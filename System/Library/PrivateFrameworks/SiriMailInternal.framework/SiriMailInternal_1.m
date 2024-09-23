id OUTLINED_FUNCTION_10_29(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_11_24()
{
  return sub_2465DAEA8();
}

uint64_t OUTLINED_FUNCTION_12_23()
{
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SendMailCATsSimple()
{
  uint64_t result;

  result = qword_2575911A0;
  if (!qword_2575911A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2465B3C20()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2465B3C5C(char a1, char a2, char a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v8 + 32) = a7;
  *(_QWORD *)(v8 + 40) = v7;
  *(_BYTE *)(v8 + 91) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a5;
  *(_BYTE *)(v8 + 90) = a3;
  *(_BYTE *)(v8 + 89) = a2;
  *(_BYTE *)(v8 + 88) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD08);
  *(_QWORD *)(v8 + 48) = swift_task_alloc();
  *(_QWORD *)(v8 + 56) = swift_task_alloc();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465B3CD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t (*v23)(unint64_t, unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 90);
  v4 = *(_BYTE *)(v0 + 89);
  v5 = *(_BYTE *)(v0 + 88);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CFB8);
  v6 = swift_allocObject();
  *(_QWORD *)(v0 + 64) = v6;
  *(_OWORD *)(v6 + 16) = xmmword_2465E02B0;
  *(_QWORD *)(v6 + 32) = 0x796C7065527369;
  *(_QWORD *)(v6 + 40) = 0xE700000000000000;
  v7 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v6 + 48) = v5;
  *(_QWORD *)(v6 + 72) = v7;
  strcpy((char *)(v6 + 80), "isBodyChange");
  *(_BYTE *)(v6 + 93) = 0;
  *(_WORD *)(v6 + 94) = -5120;
  *(_BYTE *)(v6 + 96) = v4;
  *(_QWORD *)(v6 + 120) = v7;
  *(_QWORD *)(v6 + 128) = 0xD00000000000001ALL;
  *(_QWORD *)(v6 + 136) = 0x80000002465E5530;
  *(_BYTE *)(v6 + 144) = v3;
  v8 = (uint64_t *)(v6 + 192);
  *(_QWORD *)(v6 + 168) = v7;
  *(_QWORD *)(v6 + 176) = 0x7463656A627573;
  *(_QWORD *)(v6 + 184) = 0xE700000000000000;
  sub_24653BB30(v2, v1, &qword_25758CD08);
  v9 = sub_2465DC774();
  v10 = OUTLINED_FUNCTION_19_19(v1);
  v11 = *(_QWORD *)(v0 + 56);
  if (v10 == 1)
  {
    sub_246534910(*(_QWORD *)(v0 + 56), &qword_25758CD08);
    *(_OWORD *)v8 = 0u;
    *(_OWORD *)(v6 + 208) = 0u;
  }
  else
  {
    *(_QWORD *)(v6 + 216) = v9;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v8);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(boxed_opaque_existential_1, v11, v9);
  }
  v13 = *(_QWORD *)(v0 + 48);
  v14 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v6 + 224) = 2036625250;
  *(_QWORD *)(v6 + 232) = 0xE400000000000000;
  sub_24653BB30(v14, v13, &qword_25758CD08);
  v15 = OUTLINED_FUNCTION_19_19(v13);
  v16 = *(_QWORD *)(v0 + 48);
  if (v15 == 1)
  {
    sub_246534910(*(_QWORD *)(v0 + 48), &qword_25758CD08);
    *(_OWORD *)(v6 + 240) = 0u;
    *(_OWORD *)(v6 + 256) = 0u;
  }
  else
  {
    *(_QWORD *)(v6 + 264) = v9;
    v17 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v6 + 240));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v17, v16, v9);
  }
  v18 = *(_QWORD *)(v0 + 32);
  v19 = *(_BYTE *)(v0 + 91);
  *(_QWORD *)(v6 + 272) = 0xD000000000000015;
  *(_QWORD *)(v6 + 280) = 0x80000002465E54F0;
  *(_BYTE *)(v6 + 288) = v19;
  *(_QWORD *)(v6 + 312) = v7;
  *(_QWORD *)(v6 + 320) = 0x6552656C676E6973;
  *(_QWORD *)(v6 + 328) = 0xEF746E6569706963;
  v20 = 0;
  if (v18)
  {
    v20 = sub_2465DC708();
  }
  else
  {
    *(_QWORD *)(v6 + 344) = 0;
    *(_QWORD *)(v6 + 352) = 0;
  }
  *(_QWORD *)(v6 + 336) = v18;
  *(_QWORD *)(v6 + 360) = v20;
  v23 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))((int)*MEMORY[0x24BE92A08]
                                                                            + MEMORY[0x24BE92A08]);
  swift_retain();
  v21 = (_QWORD *)OUTLINED_FUNCTION_20_20();
  *(_QWORD *)(v0 + 72) = v21;
  *v21 = v0;
  v21[1] = sub_2465B3F8C;
  return v23(0xD000000000000016, 0x80000002465E3B70, v6);
}

uint64_t sub_2465B3F8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_5_6();
  v4 = *v3;
  *v5 = v4;
  *(_QWORD *)(v2 + 80) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_62();
    return OUTLINED_FUNCTION_10_1();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_48();
    swift_task_dealloc();
    return OUTLINED_FUNCTION_0_7(v0, *(uint64_t (**)(void))(v4 + 8));
  }
}

uint64_t sub_2465B4000()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_48();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2465B4044()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_58_2();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_246554154;
  return OUTLINED_FUNCTION_0_14(0xD000000000000018, 0x80000002465E4AA0, MEMORY[0x24BEE4AF8], v3);
}

uint64_t sub_2465B40A4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v1 = (_QWORD *)OUTLINED_FUNCTION_58_2();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_246553C54;
  return OUTLINED_FUNCTION_0_14(0xD000000000000016, 0x80000002465E4AC0, MEMORY[0x24BEE4AF8], v3);
}

uint64_t sub_2465B4104(char a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = v3;
  *(_BYTE *)(v4 + 57) = a2;
  *(_BYTE *)(v4 + 56) = a1;
  return OUTLINED_FUNCTION_7_9();
}

uint64_t sub_2465B411C()
{
  unint64_t v0;
  unsigned __int8 v1;
  uint64_t v2;
  unint64_t v3;
  __n128 *v4;
  __n128 *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);

  OUTLINED_FUNCTION_17_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CFB8);
  v4 = (__n128 *)OUTLINED_FUNCTION_12_24();
  *(_QWORD *)(v2 + 32) = v4;
  v5 = OUTLINED_FUNCTION_8_25(v4, (__n128)xmmword_2465DEDB0);
  v6 = MEMORY[0x24BEE1328];
  v5[3].n128_u8[0] = v1;
  v5[4].n128_u64[1] = v6;
  v5[5].n128_u64[0] = v3;
  v7 = OUTLINED_FUNCTION_3_31((uint64_t)v5, v6);
  if (v0)
  {
    v7 = sub_2465DC708();
  }
  else
  {
    v4[9].n128_u64[1] = 0;
    v4[10].n128_u64[0] = 0;
  }
  v4[9].n128_u64[0] = v0;
  v4[10].n128_u64[1] = v7;
  OUTLINED_FUNCTION_6_29();
  v8 = (_QWORD *)OUTLINED_FUNCTION_20_20();
  *(_QWORD *)(v2 + 40) = v8;
  *v8 = v2;
  v8[1] = sub_2465B41D0;
  v9 = OUTLINED_FUNCTION_13_25(v3 + 1);
  return OUTLINED_FUNCTION_3_25(v9, v10, v11, v12);
}

uint64_t sub_2465B41D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_2_16();
  if (v1)
  {
    OUTLINED_FUNCTION_62();
    return OUTLINED_FUNCTION_10_1();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_0_7(v0, *(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_2465B421C(char a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = v3;
  *(_BYTE *)(v4 + 65) = a2;
  *(_BYTE *)(v4 + 64) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD08);
  *(_QWORD *)(v4 + 32) = swift_task_alloc();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465B4274()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int EnumTagSinglePayload;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v12;
  uint64_t (*v14)(void);

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 65);
  v4 = *(_BYTE *)(v0 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CFB8);
  v5 = OUTLINED_FUNCTION_12_24();
  *(_QWORD *)(v0 + 40) = v5;
  *(_OWORD *)(v5 + 16) = xmmword_2465DEDB0;
  *(_QWORD *)(v5 + 32) = 0x646E657070417369;
  *(_QWORD *)(v5 + 40) = 0xE800000000000000;
  v6 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v5 + 48) = v4;
  *(_QWORD *)(v5 + 72) = v6;
  *(_QWORD *)(v5 + 80) = 0x65676E6168437369;
  *(_QWORD *)(v5 + 88) = 0xE800000000000000;
  *(_BYTE *)(v5 + 96) = v3;
  v7 = (uint64_t *)(v5 + 144);
  *(_QWORD *)(v5 + 120) = v6;
  *(_QWORD *)(v5 + 128) = 0x6D614E7972657571;
  *(_QWORD *)(v5 + 136) = 0xE900000000000065;
  sub_24653BB30(v2, v1, &qword_25758CD08);
  v8 = sub_2465DC774();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v1, 1, v8);
  v10 = *(_QWORD *)(v0 + 32);
  if (EnumTagSinglePayload == 1)
  {
    sub_246534910(*(_QWORD *)(v0 + 32), &qword_25758CD08);
    *(_OWORD *)v7 = 0u;
    *(_OWORD *)(v5 + 160) = 0u;
  }
  else
  {
    *(_QWORD *)(v5 + 168) = v8;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v7);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(boxed_opaque_existential_1, v10, v8);
  }
  v12 = (_QWORD *)OUTLINED_FUNCTION_58_2();
  *(_QWORD *)(v0 + 48) = v12;
  *v12 = v0;
  v12[1] = sub_2465B43EC;
  return OUTLINED_FUNCTION_3_25(0xD00000000000001CLL, 0x80000002465E5510, v5, v14);
}

uint64_t sub_2465B43EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_5_6();
  v4 = *v3;
  *v5 = v4;
  *(_QWORD *)(v2 + 56) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_62();
    return OUTLINED_FUNCTION_10_1();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_48();
    return OUTLINED_FUNCTION_0_7(v0, *(uint64_t (**)(void))(v4 + 8));
  }
}

uint64_t sub_2465B4454(char a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = v3;
  *(_BYTE *)(v4 + 57) = a2;
  *(_BYTE *)(v4 + 56) = a1;
  return OUTLINED_FUNCTION_7_9();
}

uint64_t sub_2465B446C()
{
  unint64_t v0;
  unsigned __int8 v1;
  uint64_t v2;
  unint64_t v3;
  __n128 *v4;
  __n128 *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);

  OUTLINED_FUNCTION_17_24();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CFB8);
  v4 = (__n128 *)OUTLINED_FUNCTION_12_24();
  *(_QWORD *)(v2 + 32) = v4;
  v5 = OUTLINED_FUNCTION_8_25(v4, (__n128)xmmword_2465DEDB0);
  v6 = MEMORY[0x24BEE1328];
  v5[3].n128_u8[0] = v1;
  v5[4].n128_u64[1] = v6;
  v5[5].n128_u64[0] = v3;
  v7 = OUTLINED_FUNCTION_3_31((uint64_t)v5, v6);
  if (v0)
  {
    v7 = sub_2465DC708();
  }
  else
  {
    v4[9].n128_u64[1] = 0;
    v4[10].n128_u64[0] = 0;
  }
  v4[9].n128_u64[0] = v0;
  v4[10].n128_u64[1] = v7;
  OUTLINED_FUNCTION_6_29();
  v8 = (_QWORD *)OUTLINED_FUNCTION_20_20();
  *(_QWORD *)(v2 + 40) = v8;
  *v8 = v2;
  v8[1] = sub_2465B4520;
  v9 = OUTLINED_FUNCTION_13_25(v3 + 4);
  return OUTLINED_FUNCTION_3_25(v9, v10, v11, v12);
}

uint64_t sub_2465B4520()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_2_16();
  if (v1)
  {
    OUTLINED_FUNCTION_62();
    return OUTLINED_FUNCTION_10_1();
  }
  else
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_0_7(v0, *(uint64_t (**)(void))(v2 + 8));
  }
}

uint64_t sub_2465B456C()
{
  return type metadata accessor for SendMailCATsSimple();
}

uint64_t OUTLINED_FUNCTION_3_31@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;

  *(_QWORD *)(a1 + 88) = (v2 - 32) | 0x8000000000000000;
  *(_BYTE *)(a1 + 96) = v3;
  *(_QWORD *)(a1 + 120) = a2;
  *(_QWORD *)(a1 + 128) = 0x6552656C676E6973;
  *(_QWORD *)(a1 + 136) = 0xEF746E6569706963;
  return 0;
}

uint64_t OUTLINED_FUNCTION_6_29()
{
  return swift_retain();
}

__n128 *OUTLINED_FUNCTION_8_25(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x65676E6168437369;
  result[2].n128_u64[1] = 0xE800000000000000;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_24()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_13_25@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_19_19(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_20_20()
{
  return swift_task_alloc();
}

uint64_t sub_2465B4644(uint64_t (*a1)(_QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(_QWORD);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v27 = sub_2465DABB4();
  v7 = *(_QWORD *)(v27 - 8);
  v8 = MEMORY[0x24BDAC7A8](v27);
  v26 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v20 - v11;
  v13 = MEMORY[0x24BEE4AF8];
  v28 = MEMORY[0x24BEE4AF8];
  v25 = *(_QWORD *)(a3 + 16);
  if (v25)
  {
    v14 = 0;
    v22 = a2;
    v23 = a3;
    v21 = a1;
    while (v14 < *(_QWORD *)(a3 + 16))
    {
      v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v13 = *(_QWORD *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v12, a3 + v15 + v13 * v14, v27);
      v16 = a1(v12);
      if (v3)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v27);
        swift_bridgeObjectRelease();
        swift_release();
        return v13;
      }
      if ((v16 & 1) != 0)
      {
        v24 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        v24(v26, v12, v27);
        v17 = v28;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2465AD010(0, *(_QWORD *)(v17 + 16) + 1, 1);
          v17 = v28;
        }
        v19 = *(_QWORD *)(v17 + 16);
        v18 = *(_QWORD *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_2465AD010(v18 > 1, v19 + 1, 1);
          v17 = v28;
        }
        *(_QWORD *)(v17 + 16) = v19 + 1;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(v17 + v15 + v19 * v13, v26, v27);
        v28 = v17;
        a3 = v23;
        a1 = v21;
      }
      else
      {
        result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v27);
      }
      if (v25 == ++v14)
      {
        v13 = v28;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

void SendMailIntentPrototype.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(qword_25758D390);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_12_1();
  __swift_instantiateConcreteTypeFromMangledName(qword_2575904D8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_42_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD20);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_1_4();
  sub_2465DD158();
  OUTLINED_FUNCTION_24_17();
  sub_2465DABF0();
  OUTLINED_FUNCTION_10_9();
  OUTLINED_FUNCTION_19_20();
}

void sub_2465B4928()
{
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_13_26();
  sub_2465DABCC();
  OUTLINED_FUNCTION_19_20();
}

void sub_2465B4954()
{
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_12_25();
  sub_2465DAC08();
  OUTLINED_FUNCTION_19_20();
}

void sub_2465B4978()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_4_28();
  *(_QWORD *)(v2 - 112) = sub_2465DAC44();
  *(_QWORD *)(v2 - 104) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E3D8);
  OUTLINED_FUNCTION_23_20();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_9_24();
  sub_2465DAC20();
  v4 = sub_24656BE28();
  v6 = v5;
  sub_246534910(v1, &qword_25758CD20);
  *(_QWORD *)(v2 - 112) = v4;
  *(_QWORD *)(v2 - 104) = v6;
  OUTLINED_FUNCTION_23_20();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_8_1();
  sub_2465DCEDC();
  v7 = *(_QWORD *)(sub_2465DABC0() + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 - 112) = v7;
  sub_2465DD260();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_4_28();
  sub_2465DAC38();
  sub_2465DCE88();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_8_1();
  sub_2465DCEDC();
  sub_2465DAC5C();
  sub_2465DD08C();
  sub_246534910(v0, qword_25758D390);
  sub_2465DCEDC();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465B4B0C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58[4];

  v4 = v2;
  v52 = a2;
  sub_2465DC7E0();
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_4_2();
  v55 = v7;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758D688);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_35_1(v9, v46);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758F208);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_4_2();
  v48 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD08);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_4_2();
  v53 = v13;
  v14 = sub_2465DAB48();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4_2();
  v49 = v16;
  v17 = OUTLINED_FUNCTION_10_9();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_42_0();
  if ((a1 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758D7F0);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_2465DDFD0;
    sub_2465DAAB8();
    sub_2465DAB00();
    sub_2465DAA4C();
    sub_2465DAA7C();
  }
  else
  {
    v19 = sub_2465DAA64();
    MEMORY[0x24BDAC7A8](v19);
    *(&v46 - 2) = v2;
    v21 = sub_2465B4644(sub_2465B5A98, (uint64_t)(&v46 - 4), v20);
    sub_2465DAAB8();
    v22 = a1;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_25_19();
      v21 = v44;
    }
    v23 = *(_QWORD *)(v21 + 16);
    if (v23 >= *(_QWORD *)(v21 + 24) >> 1)
    {
      OUTLINED_FUNCTION_25_19();
      v21 = v45;
    }
    *(_QWORD *)(v21 + 16) = v23 + 1;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v18 + 32))(v21+ ((*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80))+ *(_QWORD *)(v18 + 72) * v23, v3, v17);
    sub_2465DAB00();
    a1 = v22;
  }
  v24 = v49;
  if (qword_25758C700 != -1)
    swift_once();
  v25 = sub_2465DCE04();
  __swift_project_value_buffer(v25, (uint64_t)qword_257591790);
  v50 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v50(v24, v2, v14);
  v26 = sub_2465DCDEC();
  v27 = sub_2465DD02C();
  v28 = os_log_type_enabled(v26, v27);
  v54 = v14;
  if (v28)
  {
    v29 = swift_slowAlloc();
    v47 = v15;
    v30 = v29;
    v58[0] = swift_slowAlloc();
    *(_DWORD *)v30 = 136315394;
    if ((a1 & 1) != 0)
      v31 = 6647407;
    else
      v31 = 7105633;
    v57 = sub_2465C8EE0(v31, 0xE300000000000000, v58);
    sub_2465DD0A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2048;
    v32 = *(_QWORD *)(sub_2465DAAF4() + 16);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_20_21(*(uint64_t (**)(uint64_t, uint64_t))(v47 + 8));
    v57 = v32;
    sub_2465DD0A4();
    _os_log_impl(&dword_24652E000, v26, v27, "#withReply %s: number of recipients: %ld", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_20_21(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));

  v33 = sub_2465DAB0C();
  if (v34)
  {
    v35 = v33;
    v36 = v34;
    sub_2465DB8EC();
    __swift_project_boxed_opaque_existential_1(v58, v58[3]);
    v37 = v48;
    sub_2465DB490();
    v38 = sub_2465DAECC();
    __swift_storeEnumTagSinglePayload(v37, 0, 1, v38);
    sub_2465CB434(v37, v35, v36);
    OUTLINED_FUNCTION_2();
    sub_246534910(v37, &qword_25758F208);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v58);
    v39 = v53;
    sub_2465DCEA0();
    OUTLINED_FUNCTION_29_1();
    v40 = 0;
  }
  else
  {
    v40 = 1;
    v39 = v53;
  }
  v41 = sub_2465DC774();
  __swift_storeEnumTagSinglePayload(v39, v40, 1, v41);
  type metadata accessor for MailLabelCATs();
  sub_2465DC7D4();
  sub_2465DC744();
  v42 = v56;
  sub_24655BF94(v39);
  swift_release();
  sub_2465DD308();
  sub_246534910(v42, &qword_25758D688);
  sub_2465DAB18();
  sub_246534910(v39, &qword_25758CD08);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v50)(v52, v4, v54);
}

void MailMessagePrototype.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257591220);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_4_2();
  __swift_instantiateConcreteTypeFromMangledName(qword_2575904D8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_35_1(v2, v6);
  v3 = sub_2465DAE90();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1_4();
  v4 = OUTLINED_FUNCTION_10_9();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_1_4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD20);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_12_1();
  sub_2465DD158();
  OUTLINED_FUNCTION_24_17();
  sub_2465DAA58();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13_26();
  sub_2465DAA64();
  OUTLINED_FUNCTION_7_28();
}

void sub_2465B51FC()
{
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_13_26();
  sub_2465DAA40();
  OUTLINED_FUNCTION_7_28();
}

void sub_2465B5224()
{
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_12_25();
  sub_2465DAA70();
  OUTLINED_FUNCTION_7_28();
}

void sub_2465B5244()
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

  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_4_28();
  *(_QWORD *)(v4 - 112) = sub_2465DAB0C();
  *(_QWORD *)(v4 - 104) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E3D8);
  OUTLINED_FUNCTION_22_17();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_9_24();
  sub_2465DAA88();
  v6 = sub_24656BE28();
  v8 = v7;
  sub_246534910(v0, &qword_25758CD20);
  *(_QWORD *)(v4 - 112) = v6;
  *(_QWORD *)(v4 - 104) = v8;
  OUTLINED_FUNCTION_22_17();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11_25();
  sub_2465DAAB8();
  sub_2465DD1DC();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
  OUTLINED_FUNCTION_4_28();
  sub_2465DAAF4();
  OUTLINED_FUNCTION_7_28();
}

void sub_2465B534C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_29_1();
  sub_2465DCEDC();
  sub_2465DAB30();
  sub_2465B5548();
  OUTLINED_FUNCTION_17_25();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_28_15();
  sub_2465DCEDC();
  sub_2465DAA28();
  OUTLINED_FUNCTION_17_25();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_28_15();
  OUTLINED_FUNCTION_11_25();
  sub_2465DAAAC();
  OUTLINED_FUNCTION_26_20();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_11_25();
  sub_2465DAAA0();
  OUTLINED_FUNCTION_26_20();
  OUTLINED_FUNCTION_2();
  sub_2465DCEDC();
  v0 = sub_2465DAA1C();
  v1 = sub_2465DAA10();
  MEMORY[0x24955FDE0](v0, v1);
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_4_28();
  sub_2465DAADC();
  sub_2465DCE88();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_28();
  sub_2465DAAE8();
  sub_2465DCE88();
  OUTLINED_FUNCTION_0_31();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_4_3();
}

unint64_t sub_2465B5548()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25758D708;
  if (!qword_25758D708)
  {
    v1 = sub_2465DAE90();
    result = MEMORY[0x2495605E4](MEMORY[0x24BDCE988], v1);
    atomic_store(result, (unint64_t *)&qword_25758D708);
  }
  return result;
}

uint64_t sub_2465B5588(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v38[2];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;

  v5 = sub_2465DABB4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_2465DAB48();
  v43 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v42 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2465DAA40();
  v11 = *(_QWORD *)(v10 + 16);
  v39 = v6;
  v40 = v5;
  if (v11)
  {
    v38[0] = a2;
    v38[1] = v2;
    v12 = v10 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v13 = *(_QWORD *)(v6 + 72);
    while (1)
    {
      v14 = sub_2465DAB84();
      v16 = v15;
      if (v14 == sub_2465DAB84() && v16 == v17)
        break;
      v19 = sub_2465DD278();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v19 & 1) != 0)
        goto LABEL_21;
      v12 += v13;
      if (!--v11)
      {
        swift_bridgeObjectRelease();
        v6 = v39;
        v5 = v40;
        v20 = v41;
        v21 = v43;
        v22 = v42;
        a2 = v38[0];
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_21:
    v6 = v39;
    v5 = v40;
    v20 = v41;
    v34 = v42;
    v35 = v43;
    v36 = v38[0];
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v34, v36, v20);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
    v33 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v20 = v41;
    v22 = v42;
    v21 = v43;
LABEL_11:
    (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v22, a2, v20);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
    v23 = sub_2465DAA70();
    v24 = *(_QWORD *)(v23 + 16);
    if (v24)
    {
      v25 = v23 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
      v26 = *(_QWORD *)(v6 + 72);
      while (1)
      {
        v27 = sub_2465DAB84();
        v29 = v28;
        if (v27 == sub_2465DAB84() && v29 == v30)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          goto LABEL_25;
        }
        v32 = sub_2465DD278();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v32 & 1) != 0)
          break;
        v25 += v26;
        if (!--v24)
        {
          swift_bridgeObjectRelease();
          v33 = 1;
          goto LABEL_26;
        }
      }
      swift_bridgeObjectRelease();
LABEL_25:
      v33 = 0;
LABEL_26:
      v6 = v39;
      v5 = v40;
      v20 = v41;
    }
    else
    {
      swift_bridgeObjectRelease();
      v33 = 1;
    }
    v35 = v43;
    v34 = v42;
  }
  (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v20);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v33;
}

uint64_t sub_2465B58A0(char a1)
{
  if ((a1 & 1) != 0)
    return 6647407;
  else
    return 7105633;
}

uint64_t sub_2465B58C0()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_2465DD218();
  OUTLINED_FUNCTION_8_1();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ReplyOption(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2465B595C + 4 * byte_2465E24F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2465B5990 + 4 * byte_2465E24F0[v4]))();
}

uint64_t sub_2465B5990(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2465B5998(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2465B59A0);
  return result;
}

uint64_t sub_2465B59AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2465B59B4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2465B59B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2465B59C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReplyOption()
{
  return &type metadata for ReplyOption;
}

uint64_t sub_2465B59DC(char *a1, char *a2)
{
  return sub_2465AE464(*a1, *a2);
}

void sub_2465B59E8()
{
  sub_2465AE790();
}

uint64_t sub_2465B59F0()
{
  return sub_2465AE79C();
}

void sub_2465B59F8()
{
  sub_2465AE968();
}

uint64_t sub_2465B5A00@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2465B58C0();
  *a1 = result;
  return result;
}

uint64_t sub_2465B5A2C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;

  result = sub_2465B58A0(*v1);
  *a1 = result;
  a1[1] = 0xE300000000000000;
  return result;
}

unint64_t sub_2465B5A5C()
{
  unint64_t result;

  result = qword_257591228;
  if (!qword_257591228)
  {
    result = MEMORY[0x2495605E4](&unk_2465E25E4, &type metadata for ReplyOption);
    atomic_store(result, (unint64_t *)&qword_257591228);
  }
  return result;
}

uint64_t sub_2465B5A98(uint64_t a1)
{
  uint64_t v1;

  return sub_2465B5588(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t OUTLINED_FUNCTION_0_31()
{
  return sub_2465DCEDC();
}

uint64_t OUTLINED_FUNCTION_4_28()
{
  return sub_2465DCEDC();
}

void OUTLINED_FUNCTION_7_28()
{
  JUMPOUT(0x24955FDE0);
}

uint64_t OUTLINED_FUNCTION_9_24()
{
  return sub_2465DCEDC();
}

uint64_t OUTLINED_FUNCTION_11_25()
{
  return sub_2465DCEDC();
}

uint64_t OUTLINED_FUNCTION_12_25()
{
  return sub_2465DCEDC();
}

uint64_t OUTLINED_FUNCTION_13_26()
{
  return sub_2465DCEDC();
}

uint64_t OUTLINED_FUNCTION_17_25()
{
  return sub_2465DD260();
}

void OUTLINED_FUNCTION_19_20()
{
  JUMPOUT(0x24955FDE0);
}

uint64_t OUTLINED_FUNCTION_20_21@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_22_17()
{
  return sub_2465DCE88();
}

uint64_t OUTLINED_FUNCTION_23_20()
{
  return sub_2465DCE88();
}

uint64_t OUTLINED_FUNCTION_24_17()
{
  return sub_2465DCEDC();
}

void OUTLINED_FUNCTION_25_19()
{
  sub_246550484();
}

uint64_t OUTLINED_FUNCTION_26_20()
{
  return sub_2465DCEDC();
}

uint64_t OUTLINED_FUNCTION_28_15()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t sub_2465B5B84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void (*v15)(char *, unint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v4 = sub_2465DABB4();
  v34 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v30 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v27 - v8;
  result = MEMORY[0x24BDAC7A8](v7);
  v35 = (char *)&v27 - v11;
  v12 = MEMORY[0x24BEE4AF8];
  v36 = MEMORY[0x24BEE4AF8];
  v29 = *(_QWORD *)(a1 + 16);
  if (v29)
  {
    v13 = 0;
    v33 = a2 + 56;
    v28 = a1;
    while (v13 < *(_QWORD *)(a1 + 16))
    {
      v14 = *(_QWORD *)(v34 + 72);
      v31 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
      v32 = v13;
      v15 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
      v15(v35, a1 + v31 + v14 * v13, v4);
      if (*(_QWORD *)(a2 + 16)
        && (sub_246545C20(&qword_2575914D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5FD0], MEMORY[0x24BDB5FE0]),
            v16 = sub_2465DCE28(),
            v17 = -1 << *(_BYTE *)(a2 + 32),
            v18 = v16 & ~v17,
            ((*(_QWORD *)(v33 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0))
      {
        v19 = ~v17;
        while (1)
        {
          v20 = a2;
          v15(v9, *(_QWORD *)(a2 + 48) + v18 * v14, v4);
          sub_246545C20(qword_2575901B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5FD0], MEMORY[0x24BDB5FE8]);
          v21 = sub_2465DCE34();
          v22 = *(void (**)(char *, uint64_t))(v34 + 8);
          v22(v9, v4);
          if ((v21 & 1) != 0)
            break;
          v18 = (v18 + 1) & v19;
          a2 = v20;
          if (((*(_QWORD *)(v33 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
            goto LABEL_9;
        }
        result = ((uint64_t (*)(char *, uint64_t))v22)(v35, v4);
        a2 = v20;
      }
      else
      {
LABEL_9:
        v23 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
        v23(v30, v35, v4);
        v24 = v36;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2465AD010(0, *(_QWORD *)(v24 + 16) + 1, 1);
          v24 = v36;
        }
        v26 = *(_QWORD *)(v24 + 16);
        v25 = *(_QWORD *)(v24 + 24);
        if (v26 >= v25 >> 1)
        {
          sub_2465AD010(v25 > 1, v26 + 1, 1);
          v24 = v36;
        }
        *(_QWORD *)(v24 + 16) = v26 + 1;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(v24 + v31 + v26 * v14, v30, v4);
        v36 = v24;
      }
      v13 = v32 + 1;
      a1 = v28;
      if (v32 + 1 == v29)
      {
        v12 = v36;
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v12;
  }
  return result;
}

uint64_t sub_2465B5E78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2465B5F1C(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE99C60], a2);
}

uint64_t sub_2465B5E84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2465B5F1C(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5FD0], a2);
}

uint64_t sub_2465B5E90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2465B5F1C(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C828], a2);
}

uint64_t sub_2465B5E9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2465B5EC0(a1, (uint64_t *)&unk_25758CB78, a2);
}

uint64_t sub_2465B5EA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2465B5F1C(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5CB0], a2);
}

uint64_t sub_2465B5EB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2465B5EC0(a1, &qword_25758DA68, a2);
}

uint64_t sub_2465B5EC0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = __swift_instantiateConcreteTypeFromMangledName(a2);
  if (v4)
  {
    OUTLINED_FUNCTION_29_10();
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  return OUTLINED_FUNCTION_32_8(a3, v6, 1, v5);
}

uint64_t sub_2465B5F10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2465B5F1C(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE93CC0], a2);
}

uint64_t sub_2465B5F1C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = a2(0);
  if (v4)
  {
    OUTLINED_FUNCTION_29_10();
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  return OUTLINED_FUNCTION_32_8(a3, v6, 1, v5);
}

void sub_2465B5F6C()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_167();
  v0[1] = v1;
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B5F88()
{
  OUTLINED_FUNCTION_107_3();
  sub_2465DCB70();
  OUTLINED_FUNCTION_87();
}

void SendMailPlan.__allocating_init()()
{
  swift_allocObject();
  SendMailPlan.init()();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B5FDC()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_166();
  v0[1] = v1;
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B5FF8()
{
  OUTLINED_FUNCTION_107_3();
  sub_2465DAC50();
  OUTLINED_FUNCTION_87();
}

void sub_2465B6020()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B603C()
{
  OUTLINED_FUNCTION_11_20();
  sub_2465DABFC();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B6058()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B6074()
{
  OUTLINED_FUNCTION_11_20();
  sub_2465DABD8();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B6090()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_168();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B60AC()
{
  OUTLINED_FUNCTION_11_20();
  sub_2465DAC14();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B60C8()
{
  sub_2465DAC20();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B60E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD20);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_85_2();
  sub_246545BA8(a1, v1, &qword_25758CD20);
  sub_2465DAC2C();
  OUTLINED_FUNCTION_87();
}

void sub_2465B6148()
{
  sub_2465DCB7C();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B6164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2465B61B8(a1, a2, a3, a4, MEMORY[0x24BE99970]);
}

void sub_2465B6170(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  sub_2465C9F8C(*a1, *a2, *a3, *a4, a4[1], a5, a6, a7);
}

void sub_2465B6190()
{
  sub_2465DCB7C();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465B61AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2465B61B8(a1, a2, a3, a4, MEMORY[0x24BE998B8]);
}

void sub_2465B61B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25758DB38);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_89_6();
  sub_246545BA8(v8, v9, v10);
  a5(v5);
  OUTLINED_FUNCTION_18();
}

void sub_2465B6220()
{
  sub_2465B63BC((void (*)(uint64_t))MEMORY[0x24BE973F8]);
}

uint64_t sub_2465B622C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_85_2();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6_22();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, v1 + OBJC_IVAR____TtC16SiriMailInternal12SendMailPlan__sendMessageTask, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v2, a1, v5);
  sub_2465DB3AC();
  OUTLINED_FUNCTION_45_1(a1, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  return OUTLINED_FUNCTION_75(v3, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
}

void (*sub_2465B6314(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = malloc(0x40uLL);
  *a1 = v2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  v2[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[5] = v4;
  v2[6] = malloc(*(_QWORD *)(v4 + 64));
  (*(void (**)(void))(v4 + 16))();
  v2[7] = sub_2465DB394();
  return sub_246584E80;
}

void sub_2465B63B0()
{
  sub_2465B63BC(MEMORY[0x24BE97408]);
}

void sub_2465B63BC(void (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  OUTLINED_FUNCTION_4_17();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_12_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1 + OBJC_IVAR____TtC16SiriMailInternal12SendMailPlan__sendMessageTask, v5);
  a1(v5);
  OUTLINED_FUNCTION_124_3(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  OUTLINED_FUNCTION_18();
}

uint64_t SendMailPlan.init()()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _OWORD v4[2];
  uint64_t v5;
  _OWORD v6[2];
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  OUTLINED_FUNCTION_123();
  sub_246545C20(&qword_25758DA90, (uint64_t (*)(uint64_t))MEMORY[0x24BE998C0], MEMORY[0x24BE998A8]);
  swift_retain();
  sub_2465DB3B8();
  *(_QWORD *)(v0 + OBJC_IVAR____TtC16SiriMailInternal12SendMailPlan_confirmIntentOptions) = 0;
  OUTLINED_FUNCTION_3();
  sub_2465DC720();
  v1 = (void *)sub_2465DC714();
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  sub_2465DB688();
  memset(v4, 0, sizeof(v4));
  v5 = 0;
  OUTLINED_FUNCTION_11_0();
  v2 = sub_2465DB67C();
  return sub_2465BBF0C(v1, (uint64_t)v8, (uint64_t)v6, v2, (uint64_t)v4, v0);
}

void sub_2465B6528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  Class v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  uint64_t (*v78)(char *, NSObject *);
  int v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  BOOL v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  os_log_type_t v101;
  uint64_t v102;
  uint8_t *v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  Class v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  BOOL v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  os_log_type_t v121;
  _WORD *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void (*v132)(uint64_t, NSObject *);
  uint64_t v133;
  void (*v134)(uint64_t, char *, uint64_t);
  uint64_t KeyPath;
  uint64_t v136;
  uint64_t v137;
  NSObject *v138;
  os_log_type_t v139;
  NSObject *v140;
  uint64_t v141;
  uint64_t v142;
  void (*v143)(uint64_t, uint64_t);
  os_log_type_t v144;
  uint8_t *v145;
  uint64_t v146;
  os_log_type_t v147;
  Class v148;
  uint64_t v149;
  os_log_type_t v150;
  uint8_t *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t (*v164)(uint64_t, uint64_t);
  os_log_type_t v165;
  _BOOL4 v166;
  uint64_t v167;
  uint64_t v168;
  _WORD *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  Class isa;
  uint64_t v192;
  uint64_t v193;
  char *v194;
  uint64_t v195;
  uint64_t v196;
  NSObject *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void (*v203)(char *, NSObject *);
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207[5];

  OUTLINED_FUNCTION_14_0();
  a19 = v23;
  a20 = v24;
  v193 = v20;
  v205 = v25;
  v202 = v26;
  v27 = sub_2465DB8A4();
  v200 = *(_QWORD *)(v27 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_4_2();
  v195 = v29;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  OUTLINED_FUNCTION_47_5(v30, (uint64_t)&a14);
  v189 = v31;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_4_2();
  v188 = v33;
  v34 = sub_2465DB8D4();
  OUTLINED_FUNCTION_47_5(v34, (uint64_t)&a17);
  v199 = v35;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_66_4(v37, v170);
  v180 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E448);
  v179 = *(_QWORD *)(v180 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_15_5((uint64_t)&v170 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF58);
  OUTLINED_FUNCTION_47_5(v40, (uint64_t)&v205);
  v175 = v41;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v43);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_15_5(v47);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758F998);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_15_5((uint64_t)&v170 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0));
  v186 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758F9A0);
  v183 = *(_QWORD *)(v186 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v51);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA70);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_1_4();
  v55 = v54 - v53;
  v190 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  v185 = *(_QWORD *)(v190 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_15_5(v58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA60);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_40_0();
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA68);
  isa = v60[-1].isa;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v61);
  v194 = (char *)&v170 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v63);
  OUTLINED_FUNCTION_38_1();
  v196 = v64;
  v65 = sub_2465DB8E0();
  v66 = v65[-1].isa;
  v67 = MEMORY[0x24BDAC7A8](v65);
  v69 = (char *)&v170 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v67);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v70);
  OUTLINED_FUNCTION_63_3();
  MEMORY[0x24BDAC7A8](v71);
  v73 = (char *)&v170 - v72;
  if (qword_25758C700 != -1)
    swift_once();
  v187 = v55;
  v204 = v27;
  v197 = v60;
  v74 = OUTLINED_FUNCTION_5_9();
  v201 = __swift_project_value_buffer(v74, (uint64_t)qword_257591790);
  OUTLINED_FUNCTION_9_9();
  v75 = OUTLINED_FUNCTION_6_7();
  if (OUTLINED_FUNCTION_4_21(v75))
  {
    v76 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    *(_WORD *)v76 = 0;
    OUTLINED_FUNCTION_9_7(&dword_24652E000, v60, (os_log_type_t)v27, "#SendMailPlan accept(input:)", v76);
    OUTLINED_FUNCTION_1();
  }

  v77 = v205;
  sub_2465DB898();
  v78 = (uint64_t (*)(char *, NSObject *))*((_QWORD *)v66 + 11);
  v79 = v78(v73, v65);
  v80 = *MEMORY[0x24BE98E98];
  v203 = (void (*)(char *, NSObject *))*((_QWORD *)v66 + 1);
  v203(v73, v65);
  v114 = v79 == v80;
  v81 = v77;
  if (v114)
  {
    sub_2465DB898();
    if (sub_2465708DC())
    {
      v73 = (char *)sub_2465DBE38();
      swift_release();
      sub_2465B5EC0((uint64_t)v73, &qword_25758DA68, v21);
      OUTLINED_FUNCTION_35_13();
      v82 = (uint64_t)v197;
    }
    else
    {
      v83 = OUTLINED_FUNCTION_73_6();
      v82 = (uint64_t)v197;
      __swift_storeEnumTagSinglePayload(v83, v84, 1, (uint64_t)v197);
    }
    v85 = v194;
    OUTLINED_FUNCTION_50_8(v22);
    v86 = OUTLINED_FUNCTION_73_6();
    v88 = OUTLINED_FUNCTION_9_8(v86, v87, v82);
    if (v114)
    {
      OUTLINED_FUNCTION_63_9(v88, &qword_25758DA60);
    }
    else
    {
      v107 = isa;
      v108 = v196;
      OUTLINED_FUNCTION_40_2(v196, v21, *((uint64_t (**)(uint64_t, uint64_t, uint64_t))isa + 4));
      v73 = (char *)*((_QWORD *)v107 + 2);
      ((void (*)(char *, uint64_t, uint64_t))v73)(v85, v108, v82);
      OUTLINED_FUNCTION_123();
      sub_246545C20(&qword_25758DA90, (uint64_t (*)(uint64_t))MEMORY[0x24BE998C0], MEMORY[0x24BE998A8]);
      OUTLINED_FUNCTION_128();
      v194 = v109;
      v171 = v110;
      sub_2465DBC34();
      v111 = OUTLINED_FUNCTION_73_6();
      v112 = v190;
      v115 = OUTLINED_FUNCTION_9_8(v111, v113, v190);
      if (!v114)
      {
        v123 = v185;
        v124 = v184;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v185 + 32))(v184, v21, v112);
        OUTLINED_FUNCTION_82_2();
        OUTLINED_FUNCTION_149_0(v124, v125, v126, v127, v128, v129, v130, v131, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180,
          v181);
        OUTLINED_FUNCTION_50_8(v21);
        (*(void (**)(uint64_t, uint64_t))(v123 + 8))(v124, v112);
        (*((void (**)(uint64_t, uint64_t))v107 + 1))(v196, v82);
        goto LABEL_33;
      }
      OUTLINED_FUNCTION_63_9(v115, &qword_25758DA70);
      ((void (*)(char *, uint64_t, uint64_t))v73)(v85, v196, v82);
      sub_2465DCC24();
      sub_246545C20(&qword_25758E538, (uint64_t (*)(uint64_t))MEMORY[0x24BE99978], MEMORY[0x24BE99960]);
      v117 = v116;
      OUTLINED_FUNCTION_97_4();
      sub_2465DBC34();
      v118 = v186;
      OUTLINED_FUNCTION_9_8((uint64_t)v73, 1, v186);
      if (!v114)
      {
        OUTLINED_FUNCTION_138_0();
        v133 = v182;
        v134(v182, v73, v118);
        KeyPath = swift_getKeyPath();
        sub_246545C20(&qword_25758CB68, MEMORY[0x24BE999A8], MEMORY[0x24BE99828]);
        v136 = v181;
        v204 = v117;
        OUTLINED_FUNCTION_87_5();
        OUTLINED_FUNCTION_36_5();
        v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
        v138 = OUTLINED_FUNCTION_130_0(v136);
        sub_246545BE8(v136, &qword_25758D4F8);
        if ((_DWORD)v138 == 1)
        {
          OUTLINED_FUNCTION_101_1();
          v139 = v193;
          sub_24655E564();
          v140 = swift_getKeyPath();
          OUTLINED_FUNCTION_97_4();
          v141 = v176;
          OUTLINED_FUNCTION_172();
          OUTLINED_FUNCTION_3();
          v142 = OUTLINED_FUNCTION_89_5();
          v143(v142, v141);
          OUTLINED_FUNCTION_132_0((uint64_t)&v206);
          sub_2465DB40C();
          OUTLINED_FUNCTION_58_4(KeyPath, *(uint64_t (**)(uint64_t, uint64_t))(v179 + 8));
          swift_getKeyPath();
          v144 = v139;
          sub_2465B6314(v207);
          OUTLINED_FUNCTION_145_1();
          v145 = (uint8_t *)OUTLINED_FUNCTION_151();
          v147 = v146;
          if (OUTLINED_FUNCTION_130_0(v146))
          {
            OUTLINED_FUNCTION_155();
            OUTLINED_FUNCTION_36_5();
            OUTLINED_FUNCTION_100_3((uint64_t)v207);
            v148 = isa;
            v149 = v183;
          }
          else
          {
            v162 = swift_getKeyPath();
            swift_getKeyPath();
            OUTLINED_FUNCTION_101_1();
            sub_2465DBC28();
            OUTLINED_FUNCTION_32_11();
            OUTLINED_FUNCTION_9_8(v136, 1, v137);
            if (v114)
            {
              sub_246545BE8(v136, &qword_25758D4F8);
            }
            else
            {
              swift_getKeyPath();
              sub_2465DBF10();
              v205 = v162;
              OUTLINED_FUNCTION_32_11();
              v163 = OUTLINED_FUNCTION_51_8();
              OUTLINED_FUNCTION_20_3(v163, v164);
            }
            v144 = v147;
            sub_2465DBF1C();
            OUTLINED_FUNCTION_155();
            OUTLINED_FUNCTION_36_5();
            OUTLINED_FUNCTION_100_3((uint64_t)v207);
            v149 = v183;
            v133 = v182;
            v148 = isa;
          }
          OUTLINED_FUNCTION_63_4();
          v165 = OUTLINED_FUNCTION_22_4();
          v166 = OUTLINED_FUNCTION_2_11(v165);
          v168 = v196;
          v167 = (uint64_t)v197;
          if (v166)
          {
            v169 = (_WORD *)OUTLINED_FUNCTION_3_3();
            OUTLINED_FUNCTION_14_2(v169);
            OUTLINED_FUNCTION_9_7(&dword_24652E000, v140, v144, "#SendMailPlan accept(input:) processed generic update message task, returning .yes", v145);
            OUTLINED_FUNCTION_1();
          }

          sub_2465DB364();
          (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v133, v186);
          (*((void (**)(uint64_t, uint64_t))v148 + 1))(v168, v167);
        }
        else
        {
          OUTLINED_FUNCTION_63_4();
          v150 = OUTLINED_FUNCTION_6_7();
          if (os_log_type_enabled(v138, v150))
          {
            v151 = (uint8_t *)OUTLINED_FUNCTION_3_3();
            *(_WORD *)v151 = 0;
            OUTLINED_FUNCTION_9_7(&dword_24652E000, v138, v150, "#SendMailPlan accept(input:) processed update message task, returning .yes", v151);
            OUTLINED_FUNCTION_1();
          }

          v152 = swift_getKeyPath();
          OUTLINED_FUNCTION_115_1();
          OUTLINED_FUNCTION_87_5();
          OUTLINED_FUNCTION_0();
          v153 = v173;
          sub_2465DBC04();
          OUTLINED_FUNCTION_82_2();
          OUTLINED_FUNCTION_149_0(v153, v154, v155, v156, v157, v158, v159, v160, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180,
            v181);
          OUTLINED_FUNCTION_50_8(v152);
          (*(void (**)(uint64_t, uint64_t))(v185 + 8))(v153, v190);
          OUTLINED_FUNCTION_75(v133, *(uint64_t (**)(uint64_t, uint64_t))(v183 + 8));
          v161 = OUTLINED_FUNCTION_88_2();
          v132(v161, v197);
        }
        goto LABEL_33;
      }
      v119 = OUTLINED_FUNCTION_88_2();
      OUTLINED_FUNCTION_20_3(v119, v120);
      sub_246545BE8((uint64_t)v73, &qword_25758F998);
      v81 = v205;
    }
  }
  sub_2465DB898();
  if (v78(v69, v65) != *MEMORY[0x24BE98E88])
  {
    OUTLINED_FUNCTION_50_8((uint64_t)v69);
    v98 = v200;
    goto LABEL_21;
  }
  OUTLINED_FUNCTION_58_4((uint64_t)v69, *((uint64_t (**)(uint64_t, uint64_t))v66 + 12));
  v89 = v192;
  (*(void (**)(uint64_t, char *, uint64_t))(v199 + 32))(v198, v69, v192);
  v90 = sub_2465DB8BC();
  v92 = v91;
  v93 = (void *)sub_2465DB304();
  v94 = objc_msgSend(v93, sel_identifier);

  v73 = (char *)sub_2465DCE58();
  v96 = v95;

  v97 = (char *)v90 == v73 && v92 == v96;
  v98 = v200;
  if (v97)
  {
    OUTLINED_FUNCTION_2_6();
  }
  else
  {
    v90 = sub_2465DD278();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_29_1();
    if ((v90 & 1) == 0)
    {
      OUTLINED_FUNCTION_5_14(v198, *(uint64_t (**)(uint64_t, uint64_t))(v199 + 8));
      v81 = v205;
LABEL_21:
      v99 = v195;
      OUTLINED_FUNCTION_40_2(v195, v81, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v98 + 16));
      v100 = sub_2465DCDEC();
      v101 = sub_2465DD02C();
      if (OUTLINED_FUNCTION_85_3(v101))
      {
        v102 = v99;
        v103 = (uint8_t *)OUTLINED_FUNCTION_3_3();
        v207[0] = OUTLINED_FUNCTION_3_3();
        *(_DWORD *)v103 = 136315138;
        sub_2465DB898();
        v104 = sub_2465DCE88();
        v106 = sub_2465C8EE0(v104, v105, v207);
        OUTLINED_FUNCTION_124_1(v106);
        sub_2465DD0A4();
        OUTLINED_FUNCTION_8_1();
        (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v102, v204);
        _os_log_impl(&dword_24652E000, v100, (os_log_type_t)v73, "#SendMailPlan accept(input:): got a non USO parse, rejecting parse: %s", v103, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }
      OUTLINED_FUNCTION_20_3(v99, *(uint64_t (**)(uint64_t, uint64_t))(v98 + 8));

      sub_2465DB358();
      goto LABEL_33;
    }
  }
  OUTLINED_FUNCTION_63_4();
  v121 = OUTLINED_FUNCTION_22_4();
  if (OUTLINED_FUNCTION_2_11(v121))
  {
    v122 = (_WORD *)OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_14_2(v122);
    OUTLINED_FUNCTION_9_7(&dword_24652E000, v65, (os_log_type_t)v92, "#SendMailPlan got confirm DI, accepting parse", (uint8_t *)v90);
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_128();
  sub_24655E5A0();
  LOBYTE(v207[0]) = 1;
  sub_2465DB418();
  OUTLINED_FUNCTION_58_4(v90, *(uint64_t (**)(uint64_t, uint64_t))(v189 + 8));
  sub_2465DB364();
  (*(void (**)(uint64_t, uint64_t))(v199 + 8))(v198, v89);
LABEL_33:
  OUTLINED_FUNCTION_4_3();
}

void sub_2465B7290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  char *v47;
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
  uint64_t v80;
  void (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  int *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  id v89;
  uint64_t (*v90)(uint64_t, uint64_t, _QWORD);
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t, _QWORD);
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t, _QWORD);
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t (*v116)(uint64_t, uint64_t);
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void (*v122)(uint64_t, uint64_t);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
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
  _QWORD v146[2];
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  ValueMetadata *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;

  OUTLINED_FUNCTION_14_0();
  a19 = v25;
  a20 = v26;
  v146[1] = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758F918);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_4_2();
  v142 = v29;
  v30 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E448);
  OUTLINED_FUNCTION_47_5(v30, (uint64_t)&a17);
  v139 = v31;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v33);
  v135 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E340);
  v134 = *(_QWORD *)(v135 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_4_2();
  v152 = v35;
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E440);
  v129 = *(_QWORD *)(v130 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_10_10();
  v151 = v38;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_38_1();
  v150 = v40;
  v147 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF58);
  v122 = *(void (**)(uint64_t, uint64_t))(v147 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_132();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_131();
  v45 = MEMORY[0x24BDAC7A8](v44);
  v47 = (char *)&v121 - v46;
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_38_1();
  v148 = v48;
  v49 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E350);
  OUTLINED_FUNCTION_47_5(v49, (uint64_t)&v151);
  v126 = v50;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_11_15(v52, v121);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591238);
  OUTLINED_FUNCTION_4_17();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_1_4();
  v56 = v55 - v54;
  v123 = type metadata accessor for ResolveSendMailIntent();
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_85_2();
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591240);
  v132 = *(_QWORD *)(v131 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v58);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v59);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591248);
  OUTLINED_FUNCTION_47_5(v60, (uint64_t)&v158);
  v136 = v61;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v62);
  OUTLINED_FUNCTION_15_5((uint64_t)&v121 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0));
  v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591250);
  v138 = *(_QWORD *)(v137 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v64);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v65);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591258);
  OUTLINED_FUNCTION_47_5(v66, (uint64_t)&a18);
  v141 = v67;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v68);
  OUTLINED_FUNCTION_15_5((uint64_t)&v121 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0));
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591260);
  v71 = *(_QWORD *)(v70 - 8);
  v143 = v70;
  v144 = v71;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_15_5((uint64_t)&v121 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0));
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591268);
  v75 = *(_QWORD *)(v74 - 8);
  v145 = v74;
  v146[0] = v75;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v76);
  OUTLINED_FUNCTION_15_5((uint64_t)&v121 - ((v77 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2465B63B0();
  swift_getKeyPath();
  sub_246545C20(&qword_25758DA90, (uint64_t (*)(uint64_t))MEMORY[0x24BE998C0], MEMORY[0x24BE998A8]);
  v124 = v78;
  sub_246545C20(&qword_25758CB68, MEMORY[0x24BE999A8], MEMORY[0x24BE99828]);
  sub_2465DB568();
  OUTLINED_FUNCTION_5_21();
  OUTLINED_FUNCTION_75(v56, *(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
  v79 = v148;
  OUTLINED_FUNCTION_34_8();
  swift_getKeyPath();
  v80 = v147;
  sub_2465DB3DC();
  OUTLINED_FUNCTION_3();
  v81 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v122 + 1);
  v81(v79, v80);
  OUTLINED_FUNCTION_34_8();
  swift_getKeyPath();
  sub_2465DB3DC();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_115_3((uint64_t)v47);
  OUTLINED_FUNCTION_34_8();
  swift_getKeyPath();
  v82 = v125;
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_115_3(v23);
  OUTLINED_FUNCTION_34_8();
  swift_getKeyPath();
  sub_2465DB3DC();
  OUTLINED_FUNCTION_3();
  v122 = v81;
  v81(v24, v80);
  OUTLINED_FUNCTION_97_4();
  OUTLINED_FUNCTION_34_8();
  swift_getKeyPath();
  OUTLINED_FUNCTION_115_1();
  sub_2465DB3DC();
  OUTLINED_FUNCTION_3();
  v81((uint64_t)v81, v80);
  v83 = (int *)v123;
  v84 = v21 + *(int *)(v123 + 44);
  v85 = sub_2465DAB48();
  OUTLINED_FUNCTION_26_2(v84, 1, v86, v85);
  v87 = v20 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_resolverOverride;
  OUTLINED_FUNCTION_83_3();
  sub_246545BA8(v87, v21 + v83[12], &qword_25758DAB8);
  sub_246545BA8(v20 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_skContactManagerOverride, v21 + v83[13], &qword_25758DAC0);
  v88 = *(void **)(v20 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_globals);
  sub_2465DAC74();
  v89 = v88;
  sub_2465DB400();
  OUTLINED_FUNCTION_138_0();
  OUTLINED_FUNCTION_141(v21, v149, v90);
  OUTLINED_FUNCTION_117_1(v21 + v83[6], v150);
  OUTLINED_FUNCTION_117_1(v21 + v83[7], v151);
  OUTLINED_FUNCTION_117_1(v21 + v83[8], v82);
  OUTLINED_FUNCTION_138_0();
  OUTLINED_FUNCTION_141(v91, v152, v92);
  OUTLINED_FUNCTION_138_0();
  OUTLINED_FUNCTION_141(v93, (uint64_t)v47, v94);
  *(_QWORD *)(v21 + v83[14]) = v89;
  v95 = v142;
  sub_24655E5A0();
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  OUTLINED_FUNCTION_26_2(v95, 0, v97, v96);
  v98 = OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_83_0();
  v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  sub_246545C20(&qword_25758F950, (uint64_t (*)(uint64_t))type metadata accessor for ResolveSendMailIntent, (uint64_t)&unk_2465E1CD8);
  v101 = v100;
  v102 = v127;
  v103 = v124;
  sub_2465DB1F0();
  OUTLINED_FUNCTION_0();
  sub_246545BE8(v95, &qword_25758F918);
  sub_24658A260(v21);
  OUTLINED_FUNCTION_34_8();
  v153 = (uint64_t)v83;
  v154 = (ValueMetadata *)v98;
  v155 = v99;
  v156 = v101;
  v157 = v103;
  v104 = OUTLINED_FUNCTION_17_14();
  sub_246545C20(&qword_25758F958, (uint64_t (*)(uint64_t))MEMORY[0x24BDB6130], MEMORY[0x24BDB6140]);
  v106 = v105;
  v107 = v128;
  v108 = v131;
  OUTLINED_FUNCTION_89_6();
  sub_2465DB19C();
  OUTLINED_FUNCTION_72_3((uint64_t)v146);
  OUTLINED_FUNCTION_75(v102, *(uint64_t (**)(uint64_t, uint64_t))(v132 + 8));
  OUTLINED_FUNCTION_83_0();
  v153 = v108;
  v154 = (ValueMetadata *)v104;
  v155 = v106;
  v109 = OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_101_2();
  v110 = v133;
  sub_2465DB1CC();
  OUTLINED_FUNCTION_0();
  v111 = OUTLINED_FUNCTION_89_5();
  OUTLINED_FUNCTION_75(v111, v112);
  OUTLINED_FUNCTION_83_0();
  v153 = v110;
  v154 = &type metadata for SendMailResult;
  v155 = v109;
  v113 = OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_101_1();
  v114 = v137;
  sub_2465DB1E4();
  OUTLINED_FUNCTION_0();
  v115 = OUTLINED_FUNCTION_88_2();
  OUTLINED_FUNCTION_75(v115, v116);
  v153 = v114;
  v154 = (ValueMetadata *)v113;
  v117 = OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_97_4();
  v118 = v140;
  sub_2465DB1C0();
  OUTLINED_FUNCTION_89_2(v107, *(uint64_t (**)(uint64_t, uint64_t))(v141 + 8));
  OUTLINED_FUNCTION_83_0();
  v153 = v118;
  v154 = &type metadata for SendMailResult;
  v155 = v117;
  v119 = OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_101_2();
  v120 = v143;
  sub_2465DB1A8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_124_3(*(uint64_t (**)(uint64_t, uint64_t))(v144 + 8));
  v153 = v120;
  v154 = (ValueMetadata *)v119;
  OUTLINED_FUNCTION_17_14();
  sub_2465DB064();
  OUTLINED_FUNCTION_58_4(v118, *(uint64_t (**)(uint64_t, uint64_t))(v146[0] + 8));
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465B7C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[22] = a2;
  v3[23] = a3;
  v3[21] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758F980);
  v3[24] = v4;
  v3[25] = *(_QWORD *)(v4 - 8);
  v3[26] = swift_task_alloc();
  v5 = sub_2465DB76C();
  v3[27] = v5;
  v3[28] = *(_QWORD *)(v5 - 8);
  v3[29] = swift_task_alloc();
  v6 = sub_2465DC51C();
  v3[30] = v6;
  v3[31] = *(_QWORD *)(v6 - 8);
  v3[32] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF68);
  v3[33] = v7;
  v3[34] = *(_QWORD *)(v7 - 8);
  v3[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2465B7D64()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  id v13;
  id *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  _WORD *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v25;
  id v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  os_log_type_t v30;
  _WORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v45;
  id *v46;
  uint64_t v47;

  if (qword_25758C700 != -1)
    swift_once();
  v46 = (id *)(v0 + 20);
  v1 = OUTLINED_FUNCTION_5_9();
  __swift_project_value_buffer(v1, (uint64_t)qword_257591790);
  v2 = OUTLINED_FUNCTION_9_9();
  v3 = sub_2465DD050();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    *(_WORD *)v4 = 0;
    OUTLINED_FUNCTION_9_7(&dword_24652E000, v2, v3, "#SendMailPlan handling cancelation", v4);
    OUTLINED_FUNCTION_1();
  }
  v45 = v0;
  v6 = v0[32];
  v7 = v0[30];
  v8 = v0[31];
  v5 = v0 + 29;
  v9 = v0 + 27;
  v10 = (void *)*(v5 - 7);

  sub_24655E578();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v6, *MEMORY[0x24BE99BF8], v7);
  sub_2465DB418();
  OUTLINED_FUNCTION_20_3(v6, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  v11 = OUTLINED_FUNCTION_51_8();
  OUTLINED_FUNCTION_5_14(v11, v12);
  *(v5 - 9) = v10;
  v13 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758D820);
  v14 = v46;
  if ((OUTLINED_FUNCTION_100_2() & 1) != 0)
  {
    v15 = 28;
    v16 = v45;
LABEL_9:
    (*(void (**)(_QWORD, _QWORD))(v16[v15] + 8))(*v5, *v9);

    v19 = OUTLINED_FUNCTION_145();
    v20 = sub_2465DD050();
    if (OUTLINED_FUNCTION_5_10(v20))
    {
      v21 = (_WORD *)OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_14_2(v21);
      OUTLINED_FUNCTION_9_7(&dword_24652E000, v19, (os_log_type_t)v2, "#SendMailPlan user cancelled or rejected, returning IntentCancelled", (uint8_t *)v10);
      OUTLINED_FUNCTION_1();
    }

    v22 = (_QWORD *)swift_task_alloc();
    v16[36] = v22;
    OUTLINED_FUNCTION_90_2(v22);
    OUTLINED_FUNCTION_89_3();
    return sub_24656C788(v23);
  }
  v16 = v45;
  v5 = v45 + 26;
  v2 = v45[26];
  v9 = v45 + 24;
  v10 = (void *)v45[24];
  v17 = (void *)v45[22];

  v45[18] = v17;
  v18 = v17;
  if (OUTLINED_FUNCTION_100_2())
  {
    v15 = 25;
    v14 = (id *)(v45 + 18);
    goto LABEL_9;
  }
  v25 = (void *)v45[22];

  v45[16] = v25;
  v26 = v25;
  if (OUTLINED_FUNCTION_100_2())
  {
    v25 = (void *)v45[11];
    v27 = v45[12];
    v45[38] = v25;
    v45[39] = v27;
    v28 = *((unsigned __int8 *)v45 + 104);
    if (v28 == 1)
    {
      v29 = OUTLINED_FUNCTION_145();
      v30 = sub_2465DD050();
      if (OUTLINED_FUNCTION_5_10(v30))
      {
        v31 = (_WORD *)OUTLINED_FUNCTION_3_3();
        OUTLINED_FUNCTION_14_2(v31);
        OUTLINED_FUNCTION_9_7(&dword_24652E000, v29, (os_log_type_t)((_BYTE)v45 + 88), "#SendMailPlan RecipientResolutionError.contactMatchWithoutEmailHandle, returning UnsupportedContactNoEmailAddress", (uint8_t *)v45 + 128);
        OUTLINED_FUNCTION_1();
      }
      v32 = v45[23];

      sub_246558B34(v32 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_responseFactory, (uint64_t)(v45 + 3));
      v45[2] = v25;
      swift_retain();
      v33 = (_QWORD *)swift_task_alloc();
      v45[40] = v33;
      OUTLINED_FUNCTION_90_2(v33);
      OUTLINED_FUNCTION_89_3();
      return sub_2465D4320(v34);
    }
    sub_24657FC9C((uint64_t)v25, v27, v28);
  }
  v35 = (void *)v45[22];

  v36 = v35;
  v37 = v35;
  v38 = OUTLINED_FUNCTION_145();
  v39 = sub_2465DD050();
  if (OUTLINED_FUNCTION_85_3(v39))
  {
    v40 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v47 = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v40 = 136315138;
    swift_getErrorValue();
    v41 = sub_2465DD29C();
    v45[19] = sub_2465C8EE0(v41, v42, &v47);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_76_3();
    OUTLINED_FUNCTION_76_3();
    _os_log_impl(&dword_24652E000, v38, (os_log_type_t)v25, "#SendMailPlan error: %s", v40, 0xCu);
    OUTLINED_FUNCTION_39_11();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_76_3();
  OUTLINED_FUNCTION_76_3();

  type metadata accessor for GenericError();
  v45[42] = swift_initStackObject();
  v43 = (_QWORD *)swift_task_alloc();
  v45[43] = v43;
  OUTLINED_FUNCTION_90_2(v43);
  OUTLINED_FUNCTION_89_3();
  return sub_2465D51AC(v44);
}

uint64_t sub_2465B8238()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 296) = v0;
  swift_task_dealloc();
  if (v0)
    return OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_53_5();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  return OUTLINED_FUNCTION_13_15(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_2465B82A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  sub_24658A378(v2);
  return swift_task_switch();
}

uint64_t sub_2465B8318()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 352) = v0;
  swift_task_dealloc();
  if (v0)
    return OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_53_5();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  return OUTLINED_FUNCTION_13_15(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t sub_2465B8388()
{
  return swift_unexpectedError();
}

uint64_t sub_2465B83A4()
{
  return swift_unexpectedError();
}

uint64_t sub_2465B83C0()
{
  return swift_unexpectedError();
}

void sub_2465B83DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  void (*v46)(_BYTE *, _QWORD);
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
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(_QWORD *);
  void (*v69)(_BYTE *, _QWORD);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t, uint64_t);
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(uint64_t, uint64_t);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(uint64_t, uint64_t);
  uint64_t v113;
  int v114;
  os_log_type_t v115;
  _DWORD *v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)(uint64_t, uint64_t);
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t KeyPath;
  void (*v130)(_BYTE *, _QWORD);
  void (*v131)(uint64_t *, _QWORD);
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
  uint64_t (**v145)(uint64_t, uint64_t);
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _BYTE v151[32];
  uint64_t v152[5];

  OUTLINED_FUNCTION_14_0();
  a19 = v24;
  a20 = v25;
  v149 = v21;
  v140 = v27;
  v141 = v26;
  v147 = v28;
  v143 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  v128 = *(_QWORD *)(v143 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v30);
  v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E440);
  v135 = *(_QWORD *)(v136 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_15_5((uint64_t)&v124 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575914D8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_15_5((uint64_t)&v124 - v36);
  v138 = __swift_instantiateConcreteTypeFromMangledName(&qword_257590068);
  v137 = *(_QWORD *)(v138 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_66_4(v38, v124);
  v133 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E448);
  v132 = *(_QWORD *)(v133 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_15_5((uint64_t)&v124 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0));
  v127 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_15_5(v44);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E340);
  OUTLINED_FUNCTION_47_5(v45, (uint64_t)&a9);
  v130 = v46;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_15_5((uint64_t)&v124 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0));
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF58);
  v145 = *(uint64_t (***)(uint64_t, uint64_t))(v49 - 8);
  v146 = v49;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_4_2();
  v144 = v51;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_257590B38);
  v53 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_6_22();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758FF28);
  OUTLINED_FUNCTION_174();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_1_4();
  v57 = v56 - v55;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758FF20);
  v139 = *(_QWORD *)(v58 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_123();
  sub_246545C20(&qword_25758DA90, (uint64_t (*)(uint64_t))MEMORY[0x24BE998C0], MEMORY[0x24BE998A8]);
  v142 = v60;
  sub_2465DB46C();
  swift_getKeyPath();
  sub_246545C20(&qword_25758CB68, MEMORY[0x24BE999A8], MEMORY[0x24BE99828]);
  v62 = v61;
  OUTLINED_FUNCTION_89_6();
  sub_2465DB448();
  swift_release();
  OUTLINED_FUNCTION_75(v57, *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8));
  swift_getKeyPath();
  v150 = v58;
  v148 = v22;
  v63 = v52;
  sub_2465DB454();
  OUTLINED_FUNCTION_36_5();
  LOBYTE(v57) = sub_2465DB43C();
  v64 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
  v64(v23, v52);
  if ((v57 & 1) != 0)
  {
    v125 = v52;
    v65 = v144;
    sub_24655E564();
    swift_getKeyPath();
    OUTLINED_FUNCTION_115_1();
    sub_2465DB3DC();
    OUTLINED_FUNCTION_36_5();
    OUTLINED_FUNCTION_58_4(v65, v145[1]);
    OUTLINED_FUNCTION_132_0((uint64_t)&a9);
    sub_2465DB40C();
    v66 = OUTLINED_FUNCTION_118_2();
    OUTLINED_FUNCTION_58_4(v66, v67);
    swift_getKeyPath();
    v68 = sub_2465B6314(v152);
    v69 = (void (*)(_BYTE *, _QWORD))OUTLINED_FUNCTION_151();
    v71 = v70;
    v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
    if (OUTLINED_FUNCTION_51_5(v71))
    {
      v69(v151, 0);
      OUTLINED_FUNCTION_27_10();
      ((void (*)(uint64_t *, _QWORD))v68)(v152, 0);
      v63 = v125;
    }
    else
    {
      v130 = v69;
      v131 = (void (*)(uint64_t *, _QWORD))v68;
      KeyPath = swift_getKeyPath();
      swift_getKeyPath();
      v73 = v126;
      OUTLINED_FUNCTION_176();
      swift_release();
      v74 = OUTLINED_FUNCTION_73_6();
      v76 = OUTLINED_FUNCTION_9_8(v74, v75, v72);
      if (v77)
      {
        OUTLINED_FUNCTION_63_9(v76, &qword_25758D4F8);
      }
      else
      {
        swift_getKeyPath();
        OUTLINED_FUNCTION_89_6();
        sub_2465DBF10();
        OUTLINED_FUNCTION_32_11();
        OUTLINED_FUNCTION_75(v73, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v72 - 8) + 8));
      }
      v63 = v125;
      sub_2465DBF1C();
      v130(v151, 0);
      OUTLINED_FUNCTION_27_10();
      v131(v152, 0);
    }
  }
  swift_getKeyPath();
  OUTLINED_FUNCTION_109_4();
  v78 = v148;
  sub_2465DB454();
  OUTLINED_FUNCTION_3();
  v79 = sub_2465DB43C();
  v64(v23, v63);
  if ((v79 & 1) != 0)
  {
    OUTLINED_FUNCTION_73_3();
    swift_getKeyPath();
    OUTLINED_FUNCTION_101_1();
    OUTLINED_FUNCTION_164();
    OUTLINED_FUNCTION_3();
    v80 = OUTLINED_FUNCTION_51_8();
    OUTLINED_FUNCTION_45_1(v80, v81);
    OUTLINED_FUNCTION_132_0((uint64_t)&a12);
    sub_2465DB40C();
    v82 = OUTLINED_FUNCTION_89_5();
    OUTLINED_FUNCTION_58_4(v82, v83);
    swift_getKeyPath();
    sub_2465B6314(v152);
    OUTLINED_FUNCTION_151();
    v85 = v84;
    v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
    if (OUTLINED_FUNCTION_51_5(v85))
    {
      OUTLINED_FUNCTION_154();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_133_0();
    }
    else
    {
      v133 = swift_getKeyPath();
      swift_getKeyPath();
      OUTLINED_FUNCTION_115_1();
      OUTLINED_FUNCTION_176();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_9_8(v78, 1, v86);
      if (v77)
      {
        sub_246545BE8(v78, &qword_25758D4F8);
      }
      else
      {
        swift_getKeyPath();
        OUTLINED_FUNCTION_89_6();
        sub_2465DBF10();
        OUTLINED_FUNCTION_5_21();
        OUTLINED_FUNCTION_75(v78, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v86 - 8) + 8));
      }
      sub_2465DBF1C();
      OUTLINED_FUNCTION_154();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_133_0();
      v78 = v148;
    }
  }
  swift_getKeyPath();
  sub_246545C20(&qword_25758CB70, (uint64_t (*)(uint64_t))MEMORY[0x24BE99750], MEMORY[0x24BE99708]);
  v88 = v87;
  sub_2465DB460();
  OUTLINED_FUNCTION_0();
  v89 = OUTLINED_FUNCTION_72_5();
  OUTLINED_FUNCTION_85_5();
  v90 = v78;
  if ((v89 & 1) != 0)
  {
    v137 = v88;
    v91 = v134;
    OUTLINED_FUNCTION_45_13();
    v92 = OUTLINED_FUNCTION_108_4();
    OUTLINED_FUNCTION_9_8(v91, 1, v92);
    if (!v77)
    {
      OUTLINED_FUNCTION_75_2();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v92 - 8) + 32))(v140, v91, v92);
      goto LABEL_32;
    }
    sub_246545BE8(v91, &qword_2575914D8);
    OUTLINED_FUNCTION_102_2();
    swift_getKeyPath();
    OUTLINED_FUNCTION_30_12();
    OUTLINED_FUNCTION_0();
    v93 = OUTLINED_FUNCTION_118_2();
    v94 = v62;
    v62 = v88;
    v95(v93, v94);
    OUTLINED_FUNCTION_71_4();
    OUTLINED_FUNCTION_47_10();
    v90 = v148;
    v88 = v137;
  }
  v96 = swift_getKeyPath();
  OUTLINED_FUNCTION_109_4();
  sub_2465DB460();
  OUTLINED_FUNCTION_0();
  v97 = OUTLINED_FUNCTION_72_5();
  OUTLINED_FUNCTION_85_5();
  if ((v97 & 1) != 0)
  {
    OUTLINED_FUNCTION_128();
    OUTLINED_FUNCTION_45_13();
    v98 = OUTLINED_FUNCTION_108_4();
    v99 = OUTLINED_FUNCTION_73_6();
    v101 = OUTLINED_FUNCTION_9_8(v99, v100, v98);
    if (!v77)
    {
      (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v90, v150);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v98 - 8) + 32))(v140, v96, v98);
      goto LABEL_32;
    }
    OUTLINED_FUNCTION_63_9(v101, &qword_2575914D8);
    v137 = v88;
    OUTLINED_FUNCTION_102_2();
    swift_getKeyPath();
    OUTLINED_FUNCTION_30_12();
    OUTLINED_FUNCTION_0();
    v102 = OUTLINED_FUNCTION_118_2();
    v103(v102, v62);
    OUTLINED_FUNCTION_71_4();
    OUTLINED_FUNCTION_47_10();
  }
  v104 = swift_getKeyPath();
  OUTLINED_FUNCTION_109_4();
  sub_2465DB460();
  OUTLINED_FUNCTION_0();
  v105 = OUTLINED_FUNCTION_72_5();
  OUTLINED_FUNCTION_85_5();
  if ((v105 & 1) != 0)
  {
    OUTLINED_FUNCTION_128();
    OUTLINED_FUNCTION_45_13();
    v106 = OUTLINED_FUNCTION_108_4();
    v107 = OUTLINED_FUNCTION_73_6();
    v109 = OUTLINED_FUNCTION_9_8(v107, v108, v106);
    if (!v77)
    {
      OUTLINED_FUNCTION_75_2();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v106 - 8) + 32))(v140, v104, v106);
      goto LABEL_32;
    }
    OUTLINED_FUNCTION_63_9(v109, &qword_2575914D8);
    sub_24655E564();
    v105 = swift_getKeyPath();
    OUTLINED_FUNCTION_128();
    v110 = v146;
    OUTLINED_FUNCTION_164();
    OUTLINED_FUNCTION_3();
    v111 = OUTLINED_FUNCTION_51_8();
    v112(v111, v110);
    OUTLINED_FUNCTION_132_0((uint64_t)&a16);
    sub_2465DB40C();
    OUTLINED_FUNCTION_58_4(v104, *(uint64_t (**)(uint64_t, uint64_t))(v135 + 8));
  }
  if (qword_25758C700 != -1)
    swift_once();
  v113 = OUTLINED_FUNCTION_5_9();
  v114 = __swift_project_value_buffer(v113, (uint64_t)qword_257591790);
  swift_retain_n();
  sub_2465DCDEC();
  v115 = OUTLINED_FUNCTION_22_4();
  if (OUTLINED_FUNCTION_2_11(v115))
  {
    LODWORD(v147) = v114;
    v116 = (_DWORD *)OUTLINED_FUNCTION_3_3();
    v146 = OUTLINED_FUNCTION_3_3();
    v152[0] = v146;
    v145 = (uint64_t (**)(uint64_t, uint64_t))v116;
    *v116 = 136315138;
    swift_getKeyPath();
    v117 = v143;
    sub_2465B6220();
    OUTLINED_FUNCTION_97_4();
    sub_2465DBC28();
    OUTLINED_FUNCTION_5_21();
    v118 = OUTLINED_FUNCTION_88_2();
    v119(v118, v117);
    v120 = sub_2465DCE88();
    v122 = sub_2465C8EE0(v120, v121, v152);
    OUTLINED_FUNCTION_124_1(v122);
    sub_2465DD0A4();
    swift_release_n();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_63_10(&dword_24652E000, v105, (os_log_type_t)v147, "#SendMailPlan accept(input:) returning .yes() with updated target: %s");
    OUTLINED_FUNCTION_39_11();
    OUTLINED_FUNCTION_1();
  }

  swift_release_n();
  v123 = v148;
  sub_2465DB364();
  (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v123, v150);
LABEL_32:
  OUTLINED_FUNCTION_4_3();
}

void sub_2465B906C()
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  _BOOL4 v25;
  unsigned int *v26;
  int *v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  _BOOL4 v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  unint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  size_t v69;
  os_log_type_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  char v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  os_log_type_t v80;
  _DWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  void (*v87)(_QWORD *);
  uint64_t v88;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(_QWORD *, _QWORD);
  uint64_t v93;
  char v95;
  unint64_t v96;
  uint64_t v97;
  char v98;
  int v99;
  os_log_type_t v100;
  _DWORD *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  uint64_t v116;
  uint64_t v117;
  _QWORD v118[2];
  uint64_t (*v119)(uint64_t, uint64_t);
  uint64_t (*v120)(uint64_t, uint64_t);
  uint64_t v121;
  int v122;
  uint64_t v123;
  int v124;
  os_log_t v125;
  void (*v126)(uint64_t);
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  uint64_t v136;
  _QWORD v137[9];
  uint64_t v138[5];
  uint64_t v139;
  uint64_t v140;

  OUTLINED_FUNCTION_14_0();
  v133 = v1;
  v7 = v6;
  v9 = v8;
  v136 = v10;
  v130 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575914B8);
  v129 = *(_QWORD *)(v130 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_4_2();
  v128 = v12;
  v131 = sub_2465DBC64();
  OUTLINED_FUNCTION_4_17();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_86_2();
  sub_2465DB8E0();
  OUTLINED_FUNCTION_174();
  MEMORY[0x24BDAC7A8](v14);
  v132 = (uint64_t)v118 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v118 - v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_41_0();
  v134 = v7;
  if ((sub_24656D648(v9) & 1) != 0)
  {
    if (qword_25758C700 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_5_9();
    v21 = __swift_project_value_buffer(v20, (uint64_t)qword_257591790);
    OUTLINED_FUNCTION_147((uint64_t)v18);
    v22 = v132;
    OUTLINED_FUNCTION_147(v132);
    v127 = v21;
    v23 = v21;
    sub_2465DCDEC();
    v24 = OUTLINED_FUNCTION_6_7();
    v25 = OUTLINED_FUNCTION_125_0((os_log_type_t)v24);
    v26 = (unsigned int *)MEMORY[0x24BE9F828];
    if (v25)
    {
      v27 = (int *)MEMORY[0x24BE9F828];
      v125 = v23;
      v28 = OUTLINED_FUNCTION_3_3();
      v123 = OUTLINED_FUNCTION_3_3();
      v138[0] = v123;
      *(_DWORD *)v28 = 136315650;
      v124 = v24;
      if ((_BYTE)v9)
      {
        OUTLINED_FUNCTION_135();
        if (v29)
          v31 = 17219;
        else
          v31 = 4408130;
        if (v29)
          v32 = v30;
        else
          v32 = 0xE300000000000000;
      }
      else
      {
        v32 = 0xE200000000000000;
        v31 = 20308;
      }
      v137[0] = sub_2465C8EE0(v31, v32, v138);
      sub_2465DD0A4();
      OUTLINED_FUNCTION_27();
      *(_WORD *)(v28 + 12) = 1024;
      v122 = *v27;
      v126 = *(void (**)(uint64_t))(v3 + 104);
      v53 = v3;
      v121 = v3;
      v54 = v131;
      v126(v5);
      v55 = sub_24656E494(v9);
      v120 = (uint64_t (*)(uint64_t, uint64_t))v118;
      MEMORY[0x24BDAC7A8](v55);
      OUTLINED_FUNCTION_28_16();
      v57 = sub_2465BD948((uint64_t (*)(uint64_t *))sub_24656E73C, v56, v55);
      v135 = v9;
      v58 = v57;
      OUTLINED_FUNCTION_27();
      v120 = *(uint64_t (**)(uint64_t, uint64_t))(v53 + 8);
      OUTLINED_FUNCTION_89_2(v5, v120);
      v119 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
      OUTLINED_FUNCTION_75((uint64_t)v18, v119);
      LODWORD(v137[0]) = v58 & 1;
      v118[1] = (char *)v137 + 4;
      sub_2465DD0A4();
      *(_WORD *)(v28 + 18) = 1024;
      ((void (*)(uint64_t, _QWORD, uint64_t))v126)(v5, *MEMORY[0x24BE9F820], v54);
      v59 = sub_24656E494(v135);
      MEMORY[0x24BDAC7A8](v59);
      OUTLINED_FUNCTION_28_16();
      v61 = sub_2465BD948((uint64_t (*)(uint64_t *))sub_24656E73C, v60, v59);
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_72_3((uint64_t)&v140);
      OUTLINED_FUNCTION_72_3((uint64_t)&v139);
      LODWORD(v137[0]) = v61 & 1;
      sub_2465DD0A4();
      _os_log_impl(&dword_24652E000, v125, (os_log_type_t)v124, "#SendMailPlan %s recipients has a list operation add recipients? %{BOOL}d, remove recipients? %{BOOL}d", (uint8_t *)v28, 0x18u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }
    v38 = *(void (**)(uint64_t, uint64_t))(v0 + 8);
    v38(v22, v2);
    v38((uint64_t)v18, v2);

    v39 = *(void (**)(uint64_t))(v3 + 104);
    OUTLINED_FUNCTION_143(v62, *v26);
    v63 = sub_24656E494(v9);
    MEMORY[0x24BDAC7A8](v63);
    OUTLINED_FUNCTION_28_16();
    v65 = sub_2465BD948((uint64_t (*)(uint64_t *))sub_24656E720, v64, (unint64_t)v63);
    OUTLINED_FUNCTION_8_1();
    v66 = *(_QWORD *)(v3 + 8);
    v67 = OUTLINED_FUNCTION_115_3(v5);
    if ((v65 & 1) != 0)
    {
      v132 = v66;
      v68 = OUTLINED_FUNCTION_129_0();
      v69 = sub_24656D800(v68);
      if (!*(_QWORD *)(v69 + 16))
      {
        OUTLINED_FUNCTION_35_13();
        OUTLINED_FUNCTION_79_5();
        v80 = OUTLINED_FUNCTION_22_4();
        if (OUTLINED_FUNCTION_138(v80))
        {
          v81 = (_DWORD *)OUTLINED_FUNCTION_3_3();
          v138[0] = OUTLINED_FUNCTION_3_3();
          *v81 = 136315138;
          if ((_BYTE)v9)
          {
            OUTLINED_FUNCTION_135();
            if (v29)
              v82 = 17219;
            else
              v82 = 4408130;
          }
          else
          {
            v82 = 20308;
          }
          v103 = OUTLINED_FUNCTION_90_3(v82);
          OUTLINED_FUNCTION_42_10(v103);
          OUTLINED_FUNCTION_35_13();
          OUTLINED_FUNCTION_63_10(&dword_24652E000, v63, v80, "#SendMailPlan Digressing into the ResolveRecipientsFlow to request the recipients to be added to field %s");
          OUTLINED_FUNCTION_39_11();
          OUTLINED_FUNCTION_1();
        }
        goto LABEL_69;
      }
      v126 = v39;
      OUTLINED_FUNCTION_23_3();
      OUTLINED_FUNCTION_79_5();
      v70 = OUTLINED_FUNCTION_22_4();
      if (OUTLINED_FUNCTION_138(v70))
      {
        v71 = OUTLINED_FUNCTION_3_3();
        v138[0] = OUTLINED_FUNCTION_3_3();
        *(_DWORD *)v71 = 136315394;
        swift_bridgeObjectRetain();
        v72 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
        v73 = MEMORY[0x24955FDE0](v69, v72);
        v135 = v9;
        v75 = v74;
        OUTLINED_FUNCTION_35_13();
        v137[0] = sub_2465C8EE0(v73, v75, v138);
        sub_2465DD0A4();
        OUTLINED_FUNCTION_2_6();
        OUTLINED_FUNCTION_21_4();
        *(_WORD *)(v71 + 12) = 2080;
        if ((_BYTE)v135)
        {
          OUTLINED_FUNCTION_135();
          if (v76)
            v78 = 17219;
          else
            v78 = 4408130;
          if (v76)
            v79 = v77;
          else
            v79 = 0xE300000000000000;
        }
        else
        {
          v79 = 0xE200000000000000;
          v78 = 20308;
        }
        v137[0] = sub_2465C8EE0(v78, v79, v138);
        sub_2465DD0A4();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_77_3(&dword_24652E000, v91, v70, "#SendMailPlan Adding these recipients %s to %s");
        OUTLINED_FUNCTION_105_2();
        OUTLINED_FUNCTION_1();
      }

      OUTLINED_FUNCTION_2_6();
      swift_getKeyPath();
      OUTLINED_FUNCTION_134();
      OUTLINED_FUNCTION_145_1();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
      sub_246545C20(&qword_25758DA90, (uint64_t (*)(uint64_t))MEMORY[0x24BE998C0], MEMORY[0x24BE998A8]);
      sub_246545C20(&qword_25758CB68, MEMORY[0x24BE999A8], MEMORY[0x24BE99828]);
      v92 = (void (*)(_QWORD *, _QWORD))sub_2465DBC1C();
      v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
      if (!OUTLINED_FUNCTION_78_2(v93))
        sub_2465324FC(v9, v69);
      OUTLINED_FUNCTION_35_13();
      v92(v137, 0);
      swift_release();
      v67 = OUTLINED_FUNCTION_100_3((uint64_t)v138);
    }
    OUTLINED_FUNCTION_143(v67, *MEMORY[0x24BE9F820]);
    v95 = OUTLINED_FUNCTION_129_0();
    v96 = sub_24656E494(v95);
    MEMORY[0x24BDAC7A8](v96);
    OUTLINED_FUNCTION_28_16();
    v98 = sub_2465BD948((uint64_t (*)(uint64_t *))sub_24656E73C, v97, v96);
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_115_3(v5);
    if ((v98 & 1) == 0)
    {
LABEL_58:
      v90 = 1;
      v47 = v136;
      goto LABEL_70;
    }
    v99 = OUTLINED_FUNCTION_129_0();
    v63 = sub_24656E02C(v99);
    if (v63[2].isa)
    {
      sub_2465BA3FC();
      OUTLINED_FUNCTION_8_1();
      goto LABEL_58;
    }
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_79_5();
    v100 = OUTLINED_FUNCTION_22_4();
    if (OUTLINED_FUNCTION_138(v100))
    {
      v101 = (_DWORD *)OUTLINED_FUNCTION_3_3();
      v138[0] = OUTLINED_FUNCTION_3_3();
      *v101 = 136315138;
      if ((_BYTE)v9)
      {
        OUTLINED_FUNCTION_135();
        if (v29)
          v102 = 17219;
        else
          v102 = 4408130;
      }
      else
      {
        v102 = 20308;
      }
      v104 = OUTLINED_FUNCTION_90_3(v102);
      OUTLINED_FUNCTION_42_10(v104);
      OUTLINED_FUNCTION_35_13();
      OUTLINED_FUNCTION_63_10(&dword_24652E000, v63, v100, "#SendMailPlan Digressing into the ResolveRecipientsFlow to request the recipients to be removed from field %s");
      OUTLINED_FUNCTION_39_11();
      OUTLINED_FUNCTION_1();
    }
LABEL_69:

    v105 = *(void **)(v133 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_globals);
    v106 = OUTLINED_FUNCTION_83_3();
    OUTLINED_FUNCTION_123_1(v106, v107, &qword_25758DAB8);
    memset(v137, 0, 40);
    v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575914C0);
    OUTLINED_FUNCTION_11_0();
    v109 = v105;
    OUTLINED_FUNCTION_26_21();
    v138[0] = v110;
    v111 = OUTLINED_FUNCTION_2_29();
    OUTLINED_FUNCTION_86_4(v111);
    v112 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E4C0);
    v113 = sub_2465BC878();
    OUTLINED_FUNCTION_101_2();
    sub_2465DB10C();
    OUTLINED_FUNCTION_0();
    swift_release();
    v138[0] = v108;
    v138[1] = v112;
    v138[2] = v113;
    OUTLINED_FUNCTION_17_14();
    v47 = v136;
    sub_2465DB370();
    v114 = OUTLINED_FUNCTION_88_2();
    OUTLINED_FUNCTION_58_4(v114, v115);
    v90 = 0;
    goto LABEL_70;
  }
  swift_getKeyPath();
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  sub_246545C20(&qword_25758DA90, (uint64_t (*)(uint64_t))MEMORY[0x24BE998C0], MEMORY[0x24BE998A8]);
  v35 = v34;
  sub_246545C20(&qword_25758CB68, MEMORY[0x24BE999A8], MEMORY[0x24BE99828]);
  v134 = v36;
  sub_2465DBC28();
  swift_release();
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
  OUTLINED_FUNCTION_9_8(v4, 1, v37);
  if (v29)
  {
    sub_246545BE8(v4, &qword_25758D4F8);
    v40 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    OUTLINED_FUNCTION_129_0();
    v40 = sub_246532458();
    v41 = OUTLINED_FUNCTION_118_2();
    OUTLINED_FUNCTION_89_2(v41, v42);
  }
  v135 = v9;
  if (qword_25758C700 != -1)
    swift_once();
  v43 = OUTLINED_FUNCTION_5_9();
  v44 = __swift_project_value_buffer(v43, (uint64_t)qword_257591790);
  OUTLINED_FUNCTION_23_3();
  sub_2465DCDEC();
  v45 = OUTLINED_FUNCTION_6_7();
  v46 = OUTLINED_FUNCTION_125_0(v45);
  v47 = v136;
  if (v46)
  {
    v131 = v35;
    v48 = OUTLINED_FUNCTION_3_3();
    v138[0] = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v48 = 136315394;
    v132 = v33;
    if ((_BYTE)v135)
    {
      OUTLINED_FUNCTION_135();
      if (v49)
        v51 = 17219;
      else
        v51 = 4408130;
      if (v49)
        v52 = v50;
      else
        v52 = 0xE300000000000000;
    }
    else
    {
      v52 = 0xE200000000000000;
      v51 = 20308;
    }
    v137[0] = sub_2465C8EE0(v51, v52, v138);
    OUTLINED_FUNCTION_112_2();
    swift_bridgeObjectRelease();
    *(_WORD *)(v48 + 12) = 2080;
    swift_bridgeObjectRetain();
    v83 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
    v84 = MEMORY[0x24955FDE0](v40, v83);
    v86 = v85;
    OUTLINED_FUNCTION_16_6();
    v137[0] = sub_2465C8EE0(v84, v86, v138);
    OUTLINED_FUNCTION_112_2();
    OUTLINED_FUNCTION_2_6();
    OUTLINED_FUNCTION_35_13();
    _os_log_impl(&dword_24652E000, v44, v45, "#SendMailPlan Replacing %s recipients with these recipients: %s", (uint8_t *)v48, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_2_6();
  swift_getKeyPath();
  v87 = OUTLINED_FUNCTION_134();
  sub_2465DBC1C();
  OUTLINED_FUNCTION_145_1();
  if (!__swift_getEnumTagSinglePayload(v88, 1, v37))
    sub_2465327E8();
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_100_3((uint64_t)v137);
  OUTLINED_FUNCTION_27_10();
  ((void (*)(uint64_t *, _QWORD))v87)(v138, 0);
  v90 = 1;
LABEL_70:
  v116 = OUTLINED_FUNCTION_108_4();
  OUTLINED_FUNCTION_26_2(v47, v90, v117, v116);
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465B9E9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E440);
  v19 = *(_QWORD *)(v0 - 8);
  v20 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v18 - v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF58);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v18 - v11;
  sub_24655E564();
  swift_getKeyPath();
  sub_2465DB3DC();
  swift_release();
  v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v12, v6);
  sub_24655E564();
  swift_getKeyPath();
  sub_2465DB3DC();
  swift_release();
  v13(v10, v6);
  v14 = sub_2465BD6EC();
  v15 = v20;
  v16 = *(void (**)(char *, uint64_t))(v19 + 8);
  v16(v3, v20);
  v21 = v14;
  swift_bridgeObjectRetain();
  sub_2465BD554();
  sub_2465DB418();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v16)(v5, v15);
}

uint64_t sub_2465BA148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E440);
  v19 = *(_QWORD *)(v0 - 8);
  v20 = v0;
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v19 - v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF58);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v19 - v11;
  sub_24655E564();
  swift_getKeyPath();
  sub_2465DB3DC();
  swift_release();
  v13 = *(void (**)(char *, uint64_t))(v7 + 8);
  v13(v12, v6);
  sub_24655E564();
  swift_getKeyPath();
  sub_2465DB3DC();
  swift_release();
  v13(v10, v6);
  v14 = sub_2465BD6EC();
  v15 = v20;
  v16 = *(void (**)(char *, uint64_t))(v19 + 8);
  v16(v3, v20);
  swift_bridgeObjectRetain();
  sub_2465BCFB8();
  v21 = sub_2465B5B84(v14, v17);
  sub_2465DB418();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v16)(v5, v15);
}

void sub_2465BA3FC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t *, _QWORD);
  uint64_t v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95[4];

  OUTLINED_FUNCTION_14_0();
  v85 = v1;
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD98);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_68_4(v7, v84);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
  v92 = *(_QWORD *)(v8 - 8);
  v93 = v8;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_5_3();
  v91 = v10;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v84 - v12;
  if (qword_25758C700 != -1)
    swift_once();
  v14 = OUTLINED_FUNCTION_5_9();
  __swift_project_value_buffer(v14, (uint64_t)qword_257591790);
  OUTLINED_FUNCTION_23_3();
  sub_2465DCDEC();
  v15 = OUTLINED_FUNCTION_22_4();
  v16 = OUTLINED_FUNCTION_138(v15);
  v86 = v3;
  HIDWORD(v84) = v5;
  if (v16)
  {
    v17 = OUTLINED_FUNCTION_3_3();
    v95[0] = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v17 = 136315394;
    v18 = swift_bridgeObjectRetain();
    v19 = MEMORY[0x24955FDE0](v18, v93);
    v21 = v20;
    OUTLINED_FUNCTION_21_4();
    v94 = sub_2465C8EE0(v19, v21, v95);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_2_6();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    if ((_BYTE)v5)
    {
      OUTLINED_FUNCTION_135();
      if (v22)
        v24 = 17219;
      else
        v24 = 4408130;
      if (v22)
        v25 = v23;
      else
        v25 = 0xE300000000000000;
    }
    else
    {
      v25 = 0xE200000000000000;
      v24 = 20308;
    }
    v94 = sub_2465C8EE0(v24, v25, v95);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_16_6();
    OUTLINED_FUNCTION_77_3(&dword_24652E000, v26, v15, "#SendMailPlan Removing these recipients %s from %s");
    OUTLINED_FUNCTION_105_2();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_2_6();
  v27 = *(_QWORD *)(v3 + 16);
  v28 = MEMORY[0x24BEE4AF8];
  if (v27)
  {
    OUTLINED_FUNCTION_58_10();
    OUTLINED_FUNCTION_152();
    v30 = v3 + v29;
    v32 = *(_QWORD *)(v31 + 72);
    v87 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
    v88 = v32;
    v33 = v27;
    v89 = v27;
    do
    {
      v34 = v28;
      v87(v13, v30, v93);
      swift_getKeyPath();
      sub_246545C20(&qword_25758CB70, (uint64_t (*)(uint64_t))MEMORY[0x24BE99750], MEMORY[0x24BE99708]);
      sub_246545C20(&qword_25758D200, (uint64_t (*)(uint64_t))MEMORY[0x24BE99650], MEMORY[0x24BE99618]);
      v35 = v90;
      v36 = v13;
      sub_2465DBEF8();
      swift_release();
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE08);
      OUTLINED_FUNCTION_9_8(v35, 1, v37);
      if (v22)
      {
        sub_246545BE8(v35, &qword_25758CD98);
        v38 = 0;
        v40 = 0;
      }
      else
      {
        swift_getKeyPath();
        v38 = sub_2465DBF10();
        v40 = v39;
        OUTLINED_FUNCTION_5_21();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 8))(v35, v37);
      }
      v13 = v36;
      (*(void (**)(char *, uint64_t))(v92 + 8))(v36, v93);
      v41 = v95[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_68_5(*(_QWORD *)(v41 + 16));
        v41 = v95[0];
      }
      v28 = v34;
      v43 = *(_QWORD *)(v41 + 16);
      v42 = *(_QWORD *)(v41 + 24);
      v44 = v43 + 1;
      v27 = v89;
      if (v43 >= v42 >> 1)
      {
        OUTLINED_FUNCTION_53_9(v42);
        v41 = v95[0];
      }
      *(_QWORD *)(v41 + 16) = v44;
      v45 = v41 + 16 * v43;
      *(_QWORD *)(v45 + 32) = v38;
      *(_QWORD *)(v45 + 40) = v40;
      v30 += v88;
      --v33;
    }
    while (v33);
  }
  else
  {
    v44 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    v41 = MEMORY[0x24BEE4AF8];
    v46 = MEMORY[0x24BEE4AF8];
    if (!v44)
      goto LABEL_35;
  }
  swift_bridgeObjectRetain();
  v47 = (uint64_t *)(v41 + 40);
  v46 = MEMORY[0x24BEE4AF8];
  do
  {
    v48 = *v47;
    if (*v47)
    {
      v49 = *(v47 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_159(0, *(_QWORD *)(v46 + 16) + 1);
        v46 = v53;
      }
      v51 = *(_QWORD *)(v46 + 16);
      v50 = *(_QWORD *)(v46 + 24);
      if (v51 >= v50 >> 1)
      {
        OUTLINED_FUNCTION_159(v50 > 1, v51 + 1);
        v46 = v54;
      }
      *(_QWORD *)(v46 + 16) = v51 + 1;
      v52 = v46 + 16 * v51;
      *(_QWORD *)(v52 + 32) = v49;
      *(_QWORD *)(v52 + 40) = v48;
    }
    v47 += 2;
    --v44;
  }
  while (v44);
  OUTLINED_FUNCTION_27();
LABEL_35:
  OUTLINED_FUNCTION_27();
  v55 = sub_2465BD100(v46);
  v56 = v55;
  if (v27)
  {
    v90 = v55;
    OUTLINED_FUNCTION_58_10();
    OUTLINED_FUNCTION_152();
    v58 = v86 + v57;
    v60 = *(_QWORD *)(v59 + 72);
    v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 16);
    v28 = v95[0];
    do
    {
      v62 = v91;
      v61(v91, v58, v93);
      swift_getKeyPath();
      sub_246545C20(&qword_25758CB70, (uint64_t (*)(uint64_t))MEMORY[0x24BE99750], MEMORY[0x24BE99708]);
      v63 = sub_2465DBF10();
      v65 = v64;
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_89_2(v62, *(uint64_t (**)(uint64_t, uint64_t))(v92 + 8));
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_68_5(*(_QWORD *)(v28 + 16));
        v28 = v95[0];
      }
      v67 = *(_QWORD *)(v28 + 16);
      v66 = *(_QWORD *)(v28 + 24);
      v68 = v67 + 1;
      if (v67 >= v66 >> 1)
      {
        OUTLINED_FUNCTION_53_9(v66);
        v28 = v95[0];
      }
      *(_QWORD *)(v28 + 16) = v68;
      v69 = v28 + 16 * v67;
      *(_QWORD *)(v69 + 32) = v63;
      *(_QWORD *)(v69 + 40) = v65;
      v58 += v60;
      --v27;
    }
    while (v27);
    v56 = v90;
  }
  else
  {
    v68 = *(_QWORD *)(v28 + 16);
    v70 = v28;
    if (!v68)
      goto LABEL_53;
  }
  swift_bridgeObjectRetain();
  v71 = (uint64_t *)(v28 + 40);
  v70 = MEMORY[0x24BEE4AF8];
  do
  {
    v72 = *v71;
    if (*v71)
    {
      v73 = *(v71 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_104_2(0, *(_QWORD *)(v70 + 16) + 1);
        v70 = v77;
      }
      v75 = *(_QWORD *)(v70 + 16);
      v74 = *(_QWORD *)(v70 + 24);
      if (v75 >= v74 >> 1)
      {
        OUTLINED_FUNCTION_104_2(v74 > 1, v75 + 1);
        v70 = v78;
      }
      *(_QWORD *)(v70 + 16) = v75 + 1;
      v76 = v70 + 16 * v75;
      *(_QWORD *)(v76 + 32) = v73;
      *(_QWORD *)(v76 + 40) = v72;
    }
    v71 += 2;
    --v68;
  }
  while (v68);
  OUTLINED_FUNCTION_16_6();
LABEL_53:
  OUTLINED_FUNCTION_16_6();
  v79 = sub_2465BD100(v70);
  swift_getKeyPath();
  sub_2465B6314(v95);
  OUTLINED_FUNCTION_145_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  sub_246545C20(&qword_25758DA90, (uint64_t (*)(uint64_t))MEMORY[0x24BE998C0], MEMORY[0x24BE998A8]);
  sub_246545C20(&qword_25758CB68, MEMORY[0x24BE999A8], MEMORY[0x24BE99828]);
  v80 = (void (*)(uint64_t *, _QWORD))sub_2465DBC1C();
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
  v82 = OUTLINED_FUNCTION_78_2(v81);
  if (!(_DWORD)v82)
  {
    MEMORY[0x24BDAC7A8](v82);
    *(&v84 - 4) = v56;
    v83 = BYTE4(v84);
    *((_BYTE *)&v84 - 24) = BYTE4(v84);
    *(&v84 - 2) = v79;
    sub_2465325F4(v83);
  }
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_21_4();
  v80(&v94, 0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_100_3((uint64_t)v95);
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465BAB48(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  os_log_type_t v27;
  uint64_t v28;
  unint64_t v29;
  os_log_type_t v31;
  const char *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD98);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
  sub_246545C20(&qword_25758CB70, (uint64_t (*)(uint64_t))MEMORY[0x24BE99750], MEMORY[0x24BE99708]);
  sub_246545C20(&qword_25758D200, (uint64_t (*)(uint64_t))MEMORY[0x24BE99650], MEMORY[0x24BE99618]);
  sub_2465DBEF8();
  swift_release();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE08);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_246545BE8((uint64_t)v8, &qword_25758CD98);
    goto LABEL_16;
  }
  swift_getKeyPath();
  v10 = sub_2465DBF10();
  v12 = v11;
  swift_release();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  if (!v12)
  {
LABEL_16:
    swift_getKeyPath();
    v22 = sub_2465DBF10();
    v24 = v23;
    swift_release();
    if (v24)
    {
      sub_2465BD1A4(v22, v24, a4);
      if ((v25 & 1) != 0)
      {
        if (qword_25758C700 != -1)
          swift_once();
        v26 = sub_2465DCE04();
        __swift_project_value_buffer(v26, (uint64_t)qword_257591790);
        swift_bridgeObjectRetain();
        v16 = sub_2465DCDEC();
        v27 = sub_2465DD02C();
        if (os_log_type_enabled(v16, v27))
        {
          v18 = swift_slowAlloc();
          v19 = swift_slowAlloc();
          v36 = v19;
          *(_DWORD *)v18 = 136315394;
          if ((_BYTE)v34)
          {
            if (v34 == 1)
              v28 = 17219;
            else
              v28 = 4408130;
            if (v34 == 1)
              v29 = 0xE200000000000000;
            else
              v29 = 0xE300000000000000;
          }
          else
          {
            v29 = 0xE200000000000000;
            v28 = 20308;
          }
          v35 = sub_2465C8EE0(v28, v29, &v36);
          sub_2465DD0A4();
          swift_bridgeObjectRelease();
          *(_WORD *)(v18 + 12) = 2080;
          swift_bridgeObjectRetain();
          v35 = sub_2465C8EE0(v22, v24, &v36);
          sub_2465DD0A4();
          swift_bridgeObjectRelease_n();
          v31 = v27;
          v32 = "#SendMailPlan Removing %s recipient with name %s";
LABEL_35:
          _os_log_impl(&dword_24652E000, v16, v31, v32, (uint8_t *)v18, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x2495606A4](v19, -1, -1);
          MEMORY[0x2495606A4](v18, -1, -1);

          return 1;
        }
        goto LABEL_30;
      }
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  sub_2465BD1A4(v10, v12, a2);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v14 = v10;
  if (qword_25758C700 != -1)
    swift_once();
  v15 = sub_2465DCE04();
  __swift_project_value_buffer(v15, (uint64_t)qword_257591790);
  swift_bridgeObjectRetain();
  v16 = sub_2465DCDEC();
  v17 = sub_2465DD02C();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v36 = v19;
    *(_DWORD *)v18 = 136315394;
    if ((_BYTE)v34)
    {
      if (v34 == 1)
        v20 = 17219;
      else
        v20 = 4408130;
      if (v34 == 1)
        v21 = 0xE200000000000000;
      else
        v21 = 0xE300000000000000;
    }
    else
    {
      v21 = 0xE200000000000000;
      v20 = 20308;
    }
    v35 = sub_2465C8EE0(v20, v21, &v36);
    sub_2465DD0A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    v35 = sub_2465C8EE0(v14, v12, &v36);
    sub_2465DD0A4();
    swift_bridgeObjectRelease_n();
    v31 = v17;
    v32 = "#SendMailPlan Removing %s recipient with email %s";
    goto LABEL_35;
  }
LABEL_30:

  swift_bridgeObjectRelease_n();
  return 1;
}

uint64_t sub_2465BB080()
{
  NSObject *v0;
  os_log_type_t v1;
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
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *boxed_opaque_existential_1;
  char *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[15];
  uint64_t v32;
  uint64_t v33;

  OUTLINED_FUNCTION_14_0();
  v32 = v3;
  v33 = v4;
  v30 = v5;
  sub_2465DC7E0();
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_11_15(v7, v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758FF20);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_68_4(v9, v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758FF28);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_41_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_4_2();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_86_2();
  if (qword_25758C700 != -1)
    swift_once();
  v14 = OUTLINED_FUNCTION_5_9();
  __swift_project_value_buffer(v14, (uint64_t)qword_257591790);
  OUTLINED_FUNCTION_9_9();
  v15 = OUTLINED_FUNCTION_6_7();
  if (OUTLINED_FUNCTION_4_21(v15))
  {
    v16 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    *(_WORD *)v16 = 0;
    OUTLINED_FUNCTION_9_7(&dword_24652E000, v0, v1, "#SendMailPlan making ConfirmationPrompt", v16);
    OUTLINED_FUNCTION_1();
  }

  swift_getKeyPath();
  sub_2465B6220();
  sub_246545C20(&qword_25758DA90, (uint64_t (*)(uint64_t))MEMORY[0x24BE998C0], MEMORY[0x24BE998A8]);
  sub_246545C20(&qword_25758CB68, MEMORY[0x24BE999A8], MEMORY[0x24BE99828]);
  OUTLINED_FUNCTION_87_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_20_3(v2, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
  OUTLINED_FUNCTION_123();
  sub_2465DB46C();
  swift_getKeyPath();
  sub_2465DB448();
  OUTLINED_FUNCTION_3();
  v17 = OUTLINED_FUNCTION_118_2();
  OUTLINED_FUNCTION_45_1(v17, v18);
  v19 = *(uint64_t *)((char *)&v0->isa + OBJC_IVAR____TtC16SiriMailInternal12SendMailPlan_confirmIntentOptions);
  v20 = type metadata accessor for ConfirmSendProducer(0);
  v31[3] = v20;
  sub_246545C20(&qword_25758F908, type metadata accessor for ConfirmSendProducer, (uint64_t)&unk_2465DDC60);
  v31[4] = v21;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v31);
  v23 = (char *)boxed_opaque_existential_1 + *(int *)(v20 + 24);
  v24 = sub_2465DAC74();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v23, v30, v24);
  v25 = SendMailPlan.isSnippetInFocus.getter();
  type metadata accessor for SendMailCATsSimple();
  sub_2465DC7D4();
  v26 = sub_2465DC798();
  boxed_opaque_existential_1[1] = v19;
  *((_BYTE *)boxed_opaque_existential_1 + *(int *)(v20 + 28)) = v25 & 1;
  *boxed_opaque_existential_1 = v26;
  sub_2465DB688();
  OUTLINED_FUNCTION_11_0();
  sub_2465DB67C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575914B0);
  OUTLINED_FUNCTION_11_0();
  return sub_2465DB6C4();
}

uint64_t SendMailPlan.isSnippetInFocus.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_40_0();
  sub_24655E58C();
  sub_2465DB3E8();
  OUTLINED_FUNCTION_58_4(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return v4 & 1;
}

uint64_t sub_2465BB45C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriMailInternal12SendMailPlan__sendMessageTask;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

void SendMailPlan.deinit()
{
  uint64_t v0;

  MailSendingPlan.deinit();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  OUTLINED_FUNCTION_67_6(v0);
  OUTLINED_FUNCTION_2_12();
}

uint64_t SendMailPlan.__deallocating_deinit()
{
  uint64_t v0;

  MailSendingPlan.deinit();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  OUTLINED_FUNCTION_67_6(v0);
  return swift_deallocClassInstance();
}

#error "2465BB534: call analysis failed (funcsize=8)"

uint64_t sub_2465BB544()
{
  type metadata accessor for SendMailPlan();
  return sub_2465DB1B4();
}

#error "2465BB590: call analysis failed (funcsize=8)"

uint64_t sub_2465BB5A0(uint64_t a1)
{
  MEMORY[0x2495605E4](&protocol conformance descriptor for SendMailPlan, a1);
  return sub_2465DB190();
}

void SendMailPlan.snippet.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t KeyPath;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t);
  uint64_t (*v96)(uint64_t);
  uint64_t v97[9];
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  int *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;

  OUTLINED_FUNCTION_14_0();
  a19 = v22;
  a20 = v23;
  v109 = v24;
  v25 = OUTLINED_FUNCTION_51_3();
  v26 = OUTLINED_FUNCTION_47_5(v25, (uint64_t)&a16);
  v107 = *(_QWORD *)(v27 + 64);
  v108 = v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v106 = (uint64_t)v97 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_15_5((uint64_t)v97 - v30);
  v105 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E350);
  v104 = *(_QWORD *)(v105 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_11_15(v32, v97[0]);
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591238);
  v99 = *(_QWORD *)(v98 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v34);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  OUTLINED_FUNCTION_47_5(v35, (uint64_t)&a15);
  v102 = v36;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_15_5((uint64_t)v97 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF68);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_4_2();
  v125 = v40;
  v41 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E448);
  v119 = *(_QWORD *)(v41 - 8);
  v120 = v41;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_5_3();
  v113 = v43;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_38_1();
  v124 = v45;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E340);
  v117 = *(_QWORD *)(v46 - 8);
  v118 = v46;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_5_3();
  v112 = v48;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_38_1();
  v123 = v50;
  v114 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E440);
  v116 = *(_QWORD *)(v114 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_5_3();
  v111 = v52;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_10_10();
  v110 = v54;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_10_10();
  v126 = v56;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_10_10();
  v122 = v58;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_10_10();
  v121 = v60;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v61);
  v100 = (char *)v97 - v62;
  v97[1] = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25758DF58) - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v63);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v64);
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v65);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v66);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v67);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  v69 = MEMORY[0x24BDAC7A8](v68);
  v71 = (char *)v97 - v70;
  MEMORY[0x24BDAC7A8](v69);
  OUTLINED_FUNCTION_63_3();
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_132();
  MEMORY[0x24BDAC7A8](v73);
  OUTLINED_FUNCTION_131();
  MEMORY[0x24BDAC7A8](v74);
  v76 = (char *)v97 - v75;
  sub_24655E564();
  swift_getKeyPath();
  sub_2465DB3DC();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_10((uint64_t)v76);
  OUTLINED_FUNCTION_73_3();
  swift_getKeyPath();
  OUTLINED_FUNCTION_172();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_10(v20);
  OUTLINED_FUNCTION_73_3();
  swift_getKeyPath();
  sub_2465DB3DC();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_10(v21);
  OUTLINED_FUNCTION_73_3();
  swift_getKeyPath();
  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_19_13();
  OUTLINED_FUNCTION_73_3();
  swift_getKeyPath();
  OUTLINED_FUNCTION_164();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_10((uint64_t)v71);
  sub_24655E578();
  sub_24655E564();
  swift_getKeyPath();
  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_19_13();
  OUTLINED_FUNCTION_22_15();
  swift_getKeyPath();
  v77 = v110;
  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_19_13();
  OUTLINED_FUNCTION_22_15();
  swift_getKeyPath();
  v78 = v111;
  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_19_13();
  OUTLINED_FUNCTION_22_15();
  swift_getKeyPath();
  v79 = v112;
  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_19_13();
  OUTLINED_FUNCTION_22_15();
  KeyPath = swift_getKeyPath();
  v81 = v113;
  OUTLINED_FUNCTION_18_13();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_19_13();
  OUTLINED_FUNCTION_128();
  sub_24655E58C();
  v82 = v97[8];
  sub_2465B63B0();
  swift_getKeyPath();
  sub_246545C20(&qword_25758DA90, (uint64_t (*)(uint64_t))MEMORY[0x24BE998C0], MEMORY[0x24BE998A8]);
  sub_246545C20(&qword_25758CB68, MEMORY[0x24BE999A8], MEMORY[0x24BE99828]);
  v83 = v115;
  sub_2465DB568();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_14(v82, *(uint64_t (**)(uint64_t, uint64_t))(v99 + 8));
  v84 = v101;
  OUTLINED_FUNCTION_27_6(v101, v126);
  v85 = v103;
  OUTLINED_FUNCTION_27_6(v84 + v103[5], v77);
  OUTLINED_FUNCTION_27_6(v84 + v85[6], v78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v117 + 16))(v84 + v85[7], v79, v118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v119 + 16))(v84 + v85[8], v81, v120);
  v86 = v104;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 16))(v84 + v85[9], v83, v105);
  v87 = v84;
  v88 = v102;
  v89 = KeyPath;
  OUTLINED_FUNCTION_40_2(v84 + v85[10], KeyPath, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v102 + 16));
  type metadata accessor for MetricsSnippetEventHandler();
  v90 = OUTLINED_FUNCTION_11_0();
  swift_defaultActor_initialize();
  sub_2465DB214();
  v91 = v106;
  sub_24658A070(v87, v106);
  v92 = (*(unsigned __int8 *)(v108 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v108 + 80);
  v93 = (v107 + v92 + 7) & 0xFFFFFFFFFFFFFFF8;
  v94 = swift_allocObject();
  sub_24658A070(v91, v94 + v92);
  *(_QWORD *)(v94 + v93) = v90;
  OUTLINED_FUNCTION_89_2(v115, *(uint64_t (**)(uint64_t, uint64_t))(v86 + 8));
  OUTLINED_FUNCTION_20_3(v89, *(uint64_t (**)(uint64_t, uint64_t))(v88 + 8));
  (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v113, v120);
  (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v112, v118);
  OUTLINED_FUNCTION_110_1(v111);
  OUTLINED_FUNCTION_110_1(v110);
  OUTLINED_FUNCTION_110_1(v126);
  sub_2465DAF08();
  v95 = (uint64_t (*)(uint64_t))MEMORY[0x24BE999E8];
  sub_2465DC468();
  v96 = (uint64_t (*)(uint64_t))MEMORY[0x24BE99AC8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E4C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E3D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD20);
  sub_2465DC51C();
  sub_246545C20(&qword_25758F8C8, v95, MEMORY[0x24BE999D8]);
  sub_246545C20(&qword_25758F8D0, v96, MEMORY[0x24BE99AE0]);
  sub_246545C20(&qword_25758F8D8, v96, MEMORY[0x24BE99AD8]);
  sub_2465DB694();
  OUTLINED_FUNCTION_4_3();
}

#error "2465BBED8: call analysis failed (funcsize=8)"

uint64_t sub_2465BBEE8()
{
  return SendMailPlan.isSnippetInFocus.getter() & 1;
}

uint64_t sub_2465BBF0C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  id v13;
  __int128 v15;
  uint64_t v16;
  __int128 v17[2];
  _QWORD v18[5];
  _BYTE v19[24];
  ValueMetadata *v20;
  _UNKNOWN **v21;

  v20 = &type metadata for LinkServicesProvider;
  v21 = &protocol witness table for LinkServicesProvider;
  v18[3] = sub_2465DB688();
  v18[4] = &protocol witness table for ResponseFactory;
  v18[0] = a4;
  sub_2465DAC74();
  sub_2465DB400();
  sub_2465DC51C();
  sub_2465DB400();
  sub_2465DB400();
  sub_2465DB400();
  v12 = a6 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_resolverOverride;
  *(_QWORD *)(v12 + 32) = 0;
  *(_OWORD *)v12 = 0u;
  *(_OWORD *)(v12 + 16) = 0u;
  *(_QWORD *)(a6 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_globals) = a1;
  swift_beginAccess();
  v13 = a1;
  sub_24655FB94(a2, v12);
  swift_endAccess();
  sub_246558B34((uint64_t)v19, a6 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_linkServicesProvider);
  sub_246545BA8(a3, a6 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_skContactManagerOverride, &qword_25758DAC0);
  sub_246558B34((uint64_t)v18, a6 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_responseFactory);
  sub_246545BA8(a5, (uint64_t)&v15, &qword_25758DAC8);
  if (v16)
  {

    sub_246545BE8(a5, &qword_25758DAC8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    sub_246545BE8(a3, &qword_25758DAC0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    sub_246545BE8(a2, &qword_25758DAB8);
    sub_2465362E0(&v15, (uint64_t)v17);
  }
  else
  {
    sub_2465DB2A4();

    sub_246545BE8(a5, &qword_25758DAC8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    sub_246545BE8(a3, &qword_25758DAC0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    sub_246545BE8(a2, &qword_25758DAB8);
    sub_246545BE8((uint64_t)&v15, &qword_25758DAC8);
  }
  sub_2465362E0(v17, a6 + OBJC_IVAR____TtC16SiriMailInternal15MailSendingPlan_eventSender);
  return a6;
}

void sub_2465BC18C()
{
  sub_2465DCB7C();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BC1A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2465B61B8(a1, a2, a3, a4, MEMORY[0x24BE99970]);
}

void sub_2465BC1C4()
{
  sub_2465DAC20();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BC1E4()
{
  sub_2465DCB7C();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BC200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2465B61B8(a1, a2, a3, a4, MEMORY[0x24BE998B8]);
}

void sub_2465BC21C()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_167();
  v0[1] = v1;
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BC23C()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BC25C()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BC27C()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_168();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BC29C()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_166();
  v0[1] = v1;
  OUTLINED_FUNCTION_2_12();
}

uint64_t sub_2465BC2BC()
{
  return sub_2465BB080();
}

uint64_t sub_2465BC2E0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_79_3(v1);
  return sub_2465870FC(v2, v3);
}

uint64_t sub_2465BC334()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_79_3(v1);
  return sub_2465B7C80(v2, v3, v4);
}

uint64_t sub_2465BC388()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (int *)OUTLINED_FUNCTION_51_3();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E440);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_133(v1[5]);
  OUTLINED_FUNCTION_133(v1[6]);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E340);
  OUTLINED_FUNCTION_26_13(v5);
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E448);
  OUTLINED_FUNCTION_26_13(v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E350);
  OUTLINED_FUNCTION_26_13(v7);
  v8 = v3 + v1[10];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_release();
  return swift_deallocObject();
}

void sub_2465BC4A4()
{
  sub_246545C20(&qword_257591298, (uint64_t (*)(uint64_t))type metadata accessor for SendMailPlan, (uint64_t)&protocol conformance descriptor for SendMailPlan);
}

uint64_t type metadata accessor for SendMailPlan()
{
  uint64_t result;

  result = qword_2575912D0;
  if (!qword_2575912D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2465BC508()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2465BC518()
{
  sub_246545C20(&qword_2575912A0, (uint64_t (*)(uint64_t))type metadata accessor for SendMailPlan, (uint64_t)&protocol conformance descriptor for SendMailPlan);
}

uint64_t sub_2465BC544()
{
  return type metadata accessor for SendMailPlan();
}

void sub_2465BC54C()
{
  unint64_t v0;

  sub_2465BC5F0();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SendMailPlan()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SendMailPlan.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t dispatch thunk of SendMailPlan.accept(input:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of SendMailPlan.body.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

void sub_2465BC5F0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2575912E0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25758DA78);
    v0 = sub_2465DB3C4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2575912E0);
  }
}

uint64_t sub_2465BC648()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257591268);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257591260);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257591258);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257591250);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257591248);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257591240);
  type metadata accessor for ResolveSendMailIntent();
  sub_2465DCBA0();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BE998C0];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25758D4F8);
  sub_246545C20(&qword_25758F950, (uint64_t (*)(uint64_t))type metadata accessor for ResolveSendMailIntent, (uint64_t)&unk_2465E1CD8);
  sub_246545C20(&qword_25758DA90, v0, MEMORY[0x24BE998A8]);
  OUTLINED_FUNCTION_17_14();
  sub_246545C20(&qword_25758F958, (uint64_t (*)(uint64_t))MEMORY[0x24BDB6130], MEMORY[0x24BDB6140]);
  OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_17_14();
  return OUTLINED_FUNCTION_17_14();
}

uint64_t sub_2465BC830(uint64_t a1)
{
  uint64_t v1;

  return sub_2465BAB48(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_2465BC848()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2465BC86C()
{
  return sub_2465BA148();
}

unint64_t sub_2465BC878()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2575914C8;
  if (!qword_2575914C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575914C0);
    result = MEMORY[0x2495605E4](&unk_2465E18A8, v1);
    atomic_store(result, (unint64_t *)&qword_2575914C8);
  }
  return result;
}

uint64_t sub_2465BC8BC()
{
  return sub_2465B9E9C();
}

void OUTLINED_FUNCTION_26_21()
{
  sub_2465BDE28();
}

uint64_t OUTLINED_FUNCTION_29_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(v0, v2+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
}

uint64_t OUTLINED_FUNCTION_30_12()
{
  return sub_2465DB3DC();
}

uint64_t OUTLINED_FUNCTION_39_11()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_42_10(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 208) = a1;
  return sub_2465DD0A4();
}

void OUTLINED_FUNCTION_45_13()
{
  sub_2465B906C();
}

uint64_t OUTLINED_FUNCTION_47_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 288) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_50_8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 176))(a1, v1);
}

uint64_t OUTLINED_FUNCTION_51_8()
{
  uint64_t v0;

  return v0;
}

_QWORD *OUTLINED_FUNCTION_53_9@<X0>(unint64_t a1@<X8>)
{
  int64_t v1;

  return sub_2465AD150((_QWORD *)(a1 > 1), v1, 1);
}

_QWORD *OUTLINED_FUNCTION_58_10()
{
  int64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = v1;
  return sub_2465AD150(0, v0, 0);
}

void OUTLINED_FUNCTION_63_10(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_66_4(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 216) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_67_6(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

_QWORD *OUTLINED_FUNCTION_68_5@<X0>(uint64_t a1@<X8>)
{
  return sub_2465AD150(0, a1 + 1, 1);
}

uint64_t OUTLINED_FUNCTION_71_4()
{
  return sub_2465DB40C();
}

uint64_t OUTLINED_FUNCTION_72_5()
{
  return sub_2465DB43C();
}

uint64_t OUTLINED_FUNCTION_73_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_75_2()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 256) + 8))(*(_QWORD *)(v0 - 176), *(_QWORD *)(v0 - 160));
}

uint64_t OUTLINED_FUNCTION_79_5()
{
  return sub_2465DCDEC();
}

uint64_t OUTLINED_FUNCTION_82_2()
{
  return sub_2465DB898();
}

uint64_t OUTLINED_FUNCTION_85_5()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_86_4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  *(_BYTE *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 24) = v1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_87_5()
{
  return sub_2465DBC28();
}

uint64_t OUTLINED_FUNCTION_90_3(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;

  return sub_2465C8EE0(a1, v1, (uint64_t *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_102_2()
{
  return sub_24655E564();
}

uint64_t OUTLINED_FUNCTION_105_2()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_107_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_108_4()
{
  return sub_2465DB37C();
}

uint64_t OUTLINED_FUNCTION_112_2()
{
  return sub_2465DD0A4();
}

uint64_t OUTLINED_FUNCTION_115_3(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_118_2()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_123_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_246545BA8(v3, v4 - 136, a3);
}

uint64_t OUTLINED_FUNCTION_124_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

BOOL OUTLINED_FUNCTION_125_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_129_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_130_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_132_0@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_133_0()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;

  return v0(v1 - 120, 0);
}

void (*OUTLINED_FUNCTION_134())(_QWORD *a1)
{
  uint64_t v0;

  return sub_2465B6314((_QWORD *)(v0 - 136));
}

uint64_t OUTLINED_FUNCTION_143(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;

  return v3(v4, a2, v2);
}

uint64_t OUTLINED_FUNCTION_147(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

void OUTLINED_FUNCTION_149_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;

  sub_2465B83DC(a1, v20, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t OUTLINED_FUNCTION_151()
{
  return sub_2465DBC1C();
}

uint64_t OUTLINED_FUNCTION_154()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;

  return v0(v1 - 152, 0);
}

uint64_t OUTLINED_FUNCTION_155()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;

  return v0(v1 - 152, 0);
}

void OUTLINED_FUNCTION_159(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_2465506BC(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_164()
{
  return sub_2465DB3DC();
}

uint64_t OUTLINED_FUNCTION_165()
{
  return sub_2465DABF0();
}

uint64_t OUTLINED_FUNCTION_166()
{
  return sub_2465DAC44();
}

uint64_t OUTLINED_FUNCTION_167()
{
  return sub_2465DCB64();
}

uint64_t OUTLINED_FUNCTION_168()
{
  return sub_2465DAC08();
}

uint64_t OUTLINED_FUNCTION_169()
{
  return sub_2465DABCC();
}

uint64_t OUTLINED_FUNCTION_172()
{
  return sub_2465DB3DC();
}

uint64_t OUTLINED_FUNCTION_176()
{
  return sub_2465DBC28();
}

uint64_t sub_2465BCCC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void (*v15)(char *, unint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;

  v4 = sub_2465DC570();
  v34 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v30 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v27 - v8;
  result = MEMORY[0x24BDAC7A8](v7);
  v35 = (char *)&v27 - v11;
  v12 = MEMORY[0x24BEE4AF8];
  v36 = MEMORY[0x24BEE4AF8];
  v29 = *(_QWORD *)(a1 + 16);
  if (v29)
  {
    v13 = 0;
    v33 = a2 + 56;
    v28 = a1;
    while (v13 < *(_QWORD *)(a1 + 16))
    {
      v14 = *(_QWORD *)(v34 + 72);
      v31 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
      v32 = v13;
      v15 = *(void (**)(char *, unint64_t, uint64_t))(v34 + 16);
      v15(v35, a1 + v31 + v14 * v13, v4);
      if (*(_QWORD *)(a2 + 16)
        && (sub_246558BDC(&qword_257591740, (void (*)(uint64_t))MEMORY[0x24BE99C60]),
            v16 = sub_2465DCE28(),
            v17 = -1 << *(_BYTE *)(a2 + 32),
            v18 = v16 & ~v17,
            ((*(_QWORD *)(v33 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0))
      {
        v19 = ~v17;
        while (1)
        {
          v20 = a2;
          v15(v9, *(_QWORD *)(a2 + 48) + v18 * v14, v4);
          sub_246558BDC(&qword_2575905D8, (void (*)(uint64_t))MEMORY[0x24BE99C60]);
          v21 = sub_2465DCE34();
          v22 = *(void (**)(char *, uint64_t))(v34 + 8);
          v22(v9, v4);
          if ((v21 & 1) != 0)
            break;
          v18 = (v18 + 1) & v19;
          a2 = v20;
          if (((*(_QWORD *)(v33 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
            goto LABEL_9;
        }
        result = ((uint64_t (*)(char *, uint64_t))v22)(v35, v4);
        a2 = v20;
      }
      else
      {
LABEL_9:
        v23 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
        v23(v30, v35, v4);
        v24 = v36;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2465AD03C(0, *(_QWORD *)(v24 + 16) + 1, 1);
          v24 = v36;
        }
        v26 = *(_QWORD *)(v24 + 16);
        v25 = *(_QWORD *)(v24 + 24);
        if (v26 >= v25 >> 1)
        {
          sub_2465AD03C(v25 > 1, v26 + 1, 1);
          v24 = v36;
        }
        *(_QWORD *)(v24 + 16) = v26 + 1;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(v24 + v31 + v26 * v14, v30, v4);
        v36 = v24;
      }
      v13 = v32 + 1;
      a1 = v28;
      if (v32 + 1 == v29)
      {
        v12 = v36;
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_17:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v12;
  }
  return result;
}

void sub_2465BCFB8()
{
  sub_2465BCFDC();
}

void sub_2465BCFDC()
{
  void (*v0)(char *, uint64_t);
  void (*v1)(char *, uint64_t);
  _QWORD *v2;
  _QWORD *v3;
  void (*v4)(uint64_t);
  void (*v5)(uint64_t);
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
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  _QWORD v21[2];

  OUTLINED_FUNCTION_14_0();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = ((uint64_t (*)(_QWORD))v4)(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_21_3();
  v12 = v10 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v21 - v14;
  sub_246558BDC(v3, v5);
  v21[1] = sub_2465DD014();
  v16 = *(_QWORD *)(v7 + 16);
  if (v16)
  {
    v17 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    v21[0] = v7;
    v18 = v7 + v17;
    v19 = *(_QWORD *)(v9 + 72);
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    do
    {
      v20(v12, v18, v8);
      v1(v15, v12);
      OUTLINED_FUNCTION_107_0((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
      v18 += v19;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_8_1();
  }
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465BD100(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_2465DD014();
  v7 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = a1 + 40;
    do
    {
      OUTLINED_FUNCTION_115_2();
      sub_2465C54A0();
      swift_bridgeObjectRelease();
      v4 += 16;
      --v3;
    }
    while (v3);
    OUTLINED_FUNCTION_8_1();
    return v7;
  }
  else
  {
    v5 = v2;
    OUTLINED_FUNCTION_8_1();
  }
  return v5;
}

void sub_2465BD1A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;
  char v18;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_179();
    sub_2465DCEAC();
    v6 = OUTLINED_FUNCTION_48_8();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    OUTLINED_FUNCTION_22_18();
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (OUTLINED_FUNCTION_127() & 1) == 0)
      {
        v13 = ~v7;
        v14 = (v8 + 1) & v13;
        OUTLINED_FUNCTION_22_18();
        if ((v15 & 1) != 0)
        {
          do
          {
            v16 = (_QWORD *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2)
              break;
            if ((OUTLINED_FUNCTION_127() & 1) != 0)
              break;
            v14 = (v14 + 1) & v13;
            OUTLINED_FUNCTION_22_18();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

void sub_2465BD294(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!OUTLINED_FUNCTION_171() || v4 + v2 > *(_QWORD *)(v3 + 24) >> 1)
  {
    sub_24655044C();
    v3 = v6;
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    if (!v2)
      goto LABEL_11;
    goto LABEL_13;
  }
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
  OUTLINED_FUNCTION_86_5();
  sub_2465ACC00(a1 + v7, v2);
  if (!v2)
  {
LABEL_11:
    OUTLINED_FUNCTION_8_1();
    *v1 = v3;
    OUTLINED_FUNCTION_18();
    return;
  }
  v8 = *(_QWORD *)(v3 + 16);
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    *(_QWORD *)(v3 + 16) = v10;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_2465BD364(unint64_t a1)
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
    v3 = sub_2465DD200();
    OUTLINED_FUNCTION_8_1();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    OUTLINED_FUNCTION_115_2();
    v5 = sub_2465DD200();
    OUTLINED_FUNCTION_29_1();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_24;
  }
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    OUTLINED_FUNCTION_115_2();
    v4 = MEMORY[0x249560008](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_2465C7678(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    OUTLINED_FUNCTION_115_2();
    v9 = sub_2465DD200();
    OUTLINED_FUNCTION_29_1();
  }
  if (v11 < 1)
    goto LABEL_20;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_20:
    swift_bridgeObjectRelease();
    return sub_2465DCF6C();
  }
  __break(1u);
  return result;
}

void sub_2465BD500()
{
  sub_2465BD570();
}

void sub_2465BD51C()
{
  sub_2465BD570();
}

void sub_2465BD538()
{
  sub_2465BD570();
}

void sub_2465BD554()
{
  sub_2465BD570();
}

void sub_2465BD570()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  void (*v3)(uint64_t, uint64_t, uint64_t);
  void (*v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_QWORD);
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  OUTLINED_FUNCTION_14_0();
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *v0;
  v7 = *(_QWORD *)(*v0 + 16);
  if (__OFADD__(v7, v5))
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v8 = v4;
  v9 = v3;
  v10 = v2;
  v11 = v1;
  if (!OUTLINED_FUNCTION_171() || v7 + v5 > *(_QWORD *)(v6 + 24) >> 1)
    v6 = v10();
  if (!*(_QWORD *)(v11 + 16))
  {
    if (!v5)
      goto LABEL_11;
    goto LABEL_13;
  }
  v12 = *(_QWORD *)(v6 + 16);
  v13 = (*(_QWORD *)(v6 + 24) >> 1) - v12;
  v8(0);
  if (v13 < v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  OUTLINED_FUNCTION_86_5();
  v9(v11 + v16, v5, v15 + v14 * v12);
  if (!v5)
  {
LABEL_11:
    OUTLINED_FUNCTION_8_1();
    *v0 = v6;
    OUTLINED_FUNCTION_4_3();
    return;
  }
  v17 = *(_QWORD *)(v6 + 16);
  v18 = __OFADD__(v17, v5);
  v19 = v17 + v5;
  if (!v18)
  {
    *(_QWORD *)(v6 + 16) = v19;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_2465BD648()
{
  sub_2465DCA44();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BD664(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_119_4();
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_85_2();
  sub_246545BA8(a1, v1, &qword_25758D268);
  sub_2465DCA50();
  OUTLINED_FUNCTION_87();
}

void sub_2465BD6C4()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_218();
  v0[1] = v1;
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BD6E0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2465BDB68(a1, a2, a3, a4, MEMORY[0x24BE99638]);
}

uint64_t sub_2465BD6EC()
{
  return sub_2465BD74C(&qword_257591750, &qword_25758E440, 0xD00000000000001DLL, 0x80000002465E5640);
}

uint64_t sub_2465BD718()
{
  return sub_2465BD74C(&qword_257591738, &qword_25758E338, 0x63413C7961727241, 0xEE003E746E756F63);
}

uint64_t sub_2465BD74C(uint64_t *a1, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a1);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_12_1();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_2465DB3D0();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 88))(v5, v9) == *MEMORY[0x24BE97450])
  {
    OUTLINED_FUNCTION_107_0(v5, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 96));
    return *(_QWORD *)v5;
  }
  else
  {
    OUTLINED_FUNCTION_107_0(v5, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
    if (qword_25758C700 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_5_9();
    OUTLINED_FUNCTION_12_4(v12, (uint64_t)qword_257591790);
    v13 = OUTLINED_FUNCTION_6_7();
    if (OUTLINED_FUNCTION_16_7(v13))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      v15 = OUTLINED_FUNCTION_3_3();
      *(_DWORD *)v14 = 136315138;
      sub_2465C8EE0(a3, a4, &v15);
      OUTLINED_FUNCTION_183();
      OUTLINED_FUNCTION_6_3(&dword_24652E000, v4, (os_log_type_t)v5, "Found .unset Resolvable<%s>, returning an empty one", v14);
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_1();
    }

    return MEMORY[0x24BEE4AF8];
  }
}

void SendMailSceneHostPlan.__allocating_init()()
{
  swift_allocObject();
  SendMailSceneHostPlan.init()();
  OUTLINED_FUNCTION_2_12();
}

uint64_t sub_2465BD920(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _BOOL4 v3;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  v3 = v2 == 0;
  return !a2 || v3;
}

uint64_t sub_2465BD948(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  uint64_t v14;

  if (a3 >> 62)
    goto LABEL_16;
  v5 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_115_2();
  for (; v5; v5 = sub_2465DD200())
  {
    v6 = 4;
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        v7 = MEMORY[0x24955FFFC](v6 - 4, a3);
      }
      else
      {
        v7 = *(_QWORD *)(a3 + 8 * v6);
        swift_retain();
      }
      v8 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v14 = v7;
      v9 = a1(&v14);
      if (v3)
      {
        OUTLINED_FUNCTION_29_1();
        swift_release();
        return v11 & 1;
      }
      v10 = v9;
      swift_release();
      if ((v10 & 1) != 0)
      {
        OUTLINED_FUNCTION_29_1();
        v11 = 1;
        return v11 & 1;
      }
      ++v6;
      if (v8 == v5)
        goto LABEL_11;
    }
    __break(1u);
LABEL_16:
    OUTLINED_FUNCTION_115_2();
  }
LABEL_11:
  OUTLINED_FUNCTION_29_1();
  v11 = 0;
  return v11 & 1;
}

void sub_2465BDA70()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_215();
  v0[1] = v1;
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDA8C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2465BDB68(a1, a2, a3, a4, MEMORY[0x24BE99C98]);
}

void sub_2465BDA98()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_212();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDAB4()
{
  OUTLINED_FUNCTION_11_20();
  sub_2465DC4D4();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDAD0()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_216();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDAEC()
{
  OUTLINED_FUNCTION_11_20();
  sub_2465DC4B0();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDB08()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDB24()
{
  OUTLINED_FUNCTION_11_20();
  sub_2465DC4EC();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDB40()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_213();
  v0[1] = v1;
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDB5C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2465BDB68(a1, a2, a3, a4, MEMORY[0x24BE99B80]);
}

void sub_2465BDB68(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;

  v6 = *a1;
  v7 = a1[1];
  OUTLINED_FUNCTION_115_2();
  a5(v6, v7);
  OUTLINED_FUNCTION_87();
}

void sub_2465BDB9C()
{
  sub_2465DC528();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDBB8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = sub_2465DC51C();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_40_0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v1, a1);
  sub_2465DC534();
  OUTLINED_FUNCTION_87();
}

void sub_2465BDC1C()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_217();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDC38()
{
  OUTLINED_FUNCTION_11_20();
  sub_2465DC480();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465BDC54(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  sub_2465C9B34(*a1, *a2, *a3, *a4, a4[1], *a5, a5[1], *a6, a8, a7);
}

void sub_2465BDC9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  uint64_t v33;
  char *v34;
  _BOOL4 v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  OUTLINED_FUNCTION_14_0();
  a19 = v22;
  a20 = v23;
  v24 = OUTLINED_FUNCTION_223();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_21_3();
  v27 = v25 - v26;
  v29 = MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&a9 - v30;
  v32 = MEMORY[0x24BDAC7A8](v29);
  v34 = (char *)&a9 - v33;
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_150_0();
  sub_2465DC4C8();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_0_10(v21);
  if (v20)
  {
    v35 = 0;
  }
  else
  {
    sub_2465DC4A4();
    OUTLINED_FUNCTION_40();
    v35 = v21 == 0;
  }
  OUTLINED_FUNCTION_1_10(v21);
  OUTLINED_FUNCTION_0_10((uint64_t)v34);
  if (!v35)
  {
    OUTLINED_FUNCTION_1_10((uint64_t)v34);
    OUTLINED_FUNCTION_0_10((uint64_t)v31);
    goto LABEL_9;
  }
  sub_2465DC4E0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_1_10((uint64_t)v34);
  OUTLINED_FUNCTION_0_10((uint64_t)v31);
  if (v34)
  {
LABEL_9:
    OUTLINED_FUNCTION_1_10((uint64_t)v31);
    OUTLINED_FUNCTION_0_10(v27);
    goto LABEL_10;
  }
  v36 = sub_2465DC588();
  v38 = sub_2465BD920(v36, v37);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_1_10((uint64_t)v31);
  OUTLINED_FUNCTION_0_10(v27);
  if ((v38 & 1) != 0)
  {
    v39 = sub_2465DC4F8();
    sub_2465BD920(v39, v40);
    OUTLINED_FUNCTION_29_1();
  }
LABEL_10:
  OUTLINED_FUNCTION_1_10(v27);
  OUTLINED_FUNCTION_4_3();
}

void sub_2465BDE1C()
{
  sub_2465BDE34();
}

void sub_2465BDE28()
{
  sub_2465BDE34();
}

void sub_2465BDE34()
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  void *v31;
  os_log_type_t v32;
  uint64_t v33;
  _DWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41[2];
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
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

  OUTLINED_FUNCTION_14_0();
  v55 = v2;
  v56 = v1;
  v3 = v0;
  v57 = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v54 = sub_2465DC120();
  v52 = *(_QWORD *)(v54 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_4_2();
  v53 = v14;
  OUTLINED_FUNCTION_54_5();
  v15 = sub_2465DC1E0();
  v49 = *(_QWORD *)(v15 - 8);
  v50 = v15;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_68_4(v17, v41[0]);
  sub_2465DC1A4();
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v18);
  v48 = (char *)v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_54_5();
  sub_2465DAECC();
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_41_4(v21, v41[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257590048);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v22);
  v44 = (char *)v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_54_5();
  v24 = sub_2465DC18C();
  v46 = *(_QWORD *)(v24 - 8);
  v47 = v24;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_110_3(v26, v41[0]);
  *(_QWORD *)(v0 + 32) = 0;
  *(_QWORD *)(v0 + 40) = 0;
  *(_BYTE *)(v0 + 48) = -1;
  v27 = v0 + qword_257596F90;
  *(_QWORD *)(v27 + 32) = 0;
  *(_OWORD *)v27 = 0u;
  *(_OWORD *)(v27 + 16) = 0u;
  v28 = (_QWORD *)(v0 + qword_25758FF38);
  *v28 = 0;
  v28[1] = 0;
  v29 = (_QWORD *)(v0 + qword_25758FF40);
  *v29 = 0;
  v29[1] = 0;
  if (qword_25758C700 != -1)
    swift_once();
  v30 = OUTLINED_FUNCTION_5_9();
  v31 = (void *)__swift_project_value_buffer(v30, (uint64_t)qword_257591790);
  OUTLINED_FUNCTION_23_3();
  OUTLINED_FUNCTION_23_3();
  sub_2465DCDEC();
  v32 = OUTLINED_FUNCTION_6_7();
  if (OUTLINED_FUNCTION_16_7(v32))
  {
    v33 = OUTLINED_FUNCTION_3_3();
    v43 = v6;
    v34 = (_DWORD *)v33;
    v42 = OUTLINED_FUNCTION_3_3();
    v58 = v42;
    *v34 = 136315394;
    v41[1] = (uint64_t)(v34 + 1);
    OUTLINED_FUNCTION_148();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
    OUTLINED_FUNCTION_199();
  }

  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_2_6();
  v35 = sub_246599BE8(v12);
  OUTLINED_FUNCTION_16_6();
  *(_QWORD *)(v3 + 16) = v35;
  *(_BYTE *)(v3 + 24) = 0;
  v36 = (uint64_t)v44;
  sub_2465DC228();
  v37 = sub_2465DC234();
  OUTLINED_FUNCTION_26_2(v36, 0, v38, v37);
  sub_2465DAEC0();
  sub_2465DC198();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v49 + 104))(v51, *MEMORY[0x24BE939D8], v50);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v52 + 104))(v53, *MEMORY[0x24BE937B0], v54);
  v39 = v45;
  sub_2465DC180();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 32))(v3 + qword_257596F80, v39, v47);
  v40 = (_QWORD *)(v3 + qword_257596F88);
  *v40 = v10;
  v40[1] = v8;
  swift_beginAccess();
  sub_24659F0FC(v56, v27);
  swift_endAccess();
  sub_24659F144(v57, v3 + qword_257596F98);
  *(_QWORD *)(v3 + qword_257596FA0) = v6;
  OUTLINED_FUNCTION_4_3();
}

void sub_2465BE2C8()
{
  sub_2465BE450((void (*)(uint64_t))MEMORY[0x24BE973F8]);
}

void sub_2465BE2D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_85_2();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6_22();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, v1 + OBJC_IVAR____TtC16SiriMailInternal21SendMailSceneHostPlan__sendMessageTask, v7);
  OUTLINED_FUNCTION_53_1(v2, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
  sub_2465DB3AC();
  OUTLINED_FUNCTION_45_1(a1, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  OUTLINED_FUNCTION_75(v3, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  OUTLINED_FUNCTION_29();
}

void (*sub_2465BE3A8(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = malloc(0x40uLL);
  *a1 = v2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  v2[4] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[5] = v4;
  v2[6] = malloc(*(_QWORD *)(v4 + 64));
  (*(void (**)(void))(v4 + 16))();
  v2[7] = sub_2465DB394();
  return sub_246584E80;
}

void sub_2465BE444()
{
  sub_2465BE450(MEMORY[0x24BE97408]);
}

void sub_2465BE450(void (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_12_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v2, v1 + OBJC_IVAR____TtC16SiriMailInternal21SendMailSceneHostPlan__sendMessageTask, v4);
  a1(v4);
  OUTLINED_FUNCTION_107_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_18();
}

uint64_t SendMailSceneHostPlan.init()()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _OWORD v4[2];
  uint64_t v5;
  _OWORD v6[2];
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  OUTLINED_FUNCTION_123();
  sub_246558BDC(&qword_25758DA90, (void (*)(uint64_t))MEMORY[0x24BE998C0]);
  swift_retain();
  sub_2465DB3B8();
  *(_QWORD *)(v0 + OBJC_IVAR____TtC16SiriMailInternal21SendMailSceneHostPlan_confirmIntentOptions) = 0;
  OUTLINED_FUNCTION_3();
  sub_2465DC720();
  v1 = (void *)sub_2465DC714();
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  sub_2465DB688();
  memset(v4, 0, sizeof(v4));
  v5 = 0;
  OUTLINED_FUNCTION_11_0();
  v2 = sub_2465DB67C();
  return sub_2465C7810(v1, (uint64_t)v8, (uint64_t)v6, v2, (uint64_t)v4, v0);
}

void sub_2465BE5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  os_log_type_t v21;
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  NSObject *v83;
  int v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(uint64_t);
  NSObject *v110;
  os_log_type_t v111;
  uint8_t *v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void (*v118)(uint64_t, uint64_t, uint64_t);
  uint64_t v119;
  uint64_t v120;
  char v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  uint64_t v125;
  os_log_type_t v126;
  _WORD *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
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
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  NSObject *v149;
  uint64_t v150;
  uint64_t v151;
  NSObject *KeyPath;
  uint64_t v153;
  uint64_t (*v154)(uint64_t, uint64_t);
  os_log_type_t v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  uint8_t *v157;
  void (*v158)(_BYTE *, _QWORD);
  uint64_t v159;
  os_log_type_t v160;
  os_log_type_t v161;
  _WORD *v162;
  uint64_t (*v163)(uint64_t, uint64_t);
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void (*v167)(uint64_t, uint64_t);
  uint64_t v168;
  uint64_t v169;
  os_log_type_t v170;
  uint8_t *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  os_log_type_t v183;
  _BOOL4 v184;
  uint64_t v185;
  _WORD *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  char *v223;
  uint64_t v224;
  uint64_t v225;
  void (*v226)(uint64_t, NSObject *);
  uint64_t v227;
  uint64_t v228;
  _BYTE v229[32];
  uint64_t v230[5];

  OUTLINED_FUNCTION_14_0();
  a19 = v25;
  a20 = v26;
  v222 = v20;
  v227 = v27;
  v225 = v28;
  v29 = sub_2465DB8A4();
  v217 = *(_QWORD *)(v29 - 8);
  v218 = v29;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_4_2();
  v216 = v31;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  OUTLINED_FUNCTION_47_5(v32, (uint64_t)v230);
  v202 = v33;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_4_2();
  v201 = v35;
  OUTLINED_FUNCTION_54_5();
  v36 = sub_2465DC51C();
  OUTLINED_FUNCTION_47_5(v36, (uint64_t)&a12);
  v208 = v37;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v39);
  v209 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF68);
  v206 = *(_QWORD *)(v209 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_4_2();
  v205 = v41;
  OUTLINED_FUNCTION_54_5();
  v212 = sub_2465DB8D4();
  v211 = *(_QWORD *)(v212 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v43);
  v193 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E340);
  v192 = *(_QWORD *)(v193 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v45);
  v215 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E188);
  v214 = *(_QWORD *)(v215 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_15_5((uint64_t)&v187 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_15_5(v51);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758F998);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_15_5((uint64_t)&v187 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0));
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758F9A0);
  OUTLINED_FUNCTION_47_5(v54, (uint64_t)v229);
  v195 = v55;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v57);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA70);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v58);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v59);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  v199 = *(_QWORD *)(v60 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v61);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v62);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_15_5(v63);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA60);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v64);
  OUTLINED_FUNCTION_6_22();
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA68);
  v204 = *(_QWORD *)(v65 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v66);
  OUTLINED_FUNCTION_5_3();
  v219 = v67;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v68);
  v70 = (char *)&v187 - v69;
  v228 = sub_2465DB8E0();
  v71 = *(_QWORD *)(v228 - 8);
  MEMORY[0x24BDAC7A8](v228);
  OUTLINED_FUNCTION_21_3();
  v74 = v72 - v73;
  MEMORY[0x24BDAC7A8](v75);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v76);
  OUTLINED_FUNCTION_16_10();
  MEMORY[0x24BDAC7A8](v77);
  OUTLINED_FUNCTION_150_0();
  if (qword_25758C700 != -1)
    swift_once();
  v220 = v60;
  v221 = v65;
  v223 = v70;
  v78 = OUTLINED_FUNCTION_5_9();
  v224 = __swift_project_value_buffer(v78, (uint64_t)qword_257591790);
  v79 = v224;
  sub_2465DCDEC();
  v80 = OUTLINED_FUNCTION_6_7();
  if (OUTLINED_FUNCTION_32_5(v80))
  {
    v81 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    *(_WORD *)v81 = 0;
    OUTLINED_FUNCTION_9_7(&dword_24652E000, v79, v21, "#SendMailSceneHostPlan accept(input:)", v81);
    OUTLINED_FUNCTION_1();
  }

  sub_2465DB898();
  v82 = *(uint64_t (**)(uint64_t, uint64_t))(v71 + 88);
  v83 = v228;
  v84 = v82(v23, v228);
  v85 = *MEMORY[0x24BE98E98];
  v226 = *(void (**)(uint64_t, NSObject *))(v71 + 8);
  v226(v23, v83);
  if (v84 == v85)
  {
    sub_2465DB898();
    if (sub_2465708DC())
    {
      v86 = sub_2465DBE38();
      swift_release();
      sub_2465B5EB4(v86, v22);
      OUTLINED_FUNCTION_29_1();
      v87 = v221;
    }
    else
    {
      v87 = v221;
      __swift_storeEnumTagSinglePayload(v22, 1, 1, v221);
    }
    v89 = v219;
    v88 = v220;
    OUTLINED_FUNCTION_102_3(v24);
    OUTLINED_FUNCTION_9_8(v22, 1, v87);
    if (v121)
    {
      sub_246545BE8(v22, &qword_25758DA60);
    }
    else
    {
      v116 = v204;
      v117 = (uint64_t)v223;
      OUTLINED_FUNCTION_53_1((uint64_t)v223, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v204 + 32));
      v118 = *(void (**)(uint64_t, uint64_t, uint64_t))(v116 + 16);
      v118(v89, v117, v87);
      v119 = OUTLINED_FUNCTION_123();
      sub_246558BDC(&qword_25758DA90, (void (*)(uint64_t))MEMORY[0x24BE998C0]);
      OUTLINED_FUNCTION_131_1();
      v220 = v120;
      sub_2465DBC34();
      v122 = OUTLINED_FUNCTION_9_8(v119, 1, v88);
      if (!v121)
      {
        v134 = v199;
        v135 = v196;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v199 + 32))(v196, v119, v88);
        v136 = OUTLINED_FUNCTION_94_2();
        OUTLINED_FUNCTION_92_4(v136, v137, v138, v139, v140, v141, v142, v143, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197,
          v198);
        OUTLINED_FUNCTION_102_3(v119);
        OUTLINED_FUNCTION_58_4(v135, *(uint64_t (**)(uint64_t, uint64_t))(v134 + 8));
        (*(void (**)(char *, uint64_t))(v116 + 8))(v223, v87);
        goto LABEL_49;
      }
      OUTLINED_FUNCTION_72_6(v122, &qword_25758DA70);
      v118(v89, (uint64_t)v223, v87);
      v123 = sub_2465DCC24();
      sub_246558BDC(&qword_25758E538, (void (*)(uint64_t))MEMORY[0x24BE99978]);
      OUTLINED_FUNCTION_131_1();
      sub_2465DBC34();
      OUTLINED_FUNCTION_9_8(v123, 1, v200);
      if (!v121)
      {
        v144 = v195;
        OUTLINED_FUNCTION_38_4(v198, v123, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v195 + 32));
        swift_getKeyPath();
        sub_246558BDC(&qword_25758CB68, MEMORY[0x24BE999A8]);
        v146 = v145;
        v147 = v194;
        sub_2465DBC28();
        OUTLINED_FUNCTION_19_1();
        v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
        v149 = OUTLINED_FUNCTION_126_1(v147);
        sub_246545BE8(v147, &qword_25758D4F8);
        if ((_DWORD)v149 == 1)
        {
          v150 = v213;
          v151 = v222;
          OUTLINED_FUNCTION_18_14();
          KeyPath = swift_getKeyPath();
          v153 = v190;
          OUTLINED_FUNCTION_192();
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_80_3();
          OUTLINED_FUNCTION_31_9(v150, v154);
          OUTLINED_FUNCTION_132_0((uint64_t)&v222);
          v155 = v153;
          sub_2465DB40C();
          OUTLINED_FUNCTION_58_7();
          OUTLINED_FUNCTION_58_4(v153, v156);
          swift_getKeyPath();
          OUTLINED_FUNCTION_194();
          OUTLINED_FUNCTION_145_1();
          v157 = (uint8_t *)v146;
          v158 = (void (*)(_BYTE *, _QWORD))sub_2465DBC1C();
          v160 = v159;
          if (!OUTLINED_FUNCTION_126_1(v159))
          {
            v228 = swift_getKeyPath();
            swift_getKeyPath();
            OUTLINED_FUNCTION_97_4();
            sub_2465DBC28();
            OUTLINED_FUNCTION_32_11();
            OUTLINED_FUNCTION_9_8(v151, 1, v148);
            if (v121)
            {
              sub_246545BE8(v151, &qword_25758D4F8);
            }
            else
            {
              swift_getKeyPath();
              sub_2465DBF10();
              OUTLINED_FUNCTION_32_11();
              OUTLINED_FUNCTION_107_0(v151, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v148 - 8) + 8));
            }
            v155 = v160;
            sub_2465DBF1C();
          }
          v158(v229, 0);
          OUTLINED_FUNCTION_5_21();
          OUTLINED_FUNCTION_100_3((uint64_t)v230);
          v182 = v195;
          OUTLINED_FUNCTION_63_4();
          v183 = OUTLINED_FUNCTION_22_4();
          v184 = OUTLINED_FUNCTION_2_11(v183);
          v185 = v204;
          if (v184)
          {
            v186 = (_WORD *)OUTLINED_FUNCTION_3_3();
            OUTLINED_FUNCTION_14_2(v186);
            OUTLINED_FUNCTION_9_7(&dword_24652E000, KeyPath, v155, "#SendMailSceneHostPlan accept(input:) processed generic update message task, returning .yes", v157);
            OUTLINED_FUNCTION_1();
          }

          sub_2465DB364();
          OUTLINED_FUNCTION_107_0(v198, *(uint64_t (**)(uint64_t, uint64_t))(v182 + 8));
          v167 = *(void (**)(uint64_t, uint64_t))(v185 + 8);
        }
        else
        {
          OUTLINED_FUNCTION_63_4();
          v170 = OUTLINED_FUNCTION_6_7();
          if (OUTLINED_FUNCTION_32_5(v170))
          {
            v171 = (uint8_t *)OUTLINED_FUNCTION_3_3();
            *(_WORD *)v171 = 0;
            OUTLINED_FUNCTION_9_7(&dword_24652E000, v149, (os_log_type_t)v148, "#SendMailSceneHostPlan accept(input:) processed update message task, returning .yes", v171);
            OUTLINED_FUNCTION_1();
          }

          v172 = swift_getKeyPath();
          OUTLINED_FUNCTION_97_4();
          v173 = v198;
          sub_2465DBC28();
          OUTLINED_FUNCTION_19_1();
          OUTLINED_FUNCTION_166_0();
          sub_2465DBC04();
          v174 = OUTLINED_FUNCTION_94_2();
          OUTLINED_FUNCTION_92_4(v174, v175, v176, v177, v178, v179, v180, v181, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197,
            v198);
          OUTLINED_FUNCTION_102_3(v172);
          OUTLINED_FUNCTION_58_4(v146, *(uint64_t (**)(uint64_t, uint64_t))(v199 + 8));
          OUTLINED_FUNCTION_31_9(v173, *(uint64_t (**)(uint64_t, uint64_t))(v144 + 8));
          OUTLINED_FUNCTION_58_7();
        }
        v168 = (uint64_t)v223;
        v169 = v221;
        goto LABEL_48;
      }
      OUTLINED_FUNCTION_58_7();
      v125 = OUTLINED_FUNCTION_45_1((uint64_t)v223, v124);
      OUTLINED_FUNCTION_72_6(v125, &qword_25758F998);
    }
    v83 = v228;
  }
  sub_2465DB898();
  if (v82(v74, (uint64_t)v83) != *MEMORY[0x24BE98E88])
  {
    v226(v74, v83);
    goto LABEL_26;
  }
  OUTLINED_FUNCTION_58_4(v74, *(uint64_t (**)(uint64_t, uint64_t))(v71 + 96));
  v90 = v211;
  v91 = v74;
  v92 = v210;
  v93 = v212;
  OUTLINED_FUNCTION_38_4(v210, v91, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v211 + 32));
  v94 = sub_2465DB8BC();
  v96 = v95;
  v97 = (void *)sub_2465DB304();
  v98 = objc_msgSend(v97, sel_identifier);

  sub_2465DCE58();
  OUTLINED_FUNCTION_229();
  if ((uint64_t (*)(uint64_t, uint64_t))v94 == v82 && v96 == v97)
  {
    OUTLINED_FUNCTION_2_6();
    goto LABEL_35;
  }
  v94 = OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_29_1();
  if ((v94 & 1) != 0)
  {
LABEL_35:
    OUTLINED_FUNCTION_63_4();
    v126 = OUTLINED_FUNCTION_22_4();
    if (OUTLINED_FUNCTION_2_11(v126))
    {
      v127 = (_WORD *)OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_14_2(v127);
      OUTLINED_FUNCTION_9_7(&dword_24652E000, v83, (os_log_type_t)v96, "#SendMailSceneHostPlan got confirm DI, accepting parse", (uint8_t *)v94);
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_97_4();
    OUTLINED_FUNCTION_159_0();
    swift_getKeyPath();
    OUTLINED_FUNCTION_101_1();
    sub_2465DB3DC();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_107_0((uint64_t)v82, *(uint64_t (**)(uint64_t, uint64_t))(v214 + 8));
    v128 = v208;
    v129 = v207;
    OUTLINED_FUNCTION_122_1(v207, *MEMORY[0x24BE99BD0], *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v208 + 104));
    v130 = v209;
    sub_2465DB418();
    OUTLINED_FUNCTION_58_4(v129, *(uint64_t (**)(uint64_t, uint64_t))(v128 + 8));
    v131 = OUTLINED_FUNCTION_89_5();
    OUTLINED_FUNCTION_107_0(v131, v132);
    OUTLINED_FUNCTION_103_3();
    sub_2465600AC();
    LOBYTE(v230[0]) = 1;
    v133 = v203;
    sub_2465DB418();
    (*(void (**)(uint64_t, uint64_t))(v202 + 8))(v130, v133);
    goto LABEL_47;
  }
  v100 = sub_2465DB8BC();
  v102 = v101;
  v103 = (void *)sub_2465DB2F8();
  v104 = objc_msgSend(v103, sel_identifier);

  sub_2465DCE58();
  OUTLINED_FUNCTION_229();
  if ((uint64_t (*)(uint64_t, uint64_t))v100 == v82 && v102 == v103)
  {
    OUTLINED_FUNCTION_2_6();
    goto LABEL_44;
  }
  v100 = OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_29_1();
  if ((v100 & 1) != 0)
  {
LABEL_44:
    OUTLINED_FUNCTION_63_4();
    v161 = OUTLINED_FUNCTION_22_4();
    if (OUTLINED_FUNCTION_2_11(v161))
    {
      v162 = (_WORD *)OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_14_2(v162);
      OUTLINED_FUNCTION_9_7(&dword_24652E000, v83, (os_log_type_t)v102, "#SendMailSceneHostPlan got reject DI, accepting parse", (uint8_t *)v100);
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_103_3();
    sub_2465600C0();
    swift_getKeyPath();
    OUTLINED_FUNCTION_166_0();
    OUTLINED_FUNCTION_25_20();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_80_3();
    OUTLINED_FUNCTION_45_1((uint64_t)v103, v163);
    v164 = v208;
    v165 = v207;
    OUTLINED_FUNCTION_122_1(v207, *MEMORY[0x24BE99BF8], *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v208 + 104));
    v166 = v209;
    sub_2465DB418();
    OUTLINED_FUNCTION_58_4(v165, *(uint64_t (**)(uint64_t, uint64_t))(v164 + 8));
    (*(void (**)(id, uint64_t))(v206 + 8))(v104, v166);
LABEL_47:
    sub_2465DB364();
    v167 = *(void (**)(uint64_t, uint64_t))(v90 + 8);
    v168 = v92;
    v169 = v93;
LABEL_48:
    v167(v168, v169);
    goto LABEL_49;
  }
  OUTLINED_FUNCTION_31_9(v92, *(uint64_t (**)(uint64_t, uint64_t))(v90 + 8));
LABEL_26:
  v106 = v216;
  v107 = v217;
  v108 = OUTLINED_FUNCTION_142_0();
  v109(v108);
  v110 = OUTLINED_FUNCTION_63_4();
  v111 = sub_2465DD02C();
  if (OUTLINED_FUNCTION_85_3(v111))
  {
    v112 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v230[0] = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v112 = 136315138;
    sub_2465DB898();
    v113 = sub_2465DCE88();
    v115 = sub_2465C8EE0(v113, v114, v230);
    OUTLINED_FUNCTION_124_1(v115);
    OUTLINED_FUNCTION_183();
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_20_3(v106, *(uint64_t (**)(uint64_t, uint64_t))(v107 + 8));
    OUTLINED_FUNCTION_6_3(&dword_24652E000, v110, (os_log_type_t)v82, "#SendMailSceneHostPlan accept(input:): got a non USO parse, rejecting parse: %s", v112);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_20_3(v106, *(uint64_t (**)(uint64_t, uint64_t))(v107 + 8));

  sub_2465DB358();
LABEL_49:
  OUTLINED_FUNCTION_4_3();
}

void sub_2465BF50C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  uint64_t v61;
  int *v62;
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
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void (*v122)(uint64_t, uint64_t);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
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
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD v150[2];
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  ValueMetadata *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;

  OUTLINED_FUNCTION_14_0();
  a19 = v27;
  a20 = v28;
  v29 = v20;
  v154 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758F918);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_110_3(v32, v121);
  v152 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF68);
  v150[0] = *(_QWORD *)(v152 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v34);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E348);
  OUTLINED_FUNCTION_47_5(v35, (uint64_t)&a15);
  v145 = v36;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v38);
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E340);
  v138 = *(_QWORD *)(v139 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_5_3();
  v162 = v40;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_38_1();
  v161 = v42;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E338);
  OUTLINED_FUNCTION_47_5(v43, (uint64_t)&v162);
  v133 = v44;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_5_3();
  v156 = v46;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_10_10();
  v160 = v48;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_38_1();
  v159 = v50;
  v155 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E188);
  v122 = *(void (**)(uint64_t, uint64_t))(v155 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_16_10();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_132();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_38_1();
  v157 = v58;
  v129 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E350);
  v128 = *(_QWORD *)(v129 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_4_2();
  v158 = v60;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591238);
  OUTLINED_FUNCTION_176_0();
  MEMORY[0x24BDAC7A8](v61);
  OUTLINED_FUNCTION_85_2();
  v62 = (int *)type metadata accessor for ResolveSiriMailMessageIntent();
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v63);
  OUTLINED_FUNCTION_12_1();
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575914E8);
  OUTLINED_FUNCTION_47_5(v64, (uint64_t)&v164);
  v136 = v65;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v66);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v67);
  v137 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575914F0);
  v140 = *(_QWORD *)(v137 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v68);
  OUTLINED_FUNCTION_15_5((uint64_t)&v121 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0));
  v141 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575914F8);
  v143 = *(_QWORD *)(v141 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v70);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v71);
  v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591500);
  v146 = *(_QWORD *)(v144 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_15_5((uint64_t)&v121 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0));
  v148 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591508);
  v149 = *(_QWORD *)(v148 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v74);
  OUTLINED_FUNCTION_15_5((uint64_t)&v121 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0));
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591510);
  v77 = *(_QWORD *)(v76 - 8);
  v150[1] = v76;
  v151 = v77;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v78);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v79);
  sub_2465BE444();
  swift_getKeyPath();
  sub_246558BDC(&qword_25758DA90, (void (*)(uint64_t))MEMORY[0x24BE998C0]);
  v126 = v80;
  sub_246558BDC(&qword_25758CB68, MEMORY[0x24BE999A8]);
  sub_2465DB568();
  OUTLINED_FUNCTION_5_21();
  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v24);
  v81 = v157;
  OUTLINED_FUNCTION_32_10();
  swift_getKeyPath();
  v82 = v155;
  sub_2465DB3DC();
  OUTLINED_FUNCTION_19_1();
  v83 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v122 + 1);
  v83(v81, v82);
  OUTLINED_FUNCTION_32_10();
  swift_getKeyPath();
  OUTLINED_FUNCTION_186();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_70_4(v26);
  OUTLINED_FUNCTION_32_10();
  swift_getKeyPath();
  OUTLINED_FUNCTION_57_4();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_70_4(v25);
  v84 = v123;
  OUTLINED_FUNCTION_32_10();
  swift_getKeyPath();
  OUTLINED_FUNCTION_57_4();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_70_4(v84);
  v85 = v124;
  OUTLINED_FUNCTION_32_10();
  swift_getKeyPath();
  OUTLINED_FUNCTION_42_6();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_7_6(v85);
  v86 = v125;
  OUTLINED_FUNCTION_32_10();
  swift_getKeyPath();
  v87 = v130;
  OUTLINED_FUNCTION_42_6();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_7_6(v86);
  v122 = v83;
  v88 = v127;
  OUTLINED_FUNCTION_32_10();
  swift_getKeyPath();
  v89 = v132;
  OUTLINED_FUNCTION_186();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_70_4(v88);
  v90 = v23 + v62[12];
  v91 = sub_2465DAB48();
  OUTLINED_FUNCTION_26_2(v90, 1, v92, v91);
  v93 = v29 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_resolverOverride;
  swift_beginAccess();
  sub_246545BA8(v93, v23 + v62[13], &qword_25758DAB8);
  sub_246545BA8(v29 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_skContactManagerOverride, v23 + v62[14], &qword_25758DAC0);
  v94 = *(void **)(v29 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_globals);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v128 + 32))(v23, v158, v129);
  OUTLINED_FUNCTION_63_7(v23 + v62[5], v159);
  OUTLINED_FUNCTION_63_7(v23 + v62[6], v160);
  OUTLINED_FUNCTION_63_7(v23 + v62[7], v156);
  OUTLINED_FUNCTION_63_7(v23 + v62[8], v161);
  OUTLINED_FUNCTION_63_7(v23 + v62[9], v162);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v145 + 32))(v23 + v62[10], v87, v147);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v150[0] + 32))(v23 + v62[11], v89, v152);
  *(_QWORD *)(v23 + v62[15]) = v94;
  v95 = v94;
  v96 = v153;
  sub_2465600AC();
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  OUTLINED_FUNCTION_26_2(v96, 0, v98, v97);
  v99 = OUTLINED_FUNCTION_123();
  swift_retain();
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  sub_246558BDC(&qword_25758FBF8, (void (*)(uint64_t))type metadata accessor for ResolveSiriMailMessageIntent);
  v102 = v101;
  v103 = v131;
  v104 = v126;
  sub_2465DB1F0();
  OUTLINED_FUNCTION_0();
  sub_246545BE8(v96, &qword_25758F918);
  sub_2465909CC(v23);
  OUTLINED_FUNCTION_159_0();
  v163 = (uint64_t)v62;
  v164 = (ValueMetadata *)v99;
  v165 = v100;
  v166 = v102;
  v167 = v104;
  v105 = OUTLINED_FUNCTION_17_14();
  sub_246558BDC(&qword_25758FBB8, (void (*)(uint64_t))MEMORY[0x24BE99CD0]);
  v107 = v106;
  OUTLINED_FUNCTION_101_1();
  v108 = v135;
  sub_2465DB19C();
  OUTLINED_FUNCTION_72_3((uint64_t)v150);
  OUTLINED_FUNCTION_75(v103, *(uint64_t (**)(uint64_t, uint64_t))(v136 + 8));
  OUTLINED_FUNCTION_83_0();
  v163 = v108;
  v164 = (ValueMetadata *)v105;
  v165 = v107;
  v109 = OUTLINED_FUNCTION_17_14();
  v110 = v134;
  v111 = v137;
  sub_2465DB1CC();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_75(v100, *(uint64_t (**)(uint64_t, uint64_t))(v140 + 8));
  OUTLINED_FUNCTION_83_0();
  v163 = v111;
  v164 = &type metadata for SendMailResult;
  v165 = v109;
  v112 = OUTLINED_FUNCTION_17_14();
  v113 = v141;
  sub_2465DB1E4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_75(v110, *(uint64_t (**)(uint64_t, uint64_t))(v143 + 8));
  v163 = v113;
  v164 = (ValueMetadata *)v112;
  v114 = OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_97_4();
  v115 = v144;
  sub_2465DB1C0();
  v116 = OUTLINED_FUNCTION_89_5();
  OUTLINED_FUNCTION_89_2(v116, v117);
  OUTLINED_FUNCTION_83_0();
  v163 = v115;
  v164 = &type metadata for SendMailResult;
  v165 = v114;
  v118 = OUTLINED_FUNCTION_17_14();
  v119 = v142;
  v120 = v148;
  sub_2465DB1A8();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_107_0(v113, *(uint64_t (**)(uint64_t, uint64_t))(v149 + 8));
  v163 = v120;
  v164 = (ValueMetadata *)v118;
  OUTLINED_FUNCTION_17_14();
  sub_2465DB064();
  OUTLINED_FUNCTION_58_4(v119, *(uint64_t (**)(uint64_t, uint64_t))(v151 + 8));
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465C0028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3[2] = a1;
  v3[3] = a3;
  __swift_instantiateConcreteTypeFromMangledName(qword_25758D390);
  v3[4] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v5 = sub_2465DC51C();
  v3[8] = v5;
  v3[9] = *(_QWORD *)(v5 - 8);
  v3[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758FC28);
  v3[11] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF68);
  v3[12] = v6;
  v3[13] = *(_QWORD *)(v6 - 8);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E188);
  v3[16] = v7;
  v3[17] = *(_QWORD *)(v7 - 8);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  sub_2465DCFE4();
  v3[20] = sub_2465DCFD8();
  v3[21] = sub_2465DCFCC();
  v3[22] = v8;
  return swift_task_switch();
}

uint64_t sub_2465C01A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t, uint64_t);
  int EnumTagSinglePayload;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(NSObject *, uint64_t);
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t, uint64_t);
  uint64_t v34;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 88);
  v34 = *(_QWORD *)(v0 + 64);
  sub_2465600C0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_5_21();
  v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  OUTLINED_FUNCTION_70_4(v1);
  sub_2465DB3E8();
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(v3, v4);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v6, 1, v34);
  v10 = *(NSObject **)(v0 + 88);
  if (EnumTagSinglePayload == 1)
  {
    sub_246545BE8(*(_QWORD *)(v0 + 88), &qword_25758FC28);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 64);
    v12 = *(_QWORD *)(v0 + 72);
    v13 = (*(uint64_t (**)(_QWORD, uint64_t))(v12 + 88))(*(_QWORD *)(v0 + 88), v11);
    v14 = *MEMORY[0x24BE99BD8];
    v15 = *(void (**)(NSObject *, uint64_t))(v12 + 8);
    v15(v10, v11);
    if (v13 == v14)
    {
      if (qword_25758C700 != -1)
        swift_once();
      v32 = (void (*)(uint64_t, uint64_t))v15;
      v33 = v7;
      v16 = OUTLINED_FUNCTION_5_9();
      OUTLINED_FUNCTION_12_4(v16, (uint64_t)qword_257591790);
      v17 = OUTLINED_FUNCTION_144_0();
      if (os_log_type_enabled(v10, v17))
      {
        v18 = (uint8_t *)OUTLINED_FUNCTION_3_3();
        *(_WORD *)v18 = 0;
        OUTLINED_FUNCTION_9_7(&dword_24652E000, v10, v17, "#SendMailSceneHostPlan confirmed via voice, sending email now", v18);
        OUTLINED_FUNCTION_1();
      }
      v19 = *(_QWORD *)(v0 + 144);
      v20 = *(_QWORD *)(v0 + 128);
      v21 = *(_QWORD *)(v0 + 80);
      v30 = *(_QWORD *)(v0 + 72);
      v22 = *(_QWORD *)(v0 + 56);
      v23 = *(_QWORD *)(v0 + 64);
      v31 = *(_QWORD *)(v0 + 48);

      sub_2465600C0();
      swift_getKeyPath();
      OUTLINED_FUNCTION_192();
      OUTLINED_FUNCTION_91_1();
      v33(v19, v20);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v30 + 104))(v21, *MEMORY[0x24BE99BD0], v23);
      OUTLINED_FUNCTION_58_8();
      v32(v21, v23);
      v24 = OUTLINED_FUNCTION_142_0();
      ((void (*)(uint64_t))v8)(v24);
      sub_2465600AC();
      *(_BYTE *)(v0 + 192) = 1;
      sub_2465DB418();
      OUTLINED_FUNCTION_58_4(v22, *(uint64_t (**)(uint64_t, uint64_t))(v31 + 8));
    }
  }
  v25 = *(_QWORD *)(v0 + 32);
  v26 = sub_2465DAB48();
  OUTLINED_FUNCTION_26_2(v25, 1, v27, v26);
  v28 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v28;
  *v28 = v0;
  v28[1] = sub_2465C0498;
  return sub_24656036C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2465C0498()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_103_2();
  v1 = *(_QWORD *)(v0 + 32);
  OUTLINED_FUNCTION_22_2(v2);
  swift_task_dealloc();
  sub_246545BE8(v1, qword_25758D390);
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_2465C04E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3[22] = a2;
  v3[23] = a3;
  v3[21] = a1;
  v4 = sub_2465DC51C();
  v3[24] = v4;
  v3[25] = *(_QWORD *)(v4 - 8);
  v3[26] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF68);
  v3[27] = v5;
  v3[28] = *(_QWORD *)(v5 - 8);
  v3[29] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E188);
  v3[30] = v6;
  v3[31] = *(_QWORD *)(v6 - 8);
  v3[32] = swift_task_alloc();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758FC20);
  v3[33] = v7;
  v3[34] = *(_QWORD *)(v7 - 8);
  v3[35] = swift_task_alloc();
  v8 = sub_2465DB76C();
  v3[36] = v8;
  v3[37] = *(_QWORD *)(v8 - 8);
  v3[38] = swift_task_alloc();
  sub_2465DCFE4();
  v3[39] = sub_2465DCFD8();
  v3[40] = sub_2465DCFCC();
  v3[41] = v9;
  return swift_task_switch();
}

uint64_t sub_2465C0628()
{
  NSObject *v0;
  uint64_t v1;
  os_log_type_t v2;
  id *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  id v9;
  uint8_t *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  _WORD *v21;
  _QWORD *v22;
  uint64_t v23;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  os_log_type_t v30;
  _WORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;

  v3 = (id *)(v1 + 160);
  if (qword_25758C700 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_5_9();
  v5 = OUTLINED_FUNCTION_12_4(v4, (uint64_t)qword_257591790);
  v6 = sub_2465DD050();
  if (OUTLINED_FUNCTION_85_3(v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    *(_WORD *)v7 = 0;
    OUTLINED_FUNCTION_9_7(&dword_24652E000, v5, v2, "#SendMailSceneHostPlan handling error", v7);
    OUTLINED_FUNCTION_1();
  }
  v8 = *(void **)(v1 + 176);

  *(_QWORD *)(v1 + 160) = v8;
  v9 = v8;
  v10 = (uint8_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_25758D820);
  if ((OUTLINED_FUNCTION_100_2() & 1) != 0)
  {
    v11 = (_QWORD *)(v1 + 304);
    v12 = (_QWORD *)(v1 + 288);
    v13 = 296;
LABEL_9:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + v13) + 8))(*v11, *v12);

    v16 = *(_QWORD *)(v1 + 256);
    v49 = *(_QWORD *)(v1 + 248);
    v51 = *(id *)(v1 + 224);
    v17 = *(_QWORD *)(v1 + 200);
    v18 = *(_QWORD *)(v1 + 208);
    v19 = *(_QWORD *)(v1 + 192);
    sub_2465600C0();
    swift_getKeyPath();
    OUTLINED_FUNCTION_121_1();
    OUTLINED_FUNCTION_32_11();
    OUTLINED_FUNCTION_75(v16, *(uint64_t (**)(uint64_t, uint64_t))(v49 + 8));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v17 + 104))(v18, *MEMORY[0x24BE99BF8], v19);
    OUTLINED_FUNCTION_58_8();
    OUTLINED_FUNCTION_20_3(v18, *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
    OUTLINED_FUNCTION_130_1((uint64_t)v51);
    sub_2465DCDEC();
    v20 = OUTLINED_FUNCTION_144_0();
    if (OUTLINED_FUNCTION_5_10(v20))
    {
      v21 = (_WORD *)OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_14_2(v21);
      OUTLINED_FUNCTION_9_7(&dword_24652E000, v0, (os_log_type_t)v16, "#SendMailSceneHostPlan user cancelled or rejected, returning IntentCancelled", (uint8_t *)v17);
      OUTLINED_FUNCTION_1();
    }

    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 336) = v22;
    OUTLINED_FUNCTION_106_2(v22);
    OUTLINED_FUNCTION_89_3();
    return sub_24656C788(v23);
  }
  v14 = *(void **)(v1 + 176);

  *(_QWORD *)(v1 + 144) = v14;
  v15 = v14;
  if (OUTLINED_FUNCTION_100_2())
  {
    v11 = (_QWORD *)(v1 + 280);
    v12 = (_QWORD *)(v1 + 264);
    v13 = 272;
    v3 = (id *)(v1 + 144);
    goto LABEL_9;
  }
  v25 = *(void **)(v1 + 176);

  *(_QWORD *)(v1 + 128) = v25;
  v26 = v25;
  if (OUTLINED_FUNCTION_100_2())
  {
    v28 = *(_QWORD *)(v1 + 88);
    v27 = *(_QWORD *)(v1 + 96);
    *(_QWORD *)(v1 + 352) = v28;
    *(_QWORD *)(v1 + 360) = v27;
    v29 = *(unsigned __int8 *)(v1 + 104);
    if (v29 == 1)
    {
      sub_2465DCDEC();
      v30 = OUTLINED_FUNCTION_144_0();
      if (OUTLINED_FUNCTION_5_10(v30))
      {
        v31 = (_WORD *)OUTLINED_FUNCTION_3_3();
        OUTLINED_FUNCTION_14_2(v31);
        OUTLINED_FUNCTION_9_7(&dword_24652E000, v0, (os_log_type_t)(v1 - 96), "#SendMailSceneHostPlan RecipientResolutionError.contactMatchWithoutEmailHandle, returning UnsupportedContactNoEmailAddress", v10);
        OUTLINED_FUNCTION_1();
      }
      v32 = *(_QWORD *)(v1 + 184);

      sub_246558B34(v32 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_responseFactory, v1 + 24);
      *(_QWORD *)(v1 + 16) = v28;
      swift_retain();
      v33 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v1 + 368) = v33;
      OUTLINED_FUNCTION_106_2(v33);
      OUTLINED_FUNCTION_89_3();
      return sub_2465D4320(v34);
    }
    sub_24657FC9C(v28, v27, v29);
  }
  v35 = *(_QWORD *)(v1 + 256);
  v36 = *(_QWORD *)(v1 + 208);
  v48 = *(_QWORD *)(v1 + 248);
  v38 = *(_QWORD *)(v1 + 192);
  v37 = *(_QWORD *)(v1 + 200);
  v50 = *(_QWORD *)(v1 + 224);
  v52 = *(id *)(v1 + 176);

  sub_2465600C0();
  swift_getKeyPath();
  OUTLINED_FUNCTION_57_4();
  OUTLINED_FUNCTION_91_1();
  OUTLINED_FUNCTION_20_3(v35, *(uint64_t (**)(uint64_t, uint64_t))(v48 + 8));
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v37 + 104))(v36, *MEMORY[0x24BE99BE0], v38);
  OUTLINED_FUNCTION_58_8();
  OUTLINED_FUNCTION_75(v36, *(uint64_t (**)(uint64_t, uint64_t))(v37 + 8));
  OUTLINED_FUNCTION_130_1(v50);
  v39 = v52;
  v40 = v52;
  v41 = sub_2465DCDEC();
  v42 = sub_2465DD050();
  if (OUTLINED_FUNCTION_85_3(v42))
  {
    v43 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v53 = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v43 = 136315138;
    swift_getErrorValue();
    v44 = sub_2465DD29C();
    *(_QWORD *)(v1 + 152) = sub_2465C8EE0(v44, v45, &v53);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_76_3();
    OUTLINED_FUNCTION_76_3();
    OUTLINED_FUNCTION_6_3(&dword_24652E000, v41, (os_log_type_t)v38, "#SendMailSceneHostPlan error: %s", v43);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_76_3();
  OUTLINED_FUNCTION_76_3();

  type metadata accessor for GenericError();
  *(_QWORD *)(v1 + 384) = swift_initStackObject();
  v46 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 392) = v46;
  OUTLINED_FUNCTION_106_2(v46);
  OUTLINED_FUNCTION_89_3();
  return sub_2465D51AC(v47);
}

uint64_t sub_2465C0B9C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_22_2(v2);
  *(_QWORD *)(v0 + 344) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_2465C0BE8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v1;
  v2 = v4;
  OUTLINED_FUNCTION_22_2(&v4);
  *(_QWORD *)(v2 + 376) = v0;
  swift_task_dealloc();
  sub_24658A378(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_2465C0C5C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_103_2();
  OUTLINED_FUNCTION_22_2(v2);
  *(_QWORD *)(v0 + 400) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_2465C0CAC()
{
  return swift_unexpectedError();
}

uint64_t sub_2465C0CC8()
{
  return swift_unexpectedError();
}

uint64_t sub_2465C0CE4()
{
  return swift_unexpectedError();
}

void sub_2465C0D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(_QWORD *);
  void (*v66)(_BYTE *, _QWORD);
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  os_log_type_t v94;
  _BOOL4 v95;
  uint64_t v96;
  uint8_t *v97;
  uint64_t v98;
  void (*v99)(uint64_t, uint64_t);
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103[2];
  void (*v104)(_BYTE *, _QWORD);
  void (*v105)(uint64_t *, _QWORD);
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t KeyPath;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint8_t *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  _BYTE v129[32];
  uint64_t v130;
  uint64_t v131;

  OUTLINED_FUNCTION_14_0();
  a19 = v23;
  a20 = v24;
  v127 = v25;
  v128 = v20;
  v119 = v26;
  v117 = v27;
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  v109 = *(_QWORD *)(v121 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_15_5((uint64_t)v103 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E338);
  OUTLINED_FUNCTION_47_5(v30, (uint64_t)&a13);
  v110 = v31;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575914D8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_15_5(v37);
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_257590068);
  v114 = *(_QWORD *)(v115 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_41_4(v39, v103[0]);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  OUTLINED_FUNCTION_47_5(v40, (uint64_t)&v131);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_15_5(v44);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E340);
  OUTLINED_FUNCTION_158(v45, (uint64_t)&a16);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v47);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E188);
  v124 = *(uint8_t **)(v48 - 8);
  v125 = v48;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v49);
  v123 = (char *)v103 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257590B38);
  OUTLINED_FUNCTION_176_0();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_6_22();
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758FF28);
  v53 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v55 = (uint64_t)v103 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758FF20);
  v116 = *(_QWORD *)(v56 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v57);
  v59 = (char *)v103 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_123();
  sub_246558BDC(&qword_25758DA90, (void (*)(uint64_t))MEMORY[0x24BE998C0]);
  v120 = v60;
  sub_2465DB46C();
  swift_getKeyPath();
  sub_246558BDC(&qword_25758CB68, MEMORY[0x24BE999A8]);
  sub_2465DB448();
  swift_release();
  OUTLINED_FUNCTION_75(v55, *(uint64_t (**)(uint64_t, uint64_t))(v53 + 8));
  swift_getKeyPath();
  v126 = v59;
  sub_2465DB454();
  swift_release();
  LOBYTE(v55) = OUTLINED_FUNCTION_81_5();
  v61 = *(_QWORD *)(v21 + 8);
  OUTLINED_FUNCTION_201();
  v118 = v56;
  if ((v55 & 1) != 0)
  {
    v106 = v61;
    v62 = (uint64_t)v123;
    OUTLINED_FUNCTION_159_0();
    swift_getKeyPath();
    v63 = v111;
    OUTLINED_FUNCTION_25_20();
    swift_release();
    OUTLINED_FUNCTION_58_4(v62, *((uint64_t (**)(uint64_t, uint64_t))v124 + 1));
    OUTLINED_FUNCTION_132_0((uint64_t)&a16);
    sub_2465DB40C();
    OUTLINED_FUNCTION_58_7();
    OUTLINED_FUNCTION_58_4(v63, v64);
    swift_getKeyPath();
    v65 = sub_2465BE3A8(&v130);
    v66 = (void (*)(_BYTE *, _QWORD))sub_2465DBC1C();
    v68 = v67;
    v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
    if (__swift_getEnumTagSinglePayload(v68, 1, v69))
    {
      v66(v129, 0);
      OUTLINED_FUNCTION_32_11();
      ((void (*)(uint64_t *, _QWORD))v65)(&v130, 0);
      v56 = v118;
    }
    else
    {
      v103[1] = v68;
      v104 = v66;
      v105 = (void (*)(uint64_t *, _QWORD))v65;
      v103[0] = swift_getKeyPath();
      swift_getKeyPath();
      v70 = v107;
      sub_2465DBC28();
      OUTLINED_FUNCTION_0();
      v71 = OUTLINED_FUNCTION_9_8(v70, 1, v69);
      if (v72)
      {
        OUTLINED_FUNCTION_72_6(v71, &qword_25758D4F8);
      }
      else
      {
        swift_getKeyPath();
        sub_2465DBF10();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_20_3(v70, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 8));
      }
      sub_2465DBF1C();
      v104(v129, 0);
      OUTLINED_FUNCTION_32_11();
      v105(&v130, 0);
      v56 = v118;
    }
  }
  swift_getKeyPath();
  sub_2465DB454();
  OUTLINED_FUNCTION_0();
  v73 = OUTLINED_FUNCTION_81_5();
  OUTLINED_FUNCTION_201();
  if ((v73 & 1) != 0)
  {
    v74 = (uint64_t)v123;
    OUTLINED_FUNCTION_18_14();
    swift_getKeyPath();
    OUTLINED_FUNCTION_166_0();
    OUTLINED_FUNCTION_25_20();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_58_4(v74, *((uint64_t (**)(uint64_t, uint64_t))v124 + 1));
    OUTLINED_FUNCTION_132_0((uint64_t)&a16);
    sub_2465DB40C();
    OUTLINED_FUNCTION_58_4(v22, *(uint64_t (**)(uint64_t, uint64_t))(v112 + 8));
    swift_getKeyPath();
    OUTLINED_FUNCTION_194();
    sub_2465DBC1C();
    v76 = v75;
    v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
    if (__swift_getEnumTagSinglePayload(v76, 1, v77))
    {
      OUTLINED_FUNCTION_182((uint64_t)v129);
      OUTLINED_FUNCTION_19_1();
      OUTLINED_FUNCTION_119_1();
    }
    else
    {
      KeyPath = swift_getKeyPath();
      swift_getKeyPath();
      v78 = v108;
      sub_2465DBC28();
      OUTLINED_FUNCTION_32_11();
      OUTLINED_FUNCTION_9_8(v78, 1, v77);
      if (v72)
      {
        sub_246545BE8(v78, &qword_25758D4F8);
      }
      else
      {
        swift_getKeyPath();
        sub_2465DBF10();
        swift_release();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 8))(v78, v77);
      }
      sub_2465DBF1C();
      OUTLINED_FUNCTION_182((uint64_t)v129);
      OUTLINED_FUNCTION_19_1();
      OUTLINED_FUNCTION_119_1();
      v56 = v118;
    }
  }
  v79 = swift_getKeyPath();
  sub_246558BDC(&qword_25758CB70, (void (*)(uint64_t))MEMORY[0x24BE99750]);
  v80 = v122;
  sub_2465DB460();
  OUTLINED_FUNCTION_19_1();
  v81 = v115;
  v82 = OUTLINED_FUNCTION_81_5();
  OUTLINED_FUNCTION_101_3();
  if ((v82 & 1) != 0)
  {
    OUTLINED_FUNCTION_103_3();
    OUTLINED_FUNCTION_57_6();
    v83 = OUTLINED_FUNCTION_108_4();
    v84 = OUTLINED_FUNCTION_9_8(v79, 1, v83);
    if (!v72)
    {
LABEL_31:
      OUTLINED_FUNCTION_84_3();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 32))(v117, v79, v83);
      goto LABEL_33;
    }
    OUTLINED_FUNCTION_72_6(v84, &qword_2575914D8);
    OUTLINED_FUNCTION_121_3();
    swift_getKeyPath();
    OUTLINED_FUNCTION_51_9();
    OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_53_10();
    OUTLINED_FUNCTION_109_5();
    v85 = v80;
    v80 = v122;
    OUTLINED_FUNCTION_107_0(v85, *(uint64_t (**)(uint64_t, uint64_t))(v110 + 8));
  }
  swift_getKeyPath();
  OUTLINED_FUNCTION_66_5();
  OUTLINED_FUNCTION_19_1();
  v86 = OUTLINED_FUNCTION_81_5();
  OUTLINED_FUNCTION_101_3();
  if ((v86 & 1) != 0)
  {
    OUTLINED_FUNCTION_103_3();
    OUTLINED_FUNCTION_57_6();
    v83 = OUTLINED_FUNCTION_108_4();
    v87 = OUTLINED_FUNCTION_9_8(v79, 1, v83);
    if (!v72)
      goto LABEL_31;
    OUTLINED_FUNCTION_72_6(v87, &qword_2575914D8);
    OUTLINED_FUNCTION_121_3();
    swift_getKeyPath();
    OUTLINED_FUNCTION_51_9();
    OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_53_10();
    OUTLINED_FUNCTION_109_5();
    OUTLINED_FUNCTION_107_0(v80, *(uint64_t (**)(uint64_t, uint64_t))(v110 + 8));
  }
  swift_getKeyPath();
  OUTLINED_FUNCTION_66_5();
  OUTLINED_FUNCTION_19_1();
  v88 = OUTLINED_FUNCTION_81_5();
  OUTLINED_FUNCTION_101_3();
  if ((v88 & 1) != 0)
  {
    OUTLINED_FUNCTION_103_3();
    OUTLINED_FUNCTION_57_6();
    v89 = OUTLINED_FUNCTION_108_4();
    v90 = OUTLINED_FUNCTION_9_8(v79, 1, v89);
    if (!v72)
    {
      OUTLINED_FUNCTION_84_3();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 32))(v117, v79, v89);
      goto LABEL_33;
    }
    OUTLINED_FUNCTION_72_6(v90, &qword_2575914D8);
    v91 = (uint64_t)v123;
    sub_2465600C0();
    v81 = swift_getKeyPath();
    OUTLINED_FUNCTION_103_3();
    sub_2465DB3DC();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_75(v91, *((uint64_t (**)(uint64_t, uint64_t))v124 + 1));
    OUTLINED_FUNCTION_132_0((uint64_t)&a13);
    sub_2465DB40C();
    OUTLINED_FUNCTION_58_4(v79, *(uint64_t (**)(uint64_t, uint64_t))(v110 + 8));
  }
  if (qword_25758C700 != -1)
    swift_once();
  v92 = OUTLINED_FUNCTION_5_9();
  v93 = __swift_project_value_buffer(v92, (uint64_t)qword_257591790);
  swift_retain_n();
  sub_2465DCDEC();
  v94 = OUTLINED_FUNCTION_22_4();
  v95 = OUTLINED_FUNCTION_2_11(v94);
  v96 = v121;
  if (v95)
  {
    LODWORD(v127) = v93;
    v97 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v125 = OUTLINED_FUNCTION_3_3();
    v130 = v125;
    *(_DWORD *)v97 = 136315138;
    v123 = (char *)(v97 + 4);
    v124 = v97;
    swift_getKeyPath();
    OUTLINED_FUNCTION_101_1();
    sub_2465BE2C8();
    OUTLINED_FUNCTION_97_4();
    sub_2465DBC28();
    OUTLINED_FUNCTION_5_21();
    v98 = OUTLINED_FUNCTION_89_5();
    v99(v98, v96);
    v100 = sub_2465DCE88();
    v102 = sub_2465C8EE0(v100, v101, &v130);
    OUTLINED_FUNCTION_124_1(v102);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_207();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_6_3(&dword_24652E000, v81, (os_log_type_t)v127, "#SendMailSceneHostPlan accept(input:) returning .yes() with updated target: %s", v124);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_207();
  sub_2465DB364();
  (*(void (**)(char *, uint64_t))(v116 + 8))(v126, v56);
LABEL_33:
  OUTLINED_FUNCTION_4_3();
}

void sub_2465C1954()
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
  NSObject *v20;
  int v21;
  _BOOL4 v22;
  unsigned int *v23;
  int *v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  unint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  size_t v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  os_log_type_t v74;
  uint8_t *v75;
  uint64_t v76;
  void (*v77)(_QWORD *);
  uint64_t v78;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(_QWORD *, _QWORD);
  uint64_t v83;
  char v85;
  unint64_t v86;
  uint64_t v87;
  char v88;
  int v89;
  os_log_type_t v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  uint64_t v106;
  uint64_t v107;
  _QWORD v108[2];
  uint64_t (*v109)(uint64_t, uint64_t);
  uint64_t (*v110)(uint64_t, uint64_t);
  uint64_t v111;
  int v112;
  uint64_t v113;
  int v114;
  os_log_t v115;
  void (*v116)(uint64_t);
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  _QWORD v127[9];
  uint64_t v128[5];
  uint64_t v129;
  uint64_t v130;

  OUTLINED_FUNCTION_14_0();
  v123 = v0;
  v5 = v4;
  v7 = v6;
  v126 = v8;
  v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575914B8);
  v119 = *(_QWORD *)(v120 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v9);
  v118 = (char *)v108 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_54_5();
  v121 = sub_2465DBC64();
  v11 = *(_QWORD *)(v121 - 8);
  MEMORY[0x24BDAC7A8](v121);
  OUTLINED_FUNCTION_86_2();
  v12 = sub_2465DB8E0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v122 = (uint64_t)v108 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_150_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_41_0();
  v124 = v5;
  if ((sub_24656D648(v7) & 1) != 0)
  {
    if (qword_25758C700 != -1)
      swift_once();
    v17 = OUTLINED_FUNCTION_5_9();
    v18 = __swift_project_value_buffer(v17, (uint64_t)qword_257591790);
    OUTLINED_FUNCTION_147(v1);
    v19 = v122;
    OUTLINED_FUNCTION_147(v122);
    v117 = v18;
    v20 = v18;
    sub_2465DCDEC();
    v21 = OUTLINED_FUNCTION_6_7();
    v22 = OUTLINED_FUNCTION_125_0((os_log_type_t)v21);
    v23 = (unsigned int *)MEMORY[0x24BE9F828];
    if (v22)
    {
      v24 = (int *)MEMORY[0x24BE9F828];
      v115 = v20;
      v25 = OUTLINED_FUNCTION_3_3();
      v113 = OUTLINED_FUNCTION_3_3();
      v128[0] = v113;
      *(_DWORD *)v25 = 136315650;
      v114 = v21;
      if ((_BYTE)v7)
      {
        OUTLINED_FUNCTION_135();
        if (v26)
          v28 = 17219;
        else
          v28 = 4408130;
        if (v26)
          v29 = v27;
        else
          v29 = 0xE300000000000000;
      }
      else
      {
        v29 = 0xE200000000000000;
        v28 = 20308;
      }
      v127[0] = sub_2465C8EE0(v28, v29, v128);
      sub_2465DD0A4();
      OUTLINED_FUNCTION_27();
      *(_WORD *)(v25 + 12) = 1024;
      v112 = *v24;
      v116 = *(void (**)(uint64_t))(v11 + 104);
      v47 = v11;
      v111 = v11;
      v48 = v121;
      v116(v3);
      v49 = sub_24656E494(v7);
      v110 = (uint64_t (*)(uint64_t, uint64_t))v108;
      MEMORY[0x24BDAC7A8](v49);
      OUTLINED_FUNCTION_28_16();
      v51 = sub_2465BD948((uint64_t (*)(uint64_t *))sub_24656E73C, v50, v49);
      v125 = v7;
      v52 = v51;
      OUTLINED_FUNCTION_27();
      v110 = *(uint64_t (**)(uint64_t, uint64_t))(v47 + 8);
      OUTLINED_FUNCTION_89_2(v3, v110);
      v109 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
      OUTLINED_FUNCTION_75(v1, v109);
      LODWORD(v127[0]) = v52 & 1;
      v108[1] = (char *)v127 + 4;
      sub_2465DD0A4();
      *(_WORD *)(v25 + 18) = 1024;
      ((void (*)(uint64_t, _QWORD, uint64_t))v116)(v3, *MEMORY[0x24BE9F820], v48);
      v53 = sub_24656E494(v125);
      MEMORY[0x24BDAC7A8](v53);
      OUTLINED_FUNCTION_28_16();
      v55 = sub_2465BD948((uint64_t (*)(uint64_t *))sub_24656E73C, v54, v53);
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_72_3((uint64_t)&v130);
      OUTLINED_FUNCTION_72_3((uint64_t)&v129);
      LODWORD(v127[0]) = v55 & 1;
      sub_2465DD0A4();
      _os_log_impl(&dword_24652E000, v115, (os_log_type_t)v114, "#SendMailSceneHostPlan %s recipients has a list operation add recipients? %{BOOL}d, remove recipients? %{BOOL}d", (uint8_t *)v25, 0x18u);
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_1();
    }
    v35 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v35(v19, v12);
    v35(v1, v12);

    v36 = *(void (**)(uint64_t))(v11 + 104);
    v37 = v11;
    v38 = v121;
    OUTLINED_FUNCTION_143(v56, *v23);
    v57 = sub_24656E494(v7);
    MEMORY[0x24BDAC7A8](v57);
    OUTLINED_FUNCTION_28_16();
    v59 = sub_2465BD948((uint64_t (*)(uint64_t *))sub_24656E720, v58, (unint64_t)v57);
    OUTLINED_FUNCTION_8_1();
    v60 = *(_QWORD *)(v37 + 8);
    v61 = OUTLINED_FUNCTION_206();
    if ((v59 & 1) != 0)
    {
      v122 = v60;
      v62 = OUTLINED_FUNCTION_129_0();
      v63 = sub_24656D800(v62);
      if (!*(_QWORD *)(v63 + 16))
      {
        OUTLINED_FUNCTION_35_13();
        OUTLINED_FUNCTION_79_5();
        v74 = OUTLINED_FUNCTION_22_4();
        if (OUTLINED_FUNCTION_138(v74))
        {
          v75 = (uint8_t *)OUTLINED_FUNCTION_3_3();
          v128[0] = OUTLINED_FUNCTION_3_3();
          *(_DWORD *)v75 = 136315138;
          if ((_BYTE)v7)
          {
            OUTLINED_FUNCTION_135();
            if (v26)
              v76 = 17219;
            else
              v76 = 4408130;
          }
          else
          {
            v76 = 20308;
          }
          v93 = OUTLINED_FUNCTION_90_3(v76);
          OUTLINED_FUNCTION_42_10(v93);
          OUTLINED_FUNCTION_35_13();
          OUTLINED_FUNCTION_6_3(&dword_24652E000, v57, v74, "#SendMailSceneHostPlan Digressing into the ResolveRecipientsFlow to request the recipients to be added to field %s", v75);
          OUTLINED_FUNCTION_14_1();
          OUTLINED_FUNCTION_1();
        }
        goto LABEL_66;
      }
      v116 = v36;
      OUTLINED_FUNCTION_23_3();
      OUTLINED_FUNCTION_79_5();
      v64 = OUTLINED_FUNCTION_22_4();
      if (OUTLINED_FUNCTION_138(v64))
      {
        v65 = OUTLINED_FUNCTION_3_3();
        v128[0] = OUTLINED_FUNCTION_3_3();
        *(_DWORD *)v65 = 136315394;
        swift_bridgeObjectRetain();
        v66 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
        v67 = MEMORY[0x24955FDE0](v63, v66);
        v125 = v7;
        v69 = v68;
        OUTLINED_FUNCTION_35_13();
        v127[0] = sub_2465C8EE0(v67, v69, v128);
        sub_2465DD0A4();
        OUTLINED_FUNCTION_2_6();
        OUTLINED_FUNCTION_21_4();
        *(_WORD *)(v65 + 12) = 2080;
        if ((_BYTE)v125)
        {
          OUTLINED_FUNCTION_135();
          if (v70)
            v72 = 17219;
          else
            v72 = 4408130;
          if (v70)
            v73 = v71;
          else
            v73 = 0xE300000000000000;
        }
        else
        {
          v73 = 0xE200000000000000;
          v72 = 20308;
        }
        v127[0] = sub_2465C8EE0(v72, v73, v128);
        sub_2465DD0A4();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_77_3(&dword_24652E000, v81, v64, "#SendMailSceneHostPlan Adding these recipients %s to %s");
        OUTLINED_FUNCTION_105_2();
        OUTLINED_FUNCTION_1();
      }

      OUTLINED_FUNCTION_2_6();
      swift_getKeyPath();
      OUTLINED_FUNCTION_204();
      OUTLINED_FUNCTION_145_1();
      __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
      sub_246558BDC(&qword_25758DA90, (void (*)(uint64_t))MEMORY[0x24BE998C0]);
      sub_246558BDC(&qword_25758CB68, MEMORY[0x24BE999A8]);
      v82 = (void (*)(_QWORD *, _QWORD))sub_2465DBC1C();
      v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
      if (!OUTLINED_FUNCTION_78_2(v83))
        sub_2465324FC(v7, v63);
      OUTLINED_FUNCTION_35_13();
      v82(v127, 0);
      OUTLINED_FUNCTION_19_1();
      v61 = OUTLINED_FUNCTION_100_3((uint64_t)v128);
      v38 = v121;
    }
    OUTLINED_FUNCTION_143(v61, *MEMORY[0x24BE9F820]);
    v85 = OUTLINED_FUNCTION_129_0();
    v86 = sub_24656E494(v85);
    MEMORY[0x24BDAC7A8](v86);
    OUTLINED_FUNCTION_28_16();
    v88 = sub_2465BD948((uint64_t (*)(uint64_t *))sub_24656E73C, v87, v86);
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_206();
    if ((v88 & 1) == 0)
    {
LABEL_55:
      v80 = 1;
      v43 = v126;
      goto LABEL_67;
    }
    v89 = OUTLINED_FUNCTION_129_0();
    v57 = sub_24656E02C(v89);
    if (v57[2].isa)
    {
      sub_2465C30A8();
      OUTLINED_FUNCTION_8_1();
      goto LABEL_55;
    }
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_79_5();
    v90 = OUTLINED_FUNCTION_22_4();
    if (OUTLINED_FUNCTION_138(v90))
    {
      v91 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      v128[0] = OUTLINED_FUNCTION_3_3();
      *(_DWORD *)v91 = 136315138;
      if ((_BYTE)v7)
      {
        OUTLINED_FUNCTION_135();
        if (v26)
          v92 = 17219;
        else
          v92 = 4408130;
      }
      else
      {
        v92 = 20308;
      }
      v94 = OUTLINED_FUNCTION_90_3(v92);
      OUTLINED_FUNCTION_42_10(v94);
      OUTLINED_FUNCTION_35_13();
      OUTLINED_FUNCTION_6_3(&dword_24652E000, v57, v90, "#SendMailSceneHostPlan Digressing into the ResolveRecipientsFlow to request the recipients to be removed from field %s", v91);
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_1();
    }
LABEL_66:

    v95 = *(void **)(v123 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_globals);
    v96 = OUTLINED_FUNCTION_74_2();
    OUTLINED_FUNCTION_123_1(v96, v97, &qword_25758DAB8);
    memset(v127, 0, 40);
    v98 = OUTLINED_FUNCTION_119_4();
    OUTLINED_FUNCTION_11_0();
    v99 = v95;
    OUTLINED_FUNCTION_43_12();
    v128[0] = v100;
    v101 = OUTLINED_FUNCTION_2_29();
    OUTLINED_FUNCTION_112_3(v101);
    v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E4C0);
    sub_246558A88(&qword_2575914C8, &qword_2575914C0);
    v104 = v103;
    OUTLINED_FUNCTION_166_0();
    sub_2465DB10C();
    OUTLINED_FUNCTION_19_1();
    swift_release();
    v128[0] = v98;
    v128[1] = v102;
    v128[2] = v104;
    OUTLINED_FUNCTION_17_14();
    v43 = v126;
    sub_2465DB370();
    OUTLINED_FUNCTION_80_3();
    OUTLINED_FUNCTION_58_4(v38, v105);
    v80 = 0;
    goto LABEL_67;
  }
  swift_getKeyPath();
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  sub_246558BDC(&qword_25758DA90, (void (*)(uint64_t))MEMORY[0x24BE998C0]);
  v32 = v31;
  sub_246558BDC(&qword_25758CB68, MEMORY[0x24BE999A8]);
  v124 = v33;
  sub_2465DBC28();
  swift_release();
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
  OUTLINED_FUNCTION_9_8(v2, 1, v34);
  if (v26)
  {
    sub_246545BE8(v2, &qword_25758D4F8);
  }
  else
  {
    OUTLINED_FUNCTION_129_0();
    sub_246532458();
    OUTLINED_FUNCTION_89_2(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 8));
  }
  v125 = v7;
  if (qword_25758C700 != -1)
    swift_once();
  v39 = OUTLINED_FUNCTION_5_9();
  v40 = (void *)__swift_project_value_buffer(v39, (uint64_t)qword_257591790);
  OUTLINED_FUNCTION_23_3();
  sub_2465DCDEC();
  v41 = OUTLINED_FUNCTION_6_7();
  v42 = OUTLINED_FUNCTION_125_0(v41);
  v43 = v126;
  if (v42)
  {
    v121 = v32;
    v44 = OUTLINED_FUNCTION_3_3();
    v128[0] = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v44 = 136315394;
    v122 = v30;
    if ((_BYTE)v125)
    {
      OUTLINED_FUNCTION_135();
      if (v26)
        v46 = 17219;
      else
        v46 = 4408130;
    }
    else
    {
      v46 = 20308;
    }
    v127[0] = OUTLINED_FUNCTION_198(v46, v45, v128);
    OUTLINED_FUNCTION_112_2();
    swift_bridgeObjectRelease();
    *(_WORD *)(v44 + 12) = 2080;
    OUTLINED_FUNCTION_148();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
    OUTLINED_FUNCTION_199();
  }

  OUTLINED_FUNCTION_2_6();
  swift_getKeyPath();
  v77 = OUTLINED_FUNCTION_204();
  sub_2465DBC1C();
  OUTLINED_FUNCTION_145_1();
  if (!__swift_getEnumTagSinglePayload(v78, 1, v34))
    sub_2465327E8();
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_100_3((uint64_t)v127);
  OUTLINED_FUNCTION_27_10();
  ((void (*)(uint64_t *, _QWORD))v77)(v128, 0);
  v80 = 1;
LABEL_67:
  v106 = OUTLINED_FUNCTION_108_4();
  OUTLINED_FUNCTION_26_2(v43, v80, v107, v106);
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465C27B8(uint64_t *a1, int a2, uint64_t a3)
{
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  char *v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  int v46;
  void (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v41 = a3;
  v46 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E338);
  v45 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v36 - v7;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E188);
  v40 = *(_QWORD *)(v43 - 8);
  v9 = MEMORY[0x24BDAC7A8](v43);
  v42 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)&v36 - v11;
  v12 = sub_2465DABB4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_2465DC570();
  v16 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *a1;
  v20 = *(_QWORD *)(v19 + 16);
  if (v20)
  {
    v37 = v8;
    v38 = v4;
    v51 = MEMORY[0x24BEE4AF8];
    sub_2465AD03C(0, v20, 0);
    v21 = v19 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    v22 = *(_QWORD *)(v13 + 72);
    v47 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v48 = v22;
    v23 = v13;
    v49 = v13;
    do
    {
      v47(v15, v21, v12);
      sub_2465DAB60();
      sub_2465DAB84();
      sub_2465DC54C();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v15, v12);
      v24 = v51;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2465AD03C(0, *(_QWORD *)(v24 + 16) + 1, 1);
        v24 = v51;
      }
      v26 = *(_QWORD *)(v24 + 16);
      v25 = *(_QWORD *)(v24 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_2465AD03C(v25 > 1, v26 + 1, 1);
        v24 = v51;
      }
      *(_QWORD *)(v24 + 16) = v26 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v24+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(_QWORD *)(v16 + 72) * v26, v18, v50);
      v51 = v24;
      v23 = v49;
      v21 += v48;
      --v20;
    }
    while (v20);
    v8 = v37;
    v27 = v38;
  }
  else
  {
    v27 = v4;
  }
  v28 = v39;
  sub_2465600C0();
  swift_getKeyPath();
  v29 = v43;
  sub_2465DB3DC();
  swift_release();
  v30 = *(void (**)(char *, uint64_t))(v40 + 8);
  v30(v28, v29);
  v31 = v42;
  sub_2465600C0();
  swift_getKeyPath();
  v32 = v44;
  sub_2465DB3DC();
  swift_release();
  v30(v31, v29);
  v33 = sub_2465BD74C(&qword_257591738, &qword_25758E338, 0x63413C7961727241, 0xEE003E746E756F63);
  v34 = *(void (**)(char *, uint64_t))(v45 + 8);
  v34(v32, v27);
  v51 = v33;
  sub_2465BD570();
  sub_2465DB418();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v34)(v8, v27);
}

uint64_t sub_2465C2C18(uint64_t *a1, int a2, uint64_t a3)
{
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  int v46;
  void (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v41 = a3;
  v46 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E338);
  v45 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - v7;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E188);
  v40 = *(_QWORD *)(v43 - 8);
  v9 = MEMORY[0x24BDAC7A8](v43);
  v42 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)&v37 - v11;
  v12 = sub_2465DABB4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_2465DC570();
  v16 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *a1;
  v20 = *(_QWORD *)(*a1 + 16);
  if (v20)
  {
    v37 = v8;
    v38 = v4;
    v51 = MEMORY[0x24BEE4AF8];
    sub_2465AD03C(0, v20, 0);
    v21 = v19 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    v48 = *(_QWORD *)(v13 + 72);
    v49 = v13;
    v47 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    do
    {
      v47(v15, v21, v12);
      sub_2465DAB60();
      sub_2465DAB84();
      sub_2465DC54C();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v15, v12);
      v22 = v51;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2465AD03C(0, *(_QWORD *)(v22 + 16) + 1, 1);
        v22 = v51;
      }
      v24 = *(_QWORD *)(v22 + 16);
      v23 = *(_QWORD *)(v22 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_2465AD03C(v23 > 1, v24 + 1, 1);
        v22 = v51;
      }
      *(_QWORD *)(v22 + 16) = v24 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v16 + 32))(v22+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(_QWORD *)(v16 + 72) * v24, v18, v50);
      v51 = v22;
      v21 += v48;
      --v20;
    }
    while (v20);
    v8 = v37;
    v25 = v38;
  }
  else
  {
    v25 = v4;
  }
  v26 = v39;
  sub_2465600C0();
  swift_getKeyPath();
  v27 = v43;
  sub_2465DB3DC();
  swift_release();
  v28 = *(void (**)(char *, uint64_t))(v40 + 8);
  v28(v26, v27);
  v29 = v42;
  sub_2465600C0();
  swift_getKeyPath();
  v30 = v44;
  sub_2465DB3DC();
  swift_release();
  v28(v29, v27);
  sub_2465BD74C(&qword_257591738, &qword_25758E338, 0x63413C7961727241, 0xEE003E746E756F63);
  v31 = *(void (**)(char *, uint64_t))(v45 + 8);
  v31(v30, v25);
  swift_bridgeObjectRetain();
  sub_2465BCFDC();
  v33 = v32;
  v34 = swift_bridgeObjectRetain();
  v35 = sub_2465BCCC4(v34, v33);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v51 = v35;
  sub_2465DB418();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v31)(v8, v25);
}

void sub_2465C30A8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(char *, uint64_t, uint64_t);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94[4];

  OUTLINED_FUNCTION_14_0();
  v84 = v1;
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD98);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_68_4(v7, v83);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
  v91 = *(_QWORD *)(v8 - 8);
  v92 = v8;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_5_3();
  v90 = v10;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v83 - v12;
  if (qword_25758C700 != -1)
    swift_once();
  v14 = OUTLINED_FUNCTION_5_9();
  __swift_project_value_buffer(v14, (uint64_t)qword_257591790);
  OUTLINED_FUNCTION_23_3();
  sub_2465DCDEC();
  v15 = OUTLINED_FUNCTION_22_4();
  v16 = OUTLINED_FUNCTION_138(v15);
  v85 = v3;
  HIDWORD(v83) = v5;
  if (v16)
  {
    v17 = OUTLINED_FUNCTION_3_3();
    v94[0] = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v17 = 136315394;
    v18 = swift_bridgeObjectRetain();
    v19 = MEMORY[0x24955FDE0](v18, v92);
    v21 = v20;
    OUTLINED_FUNCTION_21_4();
    v93 = sub_2465C8EE0(v19, v21, v94);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_2_6();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    if ((_BYTE)v5)
    {
      OUTLINED_FUNCTION_135();
      if (v22)
        v24 = 17219;
      else
        v24 = 4408130;
      if (v22)
        v25 = v23;
      else
        v25 = 0xE300000000000000;
    }
    else
    {
      v25 = 0xE200000000000000;
      v24 = 20308;
    }
    v93 = sub_2465C8EE0(v24, v25, v94);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_16_6();
    OUTLINED_FUNCTION_77_3(&dword_24652E000, v26, v15, "#SendMailSceneHostPlan Removing these recipients %s from %s");
    OUTLINED_FUNCTION_105_2();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_2_6();
  v27 = *(_QWORD *)(v3 + 16);
  v28 = MEMORY[0x24BEE4AF8];
  if (v27)
  {
    OUTLINED_FUNCTION_58_10();
    OUTLINED_FUNCTION_152();
    v30 = v3 + v29;
    v32 = *(_QWORD *)(v31 + 72);
    v86 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
    v87 = v32;
    v33 = v27;
    v88 = v27;
    do
    {
      v34 = v28;
      v86(v13, v30, v92);
      swift_getKeyPath();
      sub_246558BDC(&qword_25758CB70, (void (*)(uint64_t))MEMORY[0x24BE99750]);
      sub_246558BDC(&qword_25758D200, (void (*)(uint64_t))MEMORY[0x24BE99650]);
      v35 = v89;
      v36 = v13;
      sub_2465DBEF8();
      swift_release();
      v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE08);
      OUTLINED_FUNCTION_9_8(v35, 1, v37);
      if (v22)
      {
        sub_246545BE8(v35, &qword_25758CD98);
        v38 = 0;
        v40 = 0;
      }
      else
      {
        swift_getKeyPath();
        v38 = sub_2465DBF10();
        v40 = v39;
        OUTLINED_FUNCTION_5_21();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 8))(v35, v37);
      }
      v13 = v36;
      (*(void (**)(char *, uint64_t))(v91 + 8))(v36, v92);
      v41 = v94[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_68_5(*(_QWORD *)(v41 + 16));
        v41 = v94[0];
      }
      v28 = v34;
      v43 = *(_QWORD *)(v41 + 16);
      v42 = *(_QWORD *)(v41 + 24);
      v44 = v43 + 1;
      v27 = v88;
      if (v43 >= v42 >> 1)
      {
        OUTLINED_FUNCTION_53_9(v42);
        v41 = v94[0];
      }
      *(_QWORD *)(v41 + 16) = v44;
      v45 = v41 + 16 * v43;
      *(_QWORD *)(v45 + 32) = v38;
      *(_QWORD *)(v45 + 40) = v40;
      v30 += v87;
      --v33;
    }
    while (v33);
  }
  else
  {
    v44 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    v41 = MEMORY[0x24BEE4AF8];
    v46 = MEMORY[0x24BEE4AF8];
    if (!v44)
      goto LABEL_35;
  }
  swift_bridgeObjectRetain();
  v47 = (uint64_t *)(v41 + 40);
  v46 = MEMORY[0x24BEE4AF8];
  do
  {
    v48 = *v47;
    if (*v47)
    {
      v49 = *(v47 - 1);
      swift_bridgeObjectRetain();
      if ((OUTLINED_FUNCTION_171() & 1) == 0)
      {
        OUTLINED_FUNCTION_159(0, *(_QWORD *)(v46 + 16) + 1);
        v46 = v53;
      }
      v51 = *(_QWORD *)(v46 + 16);
      v50 = *(_QWORD *)(v46 + 24);
      if (v51 >= v50 >> 1)
      {
        OUTLINED_FUNCTION_159(v50 > 1, v51 + 1);
        v46 = v54;
      }
      *(_QWORD *)(v46 + 16) = v51 + 1;
      v52 = v46 + 16 * v51;
      *(_QWORD *)(v52 + 32) = v49;
      *(_QWORD *)(v52 + 40) = v48;
    }
    v47 += 2;
    --v44;
  }
  while (v44);
  OUTLINED_FUNCTION_27();
LABEL_35:
  OUTLINED_FUNCTION_27();
  v55 = sub_2465BD100(v46);
  v56 = v55;
  if (v27)
  {
    v89 = v55;
    OUTLINED_FUNCTION_58_10();
    OUTLINED_FUNCTION_152();
    v58 = v85 + v57;
    v60 = *(_QWORD *)(v59 + 72);
    v61 = *(void (**)(uint64_t, uint64_t, uint64_t))(v59 + 16);
    v28 = v94[0];
    do
    {
      v62 = v90;
      v61(v90, v58, v92);
      swift_getKeyPath();
      sub_246558BDC(&qword_25758CB70, (void (*)(uint64_t))MEMORY[0x24BE99750]);
      v63 = sub_2465DBF10();
      v65 = v64;
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_89_2(v62, *(uint64_t (**)(uint64_t, uint64_t))(v91 + 8));
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_68_5(*(_QWORD *)(v28 + 16));
        v28 = v94[0];
      }
      v67 = *(_QWORD *)(v28 + 16);
      v66 = *(_QWORD *)(v28 + 24);
      v68 = v67 + 1;
      if (v67 >= v66 >> 1)
      {
        OUTLINED_FUNCTION_53_9(v66);
        v28 = v94[0];
      }
      *(_QWORD *)(v28 + 16) = v68;
      v69 = v28 + 16 * v67;
      *(_QWORD *)(v69 + 32) = v63;
      *(_QWORD *)(v69 + 40) = v65;
      v58 += v60;
      --v27;
    }
    while (v27);
    v56 = v89;
  }
  else
  {
    v68 = *(_QWORD *)(v28 + 16);
    v70 = v28;
    if (!v68)
      goto LABEL_53;
  }
  OUTLINED_FUNCTION_148();
  v71 = (uint64_t *)(v28 + 40);
  v70 = MEMORY[0x24BEE4AF8];
  do
  {
    v72 = *v71;
    if (*v71)
    {
      v73 = *(v71 - 1);
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_104_2(0, *(_QWORD *)(v70 + 16) + 1);
        v70 = v77;
      }
      v75 = *(_QWORD *)(v70 + 16);
      v74 = *(_QWORD *)(v70 + 24);
      if (v75 >= v74 >> 1)
      {
        OUTLINED_FUNCTION_104_2(v74 > 1, v75 + 1);
        v70 = v78;
      }
      *(_QWORD *)(v70 + 16) = v75 + 1;
      v76 = v70 + 16 * v75;
      *(_QWORD *)(v76 + 32) = v73;
      *(_QWORD *)(v76 + 40) = v72;
    }
    v71 += 2;
    --v68;
  }
  while (v68);
  OUTLINED_FUNCTION_16_6();
LABEL_53:
  OUTLINED_FUNCTION_16_6();
  v79 = sub_2465BD100(v70);
  swift_getKeyPath();
  sub_2465BE3A8(v94);
  OUTLINED_FUNCTION_145_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  sub_246558BDC(&qword_25758DA90, (void (*)(uint64_t))MEMORY[0x24BE998C0]);
  sub_246558BDC(&qword_25758CB68, MEMORY[0x24BE999A8]);
  sub_2465DBC1C();
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
  v81 = OUTLINED_FUNCTION_78_2(v80);
  if (!(_DWORD)v81)
  {
    MEMORY[0x24BDAC7A8](v81);
    *(&v83 - 4) = v56;
    v82 = BYTE4(v83);
    *((_BYTE *)&v83 - 24) = BYTE4(v83);
    *(&v83 - 2) = v79;
    sub_2465325F4(v82);
  }
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_21_4();
  OUTLINED_FUNCTION_182((uint64_t)&v93);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_100_3((uint64_t)v94);
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465C37E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  os_log_type_t v27;
  uint64_t v28;
  unint64_t v29;
  os_log_type_t v31;
  const char *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;

  v34 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD98);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
  sub_246558BDC(&qword_25758CB70, (void (*)(uint64_t))MEMORY[0x24BE99750]);
  sub_246558BDC(&qword_25758D200, (void (*)(uint64_t))MEMORY[0x24BE99650]);
  sub_2465DBEF8();
  swift_release();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE08);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_246545BE8((uint64_t)v8, &qword_25758CD98);
    goto LABEL_16;
  }
  swift_getKeyPath();
  v10 = sub_2465DBF10();
  v12 = v11;
  swift_release();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  if (!v12)
  {
LABEL_16:
    swift_getKeyPath();
    v22 = sub_2465DBF10();
    v24 = v23;
    swift_release();
    if (v24)
    {
      sub_2465BD1A4(v22, v24, a4);
      if ((v25 & 1) != 0)
      {
        if (qword_25758C700 != -1)
          swift_once();
        v26 = sub_2465DCE04();
        __swift_project_value_buffer(v26, (uint64_t)qword_257591790);
        swift_bridgeObjectRetain();
        v16 = sub_2465DCDEC();
        v27 = sub_2465DD02C();
        if (os_log_type_enabled(v16, v27))
        {
          v18 = swift_slowAlloc();
          v19 = swift_slowAlloc();
          v36 = v19;
          *(_DWORD *)v18 = 136315394;
          if ((_BYTE)v34)
          {
            if (v34 == 1)
              v28 = 17219;
            else
              v28 = 4408130;
            if (v34 == 1)
              v29 = 0xE200000000000000;
            else
              v29 = 0xE300000000000000;
          }
          else
          {
            v29 = 0xE200000000000000;
            v28 = 20308;
          }
          v35 = sub_2465C8EE0(v28, v29, &v36);
          sub_2465DD0A4();
          swift_bridgeObjectRelease();
          *(_WORD *)(v18 + 12) = 2080;
          swift_bridgeObjectRetain();
          v35 = sub_2465C8EE0(v22, v24, &v36);
          sub_2465DD0A4();
          swift_bridgeObjectRelease_n();
          v31 = v27;
          v32 = "#SendMailSceneHostPlan Removing %s recipient with name %s";
LABEL_35:
          _os_log_impl(&dword_24652E000, v16, v31, v32, (uint8_t *)v18, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x2495606A4](v19, -1, -1);
          MEMORY[0x2495606A4](v18, -1, -1);

          return 1;
        }
        goto LABEL_30;
      }
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  sub_2465BD1A4(v10, v12, a2);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v14 = v10;
  if (qword_25758C700 != -1)
    swift_once();
  v15 = sub_2465DCE04();
  __swift_project_value_buffer(v15, (uint64_t)qword_257591790);
  swift_bridgeObjectRetain();
  v16 = sub_2465DCDEC();
  v17 = sub_2465DD02C();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v36 = v19;
    *(_DWORD *)v18 = 136315394;
    if ((_BYTE)v34)
    {
      if (v34 == 1)
        v20 = 17219;
      else
        v20 = 4408130;
      if (v34 == 1)
        v21 = 0xE200000000000000;
      else
        v21 = 0xE300000000000000;
    }
    else
    {
      v21 = 0xE200000000000000;
      v20 = 20308;
    }
    v35 = sub_2465C8EE0(v20, v21, &v36);
    sub_2465DD0A4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain();
    v35 = sub_2465C8EE0(v14, v12, &v36);
    sub_2465DD0A4();
    swift_bridgeObjectRelease_n();
    v31 = v17;
    v32 = "#SendMailSceneHostPlan Removing %s recipient with email %s";
    goto LABEL_35;
  }
LABEL_30:

  swift_bridgeObjectRelease_n();
  return 1;
}

void sub_2465C3D20()
{
  NSObject *v0;
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
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *boxed_opaque_existential_1;
  char *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[5];

  OUTLINED_FUNCTION_14_0();
  v24 = v3;
  sub_2465DC7E0();
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758FF20);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_68_4(v6, v22);
  v23 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25758FF28) - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_41_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_4_2();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA78);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_86_2();
  if (qword_25758C700 != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_5_9();
  OUTLINED_FUNCTION_12_4(v11, (uint64_t)qword_257591790);
  v12 = OUTLINED_FUNCTION_6_7();
  if (os_log_type_enabled(v0, v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    *(_WORD *)v13 = 0;
    OUTLINED_FUNCTION_9_7(&dword_24652E000, v0, v12, "#SendMailSceneHostPlan making ConfirmationPrompt", v13);
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_84_1();
  sub_2465BE2C8();
  sub_246558BDC(&qword_25758DA90, (void (*)(uint64_t))MEMORY[0x24BE998C0]);
  sub_246558BDC(&qword_25758CB68, MEMORY[0x24BE999A8]);
  sub_2465DBC28();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_20_3(v2, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  OUTLINED_FUNCTION_123();
  sub_2465DB46C();
  OUTLINED_FUNCTION_84_1();
  sub_2465DB448();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_45_1(v1, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
  v14 = *(uint64_t *)((char *)&v0->isa + OBJC_IVAR____TtC16SiriMailInternal21SendMailSceneHostPlan_confirmIntentOptions);
  v15 = type metadata accessor for ConfirmSendSceneHostProducer(0);
  v25[3] = v15;
  sub_246558BDC(&qword_25758FBC0, (void (*)(uint64_t))type metadata accessor for ConfirmSendSceneHostProducer);
  v25[4] = v16;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v25);
  v18 = (char *)boxed_opaque_existential_1 + *(int *)(v15 + 24);
  v19 = OUTLINED_FUNCTION_223();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v18, v24, v19);
  v20 = SendMailSceneHostPlan.isSnippetInFocus.getter();
  type metadata accessor for SendMailCATsSimple();
  sub_2465DC7D4();
  v21 = sub_2465DC798();
  boxed_opaque_existential_1[1] = v14;
  *((_BYTE *)boxed_opaque_existential_1 + *(int *)(v15 + 28)) = v20 & 1;
  *boxed_opaque_existential_1 = v21;
  sub_2465DB688();
  OUTLINED_FUNCTION_11_0();
  sub_2465DB67C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2575914B0);
  OUTLINED_FUNCTION_11_0();
  sub_2465DB6C4();
  OUTLINED_FUNCTION_4_3();
}

uint64_t SendMailSceneHostPlan.isSnippetInFocus.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v4;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_40_0();
  sub_246560098();
  sub_2465DB3E8();
  OUTLINED_FUNCTION_58_4(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return v4 & 1;
}

uint64_t sub_2465C40F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriMailInternal21SendMailSceneHostPlan__sendMessageTask;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

void SendMailSceneHostPlan.deinit()
{
  uint64_t v0;

  MailSendingSceneHostPlan.deinit();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  OUTLINED_FUNCTION_67_6(v0);
  OUTLINED_FUNCTION_2_12();
}

uint64_t SendMailSceneHostPlan.__deallocating_deinit()
{
  uint64_t v0;

  MailSendingSceneHostPlan.deinit();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591290);
  OUTLINED_FUNCTION_67_6(v0);
  return swift_deallocClassInstance();
}

#error "2465C41D0: call analysis failed (funcsize=8)"

uint64_t sub_2465C41E0()
{
  type metadata accessor for SendMailSceneHostPlan();
  return sub_2465DB1B4();
}

#error "2465C422C: call analysis failed (funcsize=8)"

uint64_t sub_2465C423C(uint64_t a1)
{
  MEMORY[0x2495605E4](&protocol conformance descriptor for SendMailSceneHostPlan, a1);
  return sub_2465DB190();
}

void SendMailSceneHostPlan.snippet.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
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
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  void (*v106)(uint64_t);
  void (*v107)(uint64_t);
  _QWORD v108[11];
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
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

  OUTLINED_FUNCTION_14_0();
  a19 = v21;
  a20 = v22;
  v120 = v23;
  v24 = OUTLINED_FUNCTION_42_2();
  v25 = OUTLINED_FUNCTION_158(v24, (uint64_t)&v144);
  v118 = *(_QWORD *)(v26 + 64);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_15_5((uint64_t)v108 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_15_5(v29);
  v116 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E350);
  v115 = *(_QWORD *)(v116 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_4_2();
  v127 = v31;
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591238);
  v110 = *(_QWORD *)(v109 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_15_5((uint64_t)v108 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  OUTLINED_FUNCTION_47_5(v34, (uint64_t)&a10);
  v113 = v35;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v36);
  v125 = (uint64_t)v108 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF68);
  OUTLINED_FUNCTION_47_5(v38, (uint64_t)&v142);
  v132 = v39;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v40);
  v124 = (uint64_t)v108 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_38_1();
  v139 = v43;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E348);
  v130 = *(_QWORD *)(v44 - 8);
  v131 = v44;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_38_1();
  v138 = v47;
  v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E340);
  v129 = *(_QWORD *)(v126 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_10_10();
  v143 = v50;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_10_10();
  v137 = v52;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_38_1();
  v136 = v54;
  v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E338);
  v128 = *(_QWORD *)(v123 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_5_3();
  v142 = v56;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_10_10();
  v141 = v58;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_10_10();
  v140 = v60;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v61);
  OUTLINED_FUNCTION_10_10();
  v135 = v62;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v63);
  OUTLINED_FUNCTION_10_10();
  v134 = v64;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v65);
  OUTLINED_FUNCTION_38_1();
  v133 = v66;
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E188);
  v108[1] = *(_QWORD *)(v67 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v68);
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v69);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v70);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v71);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v73);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v74);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  MEMORY[0x24BDAC7A8](v75);
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_2_17();
  v77 = MEMORY[0x24BDAC7A8](v76);
  v79 = (char *)v108 - v78;
  v80 = MEMORY[0x24BDAC7A8](v77);
  v82 = (char *)v108 - v81;
  v83 = MEMORY[0x24BDAC7A8](v80);
  MEMORY[0x24BDAC7A8](v83);
  OUTLINED_FUNCTION_132();
  v85 = MEMORY[0x24BDAC7A8](v84);
  v87 = (char *)v108 - v86;
  MEMORY[0x24BDAC7A8](v85);
  v89 = (char *)v108 - v88;
  sub_2465600C0();
  swift_getKeyPath();
  sub_2465DB3DC();
  OUTLINED_FUNCTION_27_10();
  OUTLINED_FUNCTION_17_15((uint64_t)v89);
  OUTLINED_FUNCTION_18_14();
  swift_getKeyPath();
  OUTLINED_FUNCTION_42_6();
  swift_release();
  OUTLINED_FUNCTION_17_15((uint64_t)v87);
  OUTLINED_FUNCTION_18_14();
  OUTLINED_FUNCTION_84_1();
  sub_2465DB3DC();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17_15(v20);
  OUTLINED_FUNCTION_18_14();
  swift_getKeyPath();
  OUTLINED_FUNCTION_15_20();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_14();
  OUTLINED_FUNCTION_18_14();
  swift_getKeyPath();
  OUTLINED_FUNCTION_192();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17_15((uint64_t)v82);
  OUTLINED_FUNCTION_18_14();
  swift_getKeyPath();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17_15((uint64_t)v79);
  OUTLINED_FUNCTION_10_18();
  swift_getKeyPath();
  OUTLINED_FUNCTION_15_20();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_14();
  OUTLINED_FUNCTION_10_18();
  swift_getKeyPath();
  OUTLINED_FUNCTION_15_20();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_14();
  OUTLINED_FUNCTION_10_18();
  swift_getKeyPath();
  OUTLINED_FUNCTION_15_20();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_14();
  OUTLINED_FUNCTION_10_18();
  OUTLINED_FUNCTION_84_1();
  OUTLINED_FUNCTION_15_20();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_14();
  OUTLINED_FUNCTION_10_18();
  swift_getKeyPath();
  OUTLINED_FUNCTION_15_20();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_14();
  OUTLINED_FUNCTION_10_18();
  swift_getKeyPath();
  v90 = v121;
  OUTLINED_FUNCTION_15_20();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_14();
  OUTLINED_FUNCTION_10_18();
  swift_getKeyPath();
  v91 = v122;
  OUTLINED_FUNCTION_15_20();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_14();
  v92 = v108[9];
  OUTLINED_FUNCTION_18_14();
  swift_getKeyPath();
  v93 = v124;
  OUTLINED_FUNCTION_42_6();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_17_15(v92);
  v94 = v125;
  sub_246560098();
  OUTLINED_FUNCTION_101_1();
  sub_2465BE444();
  swift_getKeyPath();
  sub_246558BDC(&qword_25758DA90, (void (*)(uint64_t))MEMORY[0x24BE998C0]);
  sub_246558BDC(&qword_25758CB68, MEMORY[0x24BE999A8]);
  v95 = v127;
  sub_2465DB568();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_75(v67, *(uint64_t (**)(uint64_t, uint64_t))(v110 + 8));
  v96 = v111;
  OUTLINED_FUNCTION_27_6(v111, v140);
  v97 = v112;
  OUTLINED_FUNCTION_27_6(v96 + v112[5], v141);
  OUTLINED_FUNCTION_27_6(v96 + v97[6], v142);
  OUTLINED_FUNCTION_27_6(v96 + v97[7], v143);
  OUTLINED_FUNCTION_27_6(v96 + v97[8], v90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v130 + 16))(v96 + v97[9], v91, v131);
  OUTLINED_FUNCTION_38_4(v96 + v97[10], v93, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v132 + 16));
  v98 = v115;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v115 + 16))(v96 + v97[11], v95, v116);
  v99 = v96;
  v100 = v113;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v113 + 16))(v96 + v97[12], v94, v114);
  type metadata accessor for MetricsSnippetEventHandler();
  v101 = OUTLINED_FUNCTION_11_0();
  swift_defaultActor_initialize();
  sub_2465DB214();
  v102 = v117;
  sub_246590774(v99, v117);
  v103 = (*(unsigned __int8 *)(v119 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v119 + 80);
  v104 = (v118 + v103 + 7) & 0xFFFFFFFFFFFFFFF8;
  v105 = swift_allocObject();
  sub_246590774(v102, v105 + v103);
  *(_QWORD *)(v105 + v104) = v101;
  OUTLINED_FUNCTION_89_2(v127, *(uint64_t (**)(uint64_t, uint64_t))(v98 + 8));
  OUTLINED_FUNCTION_20_3(v125, *(uint64_t (**)(uint64_t, uint64_t))(v100 + 8));
  OUTLINED_FUNCTION_31_9(v124, *(uint64_t (**)(uint64_t, uint64_t))(v132 + 8));
  (*(void (**)(uint64_t, uint64_t))(v130 + 8))(v122, v131);
  OUTLINED_FUNCTION_110_1(v121);
  OUTLINED_FUNCTION_110_1(v143);
  OUTLINED_FUNCTION_110_1(v142);
  OUTLINED_FUNCTION_110_1(v141);
  OUTLINED_FUNCTION_110_1(v140);
  v143 = sub_2465DAF08();
  v106 = (void (*)(uint64_t))MEMORY[0x24BE999E8];
  sub_2465DC468();
  v107 = (void (*)(uint64_t))MEMORY[0x24BE99AC8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E3C8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E3D8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E3E8);
  sub_2465DC51C();
  OUTLINED_FUNCTION_223();
  sub_246558BDC(&qword_25758F8C8, v106);
  sub_246558BDC(&qword_25758F8D0, v107);
  sub_246558BDC(&qword_25758F8D8, v107);
  sub_246558BDC(&qword_25758FBB8, (void (*)(uint64_t))MEMORY[0x24BE99CD0]);
  sub_2465DB6A0();
  OUTLINED_FUNCTION_4_3();
}

#error "2465C4D8C: call analysis failed (funcsize=8)"

uint64_t sub_2465C4D9C()
{
  return SendMailSceneHostPlan.isSnippetInFocus.getter() & 1;
}

uint64_t sub_2465C4DC0(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_2465DABB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_246558BDC(&qword_2575914D0, v11);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_2465DCE28();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_246558BDC(qword_2575901B0, (void (*)(uint64_t))MEMORY[0x24BDB5FD0]);
      v21 = sub_2465DCE34();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_2465C5F50((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_2465C501C(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_2465DC570();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_246558BDC(&qword_257591740, v11);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_2465DCE28();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_246558BDC(&qword_2575905D8, (void (*)(uint64_t))MEMORY[0x24BE99C60]);
      v21 = sub_2465DCE34();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_2465C61A4((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

void sub_2465C5278()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD, _QWORD, _QWORD);
  uint64_t v18;
  void (*v19)(_QWORD, _QWORD, _QWORD);
  char v20;
  void (*v21)(uint64_t, uint64_t);
  _QWORD *v22;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_14_0();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  v7 = sub_2465DC09C();
  v8 = *(_QWORD **)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6_22();
  v9 = *v2;
  sub_246558BDC(&qword_257591760, v10);
  swift_bridgeObjectRetain();
  v29 = v4;
  v11 = sub_2465DCE28();
  v12 = -1 << *(_BYTE *)(v9 + 32);
  v13 = v11 & ~v12;
  v14 = v9;
  v15 = v9 + 56;
  if (((*(_QWORD *)(v9 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v26 = v2;
    v27 = v6;
    v28 = ~v12;
    v16 = v8[9];
    v17 = (void (*)(_QWORD, _QWORD, _QWORD))v8[2];
    while (1)
    {
      v18 = v14;
      v19 = v17;
      v17(v1, *(_QWORD *)(v14 + 48) + v16 * v13, v7);
      sub_246558BDC(&qword_257591768, (void (*)(uint64_t))MEMORY[0x24BE93590]);
      v20 = sub_2465DCE34();
      v21 = (void (*)(uint64_t, uint64_t))v8[1];
      v21(v1, v7);
      if ((v20 & 1) != 0)
        break;
      v13 = (v13 + 1) & v28;
      v14 = v18;
      v17 = v19;
      if (((*(_QWORD *)(v15 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v2 = v26;
        v6 = v27;
        v22 = v8;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v21(v29, v7);
    v19(v27, *(_QWORD *)(*v26 + 48) + v16 * v13, v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    v17 = (void (*)(_QWORD, _QWORD, _QWORD))v8[2];
    v22 = v8;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v17(v1, v29, v7);
    v30 = *v2;
    *v2 = 0x8000000000000000;
    v24 = OUTLINED_FUNCTION_142_0();
    sub_2465C63F8(v24, v25, isUniquelyReferenced_nonNull_native);
    *v2 = v30;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_53_1(v6, v29, (uint64_t (*)(uint64_t, uint64_t, uint64_t))v22[4]);
  }
  OUTLINED_FUNCTION_4_3();
}

void sub_2465C54A0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t v13;
  char v14;
  _QWORD *v15;
  BOOL v16;
  char isUniquelyReferenced_nonNull_native;
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

  OUTLINED_FUNCTION_167_0();
  v5 = *v1;
  OUTLINED_FUNCTION_179();
  OUTLINED_FUNCTION_148();
  OUTLINED_FUNCTION_136_1();
  v6 = OUTLINED_FUNCTION_48_8();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  OUTLINED_FUNCTION_22_18();
  if ((v9 & 1) == 0)
  {
LABEL_16:
    OUTLINED_FUNCTION_16_6();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v27 = *v2;
    *v2 = 0x8000000000000000;
    OUTLINED_FUNCTION_115_2();
    sub_2465C664C(v4, v3, v8, isUniquelyReferenced_nonNull_native);
    OUTLINED_FUNCTION_123_2(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
    *v0 = v4;
    v0[1] = v3;
    goto LABEL_17;
  }
  v10 = *(_QWORD *)(v5 + 48);
  v11 = (_QWORD *)(v10 + 16 * v8);
  v12 = *v11 == v4 && v11[1] == v3;
  if (!v12 && (OUTLINED_FUNCTION_0_17() & 1) == 0)
  {
    v13 = ~v7;
    do
    {
      v8 = (v8 + 1) & v13;
      OUTLINED_FUNCTION_22_18();
      if ((v14 & 1) == 0)
        goto LABEL_16;
      v15 = (_QWORD *)(v10 + 16 * v8);
      v16 = *v15 == v4 && v15[1] == v3;
    }
    while (!v16 && (OUTLINED_FUNCTION_0_17() & 1) == 0);
  }
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_163((_QWORD *)(*(_QWORD *)(*v2 + 48) + 16 * v8));
LABEL_17:
  OUTLINED_FUNCTION_55_10();
}

void sub_2465C55BC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  char isUniquelyReferenced_nonNull_native;
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

  OUTLINED_FUNCTION_167_0();
  v5 = *v1;
  OUTLINED_FUNCTION_179();
  sub_2465DD2F0();
  swift_bridgeObjectRetain();
  if (v3)
  {
    OUTLINED_FUNCTION_115_2();
    OUTLINED_FUNCTION_136_1();
    OUTLINED_FUNCTION_29_1();
  }
  v6 = OUTLINED_FUNCTION_48_8();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = *v2;
    *v2 = 0x8000000000000000;
    OUTLINED_FUNCTION_115_2();
    v15 = sub_2465C67E4(v4, v3, v8, isUniquelyReferenced_nonNull_native);
    OUTLINED_FUNCTION_123_2(v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
    *v0 = v4;
    v0[1] = v3;
    goto LABEL_18;
  }
  v9 = ~v7;
  v10 = *(_QWORD *)(v5 + 48);
  while (1)
  {
    v11 = (_QWORD *)(v10 + 16 * v8);
    v12 = v11[1];
    if (v12)
      break;
    if (!v3)
      goto LABEL_17;
LABEL_14:
    v8 = (v8 + 1) & v9;
    if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
      goto LABEL_15;
  }
  if (!v3)
    goto LABEL_14;
  v13 = *v11 == v4 && v12 == v3;
  if (!v13 && (OUTLINED_FUNCTION_0_17() & 1) == 0)
    goto LABEL_14;
  OUTLINED_FUNCTION_29_1();
LABEL_17:
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_163((_QWORD *)(*(_QWORD *)(*v2 + 48) + 16 * v8));
LABEL_18:
  OUTLINED_FUNCTION_55_10();
}

void sub_2465C571C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
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
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  OUTLINED_FUNCTION_14_0();
  v42 = v1;
  v43 = v2;
  v4 = v3;
  v5 = v0;
  v8 = OUTLINED_FUNCTION_139(v6, v7);
  v41 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v37 - v9;
  v11 = (_QWORD *)*v0;
  __swift_instantiateConcreteTypeFromMangledName(v4);
  v12 = sub_2465DD14C();
  if (v11[2])
  {
    OUTLINED_FUNCTION_79_6();
    v40 = v11 + 7;
    OUTLINED_FUNCTION_228();
    v15 = v14 & v13;
    OUTLINED_FUNCTION_227();
    v38 = v0;
    v39 = v16;
    v17 = v12 + 56;
    swift_retain();
    v18 = 0;
    if (!v15)
      goto LABEL_4;
LABEL_3:
    OUTLINED_FUNCTION_157_0();
    while (1)
    {
      v24 = v11;
      v25 = v11[6];
      v26 = *(_QWORD *)(v41 + 72);
      v27 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 32);
      v27(v10, v25 + v26 * v19, v8);
      OUTLINED_FUNCTION_210();
      sub_2465DCE28();
      OUTLINED_FUNCTION_209();
      if (((v30 << v29) & ~*(_QWORD *)(v17 + 8 * v28)) == 0)
      {
        OUTLINED_FUNCTION_174_0();
        while (++v33 != v34 || (v32 & 1) == 0)
        {
          v35 = v33 == v34;
          if (v33 == v34)
            v33 = 0;
          v32 |= v35;
          if (*(_QWORD *)(v17 + 8 * v33) != -1)
          {
            OUTLINED_FUNCTION_202();
            goto LABEL_27;
          }
        }
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_208();
LABEL_27:
      *(_QWORD *)(v17 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v31;
      v27((char *)(*(_QWORD *)(v12 + 48) + v31 * v26), (uint64_t)v10, v8);
      ++*(_QWORD *)(v12 + 16);
      v11 = v24;
      if (v15)
        goto LABEL_3;
LABEL_4:
      if (__OFADD__(v18, 1))
        goto LABEL_35;
      if (v18 + 1 >= v39)
        goto LABEL_29;
      OUTLINED_FUNCTION_226();
      v18 = v20;
      if (!v21)
      {
        v18 = v20 + 1;
        if (v20 + 1 >= v39)
          goto LABEL_29;
        if (!v40[v18])
        {
          v18 = v20 + 2;
          if (v20 + 2 >= v39)
            goto LABEL_29;
          if (!v40[v18])
          {
            if (v20 + 3 >= v39)
            {
LABEL_29:
              OUTLINED_FUNCTION_27_10();
              v5 = v38;
              OUTLINED_FUNCTION_79_6();
              if (v36 > 63)
                sub_2465C6998(0, (unint64_t)(v36 + 63) >> 6, v40);
              else
                *v40 = -1 << v36;
              v11[2] = 0;
              break;
            }
            OUTLINED_FUNCTION_226();
            if (!v23)
            {
              while (1)
              {
                v18 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_36;
                if (v18 >= v39)
                  goto LABEL_29;
                ++v22;
                if (v40[v18])
                  goto LABEL_17;
              }
            }
            v18 = v22;
          }
        }
      }
LABEL_17:
      OUTLINED_FUNCTION_155_0();
    }
  }
  OUTLINED_FUNCTION_27_10();
  *v5 = v12;
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465C59D0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591730);
  v3 = sub_2465DD14C();
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
      sub_2465DD2D8();
      sub_2465DCEAC();
      result = sub_2465DD2FC();
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
                sub_2465C6998(0, (unint64_t)(v29 + 63) >> 6, v30);
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

unint64_t sub_2465C5CA8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591788);
  v3 = sub_2465DD14C();
  if (*(_QWORD *)(v2 + 16))
  {
    v4 = 1 << *(_BYTE *)(v2 + 32);
    v5 = (_QWORD *)(v2 + 56);
    v6 = -1;
    if (v4 < 64)
      v6 = ~(-1 << v4);
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v4 + 63) >> 6;
    result = swift_retain();
    v10 = 0;
    if (!v7)
      goto LABEL_6;
LABEL_5:
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v11 | (v10 << 6); ; i = __clz(__rbit64(v14)) + (v10 << 6))
    {
      result = sub_2465C5E78(*(_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i), *(_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i + 8), v3);
      if (v7)
        goto LABEL_5;
LABEL_6:
      v13 = v10 + 1;
      if (__OFADD__(v10, 1))
      {
        __break(1u);
LABEL_28:
        __break(1u);
        return result;
      }
      if (v13 >= v8)
        goto LABEL_22;
      v14 = v5[v13];
      ++v10;
      if (!v14)
      {
        v10 = v13 + 1;
        if (v13 + 1 >= v8)
          goto LABEL_22;
        v14 = v5[v10];
        if (!v14)
        {
          v10 = v13 + 2;
          if (v13 + 2 >= v8)
            goto LABEL_22;
          v14 = v5[v10];
          if (!v14)
          {
            v15 = v13 + 3;
            if (v15 >= v8)
            {
LABEL_22:
              swift_release();
              v16 = 1 << *(_BYTE *)(v2 + 32);
              if (v16 > 63)
                sub_2465C6998(0, (unint64_t)(v16 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v5 = -1 << v16;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v14 = v5[v15];
            if (!v14)
            {
              while (1)
              {
                v10 = v15 + 1;
                if (__OFADD__(v15, 1))
                  goto LABEL_28;
                if (v10 >= v8)
                  goto LABEL_22;
                v14 = v5[v10];
                ++v15;
                if (v14)
                  goto LABEL_19;
              }
            }
            v10 = v15;
          }
        }
      }
LABEL_19:
      v7 = (v14 - 1) & v14;
    }
  }
  result = swift_release();
  *v1 = v3;
  return result;
}

unint64_t sub_2465C5E78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t result;
  _QWORD *v7;

  sub_2465DD2D8();
  sub_2465DD2F0();
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_2465DCEAC();
    swift_bridgeObjectRelease();
  }
  sub_2465DD2FC();
  result = sub_2465DD134();
  *(_QWORD *)(a3 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  v7 = (_QWORD *)(*(_QWORD *)(a3 + 48) + 16 * result);
  *v7 = a1;
  v7[1] = a2;
  ++*(_QWORD *)(a3 + 16);
  return result;
}

uint64_t sub_2465C5F50(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_2465DABB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_2465C571C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2465C6B18();
      goto LABEL_12;
    }
    sub_2465C6EA8();
  }
  v12 = *v3;
  sub_246558BDC(&qword_2575914D0, (void (*)(uint64_t))MEMORY[0x24BDB5FD0]);
  v13 = sub_2465DCE28();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_246558BDC(qword_2575901B0, (void (*)(uint64_t))MEMORY[0x24BDB5FD0]);
      v18 = sub_2465DCE34();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_2465DD290();
  __break(1u);
  return result;
}

uint64_t sub_2465C61A4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_2465DC570();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_2465C571C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2465C6B18();
      goto LABEL_12;
    }
    sub_2465C6EA8();
  }
  v12 = *v3;
  sub_246558BDC(&qword_257591740, (void (*)(uint64_t))MEMORY[0x24BE99C60]);
  v13 = sub_2465DCE28();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_246558BDC(&qword_2575905D8, (void (*)(uint64_t))MEMORY[0x24BE99C60]);
      v18 = sub_2465DCE34();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_2465DD290();
  __break(1u);
  return result;
}

uint64_t sub_2465C63F8(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_2465DC09C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_2465C571C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2465C6B18();
      goto LABEL_12;
    }
    sub_2465C6EA8();
  }
  v12 = *v3;
  sub_246558BDC(&qword_257591760, (void (*)(uint64_t))MEMORY[0x24BE93590]);
  v13 = sub_2465DCE28();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_246558BDC(&qword_257591768, (void (*)(uint64_t))MEMORY[0x24BE93590]);
      v18 = sub_2465DCE34();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_2465DD290();
  __break(1u);
  return result;
}

void sub_2465C664C(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  BOOL v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_2465C59D0();
  }
  else
  {
    if (v10 > v9)
    {
      sub_2465C69B4();
      goto LABEL_22;
    }
    sub_2465C7130();
  }
  v11 = *v4;
  sub_2465DD2D8();
  sub_2465DCEAC();
  v12 = sub_2465DD2FC();
  v13 = -1 << *(_BYTE *)(v11 + 32);
  a3 = v12 & ~v13;
  v14 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v11 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = *v16 == a1 && v16[1] == a2;
    if (v17 || (sub_2465DD278() & 1) != 0)
    {
LABEL_21:
      sub_2465DD290();
      __break(1u);
    }
    else
    {
      v18 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v18;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v19 = (_QWORD *)(v15 + 16 * a3);
        v20 = *v19 == a1 && v19[1] == a2;
        if (v20 || (sub_2465DD278() & 1) != 0)
          goto LABEL_21;
      }
    }
  }
LABEL_22:
  v21 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v22 = (_QWORD *)(*(_QWORD *)(v21 + 48) + 16 * a3);
  *v22 = a1;
  v22[1] = a2;
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (v24)
    __break(1u);
  else
    *(_QWORD *)(v21 + 16) = v25;
}

uint64_t sub_2465C67E4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 <= v9 || (a4 & 1) == 0)
  {
    if ((a4 & 1) != 0)
    {
      sub_2465C5CA8();
    }
    else
    {
      if (v10 > v9)
      {
        result = (uint64_t)sub_2465C6CFC();
        goto LABEL_22;
      }
      sub_2465C73D8();
    }
    v11 = *v4;
    sub_2465DD2D8();
    sub_2465DD2F0();
    if (a2)
    {
      swift_bridgeObjectRetain();
      sub_2465DCEAC();
      swift_bridgeObjectRelease();
    }
    result = sub_2465DD2FC();
    v12 = -1 << *(_BYTE *)(v11 + 32);
    a3 = result & ~v12;
    v13 = v11 + 56;
    if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
    {
      v14 = ~v12;
      v15 = *(_QWORD *)(v11 + 48);
      do
      {
        v16 = (_QWORD *)(v15 + 16 * a3);
        v17 = v16[1];
        if (v17)
        {
          if (a2)
          {
            if (*v16 == v8 && v17 == a2)
              goto LABEL_25;
            result = sub_2465DD278();
            if ((result & 1) != 0)
              goto LABEL_25;
          }
        }
        else if (!a2)
        {
          goto LABEL_25;
        }
        a3 = (a3 + 1) & v14;
      }
      while (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
    }
  }
LABEL_22:
  v19 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v20 = (uint64_t *)(*(_QWORD *)(v19 + 48) + 16 * a3);
  *v20 = v8;
  v20[1] = a2;
  v21 = *(_QWORD *)(v19 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
  {
    __break(1u);
LABEL_25:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758E3D8);
    result = sub_2465DD290();
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v19 + 16) = v23;
  }
  return result;
}

uint64_t sub_2465C6998(uint64_t result, uint64_t a2, _QWORD *a3)
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

void sub_2465C69B4()
{
  uint64_t *v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591730);
  v2 = (_QWORD *)*v0;
  v3 = sub_2465DD140();
  if (!v2[2])
  {
LABEL_26:
    OUTLINED_FUNCTION_0();
    *v1 = v3;
    OUTLINED_FUNCTION_29();
    return;
  }
  OUTLINED_FUNCTION_79_6();
  v4 = v2 + 7;
  OUTLINED_FUNCTION_227();
  if ((_QWORD *)v3 != v2 || v5 >= &v2[v6 + 7])
    memmove(v5, v2 + 7, 8 * v6);
  v8 = 0;
  *(_QWORD *)(v3 + 16) = v2[2];
  OUTLINED_FUNCTION_79_6();
  OUTLINED_FUNCTION_185();
  v11 = v10 & v9;
  v13 = (unint64_t)(v12 + 63) >> 6;
  if ((v10 & v9) == 0)
    goto LABEL_10;
LABEL_9:
  OUTLINED_FUNCTION_157_0();
  while (1)
  {
    v17 = (_QWORD *)(v2[6] + 16 * v14);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v14);
    *v19 = *v17;
    v19[1] = v18;
    swift_bridgeObjectRetain();
    if (v11)
      goto LABEL_9;
LABEL_10:
    v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v15 >= v13)
      goto LABEL_26;
    ++v8;
    if (!v4[v15])
    {
      v8 = v15 + 1;
      if (v15 + 1 >= v13)
        goto LABEL_26;
      if (!v4[v8])
      {
        v8 = v15 + 2;
        if (v15 + 2 >= v13)
          goto LABEL_26;
        if (!v4[v8])
          break;
      }
    }
LABEL_23:
    OUTLINED_FUNCTION_155_0();
  }
  v16 = v15 + 3;
  if (v16 >= v13)
    goto LABEL_26;
  if (v4[v16])
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v13)
      goto LABEL_26;
    ++v16;
    if (v4[v8])
      goto LABEL_23;
  }
LABEL_28:
  __break(1u);
}

void sub_2465C6B18()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t i;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  OUTLINED_FUNCTION_14_0();
  v2 = v1;
  v3 = v0;
  v5 = v4(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - v7;
  __swift_instantiateConcreteTypeFromMangledName(v2);
  v9 = (_QWORD *)*v0;
  v10 = sub_2465DD140();
  if (!v9[2])
  {
    OUTLINED_FUNCTION_19_1();
LABEL_28:
    *v3 = v10;
    OUTLINED_FUNCTION_4_3();
    return;
  }
  v28 = v3;
  OUTLINED_FUNCTION_79_6();
  v11 = v9 + 7;
  OUTLINED_FUNCTION_227();
  if ((_QWORD *)v10 != v9 || v12 >= &v9[v13 + 7])
    memmove(v12, v9 + 7, 8 * v13);
  v15 = 0;
  *(_QWORD *)(v10 + 16) = v9[2];
  OUTLINED_FUNCTION_79_6();
  OUTLINED_FUNCTION_185();
  v18 = v17 & v16;
  v20 = (unint64_t)(v19 + 63) >> 6;
  if ((v17 & v16) == 0)
    goto LABEL_10;
LABEL_9:
  v21 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  for (i = v21 | (v15 << 6); ; i = __clz(__rbit64(v24)) + (v15 << 6))
  {
    v26 = *(_QWORD *)(v6 + 72) * i;
    OUTLINED_FUNCTION_53_1((uint64_t)v8, v9[6] + v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    OUTLINED_FUNCTION_53_1(*(_QWORD *)(v10 + 48) + v26, (uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32));
    if (v18)
      goto LABEL_9;
LABEL_10:
    v23 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v23 >= v20)
      goto LABEL_26;
    v24 = v11[v23];
    ++v15;
    if (!v24)
    {
      v15 = v23 + 1;
      if (v23 + 1 >= v20)
        goto LABEL_26;
      v24 = v11[v15];
      if (!v24)
      {
        v15 = v23 + 2;
        if (v23 + 2 >= v20)
          goto LABEL_26;
        v24 = v11[v15];
        if (!v24)
          break;
      }
    }
LABEL_23:
    v18 = (v24 - 1) & v24;
  }
  v25 = v23 + 3;
  if (v25 >= v20)
  {
LABEL_26:
    OUTLINED_FUNCTION_19_1();
    v3 = v28;
    goto LABEL_28;
  }
  v24 = v11[v25];
  if (v24)
  {
    v15 = v25;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v15 >= v20)
      goto LABEL_26;
    v24 = v11[v15];
    ++v25;
    if (v24)
      goto LABEL_23;
  }
LABEL_30:
  __break(1u);
}

void *sub_2465C6CFC()
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

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591788);
  v2 = *v0;
  v3 = sub_2465DD140();
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
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + 16 * i) = *(_OWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
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

void sub_2465C6EA8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t i;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  OUTLINED_FUNCTION_14_0();
  v35 = v1;
  v36 = v2;
  v3 = v0;
  v6 = OUTLINED_FUNCTION_139(v4, v5);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - v8;
  v10 = *v0;
  OUTLINED_FUNCTION_119_4();
  v11 = sub_2465DD14C();
  if (!*(_QWORD *)(v10 + 16))
  {
    OUTLINED_FUNCTION_91_1();
LABEL_31:
    *v3 = v11;
    OUTLINED_FUNCTION_4_3();
    return;
  }
  OUTLINED_FUNCTION_79_6();
  v32 = v0;
  v33 = v10 + 56;
  OUTLINED_FUNCTION_228();
  v14 = v13 & v12;
  OUTLINED_FUNCTION_227();
  v34 = v15;
  v16 = v11 + 56;
  swift_retain();
  v17 = 0;
  if (!v14)
    goto LABEL_4;
LABEL_3:
  v18 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v18 | (v17 << 6); ; i = __clz(__rbit64(v21)) + (v17 << 6))
  {
    v23 = *(_QWORD *)(v7 + 72);
    OUTLINED_FUNCTION_38_4((uint64_t)v9, *(_QWORD *)(v10 + 48) + v23 * i, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
    OUTLINED_FUNCTION_210();
    sub_2465DCE28();
    OUTLINED_FUNCTION_209();
    if (((v26 << v25) & ~*(_QWORD *)(v16 + 8 * v24)) == 0)
    {
      OUTLINED_FUNCTION_174_0();
      while (++v29 != v30 || (v28 & 1) == 0)
      {
        v31 = v29 == v30;
        if (v29 == v30)
          v29 = 0;
        v28 |= v31;
        if (*(_QWORD *)(v16 + 8 * v29) != -1)
        {
          OUTLINED_FUNCTION_202();
          goto LABEL_27;
        }
      }
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    OUTLINED_FUNCTION_208();
LABEL_27:
    *(_QWORD *)(v16 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
    OUTLINED_FUNCTION_38_4(*(_QWORD *)(v11 + 48) + v27 * v23, (uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
    ++*(_QWORD *)(v11 + 16);
    if (v14)
      goto LABEL_3;
LABEL_4:
    if (__OFADD__(v17, 1))
      goto LABEL_33;
    if (v17 + 1 >= v34)
      goto LABEL_29;
    OUTLINED_FUNCTION_226();
    v17 = v20;
    if (!v21)
    {
      v17 = v20 + 1;
      if (v20 + 1 >= v34)
        goto LABEL_29;
      v21 = *(_QWORD *)(v33 + 8 * v17);
      if (!v21)
      {
        v17 = v20 + 2;
        if (v20 + 2 >= v34)
          goto LABEL_29;
        v21 = *(_QWORD *)(v33 + 8 * v17);
        if (!v21)
          break;
      }
    }
LABEL_17:
    v14 = (v21 - 1) & v21;
  }
  if (v20 + 3 >= v34)
  {
LABEL_29:
    OUTLINED_FUNCTION_207();
    v3 = v32;
    goto LABEL_31;
  }
  OUTLINED_FUNCTION_226();
  if (v21)
  {
    v17 = v22;
    goto LABEL_17;
  }
  while (1)
  {
    v17 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v17 >= v34)
      goto LABEL_29;
    v21 = *(_QWORD *)(v33 + 8 * v17);
    ++v22;
    if (v21)
      goto LABEL_17;
  }
LABEL_34:
  __break(1u);
}

uint64_t sub_2465C7130()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591730);
  v3 = sub_2465DD14C();
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
    sub_2465DD2D8();
    swift_bridgeObjectRetain();
    sub_2465DCEAC();
    result = sub_2465DD2FC();
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

unint64_t sub_2465C73D8()
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
  unint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591788);
  v3 = sub_2465DD14C();
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_23:
    result = swift_release();
    *v1 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = v2 + 56;
  v6 = -1;
  if (v4 < 64)
    v6 = ~(-1 << v4);
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v8 = (unint64_t)(v4 + 63) >> 6;
  result = swift_retain();
  v10 = 0;
  if (!v7)
    goto LABEL_6;
LABEL_5:
  v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v11 | (v10 << 6); ; i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v17 = *v16;
    v18 = v16[1];
    swift_bridgeObjectRetain();
    result = sub_2465C5E78(v17, v18, v3);
    if (v7)
      goto LABEL_5;
LABEL_6:
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v8)
      goto LABEL_22;
    v14 = *(_QWORD *)(v5 + 8 * v13);
    ++v10;
    if (!v14)
    {
      v10 = v13 + 1;
      if (v13 + 1 >= v8)
        goto LABEL_22;
      v14 = *(_QWORD *)(v5 + 8 * v10);
      if (!v14)
      {
        v10 = v13 + 2;
        if (v13 + 2 >= v8)
          goto LABEL_22;
        v14 = *(_QWORD *)(v5 + 8 * v10);
        if (!v14)
          break;
      }
    }
LABEL_19:
    v7 = (v14 - 1) & v14;
  }
  v15 = v13 + 3;
  if (v15 >= v8)
  {
LABEL_22:
    swift_release();
    goto LABEL_23;
  }
  v14 = *(_QWORD *)(v5 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_19;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v8)
      goto LABEL_22;
    v14 = *(_QWORD *)(v5 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_25:
  __break(1u);
  return result;
}

void (*sub_2465C7584(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x28uLL);
  *a1 = v6;
  v6[4] = sub_2465C7604(v6, a2, a3);
  return sub_2465C75D8;
}

void sub_2465C75D8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_2465C7604(_QWORD *a1, uint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v6;
  id v7;

  v6 = a3 & 0xC000000000000001;
  sub_2465B2D20(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = (id)MEMORY[0x24955FFFC](a2, a3);
  else
    v7 = *(id *)(a3 + 8 * a2 + 32);
  *a1 = v7;
  return sub_2465C7670;
}

void sub_2465C7670(id *a1)
{

}

uint64_t sub_2465C7678(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  _QWORD v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_2465DD200();
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
      v8 = sub_2465DD200();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_246558A88(&qword_257591780, &qword_257591778);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_257591778);
            v10 = sub_2465C7584(v13, i, a3);
            v12 = *v11;
            ((void (*)(_QWORD *, _QWORD))v10)(v13, 0);
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
        sub_2465ACC0C((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10));
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

uint64_t sub_2465C7810(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  id v13;
  __int128 v15;
  uint64_t v16;
  __int128 v17[2];
  _QWORD v18[5];
  _BYTE v19[24];
  ValueMetadata *v20;
  _UNKNOWN **v21;

  v20 = &type metadata for LinkServicesProvider;
  v21 = &protocol witness table for LinkServicesProvider;
  v18[3] = sub_2465DB688();
  v18[4] = &protocol witness table for ResponseFactory;
  v18[0] = a4;
  sub_2465DB400();
  sub_2465DB400();
  sub_2465DC5A0();
  sub_2465DB400();
  v12 = a6 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_resolverOverride;
  *(_QWORD *)(v12 + 32) = 0;
  *(_OWORD *)v12 = 0u;
  *(_OWORD *)(v12 + 16) = 0u;
  *(_QWORD *)(a6 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_globals) = a1;
  swift_beginAccess();
  v13 = a1;
  sub_24655FB94(a2, v12);
  swift_endAccess();
  sub_246558B34((uint64_t)v19, a6 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_linkServicesProvider);
  sub_246545BA8(a3, a6 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_skContactManagerOverride, &qword_25758DAC0);
  sub_246558B34((uint64_t)v18, a6 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_responseFactory);
  sub_246545BA8(a5, (uint64_t)&v15, &qword_25758DAC8);
  if (v16)
  {

    sub_246545BE8(a5, &qword_25758DAC8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    sub_246545BE8(a3, &qword_25758DAC0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    sub_246545BE8(a2, &qword_25758DAB8);
    sub_2465362E0(&v15, (uint64_t)v17);
  }
  else
  {
    sub_2465DB2A4();

    sub_246545BE8(a5, &qword_25758DAC8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    sub_246545BE8(a3, &qword_25758DAC0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
    sub_246545BE8(a2, &qword_25758DAB8);
    sub_246545BE8((uint64_t)&v15, &qword_25758DAC8);
  }
  sub_2465362E0(v17, a6 + OBJC_IVAR____TtC16SiriMailInternal24MailSendingSceneHostPlan_eventSender);
  return a6;
}

void sub_2465C7A70()
{
  sub_2465DC528();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465C7A98()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_213();
  v0[1] = v1;
  OUTLINED_FUNCTION_2_12();
}

void sub_2465C7AB4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2465BDB68(a1, a2, a3, a4, MEMORY[0x24BE99B80]);
}

void sub_2465C7AE0()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_212();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465C7B00()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_216();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465C7B20()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_214();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465C7B40()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_215();
  v0[1] = v1;
  OUTLINED_FUNCTION_2_12();
}

void sub_2465C7B5C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2465BDB68(a1, a2, a3, a4, MEMORY[0x24BE99C98]);
}

void sub_2465C7B78()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_217();
  OUTLINED_FUNCTION_2_12();
}

void sub_2465C7B98()
{
  sub_2465C3D20();
}

uint64_t sub_2465C7BBC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_79_3(v1);
  return sub_2465C0028(v2, v3, v4);
}

uint64_t sub_2465C7C10()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_79_3(v1);
  return sub_2465C04E4(v2, v3, v4);
}

uint64_t sub_2465C7C64()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_14_0();
  v1 = (int *)OUTLINED_FUNCTION_42_2();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E338);
  OUTLINED_FUNCTION_141_0(v3);
  OUTLINED_FUNCTION_141_0(v3 + v1[5]);
  OUTLINED_FUNCTION_141_0(v3 + v1[6]);
  v4 = *(void (**)(uint64_t))(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25758E340) - 8)
                                      + 8);
  v5 = OUTLINED_FUNCTION_142_0();
  v4(v5);
  OUTLINED_FUNCTION_7_6(v3 + v1[8]);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758E348);
  OUTLINED_FUNCTION_26_13(v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF68);
  OUTLINED_FUNCTION_26_13(v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E350);
  OUTLINED_FUNCTION_26_13(v8);
  v9 = v3 + v1[12];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DF78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  swift_release();
  return swift_deallocObject();
}

void sub_2465C7DB8()
{
  sub_246558BDC(&qword_257591538, (void (*)(uint64_t))type metadata accessor for SendMailSceneHostPlan);
}

uint64_t type metadata accessor for SendMailSceneHostPlan()
{
  uint64_t result;

  result = qword_257591570;
  if (!qword_257591570)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2465C7E1C()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2465C7E2C()
{
  sub_246558BDC(&qword_257591540, (void (*)(uint64_t))type metadata accessor for SendMailSceneHostPlan);
}

void sub_2465C7E58()
{
  sub_246558BDC(&qword_25758F8C8, (void (*)(uint64_t))MEMORY[0x24BE999E8]);
}

void sub_2465C7E84()
{
  sub_246558BDC(&qword_25758F8D0, (void (*)(uint64_t))MEMORY[0x24BE99AC8]);
}

void sub_2465C7EB0()
{
  sub_246558BDC(&qword_25758F8D8, (void (*)(uint64_t))MEMORY[0x24BE99AC8]);
}

uint64_t sub_2465C7EDC()
{
  return type metadata accessor for SendMailSceneHostPlan();
}

void sub_2465C7EE4()
{
  unint64_t v0;

  sub_2465BC5F0();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for SendMailSceneHostPlan()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SendMailSceneHostPlan.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of SendMailSceneHostPlan.accept(input:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of SendMailSceneHostPlan.body.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t sub_2465C7F88()
{
  void (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257591510);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257591508);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257591500);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575914F8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575914F0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2575914E8);
  type metadata accessor for ResolveSiriMailMessageIntent();
  sub_2465DCBA0();
  v0 = (void (*)(uint64_t))MEMORY[0x24BE998C0];
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25758D4F8);
  sub_246558BDC(&qword_25758FBF8, (void (*)(uint64_t))type metadata accessor for ResolveSiriMailMessageIntent);
  sub_246558BDC(&qword_25758DA90, v0);
  OUTLINED_FUNCTION_17_14();
  sub_246558BDC(&qword_25758FBB8, (void (*)(uint64_t))MEMORY[0x24BE99CD0]);
  OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_17_14();
  OUTLINED_FUNCTION_17_14();
  return OUTLINED_FUNCTION_17_14();
}

void sub_2465C8160()
{
  sub_2465DCA44();
  OUTLINED_FUNCTION_2_12();
}

uint64_t sub_2465C8188(uint64_t a1)
{
  uint64_t v1;

  return sub_2465C37E8(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

void sub_2465C8198()
{
  uint64_t *v0;
  uint64_t v1;

  *v0 = OUTLINED_FUNCTION_218();
  v0[1] = v1;
  OUTLINED_FUNCTION_2_12();
}

void sub_2465C81B4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2465BDB68(a1, a2, a3, a4, MEMORY[0x24BE99638]);
}

uint64_t sub_2465C81D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2465C81F4(uint64_t *a1)
{
  uint64_t v1;

  return sub_2465C2C18(a1, *(unsigned __int8 *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2465C8200(uint64_t *a1)
{
  uint64_t v1;

  return sub_2465C27B8(a1, *(unsigned __int8 *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t OUTLINED_FUNCTION_25_20()
{
  return sub_2465DB3DC();
}

void OUTLINED_FUNCTION_43_12()
{
  sub_2465BDE34();
}

uint64_t OUTLINED_FUNCTION_51_9()
{
  return sub_2465DB3DC();
}

uint64_t OUTLINED_FUNCTION_53_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 192) + 8))(v1, v0);
}

void OUTLINED_FUNCTION_57_6()
{
  sub_2465C1954();
}

uint64_t OUTLINED_FUNCTION_66_5()
{
  return sub_2465DB460();
}

void OUTLINED_FUNCTION_72_6(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_246545BE8(v2, a2);
}

uint64_t OUTLINED_FUNCTION_74_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_81_5()
{
  return sub_2465DB43C();
}

uint64_t OUTLINED_FUNCTION_84_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 256) + 8))(v0, v1);
}

void OUTLINED_FUNCTION_92_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;

  sub_2465C0D00(v21, v20, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

uint64_t OUTLINED_FUNCTION_94_2()
{
  return sub_2465DB898();
}

uint64_t OUTLINED_FUNCTION_101_3()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

uint64_t OUTLINED_FUNCTION_102_3(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 - 176))(a1, *(_QWORD *)(v1 - 160));
}

uint64_t OUTLINED_FUNCTION_109_5()
{
  return sub_2465DB40C();
}

void OUTLINED_FUNCTION_110_3(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 232) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_112_3(uint64_t a1)
{
  uint64_t v1;
  char v2;

  *(_BYTE *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 24) = v1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_119_4()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_121_3()
{
  return sub_2465600C0();
}

uint64_t OUTLINED_FUNCTION_122_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 312));
}

uint64_t OUTLINED_FUNCTION_123_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;

  *v10 = a10;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_127()
{
  return sub_2465DD278();
}

uint64_t OUTLINED_FUNCTION_130_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_131_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_136_1()
{
  return sub_2465DCEAC();
}

uint64_t OUTLINED_FUNCTION_139(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = a2;
  return a2(0);
}

uint64_t OUTLINED_FUNCTION_142_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_148()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_158@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(a2 - 256) = result;
  *(_QWORD *)(v2 - 288) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_159_0()
{
  return sub_2465600C0();
}

uint64_t OUTLINED_FUNCTION_163@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = a1[1];
  *v1 = *a1;
  v1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_171()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_179()
{
  return sub_2465DD2D8();
}

uint64_t OUTLINED_FUNCTION_182(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD);

  return v1(a1, 0);
}

uint64_t OUTLINED_FUNCTION_183()
{
  return sub_2465DD0A4();
}

uint64_t OUTLINED_FUNCTION_186()
{
  return sub_2465DB3DC();
}

uint64_t OUTLINED_FUNCTION_192()
{
  return sub_2465DB3DC();
}

void (*OUTLINED_FUNCTION_194())(_QWORD *a1)
{
  uint64_t v0;

  return sub_2465BE3A8((_QWORD *)(v0 - 120));
}

uint64_t OUTLINED_FUNCTION_198(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_2465C8EE0(a1, v3, a3);
}

void OUTLINED_FUNCTION_199()
{
  JUMPOUT(0x24955FDE0);
}

uint64_t OUTLINED_FUNCTION_201()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

void (*OUTLINED_FUNCTION_204())(_QWORD *a1)
{
  uint64_t v0;

  return sub_2465BE3A8((_QWORD *)(v0 - 136));
}

uint64_t OUTLINED_FUNCTION_206()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_207()
{
  return swift_release_n();
}

void OUTLINED_FUNCTION_210()
{
  uint64_t v0;

  sub_246558BDC(*(_QWORD **)(v0 - 96), *(void (**)(uint64_t))(v0 - 104));
}

uint64_t OUTLINED_FUNCTION_212()
{
  return sub_2465DC4C8();
}

uint64_t OUTLINED_FUNCTION_213()
{
  return sub_2465DC4F8();
}

uint64_t OUTLINED_FUNCTION_214()
{
  return sub_2465DC4E0();
}

uint64_t OUTLINED_FUNCTION_215()
{
  return sub_2465DC588();
}

uint64_t OUTLINED_FUNCTION_216()
{
  return sub_2465DC4A4();
}

uint64_t OUTLINED_FUNCTION_217()
{
  return sub_2465DC474();
}

uint64_t OUTLINED_FUNCTION_218()
{
  return sub_2465DC9A8();
}

uint64_t OUTLINED_FUNCTION_223()
{
  return sub_2465DC5A0();
}

void OUTLINED_FUNCTION_229()
{
  void *v0;

}

unint64_t SiriMailError.errorDescription.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = 0xD000000000000021;
  switch(*(_QWORD *)(v0 + 8))
  {
    case 0:
    case 3:
      return v1;
    case 1:
      sub_2465DD158();
      swift_bridgeObjectRelease();
      v1 = 0xD000000000000033;
      break;
    case 2:
      v1 = 0x6C706D6920746F4ELL;
      break;
    case 4:
      v1 = 0xD000000000000020;
      break;
    case 5:
      v1 = 0xD000000000000027;
      break;
    case 6:
      v1 = 0xD000000000000038;
      break;
    case 7:
      v1 = 0xD000000000000067;
      break;
    default:
      sub_2465DD158();
      sub_2465DCEDC();
      sub_2465DCEDC();
      v1 = 0;
      break;
  }
  return v1;
}

unint64_t destroy for SiriMailError(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s16SiriMailInternal13SiriMailErrorOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for SiriMailError(_QWORD *a1, _QWORD *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for SiriMailError(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for SiriMailError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFF8 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483640);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 7;
  if (v4 >= 9)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SiriMailError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFF7)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483640;
    if (a3 >= 0x7FFFFFF8)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF8)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 7;
  }
  return result;
}

uint64_t sub_2465C8A34(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_2465C8A4C(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for SiriMailError()
{
  return &type metadata for SiriMailError;
}

uint64_t static Logger.logAndCrash(_:file:line:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
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
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v33 = a4;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575917A8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v27 - v15;
  if (qword_25758C700 != -1)
    swift_once();
  v17 = OUTLINED_FUNCTION_5_9();
  v18 = __swift_project_value_buffer(v17, (uint64_t)qword_257591790);
  v19 = *(_QWORD *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v16, v18, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v17);
  sub_2465C8DEC((uint64_t)v16, (uint64_t)v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v17) == 1)
  {
    sub_2465C8E34((uint64_t)v14);
  }
  else
  {
    swift_bridgeObjectRetain_n();
    v20 = sub_2465DCDEC();
    v21 = sub_2465DD038();
    v30 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      v22 = swift_slowAlloc();
      v31 = a6;
      v23 = v22;
      v28 = swift_slowAlloc();
      v35 = v28;
      *(_DWORD *)v23 = 136315650;
      v32 = a3;
      v24 = sub_2465DD170();
      v34 = sub_2465C8EE0(v24, v25, &v35);
      v29 = a5;
      sub_2465DD0A4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2048;
      v34 = v31;
      sub_2465DD0A4();
      *(_WORD *)(v23 + 22) = 2080;
      swift_bridgeObjectRetain();
      v34 = sub_2465C8EE0(a1, a2, &v35);
      sub_2465DD0A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24652E000, v20, (os_log_type_t)v30, "FatalError at %s:%lu - %s", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v17);
  }
  sub_2465DB34C();
  result = sub_2465DD1F4();
  __break(1u);
  return result;
}

uint64_t sub_2465C8D7C()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_5_9();
  __swift_allocate_value_buffer(v0, qword_257591790);
  __swift_project_value_buffer(v0, (uint64_t)qword_257591790);
  return sub_2465DCDF8();
}

uint64_t sub_2465C8DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575917A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2465C8E34(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575917A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static Logger.siriMail.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25758C700 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_5_9();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257591790);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2465C8EE0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2465C8FC0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2465528EC((uint64_t)v12, *a3);
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
      sub_2465528EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t sub_2465C8FC0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_2465C9114((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2465DD0B0();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2465C91D8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2465DD194();
    if (!v8)
    {
      result = sub_2465DD1E8();
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

void *sub_2465C9114(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2465DD20C();
  __break(1u);
  return result;
}

uint64_t sub_2465C91D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2465C926C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2465C9440(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2465C9440((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2465C926C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2465DCEE8();
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
  v3 = sub_2465C93DC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2465DD164();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2465DD20C();
  __break(1u);
LABEL_14:
  result = sub_2465DD1E8();
  __break(1u);
  return result;
}

_QWORD *sub_2465C93DC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_2575917B0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2465C9440(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_2575917B0);
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
    sub_2465C95D8(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2465C9514(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2465C9514(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2465DD20C();
  __break(1u);
  return result;
}

char *sub_2465C95D8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2465DD20C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t *sub_2465C9698(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2465DCDE0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    *(_OWORD *)v9 = *(_OWORD *)v10;
    v9[16] = v10[16];
  }
  return a1;
}

uint64_t sub_2465C9730(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2465DCDE0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_2465C9764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2465DCDE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  return a1;
}

uint64_t sub_2465C97D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2465DCDE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  return a1;
}

uint64_t sub_2465C9844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2465DCDE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  return a1;
}

uint64_t sub_2465C98B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_2465DCDE0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = *(_BYTE *)(v9 + 16);
  return a1;
}

uint64_t sub_2465C991C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2465C9928()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_32();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t sub_2465C9950()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2465C995C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_32();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t type metadata accessor for Signpost.OpenSignpost()
{
  uint64_t result;

  result = qword_257591810;
  if (!qword_257591810)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2465C99C0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2465DCDE0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2465C9A30()
{
  uint64_t result;

  sub_2465C9A8C();
  result = sub_2465DD080();
  qword_257596FD8 = result;
  return result;
}

unint64_t sub_2465C9A8C()
{
  unint64_t result;

  result = qword_257591848;
  if (!qword_257591848)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_257591848);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SignpostName(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SignpostName(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
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
  *(_BYTE *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SignpostName()
{
  return &type metadata for SignpostName;
}

uint64_t OUTLINED_FUNCTION_0_32()
{
  return sub_2465DCDE0();
}

void sub_2465C9B34(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
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
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[3];
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

  v42 = a6;
  v43 = a5;
  v45 = a3;
  v46 = a2;
  v47 = a1;
  v48 = a9;
  v13 = sub_2465DC51C();
  v49 = *(_QWORD *)(v13 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4_2();
  v44 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E510);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_4_2();
  v50 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758FC28);
  OUTLINED_FUNCTION_1_6();
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)v40 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v40 - v25;
  if (qword_25758C700 != -1)
    swift_once();
  v27 = sub_2465DCE04();
  __swift_project_value_buffer(v27, (uint64_t)qword_257591790);
  v41 = a10;
  sub_24653BB30(a10, (uint64_t)v26, &qword_25758FC28);
  v28 = sub_2465DCDEC();
  v29 = sub_2465DD050();
  if (os_log_type_enabled(v28, v29))
  {
    v40[0] = a8;
    v40[1] = a7;
    v40[2] = a4;
    v30 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v53 = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v30 = 136315138;
    sub_24653BB30((uint64_t)v26, (uint64_t)v24, &qword_25758FC28);
    OUTLINED_FUNCTION_9_8((uint64_t)v24, 1, v13);
    if (v39)
    {
      sub_246534910((uint64_t)v24, &qword_25758FC28);
      v31 = 0;
      v33 = 0;
    }
    else
    {
      v31 = sub_2465DC510();
      v33 = v32;
      (*(void (**)(char *, uint64_t))(v49 + 8))(v24, v13);
    }
    v51 = v31;
    v52 = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758E3D8);
    v34 = sub_2465DCE88();
    v51 = sub_2465C8EE0(v34, v35, &v53);
    sub_2465DD0A4();
    swift_bridgeObjectRelease();
    sub_246534910((uint64_t)v26, &qword_25758FC28);
    _os_log_impl(&dword_24652E000, v28, v29, "#reducer returning _SiriMailMessage, state: %s", v30, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }
  sub_246534910((uint64_t)v26, &qword_25758FC28);

  v36 = sub_2465DC504();
  OUTLINED_FUNCTION_0_5(v50, v37, v38, v36);
  sub_24653BB30(v41, (uint64_t)v21, &qword_25758FC28);
  OUTLINED_FUNCTION_9_8((uint64_t)v21, 1, v13);
  if (v39)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v49 + 104))(v44, *MEMORY[0x24BE99BD8], v13);
    OUTLINED_FUNCTION_148();
    OUTLINED_FUNCTION_81();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_9_25();
    sub_246534910((uint64_t)v21, &qword_25758FC28);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v49 + 32))(v44, v21, v13);
    OUTLINED_FUNCTION_148();
    OUTLINED_FUNCTION_81();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_9_25();
  }
  if (qword_25758C6E0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_2465DC4BC();
  OUTLINED_FUNCTION_4_3();
}

void sub_2465C9F8C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
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
  char *v29;
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
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  void (*v127)(char *, char *, uint64_t);
  char *v128;
  uint64_t v129;
  NSObject *v130;
  os_log_type_t v131;
  uint8_t *v132;
  void *v133;
  void *v134;
  id v135;
  uint64_t v136;
  unint64_t v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  _QWORD v141[15];
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  char *v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void (*v176)(char *, uint64_t);
  uint64_t v177;
  uint64_t v178;
  uint8_t *v179;
  uint64_t v180;
  uint64_t v181;

  v157 = a7;
  v151 = a6;
  v154 = a5;
  v162 = a4;
  v159 = a3;
  v158 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758FC28);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1_4();
  v13 = v12 - v11;
  v156 = sub_2465DC51C();
  v155 = *(_QWORD *)(v156 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_1_4();
  v17 = v16 - v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E510);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_4_2();
  v163 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591870);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_4_2();
  v152 = v21;
  v150 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD20);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_4_2();
  v153 = v23;
  v161 = sub_2465DC5A0();
  v160 = *(_QWORD *)(v161 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_5_3();
  v149 = v25;
  OUTLINED_FUNCTION_8_2();
  v27 = MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)v141 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)v141 - v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD10);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_5_3();
  v172 = v33;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_10_10();
  v168 = v35;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v36);
  v38 = (char *)v141 - v37;
  v39 = sub_2465DC570();
  v179 = *(uint8_t **)(v39 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_5_3();
  v170 = v41;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_10_10();
  v165 = v43;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_10_10();
  v167 = v45;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_10_10();
  v164 = v47;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_10_10();
  v173 = v49;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v50);
  v171 = (uint64_t)v141 - v51;
  v52 = sub_2465DABB4();
  v174 = *(_QWORD *)(v52 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_5_3();
  v169 = v54;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_10_10();
  v166 = v56;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_10_10();
  v178 = v58;
  OUTLINED_FUNCTION_8_2();
  v60 = MEMORY[0x24BDAC7A8](v59);
  v62 = (char *)v141 - v61;
  if (a1 && (v63 = *(_QWORD *)(v60 + 16)) != 0)
  {
    v146 = v29;
    v148 = v31;
    v147 = a8;
    OUTLINED_FUNCTION_3_21();
    v142 = v64;
    v66 = v65 + v64;
    v177 = *(_QWORD *)(v67 + 72);
    v143 = v65;
    swift_bridgeObjectRetain();
    v175 = MEMORY[0x24BEE4AF8];
    v145 = v13;
    v144 = v17;
    v68 = v172;
    do
    {
      OUTLINED_FUNCTION_5_7((uint64_t)v62, v66);
      OUTLINED_FUNCTION_5_7(v178, (uint64_t)v62);
      sub_2465DC57C();
      OUTLINED_FUNCTION_8_26((uint64_t)v38);
      v176 = *(void (**)(char *, uint64_t))(v174 + 8);
      v176(v62, v52);
      OUTLINED_FUNCTION_9_8((uint64_t)v38, 1, v39);
      if (v69)
      {
        sub_246534910((uint64_t)v38, &qword_25758CD10);
      }
      else
      {
        v70 = v171;
        OUTLINED_FUNCTION_6_30(v171, (uint64_t)v38);
        OUTLINED_FUNCTION_6_30(v173, v70);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          OUTLINED_FUNCTION_29_11();
          sub_246550910();
          v175 = v75;
        }
        v73 = *(_QWORD *)(v175 + 16);
        v72 = *(_QWORD *)(v175 + 24);
        if (v73 >= v72 >> 1)
        {
          OUTLINED_FUNCTION_16_21(v72);
          sub_246550910();
          v175 = v76;
        }
        v74 = v175;
        *(_QWORD *)(v175 + 16) = v73 + 1;
        OUTLINED_FUNCTION_6_30(v74 + ((v179[80] + 32) & ~(unint64_t)v179[80]) + *((_QWORD *)v179 + 9) * v73, v173);
        v68 = v172;
      }
      v66 += v177;
      --v63;
    }
    while (v63);
    OUTLINED_FUNCTION_82_0();
    if (v158)
    {
      v78 = *(_QWORD *)(v158 + 16);
      if (v78)
      {
        OUTLINED_FUNCTION_27_16();
        v79 = MEMORY[0x24BEE4AF8];
        do
        {
          v80 = v166;
          OUTLINED_FUNCTION_5_7(v166, v66);
          OUTLINED_FUNCTION_5_7(v178, v80);
          v81 = v168;
          sub_2465DC57C();
          OUTLINED_FUNCTION_8_26(v81);
          OUTLINED_FUNCTION_32_16(v80);
          OUTLINED_FUNCTION_9_8(v81, 1, v39);
          if (v69)
          {
            sub_246534910(v81, &qword_25758CD10);
          }
          else
          {
            v82 = v164;
            OUTLINED_FUNCTION_6_30(v164, v81);
            OUTLINED_FUNCTION_6_30(v167, v82);
            v83 = swift_isUniquelyReferenced_nonNull_native();
            if ((v83 & 1) == 0)
            {
              OUTLINED_FUNCTION_29_11();
              sub_246550910();
              v79 = v88;
            }
            v85 = *(_QWORD *)(v79 + 16);
            v84 = *(_QWORD *)(v79 + 24);
            if (v85 >= v84 >> 1)
            {
              OUTLINED_FUNCTION_16_21(v84);
              sub_246550910();
              v79 = v89;
            }
            *(_QWORD *)(v79 + 16) = v85 + 1;
            OUTLINED_FUNCTION_3_21();
            OUTLINED_FUNCTION_6_30(v79 + v86 + *(_QWORD *)(v87 + 72) * v85, v167);
            v68 = v172;
          }
          v66 += v177;
          --v78;
        }
        while (v78);
        OUTLINED_FUNCTION_82_0();
      }
      else
      {
        v79 = MEMORY[0x24BEE4AF8];
      }
    }
    else
    {
      v79 = 0;
    }
    if (v159)
    {
      v90 = *(_QWORD *)(v159 + 16);
      if (v90)
      {
        OUTLINED_FUNCTION_27_16();
        v91 = MEMORY[0x24BEE4AF8];
        do
        {
          v92 = v169;
          OUTLINED_FUNCTION_5_7(v169, v66);
          OUTLINED_FUNCTION_5_7(v178, v92);
          sub_2465DC57C();
          OUTLINED_FUNCTION_8_26(v68);
          OUTLINED_FUNCTION_32_16(v92);
          OUTLINED_FUNCTION_9_8(v68, 1, v39);
          if (v69)
          {
            sub_246534910(v68, &qword_25758CD10);
          }
          else
          {
            v93 = v165;
            OUTLINED_FUNCTION_6_30(v165, v68);
            OUTLINED_FUNCTION_6_30(v170, v93);
            v94 = swift_isUniquelyReferenced_nonNull_native();
            if ((v94 & 1) == 0)
            {
              OUTLINED_FUNCTION_29_11();
              sub_246550910();
              v91 = v99;
            }
            v96 = *(_QWORD *)(v91 + 16);
            v95 = *(_QWORD *)(v91 + 24);
            if (v96 >= v95 >> 1)
            {
              OUTLINED_FUNCTION_16_21(v95);
              sub_246550910();
              v91 = v100;
            }
            *(_QWORD *)(v91 + 16) = v96 + 1;
            OUTLINED_FUNCTION_3_21();
            OUTLINED_FUNCTION_6_30(v91 + v97 + *(_QWORD *)(v98 + 72) * v96, v170);
            v68 = v172;
          }
          v66 += v177;
          --v90;
        }
        while (v90);
        OUTLINED_FUNCTION_82_0();
      }
      else
      {
        v91 = MEMORY[0x24BEE4AF8];
      }
    }
    else
    {
      v91 = 0;
    }
    if (qword_25758C6E0 != -1)
      swift_once();
    v101 = *(_QWORD *)(qword_257596DE0 + 80);
    v173 = *(_QWORD *)(qword_257596DE0 + 96);
    v174 = v101;
    v102 = *(_QWORD *)(qword_257596DE0 + 104);
    v103 = *(_QWORD *)(qword_257596DE0 + 112);
    v176 = *(void (**)(char *, uint64_t))(qword_257596DE0 + 120);
    v177 = v102;
    v104 = *(_QWORD *)(qword_257596DE0 + 136);
    v171 = *(_QWORD *)(qword_257596DE0 + 128);
    v172 = v103;
    v105 = *(_QWORD *)(qword_257596DE0 + 24);
    v169 = *(_QWORD *)(qword_257596DE0 + 32);
    v141[5] = *(_QWORD *)(qword_257596DE0 + 40);
    v106 = *(_QWORD *)(qword_257596DE0 + 56);
    v168 = *(_QWORD *)(qword_257596DE0 + 64);
    v141[4] = *(_QWORD *)(qword_257596DE0 + 72);
    v167 = *(_QWORD *)(qword_257596DE0 + 16);
    v165 = *(_QWORD *)(qword_257596DE0 + 48);
    v107 = *(_QWORD *)(qword_257596DE0 + 216);
    v159 = *(_QWORD *)(qword_257596DE0 + 208);
    v108 = *(_QWORD *)(qword_257596DE0 + 248);
    v143 = *(_QWORD *)(qword_257596DE0 + 240);
    v142 = *(_QWORD *)(qword_257596DE0 + 256);
    v141[3] = *(_QWORD *)(qword_257596DE0 + 264);
    v141[13] = *(_QWORD *)(qword_257596DE0 + 272);
    v141[2] = *(_QWORD *)(qword_257596DE0 + 280);
    v141[12] = *(_QWORD *)(qword_257596DE0 + 288);
    v179 = *(uint8_t **)(qword_257596DE0 + 296);
    v109 = MEMORY[0x24BEE4AF8];
    if (v79)
      v110 = v79;
    else
      v110 = MEMORY[0x24BEE4AF8];
    v141[9] = v110;
    v141[11] = *(_QWORD *)(qword_257596DE0 + 304);
    v178 = *(_QWORD *)(qword_257596DE0 + 312);
    if (v91)
      v109 = v91;
    v141[8] = v109;
    v111 = *(_QWORD *)(qword_257596DE0 + 232);
    v141[10] = *(_QWORD *)(qword_257596DE0 + 224);
    v141[1] = v111;
    v112 = v162;
    if (v154 == 1)
      v112 = 0;
    v141[7] = v112;
    if (v154 == 1)
      v113 = 0;
    else
      v113 = v154;
    v141[6] = v113;
    v114 = v152;
    sub_24653BB30(v151, v152, &qword_257591870);
    OUTLINED_FUNCTION_9_8(v114, 1, v150);
    v170 = v104;
    v166 = v105;
    v164 = v106;
    v158 = v107;
    v141[14] = v108;
    if (v69)
    {
      v115 = sub_2465DAD4C();
      v118 = v153;
      OUTLINED_FUNCTION_0_5(v153, v116, v117, v115);
      OUTLINED_FUNCTION_31_18();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_15_26();
      OUTLINED_FUNCTION_15_26();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_81();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_148();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_148();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_19_21();
      OUTLINED_FUNCTION_30_13();
      sub_246534910(v114, &qword_257591870);
    }
    else
    {
      v118 = v153;
      sub_2465CB2E0(v114, v153);
      OUTLINED_FUNCTION_31_18();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_15_26();
      OUTLINED_FUNCTION_31_18();
      OUTLINED_FUNCTION_15_26();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_81();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_148();
      OUTLINED_FUNCTION_18_3();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_19_21();
      OUTLINED_FUNCTION_30_13();
    }
    sub_24656BE28();
    sub_246534910(v118, &qword_25758CD20);
    v119 = sub_2465DC504();
    OUTLINED_FUNCTION_0_5(v163, v120, v121, v119);
    v122 = v145;
    sub_24653BB30(v157, v145, &qword_25758FC28);
    v123 = v156;
    OUTLINED_FUNCTION_9_8(v122, 1, v156);
    if (v69)
    {
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v155 + 104))(v144, *MEMORY[0x24BE99BD8], v123);
      sub_246534910(v122, &qword_25758FC28);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v155 + 32))(v144, v122, v123);
    }
    v124 = v148;
    sub_2465DC594();
    if (qword_25758C700 != -1)
      swift_once();
    v125 = sub_2465DCE04();
    __swift_project_value_buffer(v125, (uint64_t)qword_257591790);
    v126 = v160;
    v127 = *(void (**)(char *, char *, uint64_t))(v160 + 16);
    v128 = v146;
    v129 = v161;
    v127(v146, v124, v161);
    v130 = sub_2465DCDEC();
    v131 = sub_2465DD050();
    if (os_log_type_enabled(v130, v131))
    {
      v132 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      v181 = OUTLINED_FUNCTION_3_3();
      *(_DWORD *)v132 = 136315138;
      v179 = v132 + 4;
      v127(v149, v128, v129);
      sub_2465DCE88();
      v133 = (void *)objc_opt_self();
      v134 = (void *)sub_2465DCE4C();
      v135 = objc_msgSend(v133, sel_partiallyRedactedStringForString_, v134);

      v136 = sub_2465DCE58();
      v138 = v137;
      swift_bridgeObjectRelease();

      v180 = sub_2465C8EE0(v136, v138, &v181);
      sub_2465DD0A4();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_21_15();
      _os_log_impl(&dword_24652E000, v130, v131, "Publishing new snippet: %s", v132, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_21_15();

    v139 = v147;
    (*(void (**)(uint64_t, char *, uint64_t))(v126 + 32))(v147, v148, v129);
    v140 = sub_2465DAF08();
    swift_storeEnumTagMultiPayload();
    __swift_storeEnumTagSinglePayload(v139, 0, 1, v140);
    OUTLINED_FUNCTION_4_3();
  }
  else
  {
    v77 = sub_2465DAF08();
    __swift_storeEnumTagSinglePayload(a8, 1, 1, v77);
  }
}

void sub_2465CAE60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2465CB094(a1, a2, a3, sub_246563174, (uint64_t)&unk_2517BCAC0, (uint64_t)&unk_257591858);
}

uint64_t sub_2465CAE7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v7;
  *v7 = v5;
  v7[1] = sub_2465CB328;
  return sub_246566574(a5);
}

uint64_t sub_2465CAED4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_23_21();
  OUTLINED_FUNCTION_13_27();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_14_22(v1);
  return sub_2465CAE7C(v2, v3, v4, v5, v6);
}

uint64_t sub_2465CAF34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2465DD008();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_246534910(a1, &qword_25758E130);
  }
  else
  {
    sub_2465DCFFC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2465DCFCC();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_2465CB078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2465CB094(a1, a2, a3, sub_246564120, (uint64_t)&unk_2517BCB10, (uint64_t)&unk_257591868);
}

void sub_2465CB094(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = a6;
  v9 = OUTLINED_FUNCTION_23_21();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758E130);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_1_4();
  v15 = v14 - v13;
  a4(a1);
  sub_2465DCFF0();
  v16 = sub_2465DD008();
  __swift_storeEnumTagSinglePayload(v15, 0, 1, v16);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v17 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = (char *)swift_allocObject();
  *((_QWORD *)v18 + 2) = 0;
  *((_QWORD *)v18 + 3) = 0;
  *((_QWORD *)v18 + 4) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v18[v17], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_retain();
  sub_2465CAF34(v15, v20, (uint64_t)v18);
  swift_release();
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465CB1CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2465CB1F0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t objectdestroyTm_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = OUTLINED_FUNCTION_23_21();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2465CB280()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_23_21();
  OUTLINED_FUNCTION_13_27();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_14_22(v1);
  return sub_2465CAE7C(v2, v3, v4, v5, v6);
}

uint64_t sub_2465CB2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_6_30(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_8_26(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_9_25()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_2465CB1F0(v2, *(_QWORD *)(v3 - 168));
  sub_2465CB1F0(v1, v0);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_14_22(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_15_26()
{
  return swift_bridgeObjectRetain();
}

BOOL OUTLINED_FUNCTION_16_21@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_19_21()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_21_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_23_21()
{
  return sub_2465DC468();
}

uint64_t OUTLINED_FUNCTION_27_16()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_29_11()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_30_13()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2465CB1F0(*(_QWORD *)(v1 - 248), v0);
}

uint64_t OUTLINED_FUNCTION_31_18()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_32_16(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 - 136))(a1, v1);
}

uint64_t sub_2465CB434(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;

  swift_bridgeObjectRetain();
  sub_2465CB5F4(1);
  sub_2465CB6B0();
  v5 = sub_2465DD0D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2465CB524(1uLL, a2, a3);
  sub_2465CB6EC();
  swift_bridgeObjectRetain();
  sub_2465DCED0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_2465CB524(unint64_t result, uint64_t a2, unint64_t a3)
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
    result = sub_2465DCEC4();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
    {
      v7 = sub_2465DCF18();
      swift_bridgeObjectRelease();
      return v7;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2465CB5F4(uint64_t result)
{
  uint64_t v1;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2465DCEC4();
    v1 = sub_2465DCF18();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

unint64_t sub_2465CB6B0()
{
  unint64_t result;

  result = qword_257591878;
  if (!qword_257591878)
  {
    result = MEMORY[0x2495605E4](MEMORY[0x24BEE1E38], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_257591878);
  }
  return result;
}

unint64_t sub_2465CB6EC()
{
  unint64_t result;

  result = qword_257591880;
  if (!qword_257591880)
  {
    result = MEMORY[0x2495605E4](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_257591880);
  }
  return result;
}

uint64_t String.partiallyRedactedSubjectOrSummary.getter(uint64_t a1, uint64_t a2)
{
  return sub_2465CB74C(a1, a2, (SEL *)&selRef_ec_partiallyRedactedStringForSubjectOrSummary_);
}

uint64_t String.partiallyRedactedString.getter(uint64_t a1, uint64_t a2)
{
  return sub_2465CB74C(a1, a2, (SEL *)&selRef_partiallyRedactedStringForString_);
}

uint64_t String.redactedQueryString.getter(uint64_t a1, uint64_t a2)
{
  return sub_2465CB74C(a1, a2, (SEL *)&selRef_redactedQueryStringForQueryString_);
}

uint64_t sub_2465CB74C(uint64_t a1, uint64_t a2, SEL *a3)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_2465DCE4C();
  v6 = objc_msgSend(v4, *a3, v5);

  v7 = sub_2465DCE58();
  return v7;
}

uint64_t *sub_2465CB7D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2465DC084();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = *(int *)(a3 + 24);
    v12 = (uint64_t *)((char *)v4 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_2465CB884(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_2465DC084();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

_QWORD *sub_2465CB8DC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2465DC084();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_2465CB960(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2465DC084();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_2465CB9F8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2465DC084();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_2465CBA70(_QWORD *a1, _QWORD *a2, uint64_t a3)
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

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2465DC084();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2465CBAF8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2465CBB04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;
  int v9;

  v6 = sub_2465DC084();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 20), a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  v9 = v8 - 1;
  if (v9 < 0)
    v9 = -1;
  return (v9 + 1);
}

uint64_t sub_2465CBB90()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2465CBB9C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = sub_2465DC084();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = a2;
  return result;
}

uint64_t type metadata accessor for UnresolvedContactInfo()
{
  uint64_t result;

  result = qword_2575918E0;
  if (!qword_2575918E0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2465CBC50()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2465DC084();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2465CBCD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  sub_2465DB8EC();
  sub_2465DB784();
  sub_246545BA8(a1, (uint64_t)&v7, &qword_25758DAC0);
  if (v8)
  {
    sub_2465D0C8C(a1, &qword_25758DAC0);
    sub_2465362E0(&v7, (uint64_t)&v9);
  }
  else
  {
    sub_2465DB388();
    v4 = sub_2465DB730();
    OUTLINED_FUNCTION_11_0();
    v5 = sub_2465DB724();
    v10 = v4;
    v11 = MEMORY[0x24BE98438];
    *(_QWORD *)&v9 = v5;
    sub_2465D0C8C(a1, &qword_25758DAC0);
    sub_2465D0C8C((uint64_t)&v7, &qword_25758DAC0);
  }
  return sub_2465362E0(&v9, a2);
}

void sub_2465CBDAC()
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
  char *v12;
  uint64_t v13;
  _QWORD *v14;
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
  _QWORD v30[12];
  _QWORD v31[13];

  OUTLINED_FUNCTION_14_0();
  v2 = v1;
  v22 = v3;
  v25 = v4;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257590008);
  v26 = *(_QWORD *)(v24 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1_4();
  v23 = v7 - v6;
  v8 = sub_2465DB6B8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (uint64_t *)((char *)&v21 - v13);
  sub_2465DC7E0();
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1_4();
  v16 = sub_2465DB688();
  OUTLINED_FUNCTION_11_0();
  v17 = sub_2465DB67C();
  v31[3] = v16;
  v31[4] = MEMORY[0x24BE97F18];
  v31[0] = v17;
  type metadata accessor for SendMailCATsSimple();
  OUTLINED_FUNCTION_92_5();
  v31[5] = OUTLINED_FUNCTION_77_5();
  type metadata accessor for ContactResolutionCATsSimple();
  OUTLINED_FUNCTION_92_5();
  v31[6] = OUTLINED_FUNCTION_77_5();
  sub_2465DB8EC();
  *v14 = v22;
  v14[1] = v2;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v14, *MEMORY[0x24BE980E0], v8);
  sub_2465CC05C((uint64_t)v31, (uint64_t)v30);
  (*(void (**)(char *, _QWORD *, uint64_t))(v9 + 16))(v12, v14, v8);
  sub_246558B34(v0, (uint64_t)&v29);
  sub_246558B34(v0 + 40, (uint64_t)&v28);
  sub_246558B34(v0 + 80, (uint64_t)&v27);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257590018);
  OUTLINED_FUNCTION_11_0();
  sub_2465CC090();
  swift_bridgeObjectRetain();
  v30[0] = sub_2465DB058();
  sub_246558A88(&qword_257590020, &qword_257590018);
  v20 = v19;
  sub_2465DB22C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257590010);
  v30[0] = v18;
  v30[1] = v20;
  swift_getOpaqueTypeConformance2();
  sub_2465DB0C4();
  OUTLINED_FUNCTION_5_21();
  OUTLINED_FUNCTION_124_3(*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v14, v8);
  sub_2465CC860((uint64_t)v31);
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465CC05C(uint64_t a1, uint64_t a2)
{
  sub_2465D07D8(a2, a1);
  return a2;
}

unint64_t sub_2465CC090()
{
  unint64_t result;

  result = qword_257591920;
  if (!qword_257591920)
  {
    result = MEMORY[0x2495605E4](&unk_2465E30B0, &unk_2517BCC20);
    atomic_store(result, (unint64_t *)&qword_257591920);
  }
  return result;
}

uint64_t sub_2465CC0CC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  int v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  void (*v43)(char *, uint64_t);
  uint8_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;

  v46 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591928);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591930);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v44 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591938);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (uint64_t *)((char *)&v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v44 - v18;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v20(v12, a1, v6);
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v13);
    sub_2465D0C8C((uint64_t)v5, &qword_257591928);
    v48 = 0;
    v49 = 0xE000000000000000;
    sub_2465DD158();
    sub_2465DCEDC();
    v20(v10, a1, v6);
    sub_2465DCE88();
    sub_2465DCEDC();
    swift_bridgeObjectRelease();
    sub_2465DCEDC();
    v22 = v48;
    v23 = v49;
    if (qword_25758C700 != -1)
      swift_once();
    v24 = sub_2465DCE04();
    __swift_project_value_buffer(v24, (uint64_t)qword_257591790);
    swift_bridgeObjectRetain_n();
    v25 = sub_2465DCDEC();
    v26 = sub_2465DD038();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v48 = v28;
      *(_DWORD *)v27 = 136315138;
      swift_bridgeObjectRetain();
      v47 = sub_2465C8EE0(v22, v23, &v48);
      sub_2465DD0A4();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24652E000, v25, v26, "#UnsetRelationshipFlowFactory: %s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495606A4](v28, -1, -1);
      MEMORY[0x2495606A4](v27, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_2465CC88C();
    v29 = swift_allocError();
    *v30 = v22;
    v30[1] = v23;
    *v46 = v29;
    goto LABEL_12;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v5, v13);
  (*(void (**)(uint64_t *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
  v21 = (*(uint64_t (**)(uint64_t *, uint64_t))(v14 + 88))(v17, v13);
  if (v21 == *MEMORY[0x24BE97938])
  {
    (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v17, v13);
    sub_2465392D8();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257590010);
    return swift_storeEnumTagMultiPayload();
  }
  if (v21 == *MEMORY[0x24BE97930])
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    (*(void (**)(uint64_t *, uint64_t))(v14 + 96))(v17, v13);
    *v46 = *v17;
LABEL_12:
    __swift_instantiateConcreteTypeFromMangledName(&qword_257590010);
    return swift_storeEnumTagMultiPayload();
  }
  if (v21 == *MEMORY[0x24BE97940])
  {
    sub_2465DB76C();
    sub_246558BDC(&qword_25758FFE8, (void (*)(uint64_t))MEMORY[0x24BE985D0]);
    v32 = swift_allocError();
    sub_2465DB760();
LABEL_18:
    (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    *v46 = v32;
    goto LABEL_12;
  }
  if (v21 == *MEMORY[0x24BE97928])
  {
    sub_2465CC88C();
    v32 = swift_allocError();
    *v33 = 0;
    v33[1] = 0;
    goto LABEL_18;
  }
  v48 = 0;
  v49 = 0xE000000000000000;
  sub_2465DD158();
  swift_bridgeObjectRelease();
  v48 = 0xD00000000000002ELL;
  v49 = 0x80000002465E5B40;
  sub_246558A88(qword_257591948, &qword_257591938);
  sub_2465DD260();
  sub_2465DCEDC();
  swift_bridgeObjectRelease();
  sub_2465DCEDC();
  v34 = v48;
  v35 = v49;
  if (qword_25758C700 != -1)
    swift_once();
  v36 = sub_2465DCE04();
  __swift_project_value_buffer(v36, (uint64_t)qword_257591790);
  swift_bridgeObjectRetain_n();
  v37 = sub_2465DCDEC();
  v38 = sub_2465DD038();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    v48 = v45;
    *(_DWORD *)v39 = 136315138;
    v44 = v39 + 4;
    swift_bridgeObjectRetain();
    v47 = sub_2465C8EE0(v34, v35, &v48);
    sub_2465DD0A4();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24652E000, v37, v38, "#UnsetRelationshipFlowFactory: %s", v39, 0xCu);
    v40 = v45;
    swift_arrayDestroy();
    MEMORY[0x2495606A4](v40, -1, -1);
    MEMORY[0x2495606A4](v39, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_2465CC88C();
  v41 = swift_allocError();
  *v42 = v34;
  v42[1] = v35;
  v43 = *(void (**)(char *, uint64_t))(v14 + 8);
  v43(v19, v13);
  *v46 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257590010);
  swift_storeEnumTagMultiPayload();
  return ((uint64_t (*)(uint64_t *, uint64_t))v43)(v17, v13);
}

uint64_t sub_2465CC860(uint64_t a1)
{
  sub_2465D07A4(a1);
  return a1;
}

unint64_t sub_2465CC88C()
{
  unint64_t result;

  result = qword_257591940;
  if (!qword_257591940)
  {
    result = MEMORY[0x2495605E4](&unk_2465E3070, &unk_2517BCBA8);
    atomic_store(result, (unint64_t *)&qword_257591940);
  }
  return result;
}

uint64_t sub_2465CC8C8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_60_9(a1, a2);
  v3 = OUTLINED_FUNCTION_0_0();
  v4 = OUTLINED_FUNCTION_85_6(v3);
  v2[11] = v4;
  v2[12] = *(_QWORD *)(v4 - 8);
  v2[13] = OUTLINED_FUNCTION_0_0();
  v5 = OUTLINED_FUNCTION_41();
  v2[14] = v5;
  v2[15] = *(_QWORD *)(v5 - 8);
  v2[16] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD08);
  v2[17] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465CC944()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 136);
  sub_24653909C();
  OUTLINED_FUNCTION_26_22();
  v2 = OUTLINED_FUNCTION_23_2();
  __swift_storeEnumTagSinglePayload(v1, 0, 1, v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v3;
  *v3 = v0;
  v3[1] = sub_2465CC9CC;
  return sub_24653B760(*(_QWORD *)(v0 + 136));
}

uint64_t sub_2465CC9CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 136);
  *(_QWORD *)(v3 + 152) = a1;
  *(_QWORD *)(v3 + 160) = v1;
  OUTLINED_FUNCTION_76_5();
  sub_2465D0C8C(v4, &qword_25758CD08);
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_5_8();
}

uint64_t sub_2465CCA3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 *v16;
  id v17;
  _QWORD *v18;

  OUTLINED_FUNCTION_62_5();
  v10 = *(_QWORD *)(v9 + 160);
  sub_24653909C();
  sub_2465D187C();
  OUTLINED_FUNCTION_27();
  if (v10)
  {

    swift_task_dealloc();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_39();
    return OUTLINED_FUNCTION_7_29(*(uint64_t (**)(void))(v9 + 8));
  }
  else
  {
    v12 = *(void **)(v9 + 152);
    v13 = *(_QWORD *)(v9 + 128);
    v14 = *(_QWORD *)(v9 + 104);
    v15 = *(_QWORD *)(v9 + 80);
    sub_246558B34(*(_QWORD *)(v9 + 72), v9 + 16);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v9 + 16), *(_QWORD *)(v9 + 40));
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB58);
    v16 = (__n128 *)OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_42_11(v16, (__n128)xmmword_2465DD940);
    *(_QWORD *)(v9 + 168) = a9;
    v17 = v12;
    sub_2465DB4FC();
    *(_QWORD *)(OUTLINED_FUNCTION_87_6() + 16) = v13;
    OUTLINED_FUNCTION_63_11(v15, (void (*)(uint64_t))sub_2465D0DC8, v14);
    OUTLINED_FUNCTION_49();
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v9 + 176) = v18;
    *v18 = v9;
    v18[1] = sub_2465CCB88;
    OUTLINED_FUNCTION_40_13();
    return OUTLINED_FUNCTION_17_26();
  }
}

uint64_t sub_2465CCB88()
{
  OUTLINED_FUNCTION_50_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_25_21();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_5_8();
}

uint64_t sub_2465CCBD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 120);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_37();
  v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_19_11();
  return v4();
}

uint64_t sub_2465CCC5C()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_39();
  return OUTLINED_FUNCTION_20_22(*(uint64_t (**)(void))(v0 + 8));
}

#error "2465CCD20: call analysis failed (funcsize=197)"

uint64_t sub_2465CD014(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[4] = a1;
  v2[5] = a2;
  v3 = OUTLINED_FUNCTION_48_9();
  v2[6] = v3;
  v2[7] = *(_QWORD *)(v3 - 8);
  v2[8] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465CD058()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[7];

  if (qword_25758C700 != -1)
    swift_once();
  v1 = v0[5];
  v2 = OUTLINED_FUNCTION_5_9();
  __swift_project_value_buffer(v2, (uint64_t)qword_257591790);
  v3 = OUTLINED_FUNCTION_14_3();
  v4(v3);
  v5 = sub_2465DCDEC();
  v6 = sub_2465DD02C();
  v7 = OUTLINED_FUNCTION_14_9(v6);
  v8 = v0[7];
  if (v7)
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v25[0] = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v9 = 136315138;
    sub_246558BDC(&qword_25758CF38, (void (*)(uint64_t))MEMORY[0x24BE98DD0]);
    v10 = OUTLINED_FUNCTION_56_9();
    v0[3] = sub_2465C8EE0(v10, v11, v25);
    OUTLINED_FUNCTION_53_11();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_30_14(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    OUTLINED_FUNCTION_6_3(&dword_24652E000, v5, (os_log_type_t)v1, "UnsetRelationshipFlowStrategy.parseUnsetRelationshipPersonFromResponse(input: %s)", v9);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_30_14(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));

  sub_2465D2344(v0[5], v12, v13, v14, v15, v16, v17, v18, v21, v22, v23, v24, (uint64_t)(v0 + 3), v25[0], v25[1], v25[2], v25[3], v25[4], v25[5],
    v25[6]);
  swift_task_dealloc();
  v19 = (uint64_t (*)(void))OUTLINED_FUNCTION_19_11();
  return v19();
}

uint64_t sub_2465CD328(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_60_9(a1, a2);
  v3 = OUTLINED_FUNCTION_0_0();
  v4 = OUTLINED_FUNCTION_85_6(v3);
  v2[11] = v4;
  v2[12] = *(_QWORD *)(v4 - 8);
  v2[13] = OUTLINED_FUNCTION_0_0();
  v5 = OUTLINED_FUNCTION_41();
  v2[14] = v5;
  v2[15] = *(_QWORD *)(v5 - 8);
  v2[16] = OUTLINED_FUNCTION_0_0();
  v2[17] = sub_2465DAF08();
  v2[18] = OUTLINED_FUNCTION_0_0();
  v6 = OUTLINED_FUNCTION_16_5();
  v2[19] = v6;
  v2[20] = *(_QWORD *)(v6 - 8);
  v2[21] = OUTLINED_FUNCTION_0_0();
  v7 = OUTLINED_FUNCTION_23_2();
  v2[22] = v7;
  v2[23] = *(_QWORD *)(v7 - 8);
  v2[24] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465CD3D4()
{
  _QWORD *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;

  v0[25] = __swift_instantiateConcreteTypeFromMangledName(&qword_257591A10);
  v1 = sub_2465DB790();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v0[23];
    v4 = v0[20];
    v18 = MEMORY[0x24BEE4AF8];
    sub_2465AD210(0, v2, 0);
    OUTLINED_FUNCTION_56_1();
    v6 = v1 + v5;
    v17 = *(_QWORD *)(v4 + 72);
    v7 = v4;
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v9 = v18;
    do
    {
      v10 = v0[21];
      v11 = v0[19];
      v8(v10, v6, v11);
      sub_2465DC2A0();
      OUTLINED_FUNCTION_26_22();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v10, v11);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2465AD210(0, *(_QWORD *)(v9 + 16) + 1, 1);
        v9 = v18;
      }
      v13 = *(_QWORD *)(v9 + 16);
      v12 = *(_QWORD *)(v9 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_2465AD210(v12 > 1, v13 + 1, 1);
        v9 = v18;
      }
      *(_QWORD *)(v9 + 16) = v13 + 1;
      OUTLINED_FUNCTION_56_1();
      (*(void (**)(unint64_t))(v3 + 32))(v9 + v14 + *(_QWORD *)(v3 + 72) * v13);
      v18 = v9;
      v6 += v17;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_2();
    v9 = MEMORY[0x24BEE4AF8];
  }
  v0[26] = v9;
  v15 = (_QWORD *)swift_task_alloc();
  v0[27] = v15;
  *v15 = v0;
  v15[1] = sub_2465CD5A8;
  return sub_24653B360(v9);
}

uint64_t sub_2465CD5A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 224) = a1;
  *(_QWORD *)(v3 + 232) = v1;
  OUTLINED_FUNCTION_76_5();
  OUTLINED_FUNCTION_8_1();
  if (v1)
  {
    swift_task_dealloc();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_37();
    return OUTLINED_FUNCTION_20_22(*(uint64_t (**)(void))(v3 + 8));
  }
  else
  {
    OUTLINED_FUNCTION_62();
    return OUTLINED_FUNCTION_5_8();
  }
}

uint64_t sub_2465CD658()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;

  sub_2465DB790();
  if (qword_25758C6E0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(uint64_t **)(v0 + 144);
  swift_bridgeObjectRetain();
  *v2 = sub_2465DAF68();
  v2[1] = v3;
  v2[2] = v4;
  OUTLINED_FUNCTION_14_3();
  swift_storeEnumTagMultiPayload();
  sub_2465DB790();
  sub_2465D29E8();
  if (v1)
  {
    v5 = *(void **)(v0 + 224);
    sub_2465B2E34(*(_QWORD *)(v0 + 144));
    OUTLINED_FUNCTION_35_13();

    swift_task_dealloc();
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_37();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v7 = *(void **)(v0 + 224);
    v9 = *(_QWORD *)(v0 + 136);
    v8 = *(_QWORD *)(v0 + 144);
    v10 = *(_QWORD *)(v0 + 128);
    v11 = *(_QWORD *)(v0 + 104);
    v13 = *(_QWORD **)(v0 + 72);
    v12 = *(_QWORD *)(v0 + 80);
    OUTLINED_FUNCTION_35_13();
    sub_2465DB4FC();
    *(_QWORD *)(OUTLINED_FUNCTION_87_6() + 16) = v10;
    sub_24656C1C0(v12, (void (*)(uint64_t))sub_2465D0C0C, v11);
    OUTLINED_FUNCTION_39();
    __swift_project_boxed_opaque_existential_1(v13, v13[3]);
    *(_QWORD *)(v0 + 40) = v9;
    sub_246558BDC(&qword_25758CD40, (void (*)(uint64_t))MEMORY[0x24BE999E8]);
    *(_QWORD *)(v0 + 48) = v14;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 16));
    sub_2465B2DF0(v8, (uint64_t)boxed_opaque_existential_1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB58);
    v16 = OUTLINED_FUNCTION_22();
    *(_OWORD *)(v16 + 16) = xmmword_2465DD940;
    *(_QWORD *)(v16 + 32) = v7;
    v19 = v16;
    sub_2465DCF6C();
    *(_QWORD *)(v0 + 240) = v19;
    v17 = v7;
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 248) = v18;
    *v18 = v0;
    v18[1] = sub_2465CD8D8;
    return sub_2465DB6DC();
  }
}

uint64_t sub_2465CD8D8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_50_2();
  v1 = v0 + 16;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_1();
  __swift_destroy_boxed_opaque_existential_1(v1);
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_5_8();
}

uint64_t sub_2465CD920()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t (*v7)(void);

  OUTLINED_FUNCTION_19();
  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 96);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  sub_2465B2E34(v1);
  v5 = OUTLINED_FUNCTION_14_3();
  v6(v5);
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_37();
  swift_task_dealloc();
  v7 = (uint64_t (*)(void))OUTLINED_FUNCTION_19_11();
  return OUTLINED_FUNCTION_7_29(v7);
}

uint64_t sub_2465CD9BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB50);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2465DB814();
  sub_2465DB820();
  v6 = sub_2465DB640();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v5, a2, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
  return sub_2465DB7FC();
}

uint64_t sub_2465CDA70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[2] = a3;
  v4 = OUTLINED_FUNCTION_16_5();
  v3[3] = v4;
  v3[4] = *(_QWORD *)(v4 - 8);
  v3[5] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

size_t sub_2465CDAB4()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  size_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_62_5();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_2465DD200();
    OUTLINED_FUNCTION_35_13();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
  {
LABEL_12:
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
  }
  v12 = MEMORY[0x24BEE4AF8];
  result = sub_2465AD1B8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = *(_QWORD *)(v0 + 32);
    v3 = v12;
    v7 = *(_QWORD *)(v0 + 16) + 32;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x24955FFFC](v5, *(_QWORD *)(v0 + 16));
      else
        v8 = *(id *)(v7 + 8 * v5);
      sub_2465392D8();
      v10 = *(_QWORD *)(v12 + 16);
      v9 = *(_QWORD *)(v12 + 24);
      if (v10 >= v9 >> 1)
        sub_2465AD1B8(v9 > 1, v10 + 1, 1);
      ++v5;
      *(_QWORD *)(v12 + 16) = v10 + 1;
      OUTLINED_FUNCTION_56_1();
      (*(void (**)(unint64_t))(v6 + 32))(v12 + v11 + *(_QWORD *)(v6 + 72) * v10);
    }
    while (v2 != v5);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

void sub_2465CDC10()
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
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t *, uint64_t);
  char v33;
  char v34;
  uint64_t v35;
  void *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t inited;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t, uint64_t);
  int v44;
  void *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[3];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint8_t *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66[5];

  OUTLINED_FUNCTION_14_0();
  v1 = v0;
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CF28);
  v60 = *(_QWORD *)(v4 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_5_3();
  v57 = v6;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v7);
  v65 = (char *)v56 - v8;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v9);
  v59 = (uint64_t)v56 - v10;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (_QWORD *)((char *)v56 - v12);
  v14 = OUTLINED_FUNCTION_74_0();
  v62 = *(_QWORD *)(v14 - 8);
  v63 = (uint8_t *)v14;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1_4();
  v16 = OUTLINED_FUNCTION_48_9();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_1_4();
  v20 = v19 - v18;
  if (qword_25758C700 != -1)
    swift_once();
  v21 = OUTLINED_FUNCTION_5_9();
  v22 = __swift_project_value_buffer(v21, (uint64_t)qword_257591790);
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v64 = v1;
  v23(v20, v1, v16);
  v61 = v22;
  v24 = sub_2465DCDEC();
  v25 = sub_2465DD02C();
  if (OUTLINED_FUNCTION_89_7(v24))
  {
    v26 = OUTLINED_FUNCTION_3_3();
    v56[2] = v3;
    v27 = (uint8_t *)v26;
    v28 = OUTLINED_FUNCTION_3_3();
    v56[1] = v4;
    v66[0] = v28;
    v58 = v13;
    *(_DWORD *)v27 = 136315138;
    v56[0] = v27 + 4;
    sub_246558BDC(&qword_25758CF38, (void (*)(uint64_t))MEMORY[0x24BE98DD0]);
    v29 = OUTLINED_FUNCTION_74_3();
    v31 = sub_2465C8EE0(v29, v30, v66);
    OUTLINED_FUNCTION_95_3(v31);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_52_1(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
    OUTLINED_FUNCTION_6_3(&dword_24652E000, v24, v25, "UnsetRelationshipFlowStrategy.actionForPromptForContactDisambiguationInput(_: %s)", v27);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_52_1(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));

  v32 = (void (*)(uint64_t *, uint64_t))v64;
  sub_2465DB898();
  sub_246571904();
  v34 = v33;
  OUTLINED_FUNCTION_80_5(*(uint64_t (**)(uint64_t))(v62 + 8));
  v35 = (uint64_t)v65;
  if ((v34 & 1) != 0)
  {
    v36 = (void *)OUTLINED_FUNCTION_90_4();
    v37 = sub_2465DD02C();
    if (OUTLINED_FUNCTION_2_11(v37))
    {
      *(_WORD *)OUTLINED_FUNCTION_3_3() = 0;
      OUTLINED_FUNCTION_3_10(&dword_24652E000, v38, v39, "UnsetRelationshipFlow.actionForPromptForContactDisambiguationInput: received user cancellation, returning .cancel");
      OUTLINED_FUNCTION_1();
    }

    sub_2465DB5B0();
  }
  else
  {
    type metadata accessor for ContactPromptResponseHandler();
    inited = swift_initStackObject();
    *(_QWORD *)(inited + 16) = sub_2465CE13C;
    *(_QWORD *)(inited + 24) = 0;
    sub_246539E90((uint64_t)v32, v13);
    v42 = v59;
    v41 = v60;
    v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 16);
    OUTLINED_FUNCTION_82_3(v59);
    v44 = (*(uint64_t (**)(uint64_t, uint64_t))(v41 + 88))(v42, v4);
    if (v44 == *MEMORY[0x24BE979F8])
    {
      (*(void (**)(uint64_t, uint64_t))(v41 + 96))(v42, v4);
      sub_24654313C(*(_QWORD *)v42, *(_QWORD *)(v42 + 8), *(_BYTE *)(v42 + 16));
      sub_2465DB5BC();
      OUTLINED_FUNCTION_5_21();
      (*(void (**)(uint64_t *, uint64_t))(v41 + 8))(v13, v4);
    }
    else if (v44 == *MEMORY[0x24BE979F0])
    {
      v45 = (void *)OUTLINED_FUNCTION_90_4();
      v46 = sub_2465DD02C();
      if (OUTLINED_FUNCTION_2_11(v46))
      {
        *(_WORD *)OUTLINED_FUNCTION_3_3() = 0;
        OUTLINED_FUNCTION_3_10(&dword_24652E000, v47, v48, "UnsetRelationshipFlow.actionForPromptForContactDisambiguationInput: input contained no actionable selection information, returning .ignore");
        OUTLINED_FUNCTION_1();
      }

      sub_2465DB5C8();
      OUTLINED_FUNCTION_5_21();
      (*(void (**)(uint64_t *, uint64_t))(v60 + 8))(v13, v4);
    }
    else
    {
      v58 = v13;
      OUTLINED_FUNCTION_82_3(v35);
      v49 = OUTLINED_FUNCTION_90_4();
      v50 = sub_2465DD038();
      if (OUTLINED_FUNCTION_36_9(v49))
      {
        v51 = (uint8_t *)OUTLINED_FUNCTION_3_3();
        v64 = OUTLINED_FUNCTION_3_3();
        v66[0] = v64;
        *(_DWORD *)v51 = 136315138;
        v63 = v51 + 4;
        v43(v57, v35, v4);
        v52 = sub_2465DCE88();
        v54 = sub_2465C8EE0(v52, v53, v66);
        OUTLINED_FUNCTION_95_3(v54);
        sub_2465DD0A4();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_41_11();
        OUTLINED_FUNCTION_6_3(&dword_24652E000, v49, v50, "UnsetRelationshipFlow.actionForPromptForContactDisambiguationInput: Unknown Interpretable case: %s. Returning .ignore", v51);
        OUTLINED_FUNCTION_14_1();
        OUTLINED_FUNCTION_1();
      }
      OUTLINED_FUNCTION_41_11();

      v55 = v59;
      sub_2465DB5C8();
      OUTLINED_FUNCTION_5_21();
      v32(v58, v4);
      v32((uint64_t *)v55, v4);
    }
  }
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465CE140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[12] = a2;
  v3[13] = a3;
  v3[11] = a1;
  v4 = OUTLINED_FUNCTION_16_5();
  v3[14] = v4;
  v3[15] = *(_QWORD *)(v4 - 8);
  v3[16] = OUTLINED_FUNCTION_5();
  v3[17] = OUTLINED_FUNCTION_16();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758FF18);
  v3[18] = OUTLINED_FUNCTION_5();
  v3[19] = OUTLINED_FUNCTION_16();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CF28);
  v3[20] = v5;
  v3[21] = *(_QWORD *)(v5 - 8);
  v3[22] = OUTLINED_FUNCTION_0_0();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591A10);
  v3[23] = v6;
  v3[24] = *(_QWORD *)(v6 - 8);
  v3[25] = OUTLINED_FUNCTION_5();
  v3[26] = OUTLINED_FUNCTION_16();
  v7 = OUTLINED_FUNCTION_48_9();
  v3[27] = v7;
  v3[28] = *(_QWORD *)(v7 - 8);
  v3[29] = OUTLINED_FUNCTION_5();
  v3[30] = OUTLINED_FUNCTION_16();
  v3[31] = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465CE220()
{
  _QWORD *v0;
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
  void (*v11)(uint64_t, uint64_t, uint64_t);
  NSObject *v12;
  int v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
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
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t inited;
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
  NSObject *v56;
  os_log_type_t v57;
  _BOOL8 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint8_t *v66;
  uint64_t v67;
  unint64_t v68;
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
  uint64_t v90;
  NSObject *v91;
  os_log_type_t v92;
  _BOOL8 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint8_t *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t (*v124)(void);
  _BYTE *v125;
  uint64_t v126;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
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
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  os_log_type_t type;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t (*v169)(uint64_t, uint64_t, uint64_t);
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t (*v173)(uint64_t, uint64_t);

  if (qword_25758C700 != -1)
    swift_once();
  v166 = (uint64_t)(v0 + 7);
  v1 = v0[31];
  v2 = v0[27];
  v3 = v0[28];
  v4 = v0[26];
  v5 = v0[23];
  v6 = v0[24];
  v8 = v0[12];
  v7 = v0[13];
  v9 = OUTLINED_FUNCTION_5_9();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_257591790);
  v169 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v169(v1, v8, v2);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v11(v4, v7, v5);
  v172 = v10;
  v12 = sub_2465DCDEC();
  v13 = sub_2465DD02C();
  v14 = OUTLINED_FUNCTION_89_7(v12);
  v15 = v0[26];
  if (v14)
  {
    v156 = v0[24];
    v129 = v0[25];
    v136 = v0[23];
    v16 = OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v16 = 136315394;
    HIDWORD(v148) = v13;
    sub_246558BDC(&qword_25758CF38, (void (*)(uint64_t))MEMORY[0x24BE98DD0]);
    v17 = sub_2465DD260();
    v0[9] = OUTLINED_FUNCTION_68_6(v17, v18, v19, v20, v21, v22, v23, v24, v129, v136, v15, v148, v156);
    sub_2465DD0A4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_47_11();
    *(_WORD *)(v16 + 12) = 2080;
    v25 = v143;
    v11(v130, v143, v137);
    v26 = v137;
    v27 = sub_2465DCE88();
    v0[10] = OUTLINED_FUNCTION_68_6(v27, v28, v29, v30, v31, v32, v33, v34, v130, v137, v143, v149, v157);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_2();
    (*(void (**)(uint64_t, uint64_t))(v158 + 8))(v25, v26);
    _os_log_impl(&dword_24652E000, v12, type, "UnsetRelationshipFlowStrategy.parseContactDisambiguationResult(input: %s, paginatedItems: %s)", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }
  v35 = v0[23];
  v36 = v0[24];
  OUTLINED_FUNCTION_47_11();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v15, v35);

  v38 = v0[21];
  v37 = (uint64_t *)v0[22];
  v39 = v0[20];
  v40 = v0[12];
  type metadata accessor for ContactPromptResponseHandler();
  inited = swift_initStackObject();
  *(_QWORD *)(inited + 16) = sub_2465CE13C;
  *(_QWORD *)(inited + 24) = 0;
  sub_246539E90(v40, v37);
  if ((*(unsigned int (**)(uint64_t *, uint64_t))(v38 + 88))(v37, v39) != *MEMORY[0x24BE979F8])
  {
    v83 = (*(uint64_t (**)(_QWORD, _QWORD))(v0[21] + 8))(v0[22], v0[20]);
    OUTLINED_FUNCTION_52_11(v83, v84, v85, v86, v87, v88, v89, v90, v128, v135, v142, v148, v155, v163, v166, v169);
    v91 = sub_2465DCDEC();
    v92 = sub_2465DD038();
    v93 = os_log_type_enabled(v91, v92);
    if (v93)
    {
      v101 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_3_3();
      *(_DWORD *)v101 = 136315138;
      sub_246558BDC(&qword_25758CF38, (void (*)(uint64_t))MEMORY[0x24BE98DD0]);
      v102 = OUTLINED_FUNCTION_74_3();
      v0[6] = OUTLINED_FUNCTION_68_6(v102, v103, v104, v105, v106, v107, v108, v109, v133, v140, v146, v152, v161);
      OUTLINED_FUNCTION_53_11();
      v110 = OUTLINED_FUNCTION_35_13();
      OUTLINED_FUNCTION_19_22(v110, v111, v112, v113, v114, v115, v116, v117, v134, v141, v147, v153, v162, v165, v168, v171, (uint64_t)(v101 + 4), v173);
      OUTLINED_FUNCTION_6_3(&dword_24652E000, v91, v92, "UnsetRelationshipFlow.parseContactDisambiguationResult called with un-interpretable input. actionForPrompt function should ensure this never happens. Input: %s", v101);
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_19_22(v93, v94, v95, v96, v97, v98, v99, v100, v133, v140, v146, v152, v161, v165, v168, v171, v10, v173);

    sub_2465D0C14();
    OUTLINED_FUNCTION_5_25();
    *v125 = 0;
    swift_willThrow();
    swift_release();
    goto LABEL_14;
  }
  v42 = v0[22];
  v44 = v0[18];
  v43 = v0[19];
  v45 = v0[14];
  OUTLINED_FUNCTION_80_5(*(uint64_t (**)(uint64_t))(v0[21] + 96));
  v46 = *(_QWORD *)v42;
  v47 = *(_QWORD *)(v42 + 8);
  LOBYTE(v42) = *(_BYTE *)(v42 + 16);
  sub_2465DB790();
  sub_2465CEA74();
  sub_24654313C(v46, v47, v42);
  OUTLINED_FUNCTION_27();
  sub_246545BA8(v43, v44, &qword_25758FF18);
  if (__swift_getEnumTagSinglePayload(v44, 1, v45) == 1)
  {
    sub_2465D0C8C(v0[18], &qword_25758FF18);
    OUTLINED_FUNCTION_52_11(v48, v49, v50, v51, v52, v53, v54, v55, v128, v135, v142, v148, v155, v163, v166, v169);
    v56 = sub_2465DCDEC();
    v57 = sub_2465DD038();
    v58 = OUTLINED_FUNCTION_14_9(v57);
    if (v58)
    {
      v66 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      OUTLINED_FUNCTION_3_3();
      *(_DWORD *)v66 = 136315138;
      sub_246558BDC(&qword_25758CF38, (void (*)(uint64_t))MEMORY[0x24BE98DD0]);
      v67 = OUTLINED_FUNCTION_74_3();
      v0[7] = OUTLINED_FUNCTION_68_6(v67, v68, v69, v70, v71, v72, v73, v74, v131, v138, v144, v150, v159);
      sub_2465DD0A4();
      v75 = swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_19_22(v75, v76, v77, v78, v79, v80, v81, v82, v132, v139, v145, v151, v160, v164, v167, v170, (uint64_t)(v66 + 4), v173);
      OUTLINED_FUNCTION_6_3(&dword_24652E000, v56, (os_log_type_t)v44, "UnsetRelationshipFlow.parseContactDisambiguationResult called with input that could not be resolved as a selection. Cancelling flow as a result. Input: %s", v66);
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_19_22(v58, v59, v60, v61, v62, v63, v64, v65, v131, v138, v144, v150, v159, v164, v167, v170, v172, v173);

    v126 = v0[19];
    sub_2465DB76C();
    sub_246558BDC(&qword_25758FFE8, (void (*)(uint64_t))MEMORY[0x24BE985D0]);
    OUTLINED_FUNCTION_5_25();
    sub_2465DB760();
    swift_willThrow();
    swift_release();
    sub_2465D0C8C(v126, &qword_25758FF18);
LABEL_14:
    swift_task_dealloc();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_37();
    OUTLINED_FUNCTION_49();
    swift_task_dealloc();
    swift_task_dealloc();
    OUTLINED_FUNCTION_48();
    v124 = (uint64_t (*)(void))v0[1];
    return v124();
  }
  v118 = v0[19];
  v119 = v0[16];
  v120 = v0[17];
  v122 = v0[14];
  v121 = v0[15];
  OUTLINED_FUNCTION_38_4(v120, v0[18], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v121 + 32));
  sub_2465D0C50();
  OUTLINED_FUNCTION_38_4(v119, v120, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v121 + 16));
  v123 = (void *)sub_246536CB4();
  v0[8] = v123;
  sub_2465DB748();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v120, v122);
  sub_2465D0C8C(v118, &qword_25758FF18);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_36();
  v124 = (uint64_t (*)(void))OUTLINED_FUNCTION_19_11();
  return v124();
}

uint64_t sub_2465CE9A4()
{
  uint64_t v0;
  _QWORD v2[4];

  sub_2465DBD30();
  if (!v2[3])
  {
    sub_2465D0C8C((uint64_t)v2, &qword_25758CF30);
    return 0;
  }
  sub_2465DBDA8();
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  swift_retain();
  sub_2465DBBD4();
  OUTLINED_FUNCTION_3();
  if (!v2[0])
  {
    OUTLINED_FUNCTION_3();
    return 0;
  }
  v0 = sub_2465DBCE8();
  swift_release();
  OUTLINED_FUNCTION_3();
  return v0;
}

void sub_2465CEA74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
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
  void (*v20)(NSObject *, uint64_t, uint64_t);
  uint64_t v21;
  char v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53[2];
  char v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;

  OUTLINED_FUNCTION_14_0();
  v56 = v1;
  v57 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = OUTLINED_FUNCTION_16_5();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_8_24();
  v52 = v15;
  if (v4 == 4)
  {
    v24 = v8 - 1;
    if (v8 < 1)
    {
      v25 = *(_QWORD *)(v10 + 16);
      v24 = v25 + v8;
      if ((uint64_t)(v25 + v8) < 0)
      {
LABEL_30:
        if (qword_25758C700 != -1)
          swift_once();
        v41 = OUTLINED_FUNCTION_5_9();
        v42 = __swift_project_value_buffer(v41, (uint64_t)qword_257591790);
        swift_bridgeObjectRetain_n();
        sub_2465DCDEC();
        v43 = OUTLINED_FUNCTION_93();
        if (OUTLINED_FUNCTION_31_19(v42))
        {
          v44 = OUTLINED_FUNCTION_3_3();
          v53[0] = OUTLINED_FUNCTION_3_3();
          *(_DWORD *)v44 = 134218242;
          v55 = v24;
          sub_2465DD0A4();
          *(_WORD *)(v44 + 12) = 2080;
          v45 = swift_bridgeObjectRetain();
          v46 = MEMORY[0x24955FDE0](v45, v52);
          v48 = v47;
          OUTLINED_FUNCTION_8_1();
          v55 = sub_2465C8EE0(v46, v48, v53);
          sub_2465DD0A4();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_24652E000, v42, v43, "#ResolveRecipientsFlow.DisambiguationResponse: .itemIndex(%ld) outside of range of choices %s", (uint8_t *)v44, 0x16u);
          OUTLINED_FUNCTION_14_1();
          OUTLINED_FUNCTION_1();
        }

        swift_bridgeObjectRelease_n();
        goto LABEL_34;
      }
    }
    else
    {
      v25 = *(_QWORD *)(v10 + 16);
    }
    if (v24 < v25)
    {
      OUTLINED_FUNCTION_56_1();
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 16))(v12, v10 + v40 + *(_QWORD *)(v14 + 72) * v24, v13);
      __swift_storeEnumTagSinglePayload(v12, 0, 1, v13);
      return;
    }
    goto LABEL_30;
  }
  if (v4 != 1)
  {
    if (v4)
    {
      if (qword_25758C700 != -1)
        swift_once();
      v33 = OUTLINED_FUNCTION_5_9();
      v34 = __swift_project_value_buffer(v33, (uint64_t)qword_257591790);
      OUTLINED_FUNCTION_29_12();
      OUTLINED_FUNCTION_29_12();
      sub_2465DCDEC();
      v35 = OUTLINED_FUNCTION_93();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)OUTLINED_FUNCTION_3_3();
        v37 = OUTLINED_FUNCTION_3_3();
        *(_DWORD *)v36 = 136315138;
        v55 = v37;
        v53[1] = v6;
        v54 = v4;
        OUTLINED_FUNCTION_29_12();
        v38 = sub_2465DCE88();
        v53[0] = sub_2465C8EE0(v38, v39, (uint64_t *)&v55);
        OUTLINED_FUNCTION_53_11();
        OUTLINED_FUNCTION_8_1();
        OUTLINED_FUNCTION_34_15();
        OUTLINED_FUNCTION_6_3(&dword_24652E000, v34, v35, "#ResolveRecipientsFlow.DisambiguationResponse: Unable to resolve contact from value %s", v36);
        OUTLINED_FUNCTION_14_1();
        OUTLINED_FUNCTION_1();
      }
      OUTLINED_FUNCTION_34_15();

    }
    else
    {
      v16 = *(_QWORD *)(v10 + 16);
      if (v16)
      {
        v51 = v12;
        OUTLINED_FUNCTION_56_1();
        v18 = v10 + v17;
        v19 = *(_QWORD *)(v14 + 72);
        v20 = *(void (**)(NSObject *, uint64_t, uint64_t))(v14 + 16);
        swift_bridgeObjectRetain();
        while (1)
        {
          v20(v0, v18, v13);
          if (sub_2465DC30C() == v8 && v21 == v6)
          {
            swift_bridgeObjectRelease();
            goto LABEL_39;
          }
          v23 = sub_2465DD278();
          swift_bridgeObjectRelease();
          if ((v23 & 1) != 0)
            break;
          v13 = v52;
          (*(void (**)(NSObject *, uint64_t))(v14 + 8))(v0, v52);
          v18 += v19;
          if (!--v16)
          {
            swift_bridgeObjectRelease();
            v12 = v51;
            goto LABEL_34;
          }
        }
        v13 = v52;
LABEL_39:
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, NSObject *, uint64_t))(v14 + 32))(v51, v0, v13);
        v49 = v51;
        v50 = 0;
        goto LABEL_35;
      }
    }
LABEL_34:
    v49 = v12;
    v50 = 1;
LABEL_35:
    __swift_storeEnumTagSinglePayload(v49, v50, 1, v13);
    OUTLINED_FUNCTION_4_3();
    return;
  }
  swift_bridgeObjectRetain();
  v26 = OUTLINED_FUNCTION_14_3();
  sub_246543114(v26, v27, 1u);
  v28 = sub_246599388(v10, v8, v6);
  if (*(_QWORD *)(v28 + 16) > 1uLL)
  {
    v29 = v12;
    if (qword_25758C700 != -1)
      swift_once();
    v30 = OUTLINED_FUNCTION_5_9();
    __swift_project_value_buffer(v30, (uint64_t)qword_257591790);
    OUTLINED_FUNCTION_9_9();
    v31 = OUTLINED_FUNCTION_93();
    if (os_log_type_enabled(v0, v31))
    {
      v32 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      *(_WORD *)v32 = 0;
      OUTLINED_FUNCTION_9_7(&dword_24652E000, v0, v31, "#ResolveRecipientsFlow.DisambiguationResponse: display name matched multiple contacts. Using first.", v32);
      OUTLINED_FUNCTION_1();
    }

    v12 = v29;
  }
  sub_2465B5F10(v28, v12);
  swift_bridgeObjectRelease();
}

uint64_t sub_2465CF004(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  sub_2465DB520();
  v4[11] = OUTLINED_FUNCTION_0_0();
  v5 = sub_2465DB838();
  v4[12] = v5;
  v4[13] = *(_QWORD *)(v5 - 8);
  v4[14] = OUTLINED_FUNCTION_0_0();
  v6 = OUTLINED_FUNCTION_41();
  v4[15] = v6;
  v4[16] = *(_QWORD *)(v6 - 8);
  v4[17] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD08);
  v4[18] = OUTLINED_FUNCTION_5();
  v4[19] = OUTLINED_FUNCTION_16();
  v7 = OUTLINED_FUNCTION_16_5();
  v4[20] = v7;
  v4[21] = *(_QWORD *)(v7 - 8);
  v4[22] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465CF0B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  OUTLINED_FUNCTION_19();
  v2 = *(_QWORD *)(v0 + 168);
  v1 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 144);
  v6 = *(id *)(v0 + 64);
  sub_2465392D8();
  sub_2465DC2A0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_24653909C();
  OUTLINED_FUNCTION_26_22();
  OUTLINED_FUNCTION_23_2();
  OUTLINED_FUNCTION_55_11(v4);
  OUTLINED_FUNCTION_26_22();
  OUTLINED_FUNCTION_55_11(v5);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 184) = v7;
  *v7 = v0;
  v7[1] = sub_2465CF190;
  return sub_24653B0F8(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 144));
}

uint64_t sub_2465CF190(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *v2;
  v5 = *(_QWORD *)(*v2 + 144);
  v4 = *(_QWORD *)(*v2 + 152);
  *(_QWORD *)(v3 + 192) = a1;
  *(_QWORD *)(v3 + 200) = v1;
  OUTLINED_FUNCTION_76_5();
  sub_2465D0C8C(v5, &qword_25758CD08);
  sub_2465D0C8C(v4, &qword_25758CD08);
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_5_8();
}

#error "2465CF240: call analysis failed (funcsize=76)"

uint64_t sub_2465CF35C()
{
  OUTLINED_FUNCTION_50_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_25_21();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_5_8();
}

uint64_t sub_2465CF3AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_19();
  v1 = *(_QWORD *)(v0 + 128);

  OUTLINED_FUNCTION_52_1(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_49();
  swift_task_dealloc();
  v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_19_11();
  return OUTLINED_FUNCTION_7_29(v2);
}

uint64_t sub_2465CF42C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_67_7();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_37();
  return OUTLINED_FUNCTION_20_22(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2465CF484(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB50);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_1_4();
  v6 = v5 - v4;
  sub_2465DB814();
  v7 = OUTLINED_FUNCTION_41();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v6, a2, v7);
  __swift_storeEnumTagSinglePayload(v6, 0, 1, v7);
  return sub_2465DB7FC();
}

void sub_2465CF520()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  _QWORD v34[4];
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  OUTLINED_FUNCTION_14_0();
  v2 = v1;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758ED68);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_12_1();
  v6 = OUTLINED_FUNCTION_74_0();
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_5_3();
  v35 = v8;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v34 - v10;
  v12 = OUTLINED_FUNCTION_48_9();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_1_4();
  v16 = v15 - v14;
  if (qword_25758C700 != -1)
    swift_once();
  v17 = OUTLINED_FUNCTION_5_9();
  __swift_project_value_buffer(v17, (uint64_t)qword_257591790);
  v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v38 = v2;
  OUTLINED_FUNCTION_38_4(v16, v2, v18);
  v19 = sub_2465DCDEC();
  v20 = sub_2465DD02C();
  if (OUTLINED_FUNCTION_36_9(v19))
  {
    v21 = OUTLINED_FUNCTION_3_3();
    v34[2] = v0;
    v22 = (uint8_t *)v21;
    v23 = OUTLINED_FUNCTION_3_3();
    v34[3] = v4;
    v39 = v23;
    *(_DWORD *)v22 = 136315138;
    v34[1] = v22 + 4;
    sub_246558BDC(&qword_25758CF38, (void (*)(uint64_t))MEMORY[0x24BE98DD0]);
    v24 = OUTLINED_FUNCTION_56_9();
    v26 = sub_2465C8EE0(v24, v25, &v39);
    OUTLINED_FUNCTION_10_7(v26);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_30_14(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    OUTLINED_FUNCTION_6_3(&dword_24652E000, v19, v20, "UnsetRelationshipFlowStrategy.actionForPromptToSaveRelationship(input: %s)", v22);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_30_14(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));

  sub_2465DB898();
  sub_246571904();
  v28 = v27;
  v29 = *(void (**)(char *, uint64_t))(v36 + 8);
  v30 = v11;
  v31 = v37;
  v29(v30, v37);
  if ((v28 & 1) != 0)
  {
    sub_2465DB5B0();
  }
  else
  {
    v32 = v35;
    sub_2465DB898();
    sub_246571330();
    v29(v32, v31);
    v33 = sub_2465DB718();
    LODWORD(v32) = __swift_getEnumTagSinglePayload(v0, 1, v33);
    sub_2465D0C8C(v0, &qword_25758ED68);
    if ((_DWORD)v32 == 1)
      sub_2465DB5C8();
    else
      sub_2465DB5BC();
  }
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465CF7DC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[4] = a1;
  v2[5] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758ED68);
  v2[6] = OUTLINED_FUNCTION_0_0();
  v3 = OUTLINED_FUNCTION_74_0();
  v2[7] = v3;
  v2[8] = *(_QWORD *)(v3 - 8);
  v2[9] = OUTLINED_FUNCTION_0_0();
  v4 = OUTLINED_FUNCTION_48_9();
  v2[10] = v4;
  v2[11] = *(_QWORD *)(v4 - 8);
  v2[12] = OUTLINED_FUNCTION_5();
  v2[13] = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465CF858()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(void);
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  uint64_t v43;

  if (qword_25758C700 != -1)
    swift_once();
  v1 = v0[13];
  v3 = v0[10];
  v2 = v0[11];
  v4 = v0[5];
  v5 = OUTLINED_FUNCTION_5_9();
  __swift_project_value_buffer(v5, (uint64_t)qword_257591790);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v6(v1, v4, v3);
  v7 = sub_2465DCDEC();
  v8 = sub_2465DD02C();
  if (OUTLINED_FUNCTION_31_19(v7))
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_3_3();
    v43 = OUTLINED_FUNCTION_3_3();
    *(_DWORD *)v9 = 136315138;
    sub_246558BDC(&qword_25758CF38, (void (*)(uint64_t))MEMORY[0x24BE98DD0]);
    v10 = OUTLINED_FUNCTION_78_4();
    v0[3] = sub_2465C8EE0(v10, v11, &v43);
    sub_2465DD0A4();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_37_14();
    OUTLINED_FUNCTION_6_3(&dword_24652E000, v7, v8, "UnsetRelationshipFlowStrategy.parsePromptToSaveRelationshipResponse(input: %s)", v9);
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_37_14();

  v12 = v0[6];
  sub_2465DB898();
  sub_246571330();
  OUTLINED_FUNCTION_25_21();
  v13 = sub_2465DB718();
  if (__swift_getEnumTagSinglePayload(v12, 1, v13) == 1)
  {
    v14 = v0[12];
    v15 = v0[10];
    v16 = v0[5];
    sub_2465D0C8C(v0[6], &qword_25758ED68);
    v6(v14, v16, v15);
    v17 = sub_2465DCDEC();
    v18 = sub_2465DD02C();
    v19 = OUTLINED_FUNCTION_14_9(v18);
    if (v19)
    {
      v27 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      v43 = OUTLINED_FUNCTION_3_3();
      *(_DWORD *)v27 = 136315138;
      sub_246558BDC(&qword_25758CF38, (void (*)(uint64_t))MEMORY[0x24BE98DD0]);
      v28 = OUTLINED_FUNCTION_78_4();
      v0[2] = sub_2465C8EE0(v28, v29, &v43);
      OUTLINED_FUNCTION_53_11();
      v30 = OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_70_5(v30, v31, v32, v33, v34, v35, v36, v37, (uint64_t)(v27 + 4), (uint64_t)(v0 + 2), v42);
      OUTLINED_FUNCTION_6_3(&dword_24652E000, v17, (os_log_type_t)v12, "UnsetRelationshipFlowStrategy.parsePromptToSaveRelationshipResponse: input does not contain confirmationResponse: %s", v27);
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_70_5(v19, v20, v21, v22, v23, v24, v25, v26, v40, v41, v42);

    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v0[4], *MEMORY[0x24BE983F8], v13);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v0[4], v0[6], v13);
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  v38 = (uint64_t (*)(void))OUTLINED_FUNCTION_19_11();
  return v38();
}

uint64_t sub_2465CFBD0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  OUTLINED_FUNCTION_62();
  return swift_task_switch();
}

uint64_t sub_2465CFBEC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  v1 = *(uint64_t **)(v0 + 16);
  v2 = sub_2465DBA00();
  v3 = MEMORY[0x24BE99088];
  v1[3] = v2;
  v1[4] = v3;
  __swift_allocate_boxed_opaque_existential_1(v1);
  sub_2465DB9E8();
  v4 = (uint64_t (*)(void))OUTLINED_FUNCTION_19_11();
  return v4();
}

BOOL sub_2465CFC58(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2465CFC68()
{
  return sub_2465DD2E4();
}

uint64_t sub_2465CFC8C()
{
  sub_2465DD2D8();
  sub_2465DD2E4();
  return sub_2465DD2FC();
}

BOOL sub_2465CFCD0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2465CFC58(*a1, *a2);
}

uint64_t sub_2465CFCDC()
{
  return sub_2465CFC8C();
}

uint64_t sub_2465CFCE4()
{
  return sub_2465CFC68();
}

uint64_t sub_2465CFCEC()
{
  return sub_2465CCCA8();
}

uint64_t sub_2465CFD00(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24656BE08;
  return sub_2465CD014(a1, a2);
}

uint64_t sub_2465CFD58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24656BE08;
  return sub_2465CC8C8(a1, a2);
}

uint64_t sub_2465CFDB8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DB028();
}

uint64_t sub_2465CFE34()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DB034();
}

uint64_t sub_2465CFEB0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DB010();
}

uint64_t sub_2465CFF2C()
{
  return sub_2465CD324();
}

void sub_2465CFF40()
{
  sub_2465CDC10();
}

uint64_t sub_2465CFF54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v5;
  *v5 = v3;
  v5[1] = sub_2465CFFA0;
  return sub_2465CDA70((uint64_t)v5, v6, a3);
}

uint64_t sub_2465CFFA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_2_0();
  if (!v1)
    v4 = a1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_2465CFFE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_24656BE08;
  return sub_2465CE140(a1, a2, a3);
}

uint64_t sub_2465D0050(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24656BE08;
  return sub_2465CD328(a1, a2);
}

uint64_t sub_2465D00B0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DB040();
}

uint64_t sub_2465D012C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DB04C();
}

void sub_2465D01A8()
{
  sub_2465CF520();
}

uint64_t sub_2465D01BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24656BE08;
  return sub_2465CF7DC(a1, a2);
}

uint64_t sub_2465D0214(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2465323E0;
  return sub_2465CF004(a1, a2, a3);
}

uint64_t sub_2465D027C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DAFC8();
}

uint64_t sub_2465D0300()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DAFD4();
}

uint64_t sub_2465D0384()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DAFEC();
}

uint64_t sub_2465D0408()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DAFE0();
}

uint64_t sub_2465D048C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DB004();
}

uint64_t sub_2465D0508()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DB01C();
}

uint64_t sub_2465D0584(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24656BE08;
  return sub_2465CFBD0(a1);
}

uint64_t sub_2465D05D4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24656BE08;
  return sub_2465DAFF8();
}

_QWORD *sub_2465D0650(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2465D067C()
{
  return swift_bridgeObjectRelease();
}

_QWORD *sub_2465D0684(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_2465D06C4(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2465D06F4(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t sub_2465D0744(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
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

void type metadata accessor for UnsetRelationshipFlowError()
{
  OUTLINED_FUNCTION_54_9();
}

uint64_t sub_2465D07A4(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_release();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1(a1 + 56);
}

uint64_t sub_2465D07D8(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = a2 + 56;
  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 80) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  swift_retain();
  swift_retain();
  v9(a1 + 56, v6, v8);
  return a1;
}

uint64_t *sub_2465D0864(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_retain();
  swift_release();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 7, a2 + 7);
  return a1;
}

void *__swift_memcpy96_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x60uLL);
}

uint64_t sub_2465D08D8(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 56);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  return a1;
}

uint64_t sub_2465D0948(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 96))
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

uint64_t sub_2465D0988(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for UnsetRelationshipStrategy()
{
  OUTLINED_FUNCTION_54_9();
}

uint64_t sub_2465D09EC(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 80);
}

_OWORD *sub_2465D0A18(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  return a1;
}

uint64_t *sub_2465D0A94(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  return a1;
}

void *__swift_memcpy120_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x78uLL);
}

uint64_t sub_2465D0ADC(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return a1;
}

uint64_t sub_2465D0B4C(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 120))
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

uint64_t sub_2465D0B8C(uint64_t result, int a2, int a3)
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
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
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
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for UnsetRelationshipFlowFactory()
{
  OUTLINED_FUNCTION_54_9();
}

uint64_t sub_2465D0BF4(uint64_t a1)
{
  uint64_t v1;

  return sub_2465CF484(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2465D0C0C(uint64_t a1)
{
  uint64_t v1;

  return sub_2465CD9BC(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_2465D0C14()
{
  unint64_t result;

  result = qword_257591A20;
  if (!qword_257591A20)
  {
    result = MEMORY[0x2495605E4](&unk_2465E3208, &unk_2517BCD48);
    atomic_store(result, (unint64_t *)&qword_257591A20);
  }
  return result;
}

unint64_t sub_2465D0C50()
{
  unint64_t result;

  result = qword_257591A28;
  if (!qword_257591A28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_257591A28);
  }
  return result;
}

void sub_2465D0C8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_80_5(*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8));
  OUTLINED_FUNCTION_2_12();
}

uint64_t sub_2465D0CC0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2465D0D0C + 4 * byte_2465E3005[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2465D0D40 + 4 * byte_2465E3000[v4]))();
}

uint64_t sub_2465D0D40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2465D0D48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2465D0D50);
  return result;
}

uint64_t sub_2465D0D5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2465D0D64);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2465D0D68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2465D0D70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for UnsetRelationshipStrategy.Error()
{
  OUTLINED_FUNCTION_54_9();
}

unint64_t sub_2465D0D8C()
{
  unint64_t result;

  result = qword_257591A50;
  if (!qword_257591A50)
  {
    result = MEMORY[0x2495605E4](&unk_2465E31E0, &unk_2517BCD48);
    atomic_store(result, (unint64_t *)&qword_257591A50);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_29(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_17_26()
{
  return sub_2465DB6E8();
}

uint64_t OUTLINED_FUNCTION_19_22(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t (*a18)(uint64_t, uint64_t))
{
  uint64_t v18;
  uint64_t v19;

  return a18(v18, v19);
}

uint64_t OUTLINED_FUNCTION_20_22(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_25_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_26_22()
{
  return sub_2465DC75C();
}

uint64_t OUTLINED_FUNCTION_29_12()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;

  return sub_246543114(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_30_14@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

BOOL OUTLINED_FUNCTION_31_19(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_34_15()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;

  sub_24654313C(v0, v1, v2);
  return sub_24654313C(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_37_14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_40_13()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 56);
}

uint64_t OUTLINED_FUNCTION_41_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 176) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_42_11(__n128 *a1, __n128 a2)
{
  unint64_t v2;

  a1[1] = a2;
  a1[2].n128_u64[0] = v2;
  return sub_2465DCF6C();
}

uint64_t OUTLINED_FUNCTION_47_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_48_9()
{
  return sub_2465DB8A4();
}

uint64_t OUTLINED_FUNCTION_52_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t (*a16)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  return a16(v17, v18, v16);
}

uint64_t OUTLINED_FUNCTION_53_11()
{
  return sub_2465DD0A4();
}

uint64_t OUTLINED_FUNCTION_55_11(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_56_9()
{
  return sub_2465DD260();
}

uint64_t OUTLINED_FUNCTION_60_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return sub_2465DB520();
}

void OUTLINED_FUNCTION_63_11(uint64_t a1@<X0>, void (*a2)(uint64_t)@<X4>, uint64_t a3@<X8>)
{
  sub_24656C1C0(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_67_7()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_68_6(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  return sub_2465C8EE0(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_70_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t, uint64_t))
{
  uint64_t v11;
  uint64_t v12;

  return a11(v11, v12);
}

uint64_t OUTLINED_FUNCTION_74_3()
{
  return sub_2465DD260();
}

uint64_t OUTLINED_FUNCTION_76_5()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_77_5()
{
  return sub_2465DC798();
}

uint64_t OUTLINED_FUNCTION_78_4()
{
  return sub_2465DD260();
}

uint64_t OUTLINED_FUNCTION_80_5@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return a1(v1);
}

uint64_t OUTLINED_FUNCTION_82_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v1, v3);
}

uint64_t OUTLINED_FUNCTION_85_6(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = a1;
  return sub_2465DB838();
}

uint64_t OUTLINED_FUNCTION_87_6()
{
  return swift_task_alloc();
}

BOOL OUTLINED_FUNCTION_89_7(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_90_4()
{
  return sub_2465DCDEC();
}

uint64_t OUTLINED_FUNCTION_92_5()
{
  return sub_2465DC7D4();
}

uint64_t OUTLINED_FUNCTION_95_3(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = a1;
  return v1 - 128;
}

uint64_t sub_2465D1018@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v41 = a1;
  v42 = a2;
  v2 = sub_2465DBAF0();
  v39 = *(_QWORD *)(v2 - 8);
  v40 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v38 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)&v36 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v36 = (char *)&v36 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591A60);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E7D8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2465DBA24();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v36 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v36 - v23;
  sub_2465DBE44();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v41, v8);
  sub_2465DCAEC();
  sub_2465DBE2C();
  sub_2465DBBC8();
  swift_release();
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v15);
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v24, v14, v15);
  v25 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v25(v22, v24, v15);
  v26 = v36;
  sub_2465DBAE4();
  v25(v19, v22, v15);
  sub_2465DBAD8();
  v27 = *(void (**)(char *, uint64_t))(v16 + 8);
  v27(v22, v15);
  v29 = v39;
  v28 = v40;
  v30 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  v31 = v37;
  v30(v37, v26, v40);
  v32 = v42;
  sub_2465DBB50();
  v30(v38, v31, v28);
  sub_2465DBB44();
  v33 = *(void (**)(char *, uint64_t))(v29 + 8);
  v33(v31, v28);
  v33(v26, v28);
  v27(v24, v15);
  v34 = sub_2465DBB5C();
  return __swift_storeEnumTagSinglePayload(v32, 0, 1, v34);
}

uint64_t sub_2465D1354@<X0>(void (*a1)(char *, uint64_t)@<X0>, uint64_t a2@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, char *, uint64_t);
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  uint64_t v38;
  void (*v39)(char *, char *, uint64_t);
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, char *, uint64_t);
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t);
  uint64_t v73;

  v72 = a1;
  v73 = a2;
  v2 = sub_2465DBA60();
  v68 = *(_QWORD *)(v2 - 8);
  v69 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v67 = (char *)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v66 = (char *)&v56 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v65 = (char *)&v56 - v7;
  v64 = sub_2465DBACC();
  v62 = *(_QWORD *)(v64 - 8);
  v8 = MEMORY[0x24BDAC7A8](v64);
  v61 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v60 = (char *)&v56 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v63 = (char *)&v56 - v12;
  v71 = sub_2465DBBA4();
  v59 = *(_QWORD *)(v71 - 8);
  v13 = MEMORY[0x24BDAC7A8](v71);
  v58 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v57 = (char *)&v56 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v70 = (char *)&v56 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591A60);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v56 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(qword_25758E7D8);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v56 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_2465DBA24();
  v26 = *(_QWORD **)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v56 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v56 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v56 - v33;
  sub_2465DBE44();
  (*(void (**)(char *, void (*)(char *, uint64_t), uint64_t))(v19 + 16))(v21, v72, v18);
  sub_2465DCAEC();
  sub_2465DBE2C();
  sub_2465DBBC8();
  swift_release();
  __swift_storeEnumTagSinglePayload((uint64_t)v24, 0, 1, v25);
  v35 = (void (*)(char *, char *, uint64_t))v26[4];
  v56 = v34;
  v35(v34, v24, v25);
  v36 = (void (*)(char *, char *, uint64_t))v26[2];
  v36(v32, v34, v25);
  v37 = v70;
  sub_2465DBB98();
  v36(v29, v32, v25);
  sub_2465DBB8C();
  v72 = (void (*)(char *, uint64_t))v26[1];
  v72(v32, v25);
  v38 = v59;
  v39 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
  v40 = v57;
  v41 = v71;
  v39(v57, v37, v71);
  v42 = v63;
  sub_2465DBAC0();
  v39(v58, v40, v41);
  sub_2465DBAB4();
  v59 = *(_QWORD *)(v38 + 8);
  ((void (*)(char *, uint64_t))v59)(v40, v41);
  v43 = v62;
  v44 = *(void (**)(char *, char *, uint64_t))(v62 + 16);
  v45 = v60;
  v46 = v64;
  v44(v60, v42, v64);
  v47 = v65;
  sub_2465DBA54();
  v44(v61, v45, v46);
  sub_2465DBA48();
  v62 = *(_QWORD *)(v43 + 8);
  ((void (*)(char *, uint64_t))v62)(v45, v46);
  v49 = v68;
  v48 = v69;
  v50 = *(void (**)(char *, char *, uint64_t))(v68 + 16);
  v51 = v66;
  v50(v66, v47, v69);
  v52 = v73;
  sub_2465DBB50();
  v50(v67, v51, v48);
  sub_2465DBB38();
  v53 = *(void (**)(char *, uint64_t))(v49 + 8);
  v53(v51, v48);
  v53(v47, v48);
  ((void (*)(char *, uint64_t))v62)(v42, v46);
  ((void (*)(char *, uint64_t))v59)(v70, v71);
  v72(v56, v25);
  v54 = sub_2465DBB5C();
  return __swift_storeEnumTagSinglePayload(v52, 0, 1, v54);
}

void sub_2465D187C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
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
  void (*v75)(uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
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
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
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
  void *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char v146;
  uint64_t v147;
  uint64_t v148;
  os_log_type_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  _BYTE *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;

  OUTLINED_FUNCTION_46_12();
  v161 = v0;
  v181 = v3;
  v182 = v4;
  v160 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591A58);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_4_2();
  v184 = v7;
  v183 = OUTLINED_FUNCTION_27_17();
  v159 = *(_QWORD *)(v183 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD60);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_4_2();
  v203 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD70);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_32_0(v13, v157);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD78);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD80);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_35_1(v17, v157);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD88);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD90);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_14_23(v21, v157);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD98);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_33_1(v23, v157);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDD0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v24);
  v194 = (uint64_t)&v157 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_38_1();
  v204 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDA0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_4_2();
  v202 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDA8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_5_3();
  v195 = v31;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_38_1();
  v198 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDB0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_5_3();
  v193 = v35;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v36);
  v171 = (char *)&v157 - v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDB8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v38);
  v192 = (uint64_t)&v157 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  v41 = MEMORY[0x24BDAC7A8](v40);
  v43 = (char *)&v157 - v42;
  v163 = (char *)&v157 - v42;
  v44 = MEMORY[0x24BDAC7A8](v41);
  v46 = (char *)&v157 - v45;
  v170 = (char *)&v157 - v45;
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_33_15();
  v172 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDC0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_41_12();
  v164 = v2;
  MEMORY[0x24BDAC7A8](v48);
  v50 = (char *)&v157 - v49;
  v174 = (char *)&v157 - v49;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDC8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_21_3();
  v54 = v52 - v53;
  MEMORY[0x24BDAC7A8](v55);
  v175 = (char *)&v157 - v56;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD68);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v57);
  v191 = (uint64_t)&v157 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_10_10();
  v200 = v60;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v61);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_15_5(v62);
  v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591A60);
  v179 = *(_QWORD *)(v180 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v63);
  OUTLINED_FUNCTION_4_2();
  v176 = v64;
  OUTLINED_FUNCTION_54_5();
  v65 = sub_2465DCA80();
  OUTLINED_FUNCTION_90();
  __swift_storeEnumTagSinglePayload(v66, v67, v68, v65);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDE0);
  __swift_storeEnumTagSinglePayload((uint64_t)v50, 1, 1, v69);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDE8);
  OUTLINED_FUNCTION_4_29(v1);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDF0);
  v71 = OUTLINED_FUNCTION_18_20();
  __swift_storeEnumTagSinglePayload(v71, v72, v73, v70);
  OUTLINED_FUNCTION_4_29((uint64_t)v46);
  v74 = *MEMORY[0x24BE99768];
  v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 104);
  v165 = v54;
  v75(v54, v74, v65);
  __swift_storeEnumTagSinglePayload(v54, 0, 1, v65);
  v76 = OUTLINED_FUNCTION_13_0();
  __swift_storeEnumTagSinglePayload(v76, v77, v78, v69);
  OUTLINED_FUNCTION_4_29((uint64_t)v43);
  __swift_storeEnumTagSinglePayload(v193, 1, 1, v70);
  OUTLINED_FUNCTION_4_29(v192);
  v166 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDF8);
  OUTLINED_FUNCTION_0_5(v195, v79, v80, v166);
  v169 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE00);
  OUTLINED_FUNCTION_0_5(v202, v81, v82, v169);
  v167 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDD8);
  __swift_storeEnumTagSinglePayload(v204, 1, 1, v167);
  v168 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE08);
  OUTLINED_FUNCTION_0_5(v201, v83, v84, v168);
  OUTLINED_FUNCTION_4_29(v194);
  v185 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE10);
  v85 = v196;
  OUTLINED_FUNCTION_0_5(v196, v86, v87, v185);
  v190 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE18);
  v88 = v173;
  OUTLINED_FUNCTION_0_5(v173, v89, v90, v190);
  v189 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE20);
  OUTLINED_FUNCTION_0_5(v197, v91, v92, v189);
  v188 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE28);
  v93 = v178;
  OUTLINED_FUNCTION_0_5(v178, v94, v95, v188);
  v187 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE30);
  OUTLINED_FUNCTION_0_5(v199, v96, v97, v187);
  v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE38);
  OUTLINED_FUNCTION_37_15(v191, 1, 1);
  v186 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE40);
  v99 = OUTLINED_FUNCTION_18_20();
  __swift_storeEnumTagSinglePayload(v99, v100, v101, v102);
  v103 = v93;
  OUTLINED_FUNCTION_45_14();
  v104 = v200;
  v105 = v202;
  sub_2465DBE98();
  v162 = v98;
  OUTLINED_FUNCTION_37_15(v104, 0, 1);
  v106 = OUTLINED_FUNCTION_18_20();
  OUTLINED_FUNCTION_37_15(v106, v107, v108);
  __swift_storeEnumTagSinglePayload(v85, 1, 1, v185);
  OUTLINED_FUNCTION_35_17(v88);
  v109 = OUTLINED_FUNCTION_13_0();
  __swift_storeEnumTagSinglePayload(v109, v110, v111, v189);
  OUTLINED_FUNCTION_34_16(v103);
  OUTLINED_FUNCTION_30_15();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_48_1(v112, v113, v114);
  v115 = OUTLINED_FUNCTION_18_20();
  __swift_storeEnumTagSinglePayload(v115, v116, v117, v186);
  swift_bridgeObjectRetain();
  sub_2465DBE74();
  v118 = OUTLINED_FUNCTION_36_15();
  OUTLINED_FUNCTION_48_1(v118, v119, v120);
  OUTLINED_FUNCTION_25_1(v105, 1, 1, (uint64_t)&v201);
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_48_1(v121, v122, v123);
  v124 = OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_25_1(v124, v125, v126, (uint64_t)&v200);
  OUTLINED_FUNCTION_4_29(v194);
  v127 = OUTLINED_FUNCTION_17_27();
  __swift_storeEnumTagSinglePayload(v127, v128, v129, v185);
  OUTLINED_FUNCTION_35_17(v88);
  v130 = OUTLINED_FUNCTION_18_20();
  __swift_storeEnumTagSinglePayload(v130, v131, v132, v189);
  OUTLINED_FUNCTION_34_16(v103);
  OUTLINED_FUNCTION_30_15();
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_48_1(v133, v134, v135);
  v136 = OUTLINED_FUNCTION_17_27();
  __swift_storeEnumTagSinglePayload(v136, v137, v138, v186);
  v139 = v176;
  OUTLINED_FUNCTION_45_14();
  v140 = v177;
  sub_2465DBE98();
  v141 = OUTLINED_FUNCTION_51_10();
  v142 = v184;
  __swift_storeEnumTagSinglePayload(v141, v143, v144, v145);
  sub_2465DBBEC();
  sub_2465D1018(v139, (uint64_t)v142);
  OUTLINED_FUNCTION_9_8((uint64_t)v142, 1, v183);
  if (v146)
  {
    v147 = v179;
    sub_246545BE8((uint64_t)v142, &qword_257591A58);
    if (qword_25758C700 != -1)
      swift_once();
    v148 = OUTLINED_FUNCTION_5_9();
    __swift_project_value_buffer(v148, (uint64_t)qword_257591790);
    sub_2465DCDEC();
    v149 = OUTLINED_FUNCTION_17_3();
    if (OUTLINED_FUNCTION_2_11(v149))
    {
      *(_WORD *)OUTLINED_FUNCTION_3_3() = 0;
      OUTLINED_FUNCTION_26_23(&dword_24652E000, v150, v151, "Error generating NLUSystemPrompted SDA");
      OUTLINED_FUNCTION_1();
    }

    sub_2465D0C14();
    v152 = OUTLINED_FUNCTION_5_25();
    OUTLINED_FUNCTION_24_18(v152, v153);
    OUTLINED_FUNCTION_75(v139, *(uint64_t (**)(uint64_t, uint64_t))(v147 + 8));
  }
  else
  {
    v154 = v159;
    v155 = v158;
    OUTLINED_FUNCTION_46_4(v158, (uint64_t)v142, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v159 + 32));
    OUTLINED_FUNCTION_57_7();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758E7C8);
    v156 = OUTLINED_FUNCTION_21_16();
    *(_OWORD *)(v156 + 16) = xmmword_2465DDFD0;
    OUTLINED_FUNCTION_46_4(v156 + v140, v155, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v154 + 16));
    OUTLINED_FUNCTION_48_10();
    OUTLINED_FUNCTION_75(v155, *(uint64_t (**)(uint64_t, uint64_t))(v154 + 8));
    (*(void (**)(uint64_t, uint64_t))(v179 + 8))(v139, v180);
  }
  OUTLINED_FUNCTION_6_25();
}

void sub_2465D2344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t *v26;
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
  char v54;
  char v55;
  void (*v56)(uint64_t, uint64_t);
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
  char v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  NSObject *v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  os_log_type_t v84;
  uint8_t *v85;
  uint64_t v86;
  unint64_t v87;
  void (*v88)(uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;

  OUTLINED_FUNCTION_46_12();
  a19 = v22;
  a20 = v23;
  v100 = v24;
  v101 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591A48);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_4_2();
  v91 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591A68);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_35_1(v28, v89);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD68);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_36_1(v30, v89);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE38);
  v93 = *(_QWORD *)(v97 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v31);
  v90 = (uint64_t)&v89 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_10_10();
  v92 = v34;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_38_1();
  v94 = v36;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA60);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_1_4();
  v40 = v39 - v38;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA68);
  v99 = *(_QWORD *)(v41 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_21_3();
  v45 = v43 - v44;
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_38_1();
  v98 = v47;
  OUTLINED_FUNCTION_54_5();
  v48 = sub_2465DB8E0();
  v49 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  OUTLINED_FUNCTION_21_3();
  v52 = v50 - v51;
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_33_15();
  sub_2465DB898();
  sub_246571904();
  v55 = v54;
  v56 = *(void (**)(uint64_t, uint64_t))(v49 + 8);
  v56(v21, v48);
  if ((v55 & 1) == 0)
  {
    sub_2465DB898();
    if (sub_2465708DC())
    {
      v57 = sub_2465DBE38();
      OUTLINED_FUNCTION_8_8();
      sub_2465B5EB4(v57, v40);
      swift_bridgeObjectRelease();
      v58 = v41;
    }
    else
    {
      v59 = OUTLINED_FUNCTION_13_0();
      v58 = v41;
      OUTLINED_FUNCTION_37_15(v59, v60, v61);
    }
    v56(v52, v48);
    OUTLINED_FUNCTION_9_8(v40, 1, v58);
    if (v67)
    {
      sub_246545BE8(v40, &qword_25758DA60);
      v62 = OUTLINED_FUNCTION_53_12();
      __swift_storeEnumTagSinglePayload(v100, 1, 1, v62);
      goto LABEL_17;
    }
    v64 = v98;
    v63 = v99;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v99 + 32))(v98, v40, v58);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v63 + 16))(v45, v64, v58);
    sub_2465DCAEC();
    sub_246545C20(qword_25758E578, (uint64_t (*)(uint64_t))MEMORY[0x24BE99808], MEMORY[0x24BE997F0]);
    v65 = v95;
    sub_2465DBC34();
    v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591A60);
    OUTLINED_FUNCTION_9_8(v65, 1, v66);
    if (v67)
    {
      sub_246545BE8(v65, &qword_257591A68);
      v68 = v96;
      __swift_storeEnumTagSinglePayload(v96, 1, 1, v97);
    }
    else
    {
      swift_getKeyPath();
      sub_246545C20(&qword_25758CE48, (uint64_t (*)(uint64_t))MEMORY[0x24BE99818], MEMORY[0x24BE99760]);
      v68 = v96;
      sub_2465DBC28();
      swift_release();
      OUTLINED_FUNCTION_107_0(v65, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v66 - 8) + 8));
      v69 = v97;
      OUTLINED_FUNCTION_9_8(v68, 1, v97);
      if (!v70)
      {
        v76 = v93;
        v75 = v94;
        OUTLINED_FUNCTION_46_4(v94, v68, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v93 + 32));
        v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v76 + 16);
        OUTLINED_FUNCTION_55_12(v92);
        v78 = (uint64_t)v91;
        sub_246538DCC();
        v79 = OUTLINED_FUNCTION_53_12();
        OUTLINED_FUNCTION_9_8(v78, 1, (uint64_t)v79);
        if (!v80)
        {
          OUTLINED_FUNCTION_75(v75, *(uint64_t (**)(uint64_t, uint64_t))(v76 + 8));
          (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v98, v58);
          (*((void (**)(uint64_t, uint64_t, NSObject *))v79[-1].isa + 4))(v100, v78, v79);
          v71 = OUTLINED_FUNCTION_51_10();
          goto LABEL_16;
        }
        sub_246545BE8(v78, &qword_257591A48);
        if (qword_25758C700 != -1)
          swift_once();
        v81 = OUTLINED_FUNCTION_5_9();
        __swift_project_value_buffer(v81, (uint64_t)qword_257591790);
        v82 = v90;
        OUTLINED_FUNCTION_55_12(v90);
        sub_2465DCDEC();
        v83 = v75;
        v84 = OUTLINED_FUNCTION_17_3();
        if (os_log_type_enabled(v79, v84))
        {
          v85 = (uint8_t *)OUTLINED_FUNCTION_3_3();
          v95 = OUTLINED_FUNCTION_3_3();
          a10 = v95;
          v96 = v58;
          *(_DWORD *)v85 = 136315138;
          v91 = v85 + 4;
          v77(v92, v82, v69);
          v86 = sub_2465DCE88();
          v102 = sub_2465C8EE0(v86, v87, &a10);
          sub_2465DD0A4();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v93 + 8))(v82, v69);
          _os_log_impl(&dword_24652E000, v79, v84, "UnsetRelationshipFlow: Person entity found in parse, but no usable fields found: %s", v85, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_1();
        }

        v88 = *(void (**)(uint64_t, uint64_t))(v76 + 8);
        v88(v82, v69);
        v88(v83, v69);
        (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v98, v58);
LABEL_15:
        OUTLINED_FUNCTION_53_12();
        OUTLINED_FUNCTION_90();
LABEL_16:
        __swift_storeEnumTagSinglePayload(v71, v72, v73, v74);
        goto LABEL_17;
      }
    }
    (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v64, v58);
    sub_246545BE8(v68, &qword_25758CD68);
    goto LABEL_15;
  }
  sub_2465DB76C();
  sub_246545C20((unint64_t *)&qword_25758FFE8, (uint64_t (*)(uint64_t))MEMORY[0x24BE985D0], MEMORY[0x24BE985D8]);
  OUTLINED_FUNCTION_5_25();
  sub_2465DB760();
  swift_willThrow();
LABEL_17:
  OUTLINED_FUNCTION_6_25();
}

void sub_2465D29E8()
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
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  void (*v52)(char *, uint64_t, uint64_t);
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
  uint64_t v64;
  void (*v65)(uint64_t, char *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void (*v106)(char *, uint64_t, uint64_t);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  int64_t v120;
  char *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;

  OUTLINED_FUNCTION_46_12();
  v124 = v0;
  v3 = v2;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(qword_25758E7D8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_21_3();
  v9 = v7 - v8;
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_33_15();
  v11 = sub_2465DBB20();
  v113 = *(_QWORD *)(v11 - 8);
  v114 = v11;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v12);
  v112 = (char *)&v90 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_10_10();
  v108 = v15;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_38_1();
  v111 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD68);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_14_23(v19, v90);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591A60);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_4_2();
  v116 = v21;
  OUTLINED_FUNCTION_54_5();
  v22 = sub_2465DBA24();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_5_3();
  v100 = v24;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_10_10();
  v99 = v26;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v90 - v28;
  v118 = sub_2465DC39C();
  v30 = *(_QWORD *)(v118 - 8);
  MEMORY[0x24BDAC7A8](v118);
  v115 = (char *)&v90 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_38_1();
  v123 = v33;
  OUTLINED_FUNCTION_54_5();
  v34 = sub_2465DBACC();
  v109 = *(_QWORD *)(v34 - 8);
  v110 = v34;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_33_1(v36, v90);
  v94 = sub_2465DBB80();
  v93 = *(_QWORD *)(v94 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_5_3();
  v92 = v38;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_38_1();
  v91 = v40;
  v41 = OUTLINED_FUNCTION_27_17();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_4_2();
  v42 = *(_QWORD *)(v3 + 16);
  v98 = v5;
  v97 = v43;
  v96 = v44;
  v95 = v45;
  if (v42)
  {
    v102 = v22;
    v103 = v23;
    v125 = MEMORY[0x24BEE4AF8];
    v120 = v42;
    sub_2465AD1E4(0, v42, 0);
    v46 = v3 + ((*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80));
    v107 = sub_2465DBE44();
    v101 = *(_QWORD *)(v30 + 72);
    v47 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
    v105 = v9;
    v106 = v47;
    v104 = v1;
    v48 = v118;
    v121 = v29;
    while (1)
    {
      v49 = v1;
      v50 = v9;
      v51 = v123;
      v119 = v46;
      v52 = v106;
      v106(v123, v46, v48);
      v53 = (uint64_t)v115;
      v52(v115, (uint64_t)v51, v48);
      v54 = v117;
      sub_246537434(v53, v55, v56, v57, v58, v59, v60, v61, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100,
        v101);
      v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE38);
      __swift_storeEnumTagSinglePayload(v54, 0, 1, v62);
      sub_2465DBBEC();
      sub_2465DCAEC();
      sub_2465DBE2C();
      v63 = v124;
      sub_2465DBBC8();
      if (v63)
        break;
      OUTLINED_FUNCTION_8_8();
      v64 = v103;
      v65 = *(void (**)(uint64_t, char *, uint64_t))(v103 + 16);
      v66 = v102;
      v65(v49, v29, v102);
      v67 = OUTLINED_FUNCTION_36_15();
      __swift_storeEnumTagSinglePayload(v67, v68, v69, v66);
      v70 = v108;
      sub_2465DBB14();
      sub_246545BA8(v49, v50, qword_25758E7D8);
      OUTLINED_FUNCTION_9_8(v50, 1, v66);
      v124 = 0;
      if (v71)
      {
        OUTLINED_FUNCTION_49_7();
        sub_246545BE8(v50, qword_25758E7D8);
        v74 = v70;
      }
      else
      {
        v72 = v70;
        v73 = v99;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v64 + 32))(v99, v50, v66);
        v65(v100, (char *)v73, v66);
        sub_2465DBB08();
        OUTLINED_FUNCTION_49_7();
        (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v73, v66);
        v74 = v72;
      }
      v76 = v113;
      v75 = v114;
      v77 = v111;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v113 + 32))(v111, v74, v114);
      sub_2465DBAC0();
      (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v112, v77, v75);
      sub_2465DBAA8();
      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v77, v75);
      (*(void (**)(char *, uint64_t))(v64 + 8))(v121, v66);
      v48 = v118;
      (*(void (**)(char *, uint64_t))(v30 + 8))(v123, v118);
      v78 = v125;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2465AD1E4(0, *(_QWORD *)(v125 + 16) + 1, 1);
        v78 = v125;
      }
      v79 = v119;
      v81 = *(_QWORD *)(v78 + 16);
      v80 = *(_QWORD *)(v78 + 24);
      if (v81 >= v80 >> 1)
      {
        sub_2465AD1E4(v80 > 1, v81 + 1, 1);
        v78 = v125;
      }
      *(_QWORD *)(v78 + 16) = v81 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v109 + 32))(v78+ ((*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80))+ *(_QWORD *)(v109 + 72) * v81, v122, v110);
      v125 = v78;
      v46 = v79 + v101;
      v29 = v121;
      --v120;
      v1 = v104;
      v9 = v105;
      if (!v120)
        goto LABEL_12;
    }
    OUTLINED_FUNCTION_8_8();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v123, v48);
    swift_release();
  }
  else
  {
LABEL_12:
    v82 = v94;
    v83 = v93;
    v84 = v92;
    v85 = v91;
    sub_2465DBB74();
    sub_2465DBB68();
    v86 = v95;
    sub_2465DBB50();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 16))(v84, v85, v82);
    sub_2465DBB2C();
    OUTLINED_FUNCTION_107_0(v85, *(uint64_t (**)(uint64_t, uint64_t))(v83 + 8));
    sub_2465DB634();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758E7C8);
    v87 = v96;
    v88 = (*(unsigned __int8 *)(v96 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80);
    v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = xmmword_2465DDFD0;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v87 + 16))(v89 + v88, v86, v97);
    sub_2465DB628();
    OUTLINED_FUNCTION_107_0(v86, *(uint64_t (**)(uint64_t, uint64_t))(v87 + 8));
  }
  OUTLINED_FUNCTION_6_25();
}

void sub_2465D30DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
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
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  void (*v91)(uint64_t, uint64_t, uint64_t);
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
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
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void (*v150)(char *, uint64_t);
  void *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char v156;
  uint64_t v157;
  uint64_t v158;
  os_log_type_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  _BYTE *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t KeyPath;
  uint64_t v190;
  void (*v191)(char *, uint64_t);
  uint64_t v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;

  OUTLINED_FUNCTION_46_12();
  a19 = v22;
  a20 = v23;
  v170 = v20;
  v190 = v24;
  v26 = v25;
  v169 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257591A58);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_4_2();
  v193 = v29;
  v192 = OUTLINED_FUNCTION_27_17();
  v168 = *(_QWORD *)(v192 - 8);
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_15_5(v31);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591A60);
  v194 = *(_QWORD *)(v32 - 8);
  v195 = v32;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_4_2();
  v191 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD60);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_33_1(v36, v167);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD70);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_4_2();
  v202 = v38;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD78);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_32_0(v40, v167);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD80);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_36_1(v42, v167);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD88);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_4_2();
  a10 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD90);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_35_1(v46, v167);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD98);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_14_23(v48, v167);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDD0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v49);
  OUTLINED_FUNCTION_5_3();
  v187 = v50;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v51);
  OUTLINED_FUNCTION_38_1();
  v197 = v52;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDA0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_1_4();
  v56 = v55 - v54;
  v177 = v55 - v54;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDB0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_1_4();
  v60 = v59 - v58;
  v180 = v59 - v58;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDB8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v61);
  OUTLINED_FUNCTION_41_12();
  v179 = v21;
  MEMORY[0x24BDAC7A8](v62);
  v64 = (char *)&v167 - v63;
  v181 = (char *)&v167 - v63;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDC0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v65);
  OUTLINED_FUNCTION_1_4();
  v68 = v67 - v66;
  v182 = v67 - v66;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDC8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v69);
  OUTLINED_FUNCTION_1_4();
  v72 = v71 - v70;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD68);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v73);
  v196 = (char *)&v167 - ((v74 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v75);
  OUTLINED_FUNCTION_38_1();
  v186 = v76;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDA8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v77);
  OUTLINED_FUNCTION_21_3();
  v80 = v78 - v79;
  v178 = v78 - v79;
  MEMORY[0x24BDAC7A8](v81);
  OUTLINED_FUNCTION_38_1();
  v188 = v82;
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE38);
  v84 = *(_QWORD *)(v83 - 8);
  v204 = v83;
  v205 = v84;
  OUTLINED_FUNCTION_2_7();
  MEMORY[0x24BDAC7A8](v85);
  OUTLINED_FUNCTION_1_4();
  v185 = v87 - v86;
  v88 = v26;
  sub_246537DD4();
  KeyPath = swift_getKeyPath();
  v89 = *MEMORY[0x24BE99768];
  v90 = sub_2465DCA80();
  v91 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 104);
  v183 = v72;
  v91(v72, v89, v90);
  OUTLINED_FUNCTION_6_2(v72, 0);
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDE0);
  OUTLINED_FUNCTION_0_5(v68, v93, v94, v92);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDE8);
  OUTLINED_FUNCTION_4_29((uint64_t)v64);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDF0);
  OUTLINED_FUNCTION_0_5(v60, v96, v97, v95);
  OUTLINED_FUNCTION_4_29(v21);
  v184 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDF8);
  OUTLINED_FUNCTION_0_5(v80, v98, v99, v184);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE00);
  OUTLINED_FUNCTION_0_5(v56, v101, v102, v100);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDD8);
  OUTLINED_FUNCTION_4_29(v197);
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE08);
  OUTLINED_FUNCTION_0_5(v198, v104, v105, v103);
  OUTLINED_FUNCTION_4_29(v187);
  v176 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE10);
  OUTLINED_FUNCTION_0_5(v199, v106, v107, v176);
  v175 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE18);
  OUTLINED_FUNCTION_0_5(a10, v108, v109, v175);
  v174 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE20);
  OUTLINED_FUNCTION_0_5(v200, v110, v111, v174);
  v173 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE28);
  OUTLINED_FUNCTION_0_5(v201, v112, v113, v173);
  v172 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE30);
  OUTLINED_FUNCTION_0_5(v202, v114, v115, v172);
  v116 = OUTLINED_FUNCTION_13_0();
  v117 = v204;
  OUTLINED_FUNCTION_23_22(v116, v118, v119);
  v171 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE40);
  v120 = OUTLINED_FUNCTION_17_27();
  __swift_storeEnumTagSinglePayload(v120, v121, v122, v123);
  OUTLINED_FUNCTION_45_14();
  v124 = v186;
  sub_2465DBE98();
  OUTLINED_FUNCTION_6_2(v124, 0);
  v125 = sub_24653909C();
  v197 = v126;
  v198 = v125;
  v127 = OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_23_22(v127, v128, v129);
  OUTLINED_FUNCTION_90();
  v130 = v185;
  __swift_storeEnumTagSinglePayload(v131, v132, v133, v176);
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_25_1(v134, v135, v136, (uint64_t)&a9);
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_25_1(v137, v138, v139, (uint64_t)&v206);
  v140 = OUTLINED_FUNCTION_13_0();
  __swift_storeEnumTagSinglePayload(v140, v141, v142, v173);
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_25_1(v143, v144, v145, (uint64_t)&v204);
  OUTLINED_FUNCTION_90();
  OUTLINED_FUNCTION_23_22(v146, v147, v148);
  OUTLINED_FUNCTION_25_1(v203, 1, 1, (uint64_t)&v203);
  v149 = v188;
  v150 = v191;
  sub_2465DBE74();
  OUTLINED_FUNCTION_6_2(v149, 0);
  sub_246545C20(&qword_25758CE48, (uint64_t (*)(uint64_t))MEMORY[0x24BE99818], MEMORY[0x24BE99760]);
  sub_246545C20(&qword_25758D240, MEMORY[0x24BE996E0], MEMORY[0x24BE996C8]);
  v151 = v193;
  sub_2465DBF04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v205 + 16))(v124, v130, v117);
  v152 = OUTLINED_FUNCTION_36_15();
  __swift_storeEnumTagSinglePayload(v152, v153, v154, v117);
  sub_2465DBBEC();
  v155 = (uint64_t)v150;
  sub_2465D1354(v150, (uint64_t)v151);
  OUTLINED_FUNCTION_9_8((uint64_t)v151, 1, v192);
  if (v156)
  {
    v157 = v194;
    sub_246545BE8((uint64_t)v151, &qword_257591A58);
    if (qword_25758C700 != -1)
      swift_once();
    v158 = OUTLINED_FUNCTION_5_9();
    __swift_project_value_buffer(v158, (uint64_t)qword_257591790);
    sub_2465DCDEC();
    v159 = OUTLINED_FUNCTION_17_3();
    if (OUTLINED_FUNCTION_2_11(v159))
    {
      *(_WORD *)OUTLINED_FUNCTION_3_3() = 0;
      OUTLINED_FUNCTION_26_23(&dword_24652E000, v160, v161, "Error generating NLUSystemOffered SDA");
      OUTLINED_FUNCTION_1();
    }

    sub_2465D0C14();
    v162 = OUTLINED_FUNCTION_5_25();
    OUTLINED_FUNCTION_24_18(v162, v163);
    OUTLINED_FUNCTION_75(v155, *(uint64_t (**)(uint64_t, uint64_t))(v157 + 8));
    OUTLINED_FUNCTION_44_9();
  }
  else
  {
    v164 = v168;
    v165 = v167;
    OUTLINED_FUNCTION_46_4(v167, (uint64_t)v151, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v168 + 32));
    OUTLINED_FUNCTION_57_7();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25758E7C8);
    v166 = OUTLINED_FUNCTION_21_16();
    *(_OWORD *)(v166 + 16) = xmmword_2465DDFD0;
    OUTLINED_FUNCTION_46_4(v166 + v130, v165, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v164 + 16));
    OUTLINED_FUNCTION_48_10();
    OUTLINED_FUNCTION_75(v165, *(uint64_t (**)(uint64_t, uint64_t))(v164 + 8));
    (*(void (**)(uint64_t, uint64_t))(v194 + 8))(v155, v195);
    OUTLINED_FUNCTION_44_9();
  }
  OUTLINED_FUNCTION_6_25();
}

uint64_t sub_2465D3A2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758D248);
  MEMORY[0x24BDAC7A8](v2);
  sub_246545BA8(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_25758D248);
  return sub_2465DCAE0();
}

uint64_t sub_2465D3AAC()
{
  return sub_2465DCA14();
}

uint64_t OUTLINED_FUNCTION_4_29(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

void OUTLINED_FUNCTION_14_23(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_17_27()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_18_20()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_21_16()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_23_22(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_24_18(uint64_t a1, _BYTE *a2)
{
  *a2 = 1;
  return swift_willThrow();
}

void OUTLINED_FUNCTION_26_23(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_27_17()
{
  return sub_2465DBB5C();
}

uint64_t OUTLINED_FUNCTION_30_15()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v0, 1, 1, *(_QWORD *)(v1 - 224));
}

uint64_t OUTLINED_FUNCTION_34_16(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, *(_QWORD *)(v1 - 216));
}

uint64_t OUTLINED_FUNCTION_35_17(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, *(_QWORD *)(v1 - 200));
}

uint64_t OUTLINED_FUNCTION_36_15()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_37_15(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_44_9()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 96) + 8))(v0, *(_QWORD *)(v1 - 104));
}

double OUTLINED_FUNCTION_45_14()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_48_10()
{
  return sub_2465DB628();
}

void OUTLINED_FUNCTION_49_7()
{
  uint64_t v0;
  uint64_t *v1;

  sub_246545BE8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_51_10()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_53_12()
{
  return sub_2465DB7A8();
}

uint64_t OUTLINED_FUNCTION_55_12(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_57_7()
{
  return sub_2465DB634();
}

uint64_t sub_2465D3C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v7;

  *(_BYTE *)(v7 + 73) = a7;
  *(_BYTE *)(v7 + 72) = a6;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 24) = a2;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 16) = a1;
  return OUTLINED_FUNCTION_7_9();
}

uint64_t sub_2465D3C8C()
{
  uint64_t v0;
  os_log_type_t v1;
  _WORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(void);
  uint64_t v9;
  os_log_type_t v10;
  _WORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void);

  OUTLINED_FUNCTION_80_6();
  sub_2465DAF2C();
  if ((sub_2465DAF14() & 1) != 0)
  {
    if (qword_25758C700 != -1)
      swift_once();
    v0 = OUTLINED_FUNCTION_5_9();
    OUTLINED_FUNCTION_12_4(v0, (uint64_t)qword_257591790);
    v1 = OUTLINED_FUNCTION_6_7();
    if (OUTLINED_FUNCTION_5_10(v1))
    {
      v2 = (_WORD *)OUTLINED_FUNCTION_13_1();
      OUTLINED_FUNCTION_14_2(v2);
      OUTLINED_FUNCTION_0_11(&dword_24652E000, v3, v4, "#OutputGenerator returning widget views for SMART");
      OUTLINED_FUNCTION_3_26();
    }
    OUTLINED_FUNCTION_20_11();
    v5 = OUTLINED_FUNCTION_2_31();
    v6 = (_QWORD *)OUTLINED_FUNCTION_73_7(v5);
    OUTLINED_FUNCTION_5_23(v6);
    return OUTLINED_FUNCTION_7_19(v7);
  }
  else
  {
    if (qword_25758C700 != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_5_9();
    OUTLINED_FUNCTION_12_4(v9, (uint64_t)qword_257591790);
    v10 = OUTLINED_FUNCTION_6_7();
    if (OUTLINED_FUNCTION_5_10(v10))
    {
      v11 = (_WORD *)OUTLINED_FUNCTION_13_1();
      OUTLINED_FUNCTION_14_2(v11);
      OUTLINED_FUNCTION_0_11(&dword_24652E000, v12, v13, "#OutputGenerator returning SA ace views");
      OUTLINED_FUNCTION_3_26();
    }
    OUTLINED_FUNCTION_20_11();
    v14 = OUTLINED_FUNCTION_1_23();
    v15 = (_QWORD *)OUTLINED_FUNCTION_72_7(v14);
    v16 = OUTLINED_FUNCTION_8_17(v15);
    return OUTLINED_FUNCTION_6_21(v16, v17, v18, v19, v20, v21, v22);
  }
}

uint64_t sub_2465D3DAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v7;

  *(_BYTE *)(v7 + 73) = a7;
  *(_BYTE *)(v7 + 72) = a6;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 24) = a2;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2465D3DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7)
{
  uint64_t v7;

  *(_BYTE *)(v7 + 73) = a7;
  *(_BYTE *)(v7 + 72) = a6;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 48) = a5;
  *(_QWORD *)(v7 + 24) = a2;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2465D3DFC()
{
  uint64_t v0;
  os_log_type_t v1;
  _WORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(void);
  uint64_t v9;
  os_log_type_t v10;
  _WORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void);

  OUTLINED_FUNCTION_80_6();
  sub_2465DAF2C();
  if ((sub_2465DAF14() & 1) != 0)
  {
    if (qword_25758C700 != -1)
      swift_once();
    v0 = OUTLINED_FUNCTION_5_9();
    OUTLINED_FUNCTION_12_4(v0, (uint64_t)qword_257591790);
    v1 = OUTLINED_FUNCTION_6_7();
    if (OUTLINED_FUNCTION_5_10(v1))
    {
      v2 = (_WORD *)OUTLINED_FUNCTION_13_1();
      OUTLINED_FUNCTION_14_2(v2);
      OUTLINED_FUNCTION_0_11(&dword_24652E000, v3, v4, "#OutputGenerator returning widget views for SMART");
      OUTLINED_FUNCTION_3_26();
    }
    OUTLINED_FUNCTION_20_11();
    v5 = OUTLINED_FUNCTION_2_31();
    v6 = (_QWORD *)OUTLINED_FUNCTION_73_7(v5);
    OUTLINED_FUNCTION_5_23(v6);
    return OUTLINED_FUNCTION_7_19(v7);
  }
  else
  {
    if (qword_25758C700 != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_5_9();
    OUTLINED_FUNCTION_12_4(v9, (uint64_t)qword_257591790);
    v10 = OUTLINED_FUNCTION_6_7();
    if (OUTLINED_FUNCTION_5_10(v10))
    {
      v11 = (_WORD *)OUTLINED_FUNCTION_13_1();
      OUTLINED_FUNCTION_14_2(v11);
      OUTLINED_FUNCTION_0_11(&dword_24652E000, v12, v13, "#OutputGenerator returning SA ace views");
      OUTLINED_FUNCTION_3_26();
    }
    OUTLINED_FUNCTION_20_11();
    v14 = OUTLINED_FUNCTION_1_23();
    v15 = (_QWORD *)OUTLINED_FUNCTION_72_7(v14);
    v16 = OUTLINED_FUNCTION_8_17(v15);
    return OUTLINED_FUNCTION_6_21(v16, v17, v18, v19, v20, v21, v22);
  }
}

uint64_t sub_2465D3F1C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[5] = a1;
  v2 = sub_2465DAEB4();
  v1[6] = v2;
  v1[7] = *(_QWORD *)(v2 - 8);
  v1[8] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB50);
  v1[9] = OUTLINED_FUNCTION_0_0();
  sub_2465DC42C();
  v1[10] = OUTLINED_FUNCTION_0_0();
  v3 = sub_2465DB520();
  v1[11] = v3;
  v1[12] = *(_QWORD *)(v3 - 8);
  v1[13] = OUTLINED_FUNCTION_5();
  v1[14] = OUTLINED_FUNCTION_16();
  v4 = sub_2465DB838();
  v1[15] = v4;
  v1[16] = *(_QWORD *)(v4 - 8);
  v1[17] = OUTLINED_FUNCTION_0_0();
  sub_2465DC7E0();
  v1[18] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465D3FE4()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_24_10();
  *(_QWORD *)(v0 + 152) = OUTLINED_FUNCTION_17_11();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v1;
  OUTLINED_FUNCTION_77_6(v1, (uint64_t)sub_2465D403C);
  return sub_246553E84();
}

uint64_t sub_2465D403C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[2] = v2;
  v3[3] = a1;
  v3[4] = v1;
  v3[21] = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_2465D40A4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_62_6();
  v1 = v0[8];
  v12 = v0[7];
  v13 = v0[6];
  sub_2465DB4E4();
  OUTLINED_FUNCTION_14_8();
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_72();
  sub_2465DB7E4();
  OUTLINED_FUNCTION_63_12();
  OUTLINED_FUNCTION_61_9();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_54();
  v2 = OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_15_11(v2);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_55_13();
  OUTLINED_FUNCTION_54_10();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v1, v13);
  OUTLINED_FUNCTION_18_10();
  OUTLINED_FUNCTION_1_0();
  if (qword_25758C6E0 != -1)
    swift_once();
  v0[22] = v0[3];
  v0[23] = *(_QWORD *)(qword_257596DE0 + 152);
  sub_2465DB688();
  OUTLINED_FUNCTION_11_0();
  swift_bridgeObjectRetain();
  v0[24] = sub_2465DB67C();
  v3 = (_QWORD *)swift_task_alloc();
  v0[25] = v3;
  *v3 = v0;
  v3[1] = sub_2465D4220;
  OUTLINED_FUNCTION_61_2();
  return sub_2465B21D8(v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_2465D4220()
{
  OUTLINED_FUNCTION_50_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8_8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_2465D4264()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_19();

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_46();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_19_11();
  return OUTLINED_FUNCTION_13(v1);
}

uint64_t sub_2465D42C4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_79_7();
  swift_release();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_0_24(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2465D4320(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = OUTLINED_FUNCTION_58(a1);
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB50);
  v3 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_56(v3);
  v4 = OUTLINED_FUNCTION_0_0();
  v5 = OUTLINED_FUNCTION_65(v4);
  v1[11] = OUTLINED_FUNCTION_15_27(v5);
  v6 = OUTLINED_FUNCTION_16();
  v7 = OUTLINED_FUNCTION_45_15(v6);
  v1[13] = v7;
  v1[14] = *(_QWORD *)(v7 - 8);
  v8 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_51_11(v8);
  v1[16] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465D43B4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(uint64_t **)(v0 + 24);
  OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_24_10();
  v2 = OUTLINED_FUNCTION_17_11();
  OUTLINED_FUNCTION_83_6(v2);
  v3 = *v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v4;
  *v4 = v0;
  v4[1] = sub_2465D4420;
  return sub_246553D00(v3);
}

uint64_t sub_2465D4420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24_19();
  if (!v1)
  {
    OUTLINED_FUNCTION_78_5();
    *(_QWORD *)(v2 + 160) = v0;
  }
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_10_1();
}

uint64_t sub_2465D4468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, char *, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;

  OUTLINED_FUNCTION_62_6();
  v16 = v14[5];
  v15 = v14[6];
  v28 = v14[4];
  sub_2465DB508();
  OUTLINED_FUNCTION_14_8();
  OUTLINED_FUNCTION_19_12();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_21_9();
  OUTLINED_FUNCTION_63_12();
  OUTLINED_FUNCTION_61_9();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_54();
  v17 = OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_15_11(v17);
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_55_13();
  OUTLINED_FUNCTION_54_10();
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v28);
  OUTLINED_FUNCTION_18_10();
  OUTLINED_FUNCTION_1_0();
  v29 = (char *)&dword_257591B58 + dword_257591B58;
  v18 = (_QWORD *)swift_task_alloc();
  v14[21] = v18;
  *v18 = v14;
  v18[1] = sub_2465D4588;
  OUTLINED_FUNCTION_61_2();
  return v26(v19, v20, v21, v22, v23, v24, v25, v26, a9, v28, v29, a12, a13, a14);
}

uint64_t sub_2465D4588()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465D45C4()
{
  uint64_t (*v0)(void);

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_53_13();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_46();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_19_11();
  return OUTLINED_FUNCTION_13(v0);
}

uint64_t sub_2465D460C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_79_7();
  OUTLINED_FUNCTION_65_2();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_0_24(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2465D4654(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246568A3C;
  return sub_2465D4320(a1);
}

uint64_t sub_2465D46A4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = OUTLINED_FUNCTION_58(a1);
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB50);
  v3 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_56(v3);
  v4 = OUTLINED_FUNCTION_0_0();
  v5 = OUTLINED_FUNCTION_65(v4);
  v1[11] = OUTLINED_FUNCTION_15_27(v5);
  v6 = OUTLINED_FUNCTION_16();
  v7 = OUTLINED_FUNCTION_45_15(v6);
  v1[13] = v7;
  v1[14] = *(_QWORD *)(v7 - 8);
  v8 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_51_11(v8);
  v1[16] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465D4738()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_24_10();
  v1 = OUTLINED_FUNCTION_17_11();
  OUTLINED_FUNCTION_83_6(v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v2;
  OUTLINED_FUNCTION_77_6(v2, (uint64_t)sub_2465D478C);
  return sub_246553CA8();
}

uint64_t sub_2465D478C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24_19();
  if (!v1)
  {
    OUTLINED_FUNCTION_78_5();
    *(_QWORD *)(v2 + 160) = v0;
  }
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_10_1();
}

#error "2465D4840: call analysis failed (funcsize=39)"

uint64_t sub_2465D4880()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465D48BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246568A3C;
  return sub_2465D46A4(a1);
}

uint64_t sub_2465D490C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = OUTLINED_FUNCTION_58(a1);
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB50);
  v3 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_56(v3);
  v4 = OUTLINED_FUNCTION_0_0();
  v5 = OUTLINED_FUNCTION_65(v4);
  v1[11] = OUTLINED_FUNCTION_15_27(v5);
  v6 = OUTLINED_FUNCTION_16();
  v7 = OUTLINED_FUNCTION_45_15(v6);
  v1[13] = v7;
  v1[14] = *(_QWORD *)(v7 - 8);
  v8 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_51_11(v8);
  v1[16] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465D49A0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_24_10();
  v1 = OUTLINED_FUNCTION_17_11();
  OUTLINED_FUNCTION_83_6(v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v2;
  OUTLINED_FUNCTION_77_6(v2, (uint64_t)sub_2465D49F4);
  return sub_246553E2C();
}

uint64_t sub_2465D49F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24_19();
  if (!v1)
  {
    OUTLINED_FUNCTION_78_5();
    *(_QWORD *)(v2 + 160) = v0;
  }
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_10_1();
}

#error "2465D4AA8: call analysis failed (funcsize=39)"

uint64_t sub_2465D4AE8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246568A3C;
  return sub_2465D490C(a1);
}

uint64_t sub_2465D4B38(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = OUTLINED_FUNCTION_58(a1);
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB50);
  v3 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_56(v3);
  v4 = OUTLINED_FUNCTION_0_0();
  v5 = OUTLINED_FUNCTION_65(v4);
  v1[11] = OUTLINED_FUNCTION_15_27(v5);
  v6 = OUTLINED_FUNCTION_16();
  v7 = OUTLINED_FUNCTION_45_15(v6);
  v1[13] = v7;
  v1[14] = *(_QWORD *)(v7 - 8);
  v8 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_51_11(v8);
  v1[16] = OUTLINED_FUNCTION_0_0();
  sub_2465DB70C();
  v1[17] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465D4BE0()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  sub_2465DC408();
  if (sub_2465DC3F0())
  {
    sub_2465DC3E4();
    swift_release();
  }
  sub_2465DC7BC();
  sub_2465DB700();
  v1 = sub_2465DC7B0();
  v0[18] = v1;
  OUTLINED_FUNCTION_67_0();
  sub_2465DC7D4();
  v0[19] = sub_2465DC798();
  swift_retain();
  v2 = (_QWORD *)swift_task_alloc();
  v0[20] = v2;
  *v2 = v0;
  v2[1] = sub_2465D4CE4;
  return sub_246553AA0(v1);
}

uint64_t sub_2465D4CE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_5_6();
  *v4 = *v3;
  *(_QWORD *)(v2 + 168) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_release();
    OUTLINED_FUNCTION_8_8();
    *(_QWORD *)(v2 + 176) = v0;
  }
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_10_1();
}

#error "2465D4DB0: call analysis failed (funcsize=41)"

uint64_t sub_2465D4DFC()
{
  OUTLINED_FUNCTION_50_2();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465D4E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_62_6();
  v15 = *(_QWORD *)(v14 + 120);
  v16 = *(_QWORD *)(v14 + 104);
  v17 = *(_QWORD *)(v14 + 112);
  v27 = *(_QWORD *)(v14 + 56);
  v28 = *(_QWORD *)(v14 + 48);

  OUTLINED_FUNCTION_8_8();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_46();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_19_11();
  OUTLINED_FUNCTION_61_2();
  return v18(v18, v19, v20, v21, v22, v23, v24, v25, a9, v27, v28, a12, a13, a14);
}

uint64_t sub_2465D4EC0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_19();
  swift_release_n();
  OUTLINED_FUNCTION_8_8();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_46();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_13(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2465D4F30(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246568A3C;
  return sub_2465D4B38(a1);
}

uint64_t sub_2465D4F80(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = OUTLINED_FUNCTION_58(a1);
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB50);
  v3 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_56(v3);
  v4 = OUTLINED_FUNCTION_0_0();
  v5 = OUTLINED_FUNCTION_65(v4);
  v1[11] = OUTLINED_FUNCTION_15_27(v5);
  v6 = OUTLINED_FUNCTION_16();
  v7 = OUTLINED_FUNCTION_45_15(v6);
  v1[13] = v7;
  v1[14] = *(_QWORD *)(v7 - 8);
  v8 = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_51_11(v8);
  v1[16] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465D5014()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  type metadata accessor for ReadMailCATsSimple();
  OUTLINED_FUNCTION_24_10();
  v1 = OUTLINED_FUNCTION_17_11();
  OUTLINED_FUNCTION_83_6(v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v2;
  OUTLINED_FUNCTION_77_6(v2, (uint64_t)sub_2465D506C);
  return sub_24658123C();
}

uint64_t sub_2465D506C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_24_19();
  if (!v1)
  {
    OUTLINED_FUNCTION_78_5();
    *(_QWORD *)(v2 + 160) = v0;
  }
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_10_1();
}

#error "2465D511C: call analysis failed (funcsize=38)"

uint64_t sub_2465D515C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_246568A3C;
  return sub_2465D4F80(a1);
}

uint64_t sub_2465D51AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[2] = a1;
  v2 = sub_2465DAEB4();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB50);
  v1[6] = OUTLINED_FUNCTION_0_0();
  sub_2465DC42C();
  v1[7] = OUTLINED_FUNCTION_0_0();
  v3 = sub_2465DB520();
  v1[8] = v3;
  v1[9] = *(_QWORD *)(v3 - 8);
  v1[10] = OUTLINED_FUNCTION_5();
  v1[11] = OUTLINED_FUNCTION_16();
  v4 = sub_2465DB838();
  v1[12] = v4;
  v1[13] = *(_QWORD *)(v4 - 8);
  v1[14] = OUTLINED_FUNCTION_0_0();
  sub_2465DC7E0();
  v1[15] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_26();
}

uint64_t sub_2465D5274()
{
  uint64_t v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_24_10();
  *(_QWORD *)(v0 + 128) = OUTLINED_FUNCTION_17_11();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  OUTLINED_FUNCTION_77_6(v1, (uint64_t)sub_2465D52CC);
  return sub_246553BFC();
}

uint64_t sub_2465D52CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_5_6();
  *v4 = *v3;
  *(_QWORD *)(v2 + 144) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    swift_release();
    *(_QWORD *)(v2 + 152) = v0;
  }
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_10_1();
}

#error "2465D53B8: call analysis failed (funcsize=82)"

uint64_t sub_2465D5484()
{
  OUTLINED_FUNCTION_50_2();
  OUTLINED_FUNCTION_2_0();
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_62();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_2465D54CC()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  OUTLINED_FUNCTION_19();

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_46();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_19_11();
  return OUTLINED_FUNCTION_13(v1);
}

uint64_t sub_2465D552C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_79_7();
  swift_release();
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_49();
  return OUTLINED_FUNCTION_0_24(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2465D5588()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for GenericError()
{
  return objc_opt_self();
}

uint64_t *sub_2465D55B8(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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

void type metadata accessor for AccountNotFoundOutputGenerator()
{
  OUTLINED_FUNCTION_54_9();
}

void type metadata accessor for UnsupportedDeviceOutputGenerator()
{
  OUTLINED_FUNCTION_54_9();
}

uint64_t sub_2465D5610(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24656895C;
  return sub_2465D51AC(a1);
}

void type metadata accessor for UnsupportedActionOutputGenerator()
{
  OUTLINED_FUNCTION_54_9();
}

uint64_t sub_2465D566C(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t sub_2465D56A4(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t sub_2465D56DC(uint64_t a1, int a2)
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

uint64_t sub_2465D571C(uint64_t result, int a2, int a3)
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

void type metadata accessor for UnsupportedLockedInCarPlay()
{
  OUTLINED_FUNCTION_54_9();
}

uint64_t sub_2465D5770(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 8;
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1(v1);
}

uint64_t sub_2465D5798(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = a2 + 8;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  v5 = v4;
  v6 = **(void (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);
  swift_retain();
  v6(a1 + 8, v3, v5);
  return a1;
}

_QWORD *sub_2465D5800(_QWORD *a1, _QWORD *a2)
{
  uint64_t *v3;

  v3 = a2 + 1;
  *a1 = *a2;
  swift_retain();
  swift_release();
  __swift_assign_boxed_opaque_existential_1(a1 + 1, v3);
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

uint64_t sub_2465D5868(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t sub_2465D58BC(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 48))
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

uint64_t sub_2465D58FC(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for UnsupportedContactNoEmailAddress()
{
  OUTLINED_FUNCTION_54_9();
}

uint64_t OUTLINED_FUNCTION_1_23()
{
  _QWORD *v0;

  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_2_31()
{
  _QWORD *v0;

  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_15_27(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 72) = a1;
  *(_QWORD *)(v1 + 80) = *(_QWORD *)(a1 - 8);
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_17_28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(void))
{
  return a8();
}

uint64_t OUTLINED_FUNCTION_23_23()
{
  return sub_2465DB4E4();
}

uint64_t OUTLINED_FUNCTION_24_19()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 152) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_45_15(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = a1;
  return sub_2465DB838();
}

uint64_t OUTLINED_FUNCTION_51_11(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = a1;
  return sub_2465DC7E0();
}

void OUTLINED_FUNCTION_53_13()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_54_10()
{
  return sub_2465DAE9C();
}

uint64_t OUTLINED_FUNCTION_55_13()
{
  return sub_2465DAEA8();
}

uint64_t OUTLINED_FUNCTION_61_9()
{
  return sub_2465DB7C0();
}

uint64_t OUTLINED_FUNCTION_63_12()
{
  uint64_t v0;

  return sub_24656C368(v0);
}

uint64_t OUTLINED_FUNCTION_65_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_71_5(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 16);
}

uint64_t OUTLINED_FUNCTION_72_7(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_73_7(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = result;
  return result;
}

_QWORD *OUTLINED_FUNCTION_77_6@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *result = v2;
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_78_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_83_6(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 136) = result;
  return result;
}

uint64_t sub_2465D5B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15[4];

  sub_2465DBD30();
  if (!v15[3])
  {
    sub_246534910((uint64_t)v15, &qword_25758CF30);
    goto LABEL_7;
  }
  sub_2465DBD78();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_7:
    if (qword_25758C700 != -1)
      swift_once();
    v2 = sub_2465DCE04();
    __swift_project_value_buffer(v2, (uint64_t)qword_257591790);
    OUTLINED_FUNCTION_3_32();
    v3 = sub_2465DCDEC();
    v4 = sub_2465DD038();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      v15[0] = OUTLINED_FUNCTION_3_3();
      *(_DWORD *)v5 = 136315138;
      sub_2465DBF70();
      OUTLINED_FUNCTION_24_13();
      v6 = sub_2465DCE88();
      sub_2465C8EE0(v6, v7, v15);
      sub_2465DD0A4();
      OUTLINED_FUNCTION_5_28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24652E000, v3, v4, "Could not extract the usoNoEntity from the usoTask=%s", v5, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }

    goto LABEL_17;
  }
  OUTLINED_FUNCTION_24_13();
  sub_2465DBBD4();
  OUTLINED_FUNCTION_3();
  if (!v15[0] || (v0 = sub_2465DBCC4(), swift_release(), !v0))
  {
    if (qword_25758C700 != -1)
      swift_once();
    v8 = sub_2465DCE04();
    __swift_project_value_buffer(v8, (uint64_t)qword_257591790);
    OUTLINED_FUNCTION_3_32();
    v9 = sub_2465DCDEC();
    v10 = sub_2465DD038();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_3_3();
      v15[0] = OUTLINED_FUNCTION_3_3();
      *(_DWORD *)v11 = 136315138;
      OUTLINED_FUNCTION_24_13();
      v12 = sub_2465DCE88();
      sub_2465C8EE0(v12, v13, v15);
      sub_2465DD0A4();
      OUTLINED_FUNCTION_5_28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24652E000, v9, v10, "Could not extract the listPosition from the usoNoEntity=%s", v11, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }

LABEL_17:
    swift_release_n();
    return 0;
  }
  v1 = sub_2465D5FBC();
  OUTLINED_FUNCTION_3();
  swift_release();
  return v1;
}

uint64_t UsoEntity.description.getter()
{
  uint64_t v0;

  sub_2465DBD3C();
  sub_2465DBE44();
  sub_2465D5F5C();
  v0 = sub_2465DD260();
  OUTLINED_FUNCTION_3();
  return v0;
}

unint64_t sub_2465D5F5C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25758EA00;
  if (!qword_25758EA00)
  {
    v1 = sub_2465DBE44();
    result = MEMORY[0x2495605E4](MEMORY[0x24BEA3548], v1);
    atomic_store(result, (unint64_t *)&qword_25758EA00);
  }
  return result;
}

uint64_t sub_2465D5F9C()
{
  return UsoEntity.description.getter();
}

uint64_t sub_2465D5FBC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v11)(char *, char *, uint64_t);
  int v12;
  uint64_t v13;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591BB0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2465DBDD8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - v8;
  sub_2465DBDCC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v2, 1, v3) == 1)
  {
    sub_246534910((uint64_t)v2, &qword_257591BB0);
    return 0;
  }
  v11 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v11(v9, v2, v3);
  v11(v7, v9, v3);
  v12 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
  if (v12 == *MEMORY[0x24BEA1210])
    return 4;
  if (v12 == *MEMORY[0x24BEA1220])
    return 2;
  if (v12 == *MEMORY[0x24BEA1140])
    return 1;
  if (v12 == *MEMORY[0x24BEA11B0])
    return 24;
  if (v12 == *MEMORY[0x24BEA1180])
    return 17;
  if (v12 == *MEMORY[0x24BEA1208])
    return 8;
  if (v12 == *MEMORY[0x24BEA1188])
    return -3;
  if (v12 == *MEMORY[0x24BEA11F0])
    return 6;
  if (v12 == *MEMORY[0x24BEA1170])
    return 19;
  if (v12 == *MEMORY[0x24BEA1190])
    return 25;
  if (v12 == *MEMORY[0x24BEA11E8])
    return 9;
  if (v12 == *MEMORY[0x24BEA1240])
    return 11;
  if (v12 == *MEMORY[0x24BEA11C0])
    return -1;
  if (v12 == *MEMORY[0x24BEA1168])
    return 14;
  if (v12 == *MEMORY[0x24BEA11A8])
    return -2;
  if (v12 == *MEMORY[0x24BEA1198])
    return 21;
  if (v12 == *MEMORY[0x24BEA1178])
    return 13;
  if (v12 == *MEMORY[0x24BEA11C8])
    return -1;
  if (v12 == *MEMORY[0x24BEA11B8])
    return 22;
  if (v12 == *MEMORY[0x24BEA1148])
    return 15;
  if (v12 == *MEMORY[0x24BEA1158])
    return 20;
  if (v12 == *MEMORY[0x24BEA11D8])
    return 5;
  if (v12 == *MEMORY[0x24BEA1150])
    return 16;
  if (v12 == *MEMORY[0x24BEA11E0])
    return 1;
  if (v12 == *MEMORY[0x24BEA1230])
    return 7;
  if (v12 == *MEMORY[0x24BEA1160])
    return 18;
  if (v12 == *MEMORY[0x24BEA11A0])
    return 23;
  if (v12 == *MEMORY[0x24BEA1238])
    return 12;
  if (v12 == *MEMORY[0x24BEA1200])
    return 3;
  if (v12 != *MEMORY[0x24BEA11F8])
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return 0;
  }
  return 10;
}

uint64_t OUTLINED_FUNCTION_3_32()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_5_28()
{
  return swift_release_n();
}

void static DynamicTask.== infix(_:_:)()
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
  void (*v15)(uint64_t);
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  void *v19;
  os_log_type_t v20;
  _DWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  OUTLINED_FUNCTION_14_0();
  v6 = v5;
  v32 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA58);
  v33 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_77_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_63_3();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_27_18();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_104_3();
  sub_2465DBC40();
  OUTLINED_FUNCTION_101_4();
  OUTLINED_FUNCTION_113_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_111_2();
  v14 = v3 + v13;
  OUTLINED_FUNCTION_18_21(v3, v32);
  OUTLINED_FUNCTION_18_21(v14, v6);
  if (OUTLINED_FUNCTION_66_6())
  {
    if (OUTLINED_FUNCTION_66_6())
    {
      v15 = *(void (**)(uint64_t))(v33 + 32);
      v16 = OUTLINED_FUNCTION_89_8();
      v15(v16);
      ((void (*)(uint64_t, uint64_t, uint64_t))v15)(v0, v2, v8);
      OUTLINED_FUNCTION_100_0();
      sub_2465D6780();
      v17 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
      v17(v0, v8);
      v17(v1, v8);
      OUTLINED_FUNCTION_67_8(v14);
      OUTLINED_FUNCTION_67_8(v3);
      OUTLINED_FUNCTION_4_3();
      return;
    }
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v4, v8);
  }
  if (qword_25758C700 != -1)
    swift_once();
  v18 = OUTLINED_FUNCTION_5_9();
  v19 = (void *)__swift_project_value_buffer(v18, (uint64_t)qword_257591790);
  sub_2465DCDEC();
  v20 = OUTLINED_FUNCTION_81_6();
  if (OUTLINED_FUNCTION_4_4(v20))
  {
    v21 = (_DWORD *)OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_3_3();
    *v21 = 136315138;
    v22 = OUTLINED_FUNCTION_84_4();
    v24 = OUTLINED_FUNCTION_41_5(v22, v23);
    OUTLINED_FUNCTION_39_12(v24);
    OUTLINED_FUNCTION_16_6();
    OUTLINED_FUNCTION_48_11(&dword_24652E000, v25, v26, "== not defined for DynamicTask<%s>");
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_1();
  }

  sub_2465DD158();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_84_4();
  sub_2465DCEDC();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_37_16();
  OUTLINED_FUNCTION_99_3();
  static Logger.logAndCrash(_:file:line:)(v27, v28, v29, v30, v31, 20);
  __break(1u);
}

void sub_2465D6780()
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
  char v21;
  char v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_14_0();
  v27 = v1;
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DA58);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_5_3();
  v28 = v6;
  OUTLINED_FUNCTION_8_2();
  v8 = MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_106_4(v8, v9, v10, v11, v12, v13, v14, v15, v25);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_21_3();
  v19 = v17 - v18;
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_33_15();
  OUTLINED_FUNCTION_65_3();
  sub_246545C20(&qword_25758DA98, (uint64_t (*)(uint64_t))MEMORY[0x24BE998F8], MEMORY[0x24BE998D0]);
  sub_246545C20(&qword_25758CB68, MEMORY[0x24BE999A8], MEMORY[0x24BE99828]);
  sub_2465DBC28();
  OUTLINED_FUNCTION_27_10();
  OUTLINED_FUNCTION_65_3();
  sub_2465DBC28();
  OUTLINED_FUNCTION_91_1();
  OUTLINED_FUNCTION_93_3();
  v22 = v21;
  sub_246545BE8(v19, &qword_25758D4F8);
  sub_246545BE8(v0, &qword_25758D4F8);
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v23(v26, v3, v4);
  v23(v28, v27, v4);
  if ((v22 & 1) != 0)
  {
    OUTLINED_FUNCTION_65_3();
    sub_2465DBC28();
    OUTLINED_FUNCTION_27_10();
    OUTLINED_FUNCTION_65_3();
    sub_2465DBC28();
    OUTLINED_FUNCTION_91_1();
    OUTLINED_FUNCTION_93_3();
    sub_246545BE8(v19, &qword_25758D4F8);
    sub_246545BE8(v0, &qword_25758D4F8);
  }
  v24 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v24(v28, v4);
  v24(v26, v4);
  OUTLINED_FUNCTION_4_3();
}

void sub_2465D69CC()
{
  static DynamicTask.== infix(_:_:)();
}

void static Entity.== infix(_:_:)()
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
  void (*v16)(uint64_t, uint64_t, uint64_t);
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  void *v19;
  os_log_type_t v20;
  _DWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  OUTLINED_FUNCTION_14_0();
  v32 = v5;
  v33 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CF40);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_25_22();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_77_7();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_27_18();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_104_3();
  v11 = sub_2465DBF58();
  OUTLINED_FUNCTION_101_4();
  OUTLINED_FUNCTION_113_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_111_2();
  v14 = v3 + v13;
  v15 = *(_QWORD *)(v11 - 8);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v16(v3, v32, v11);
  v16(v14, v33, v11);
  if (OUTLINED_FUNCTION_60_10())
  {
    if (OUTLINED_FUNCTION_60_10())
    {
      sub_246596034(v4, v1, &qword_25758CF40);
      sub_246596034(v2, v0, &qword_25758CF40);
      sub_2465D6C8C();
      OUTLINED_FUNCTION_18_17(v0);
      OUTLINED_FUNCTION_18_17(v1);
      v17 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
      v17(v14, v11);
      v17(v3, v11);
      OUTLINED_FUNCTION_4_3();
      return;
    }
    sub_246545BE8(v4, &qword_25758CF40);
  }
  if (qword_25758C700 != -1)
    swift_once();
  v18 = OUTLINED_FUNCTION_5_9();
  v19 = (void *)__swift_project_value_buffer(v18, (uint64_t)qword_257591790);
  sub_2465DCDEC();
  v20 = OUTLINED_FUNCTION_81_6();
  if (OUTLINED_FUNCTION_4_4(v20))
  {
    v21 = (_DWORD *)OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_3_3();
    *v21 = 136315138;
    v22 = OUTLINED_FUNCTION_84_4();
    v24 = OUTLINED_FUNCTION_41_5(v22, v23);
    OUTLINED_FUNCTION_39_12(v24);
    OUTLINED_FUNCTION_16_6();
    OUTLINED_FUNCTION_48_11(&dword_24652E000, v25, v26, "== not defined for Entity<%s>");
    OUTLINED_FUNCTION_14_1();
    OUTLINED_FUNCTION_1();
  }

  sub_2465DD158();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_84_4();
  sub_2465DCEDC();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_37_16();
  OUTLINED_FUNCTION_99_3();
  static Logger.logAndCrash(_:file:line:)(v27, v28, v29, v30, v31, 32);
  __break(1u);
}

void sub_2465D6C8C()
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
  BOOL v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  uint64_t (*v53)(uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  void (*v60)(uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  OUTLINED_FUNCTION_14_0();
  v6 = v5;
  v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD68);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v9);
  v67 = (uint64_t)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v11);
  v66 = (uint64_t)&v64 - v12;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v13);
  v68 = (char *)&v64 - v14;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_33_15();
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE38);
  v70 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  OUTLINED_FUNCTION_5_3();
  v65 = v16;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_38_1();
  v69 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD98);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_45_16();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_38_1();
  v74 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CF40);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_21_3();
  OUTLINED_FUNCTION_80_7();
  MEMORY[0x24BDAC7A8](v23);
  v73 = (uint64_t)&v64 - v24;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v25);
  v75 = (uint64_t)&v64 - v26;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_63_3();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_44_10();
  OUTLINED_FUNCTION_6_31(v8, v0);
  v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
  v30 = OUTLINED_FUNCTION_110();
  v32 = OUTLINED_FUNCTION_9_8(v30, v31, v29);
  if (v40)
  {
    OUTLINED_FUNCTION_54_8(v32, &qword_25758CF40);
    v71 = 0;
    v34 = 0;
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CB70, (uint64_t (*)(uint64_t))MEMORY[0x24BE99750], MEMORY[0x24BE99708]);
    v71 = sub_2465DBF10();
    v34 = v33;
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_5_14(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8));
  }
  OUTLINED_FUNCTION_85_7(v6, v35, &qword_25758CF40);
  v36 = OUTLINED_FUNCTION_9_8(v1, 1, v29);
  if (v40)
  {
    OUTLINED_FUNCTION_72_6(v36, &qword_25758CF40);
    if (!v34)
      goto LABEL_20;
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  v64 = v3;
  swift_getKeyPath();
  sub_246545C20(&qword_25758CB70, (uint64_t (*)(uint64_t))MEMORY[0x24BE99750], MEMORY[0x24BE99708]);
  v37 = OUTLINED_FUNCTION_46_13();
  v39 = v38;
  swift_release();
  OUTLINED_FUNCTION_5_14(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8));
  if (!v34)
  {
    v3 = v64;
    if (!v39)
      goto LABEL_20;
    goto LABEL_18;
  }
  v3 = v64;
  if (!v39)
    goto LABEL_18;
  v40 = v71 == v37 && v34 == v39;
  if (v40)
  {
    OUTLINED_FUNCTION_21_4();
    OUTLINED_FUNCTION_27();
  }
  else
  {
    v41 = OUTLINED_FUNCTION_3_14();
    OUTLINED_FUNCTION_21_4();
    OUTLINED_FUNCTION_27();
    if ((v41 & 1) == 0)
      goto LABEL_30;
  }
LABEL_20:
  v42 = v75;
  sub_24659608C(v8, v75, &qword_25758CF40);
  OUTLINED_FUNCTION_9_8(v42, 1, v29);
  if (v40)
  {
    sub_246545BE8(v42, &qword_25758CF40);
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE08);
    v46 = v74;
    OUTLINED_FUNCTION_0_5(v74, v44, v45, v43);
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CB70, (uint64_t (*)(uint64_t))MEMORY[0x24BE99750], MEMORY[0x24BE99708]);
    sub_246545C20(&qword_25758D200, (uint64_t (*)(uint64_t))MEMORY[0x24BE99650], MEMORY[0x24BE99618]);
    v46 = v74;
    OUTLINED_FUNCTION_58_11();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_5_14(v42, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8));
  }
  v47 = v73;
  sub_24659608C(v6, v73, &qword_25758CF40);
  OUTLINED_FUNCTION_9_8(v47, 1, v29);
  if (v40)
  {
    sub_246545BE8(v47, &qword_25758CF40);
    v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE08);
    OUTLINED_FUNCTION_0_5(v3, v49, v50, v48);
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CB70, (uint64_t (*)(uint64_t))MEMORY[0x24BE99750], MEMORY[0x24BE99708]);
    sub_246545C20(&qword_25758D200, (uint64_t (*)(uint64_t))MEMORY[0x24BE99650], MEMORY[0x24BE99618]);
    OUTLINED_FUNCTION_58_11();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_5_14(v47, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8));
  }
  OUTLINED_FUNCTION_89_8();
  sub_2465D7F20();
  v52 = v51;
  OUTLINED_FUNCTION_18_4(v3);
  OUTLINED_FUNCTION_18_4(v46);
  if ((v52 & 1) != 0)
  {
    sub_24659608C(v8, v4, &qword_25758CF40);
    sub_2465DCAF8();
    v53 = (uint64_t (*)(uint64_t))MEMORY[0x24BE99818];
    sub_2465DCA74();
    sub_246545C20(&qword_25758CE48, v53, MEMORY[0x24BE99760]);
    OUTLINED_FUNCTION_114_1();
    sub_2465DBF4C();
    v54 = v72;
    OUTLINED_FUNCTION_9_8(v2, 1, v72);
    if (v40)
    {
      v57 = v2;
    }
    else
    {
      v55 = v69;
      OUTLINED_FUNCTION_18_21(v69, v2);
      sub_24659608C(v6, v4, &qword_25758CF40);
      OUTLINED_FUNCTION_114_1();
      v57 = v56;
      sub_2465DBF4C();
      OUTLINED_FUNCTION_9_8(v57, 1, v54);
      if (!v58)
      {
        v61 = v65;
        OUTLINED_FUNCTION_18_21(v65, v57);
        v62 = v66;
        OUTLINED_FUNCTION_18_21(v66, v55);
        OUTLINED_FUNCTION_1_19(v62);
        v63 = v67;
        OUTLINED_FUNCTION_18_21(v67, v61);
        OUTLINED_FUNCTION_1_19(v63);
        OUTLINED_FUNCTION_100_0();
        sub_2465D8698();
        OUTLINED_FUNCTION_18_4(v63);
        OUTLINED_FUNCTION_18_4(v62);
        OUTLINED_FUNCTION_67_8(v61);
        OUTLINED_FUNCTION_67_8(v55);
        goto LABEL_30;
      }
      v59 = OUTLINED_FUNCTION_76_0();
      v60(v59);
    }
    sub_246545BE8(v57, &qword_25758CD68);
  }
LABEL_30:
  OUTLINED_FUNCTION_4_3();
}

void sub_2465D7334()
{
  static Entity.== infix(_:_:)();
}

void sub_2465D733C()
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
  char *v11;
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
  void (*v34)(uint64_t, char *, uint64_t);
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  void (*v46)(uint64_t, uint64_t, uint64_t);
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v81[2];
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;

  OUTLINED_FUNCTION_14_0();
  v5 = v4;
  v7 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758D4F8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_25_22();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v81 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CB60);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v85 = (uint64_t)v81 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v15);
  v92 = (uint64_t)v81 - v16;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v17);
  v87 = (uint64_t)v81 - v18;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v19);
  v88 = (uint64_t)v81 - v20;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v21);
  v89 = (uint64_t)v81 - v22;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v23);
  v90 = (uint64_t)v81 - v24;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v25);
  v91 = (char *)v81 - v26;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v27);
  v86 = (uint64_t)v81 - v28;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_45_16();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_131();
  MEMORY[0x24BDAC7A8](v31);
  v93 = (uint64_t)v81 - v32;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_33_15();
  sub_24659608C(v7, (uint64_t)v11, &qword_25758D4F8);
  OUTLINED_FUNCTION_9_8((uint64_t)v11, 1, v12);
  if (v36)
  {
    sub_246545BE8((uint64_t)v11, &qword_25758D4F8);
    OUTLINED_FUNCTION_9_8(v5, 1, v12);
    goto LABEL_26;
  }
  v34 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v34(v1, v11, v12);
  OUTLINED_FUNCTION_29_13(v5, v35, &qword_25758D4F8);
  OUTLINED_FUNCTION_9_8(v0, 1, v12);
  if (v36)
  {
    v37 = OUTLINED_FUNCTION_58_4(v1, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    OUTLINED_FUNCTION_54_8(v37, &qword_25758D4F8);
    goto LABEL_26;
  }
  v34(v93, (char *)v0, v12);
  OUTLINED_FUNCTION_23_24();
  sub_246545C20(&qword_25758CB68, MEMORY[0x24BE999A8], MEMORY[0x24BE99828]);
  v39 = v38;
  sub_246545C20(&qword_25758CB70, (uint64_t (*)(uint64_t))MEMORY[0x24BE99750], MEMORY[0x24BE99708]);
  v84 = v13;
  v41 = v40;
  sub_2465DBF34();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_23_24();
  v83 = v41;
  v42 = v84;
  v43 = v93;
  sub_2465DBF34();
  OUTLINED_FUNCTION_36_5();
  OUTLINED_FUNCTION_86_6();
  v45 = v44;
  OUTLINED_FUNCTION_21_4();
  OUTLINED_FUNCTION_27();
  v46 = *(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16);
  OUTLINED_FUNCTION_117_1(v2, v1);
  v81[1] = v46;
  v46(v3, v43, v12);
  v82 = v1;
  v81[0] = v39;
  if ((v45 & 1) != 0)
  {
    OUTLINED_FUNCTION_23_24();
    sub_2465DBF34();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_23_24();
    sub_2465DBF34();
    OUTLINED_FUNCTION_36_5();
    sub_2465D7C3C();
    v48 = v47;
    OUTLINED_FUNCTION_21_4();
    v1 = v82;
    swift_bridgeObjectRelease();
    v49 = (uint64_t)v91;
    v42 = v84;
  }
  else
  {
    v48 = 0;
    v49 = (uint64_t)v91;
  }
  v50 = *(_QWORD *)(v42 + 8);
  OUTLINED_FUNCTION_2_32(v3);
  OUTLINED_FUNCTION_2_32(v2);
  v51 = v86;
  OUTLINED_FUNCTION_11_26(v86, v1);
  v52 = v93;
  OUTLINED_FUNCTION_11_26(v49, v93);
  if ((v48 & 1) == 0)
  {
    OUTLINED_FUNCTION_2_32(v49);
    OUTLINED_FUNCTION_2_32(v51);
    v56 = v90;
    OUTLINED_FUNCTION_11_26(v90, v1);
    v57 = v89;
    OUTLINED_FUNCTION_11_26(v89, v52);
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_23_24();
  v84 = v50;
  sub_2465DBF34();
  v1 = v82;
  swift_release();
  OUTLINED_FUNCTION_23_24();
  v53 = (uint64_t)v91;
  sub_2465DBF34();
  OUTLINED_FUNCTION_36_5();
  OUTLINED_FUNCTION_86_6();
  v55 = v54;
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_2_32(v53);
  OUTLINED_FUNCTION_2_32(v51);
  v56 = v90;
  OUTLINED_FUNCTION_11_26(v90, v1);
  v57 = v89;
  OUTLINED_FUNCTION_11_26(v89, v52);
  if ((v55 & 1) == 0)
  {
LABEL_22:
    OUTLINED_FUNCTION_2_32(v57);
    OUTLINED_FUNCTION_2_32(v56);
    v61 = v88;
    OUTLINED_FUNCTION_11_26(v88, v1);
    v62 = v87;
    OUTLINED_FUNCTION_11_26(v87, v52);
    goto LABEL_23;
  }
  swift_getKeyPath();
  sub_2465DBF34();
  swift_release();
  swift_getKeyPath();
  v58 = v89;
  sub_2465DBF34();
  swift_release();
  OUTLINED_FUNCTION_86_6();
  v60 = v59;
  OUTLINED_FUNCTION_35_13();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_2_32(v58);
  OUTLINED_FUNCTION_2_32(v90);
  v61 = v88;
  OUTLINED_FUNCTION_11_26(v88, v1);
  v62 = v87;
  OUTLINED_FUNCTION_11_26(v87, v93);
  if ((v60 & 1) == 0)
  {
LABEL_23:
    OUTLINED_FUNCTION_2_32(v62);
    OUTLINED_FUNCTION_2_32(v61);
LABEL_24:
    v72 = v93;
    v71 = v85;
    OUTLINED_FUNCTION_11_26(v92, v1);
    OUTLINED_FUNCTION_11_26(v71, v72);
    goto LABEL_25;
  }
  v63 = v62;
  OUTLINED_FUNCTION_23_24();
  v91 = (char *)OUTLINED_FUNCTION_107_4();
  v65 = v64;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_23_24();
  v66 = sub_2465DBF10();
  v68 = v67;
  OUTLINED_FUNCTION_10_0();
  if (!v65)
  {
    OUTLINED_FUNCTION_2_32(v63);
    OUTLINED_FUNCTION_2_32(v61);
    if (!v68)
    {
LABEL_32:
      OUTLINED_FUNCTION_11_26(v92, v82);
      v71 = v85;
      OUTLINED_FUNCTION_11_26(v85, v93);
      goto LABEL_33;
    }
    OUTLINED_FUNCTION_27();
    goto LABEL_30;
  }
  if (!v68)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_2_32(v87);
    OUTLINED_FUNCTION_2_32(v88);
    OUTLINED_FUNCTION_2_6();
LABEL_30:
    v1 = v82;
    goto LABEL_24;
  }
  if (v91 == (char *)v66 && v65 == v68)
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_2_32(v87);
    OUTLINED_FUNCTION_2_32(v88);
    OUTLINED_FUNCTION_12_3();
    goto LABEL_32;
  }
  v70 = OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_2_32(v87);
  OUTLINED_FUNCTION_2_32(v88);
  OUTLINED_FUNCTION_12_3();
  v1 = v82;
  OUTLINED_FUNCTION_11_26(v92, v82);
  v71 = v85;
  v72 = v93;
  OUTLINED_FUNCTION_11_26(v85, v93);
  if ((v70 & 1) == 0)
  {
LABEL_25:
    OUTLINED_FUNCTION_2_32(v71);
    OUTLINED_FUNCTION_2_32(v92);
    OUTLINED_FUNCTION_2_32(v72);
    OUTLINED_FUNCTION_2_32(v1);
    goto LABEL_26;
  }
LABEL_33:
  OUTLINED_FUNCTION_23_24();
  v73 = sub_2465DBF10();
  v75 = v74;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_23_24();
  v76 = OUTLINED_FUNCTION_107_4();
  v78 = v77;
  OUTLINED_FUNCTION_10_0();
  if (v75)
  {
    v79 = v82;
    if (v78)
    {
      if (v73 != v76 || v75 != v78)
      {
        OUTLINED_FUNCTION_100_0();
        OUTLINED_FUNCTION_3_14();
      }
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_2_32(v71);
      OUTLINED_FUNCTION_2_32(v92);
      OUTLINED_FUNCTION_2_32(v93);
      OUTLINED_FUNCTION_2_32(v79);
      OUTLINED_FUNCTION_2();
    }
    else
    {
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_2_32(v71);
      OUTLINED_FUNCTION_2_32(v92);
      OUTLINED_FUNCTION_2_32(v93);
      OUTLINED_FUNCTION_2_32(v79);
      OUTLINED_FUNCTION_2_6();
    }
  }
  else
  {
    OUTLINED_FUNCTION_2_32(v71);
    OUTLINED_FUNCTION_2_32(v92);
    OUTLINED_FUNCTION_2_32(v93);
    OUTLINED_FUNCTION_2_32(v82);
    if (v78)
      OUTLINED_FUNCTION_27();
  }
LABEL_26:
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465D7BBC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758DB38);
  MEMORY[0x24BDAC7A8](v2);
  sub_24659608C(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_25758DB38);
  return sub_2465DCBD0();
}

void sub_2465D7C3C()
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t);
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
  char v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
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

  OUTLINED_FUNCTION_14_0();
  v1 = v0;
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CF40);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_5_3();
  v51 = v5;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_38_1();
  v50 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25758CB78);
  v54 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v49 = (uint64_t)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591BD0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5_3();
  v47 = v11;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v12);
  v46 = (uint64_t)&v41 - v13;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v14);
  v45 = (uint64_t)&v41 - v15;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_38_1();
  v44 = v17;
  v18 = *(_QWORD *)(v1 + 16);
  v52 = *(_QWORD *)(v3 + 16);
  if (v52 == v18)
  {
    v19 = v1;
    OUTLINED_FUNCTION_4_9();
    swift_bridgeObjectRetain();
    v20 = 0;
    v41 = v1;
    v42 = v3;
    do
    {
      v43 = v52 == v20;
      if (v52 == v20)
        break;
      v21 = (*(unsigned __int8 *)(v54 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
      v22 = *(_QWORD *)(v54 + 72) * v20;
      v23 = v54;
      OUTLINED_FUNCTION_18_21(v49, v3 + v21 + v22);
      ++v20;
      v24 = v19 + v21 + v22;
      v25 = v48;
      v26 = v44;
      v27 = v44 + *(int *)(v48 + 48);
      v28 = *(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32);
      OUTLINED_FUNCTION_87_7(v44);
      OUTLINED_FUNCTION_18_21(v27, v24);
      v29 = v26;
      v30 = v45;
      sub_246596034(v29, v45, &qword_257591BD0);
      v31 = *(int *)(v25 + 48);
      v32 = v46 + v31;
      v53 = v46 + v31;
      v33 = v30 + v31;
      OUTLINED_FUNCTION_18_21(v46, v30);
      OUTLINED_FUNCTION_18_21(v32, v33);
      v34 = v50;
      OUTLINED_FUNCTION_87_7(v50);
      OUTLINED_FUNCTION_1_19(v34);
      v35 = v47;
      v36 = v47 + *(int *)(v25 + 48);
      OUTLINED_FUNCTION_18_21(v47, v30);
      OUTLINED_FUNCTION_18_21(v36, v33);
      v37 = v51;
      v38 = v36;
      v19 = v41;
      v28(v51, v38, v8);
      OUTLINED_FUNCTION_1_19(v37);
      sub_2465D6C8C();
      LOBYTE(v33) = v39;
      OUTLINED_FUNCTION_18_17(v37);
      OUTLINED_FUNCTION_18_17(v34);
      v40 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
      v40(v35, v8);
      v40(v53, v8);
      v3 = v42;
      sub_246545BE8(v30, &qword_257591BD0);
    }
    while ((v33 & 1) != 0);
    OUTLINED_FUNCTION_12_3();
    OUTLINED_FUNCTION_8_1();
  }
  OUTLINED_FUNCTION_4_3();
}

void sub_2465D7F20()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v41;
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
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void (*v58)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v59;
  _DWORD *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void (*v68)(uint64_t, char *, uint64_t);
  os_log_type_t v69;
  _DWORD *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;

  OUTLINED_FUNCTION_14_0();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD98);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_25_22();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v82 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE08);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_45_16();
  MEMORY[0x24BDAC7A8](v10);
  v83 = (uint64_t)&v82 - v11;
  OUTLINED_FUNCTION_8_2();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v82 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v84 = (uint64_t)&v82 - v16;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v17);
  v85 = (uint64_t)&v82 - v18;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v19);
  v86 = (char *)&v82 - v20;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v82 - v22;
  v24 = OUTLINED_FUNCTION_76_0();
  sub_24659608C(v24, v25, &qword_25758CD98);
  OUTLINED_FUNCTION_9_8((uint64_t)v7, 1, v8);
  if (v28)
  {
    sub_246545BE8((uint64_t)v7, &qword_25758CD98);
    OUTLINED_FUNCTION_9_8(v3, 1, v8);
LABEL_20:
    OUTLINED_FUNCTION_4_3();
    return;
  }
  v26 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
  v26(v23, v7, v8);
  OUTLINED_FUNCTION_29_13(v3, v27, &qword_25758CD98);
  OUTLINED_FUNCTION_9_8(v0, 1, v8);
  if (v28)
  {
    v29 = OUTLINED_FUNCTION_58_4((uint64_t)v23, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    OUTLINED_FUNCTION_54_8(v29, &qword_25758CD98);
    goto LABEL_20;
  }
  v30 = (uint64_t)v86;
  v26(v86, (char *)v0, v8);
  v31 = sub_2465D8E50((uint64_t)v23);
  v82 = v9;
  if (v31)
  {
    v86 = v23;
    if (qword_25758C700 != -1)
      swift_once();
    v56 = OUTLINED_FUNCTION_5_9();
    v57 = (void *)__swift_project_value_buffer(v56, (uint64_t)qword_257591790);
    v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v82 + 16);
    OUTLINED_FUNCTION_41_13(v1);
    sub_2465DCDEC();
    v59 = OUTLINED_FUNCTION_81_6();
    if (OUTLINED_FUNCTION_32_5(v59))
    {
      v60 = (_DWORD *)OUTLINED_FUNCTION_3_3();
      v87 = OUTLINED_FUNCTION_3_3();
      *v60 = 136315138;
      v58(v83, v1, v8);
      v61 = OUTLINED_FUNCTION_71_6();
      v63 = OUTLINED_FUNCTION_41_5(v61, v62);
      OUTLINED_FUNCTION_40_14(v63);
      OUTLINED_FUNCTION_21_4();
      OUTLINED_FUNCTION_58_4(v1, *(uint64_t (**)(uint64_t, uint64_t))(v82 + 8));
      OUTLINED_FUNCTION_47_12(&dword_24652E000, v64, v65, "== not defined for given ContactAddress subclass: <%s>");
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_58_4(v1, *(uint64_t (**)(uint64_t, uint64_t))(v82 + 8));

    OUTLINED_FUNCTION_55_14();
    OUTLINED_FUNCTION_56_10();
    OUTLINED_FUNCTION_41_13(v83);
    OUTLINED_FUNCTION_71_6();
    OUTLINED_FUNCTION_102_4();
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_37_16();
    OUTLINED_FUNCTION_99_3();
    v81 = 93;
  }
  else
  {
    if (!sub_2465D8E50(v30))
    {
      swift_getKeyPath();
      sub_246545C20(&qword_25758D200, (uint64_t (*)(uint64_t))MEMORY[0x24BE99650], MEMORY[0x24BE99618]);
      v32 = (uint64_t)v23;
      v33 = OUTLINED_FUNCTION_46_13();
      v35 = v34;
      OUTLINED_FUNCTION_5_21();
      swift_getKeyPath();
      v36 = OUTLINED_FUNCTION_53_14();
      v38 = v37;
      OUTLINED_FUNCTION_5_21();
      if (v35)
      {
        v39 = v85;
        if (v38)
        {
          if (v33 != v36 || v35 != v38)
          {
            OUTLINED_FUNCTION_100_0();
            v41 = OUTLINED_FUNCTION_3_14();
            OUTLINED_FUNCTION_2();
            OUTLINED_FUNCTION_27();
            v42 = v30;
            v43 = v32;
            OUTLINED_FUNCTION_117_1(v39, v32);
            v44 = v84;
            v45 = OUTLINED_FUNCTION_89_8();
            OUTLINED_FUNCTION_117_1(v45, v46);
            if ((v41 & 1) != 0)
            {
LABEL_23:
              swift_getKeyPath();
              v47 = OUTLINED_FUNCTION_53_14();
              v49 = v48;
              OUTLINED_FUNCTION_5_21();
              swift_getKeyPath();
              v50 = OUTLINED_FUNCTION_46_13();
              v52 = v51;
              OUTLINED_FUNCTION_5_21();
              if (v49)
              {
                v53 = (uint64_t)v86;
                if (v52)
                {
                  v54 = v47 == v50 && v49 == v52;
                  v55 = v85;
                  if (!v54)
                    OUTLINED_FUNCTION_3_14();
                  OUTLINED_FUNCTION_27();
                  OUTLINED_FUNCTION_0_13(v84);
                  OUTLINED_FUNCTION_0_13(v55);
                  OUTLINED_FUNCTION_0_13(v53);
                  OUTLINED_FUNCTION_0_13(v32);
                  OUTLINED_FUNCTION_12_3();
                }
                else
                {
                  swift_bridgeObjectRetain();
                  OUTLINED_FUNCTION_0_13(v84);
                  OUTLINED_FUNCTION_0_13(v85);
                  OUTLINED_FUNCTION_0_13(v53);
                  OUTLINED_FUNCTION_0_13(v32);
                  OUTLINED_FUNCTION_2_6();
                }
              }
              else
              {
                OUTLINED_FUNCTION_70_6(v44);
                OUTLINED_FUNCTION_70_6(v39);
                OUTLINED_FUNCTION_70_6((uint64_t)v86);
                OUTLINED_FUNCTION_70_6(v32);
                if (v52)
                  OUTLINED_FUNCTION_27();
              }
              goto LABEL_20;
            }
            goto LABEL_19;
          }
          OUTLINED_FUNCTION_2();
          OUTLINED_FUNCTION_27();
LABEL_22:
          OUTLINED_FUNCTION_117_1(v39, v32);
          v44 = v84;
          OUTLINED_FUNCTION_117_1(v84, v30);
          goto LABEL_23;
        }
      }
      else
      {
        v39 = v85;
        if (!v38)
          goto LABEL_22;
      }
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_117_1(v39, v32);
      v44 = v84;
      OUTLINED_FUNCTION_117_1(v84, v30);
      v42 = v30;
      v43 = v32;
LABEL_19:
      OUTLINED_FUNCTION_0_13(v44);
      OUTLINED_FUNCTION_0_13(v39);
      OUTLINED_FUNCTION_0_13(v42);
      OUTLINED_FUNCTION_0_13(v43);
      goto LABEL_20;
    }
    if (qword_25758C700 != -1)
      swift_once();
    v66 = OUTLINED_FUNCTION_5_9();
    v67 = (void *)__swift_project_value_buffer(v66, (uint64_t)qword_257591790);
    v68 = *(void (**)(uint64_t, char *, uint64_t))(v82 + 16);
    OUTLINED_FUNCTION_41_13((uint64_t)v15);
    sub_2465DCDEC();
    v69 = OUTLINED_FUNCTION_81_6();
    if (OUTLINED_FUNCTION_32_5(v69))
    {
      v70 = (_DWORD *)OUTLINED_FUNCTION_3_3();
      v87 = OUTLINED_FUNCTION_3_3();
      *v70 = 136315138;
      v68(v83, v15, v8);
      v71 = OUTLINED_FUNCTION_71_6();
      v73 = OUTLINED_FUNCTION_41_5(v71, v72);
      OUTLINED_FUNCTION_40_14(v73);
      OUTLINED_FUNCTION_12_3();
      OUTLINED_FUNCTION_58_4((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t))(v82 + 8));
      OUTLINED_FUNCTION_47_12(&dword_24652E000, v74, v75, "== not defined for given ContactAddress subclass: <%s>");
      OUTLINED_FUNCTION_14_1();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_58_4((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t))(v82 + 8));

    OUTLINED_FUNCTION_55_14();
    OUTLINED_FUNCTION_56_10();
    OUTLINED_FUNCTION_41_13(v83);
    OUTLINED_FUNCTION_71_6();
    OUTLINED_FUNCTION_102_4();
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_37_16();
    OUTLINED_FUNCTION_99_3();
    v81 = 97;
  }
  static Logger.logAndCrash(_:file:line:)(v76, v77, v78, v79, v80, v81);
  __break(1u);
}

void sub_2465D8698()
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
  char *v13;
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
  uint64_t (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  BOOL v53;
  char v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
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
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;

  OUTLINED_FUNCTION_14_0();
  v7 = v6;
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDD0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_3_6();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v85 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDA8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_5_3();
  v91 = v15;
  OUTLINED_FUNCTION_8_2();
  v17 = MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_106_4(v17, v18, v19, v20, v21, v22, v23, v24, v85);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD68);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_5_3();
  v87 = v26;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v27);
  v89 = (char *)&v85 - v28;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_27_18();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_80_7();
  MEMORY[0x24BDAC7A8](v31);
  v90 = (uint64_t)&v85 - v32;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_77_7();
  MEMORY[0x24BDAC7A8](v34);
  v96 = (uint64_t *)((char *)&v85 - v35);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v36);
  v95 = (uint64_t)&v85 - v37;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_63_3();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_44_10();
  v94 = v9;
  sub_24659608C(v9, v1, &qword_25758CD68);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE38);
  v41 = OUTLINED_FUNCTION_110();
  v43 = OUTLINED_FUNCTION_9_8(v41, v42, v40);
  v92 = v0;
  v88 = v13;
  if (v53)
  {
    OUTLINED_FUNCTION_54_8(v43, &qword_25758CD68);
    v44 = 0;
    v46 = 0;
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CE48, (uint64_t (*)(uint64_t))MEMORY[0x24BE99818], MEMORY[0x24BE99760]);
    v44 = sub_2465DBF10();
    v46 = v45;
    swift_release();
    OUTLINED_FUNCTION_100_4();
    OUTLINED_FUNCTION_20_3(v1, v47);
  }
  OUTLINED_FUNCTION_85_7(v7, v48, &qword_25758CD68);
  v49 = OUTLINED_FUNCTION_9_8(v3, 1, v40);
  if (v53)
  {
    OUTLINED_FUNCTION_72_6(v49, &qword_25758CD68);
    v3 = v4;
    v4 = v5;
    v44 = v94;
    if (!v46)
      goto LABEL_22;
LABEL_19:
    OUTLINED_FUNCTION_35_13();
    v56 = v95;
    OUTLINED_FUNCTION_6_31(v44, v95);
    v55 = v96;
    OUTLINED_FUNCTION_6_31(v7, (uint64_t)v96);
    goto LABEL_20;
  }
  v86 = v7;
  swift_getKeyPath();
  sub_246545C20(&qword_25758CE48, (uint64_t (*)(uint64_t))MEMORY[0x24BE99818], MEMORY[0x24BE99760]);
  v7 = OUTLINED_FUNCTION_46_13();
  v51 = v50;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_100_4();
  OUTLINED_FUNCTION_20_3(v3, v52);
  if (!v46)
  {
    OUTLINED_FUNCTION_43_13();
    if (!v51)
      goto LABEL_22;
    goto LABEL_19;
  }
  if (!v51)
  {
    OUTLINED_FUNCTION_43_13();
    goto LABEL_19;
  }
  v53 = v44 == v7 && v46 == v51;
  if (v53)
  {
    OUTLINED_FUNCTION_35_13();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_43_13();
LABEL_22:
    v56 = v95;
    OUTLINED_FUNCTION_6_31(v44, v95);
    v55 = v96;
    OUTLINED_FUNCTION_6_31(v7, (uint64_t)v96);
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_76_0();
  v54 = OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_35_13();
  OUTLINED_FUNCTION_27();
  v55 = &qword_25758CD68;
  v44 = v94;
  v56 = v95;
  v57 = OUTLINED_FUNCTION_76_0();
  OUTLINED_FUNCTION_20_23(v57, v58);
  v7 = v86;
  OUTLINED_FUNCTION_88_3(v86, (uint64_t)v96);
  v3 = v4;
  v4 = v5;
  if ((v54 & 1) == 0)
  {
LABEL_20:
    OUTLINED_FUNCTION_18_17((uint64_t)v55);
    OUTLINED_FUNCTION_18_17(v56);
    OUTLINED_FUNCTION_6_31(v44, v4);
    OUTLINED_FUNCTION_6_31(v7, v3);
    goto LABEL_33;
  }
LABEL_23:
  sub_24659608C(v56, v2, &qword_25758CD68);
  OUTLINED_FUNCTION_9_8(v2, 1, v40);
  if (v53)
  {
    sub_246545BE8(v2, &qword_25758CD68);
    v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDF8);
    OUTLINED_FUNCTION_0_5(v93, v60, v61, v59);
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CE48, (uint64_t (*)(uint64_t))MEMORY[0x24BE99818], MEMORY[0x24BE99760]);
    sub_246545C20(&qword_25758D240, MEMORY[0x24BE996E0], MEMORY[0x24BE996C8]);
    sub_2465DBEF8();
    v55 = v96;
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_100_4();
    OUTLINED_FUNCTION_20_3(v2, v62);
  }
  v64 = v91;
  v63 = v92;
  v65 = v90;
  sub_24659608C((uint64_t)v55, v90, &qword_25758CD68);
  OUTLINED_FUNCTION_9_8(v65, 1, v40);
  if (v53)
  {
    sub_246545BE8(v65, &qword_25758CD68);
    v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDF8);
    OUTLINED_FUNCTION_0_5(v64, v67, v68, v66);
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CE48, (uint64_t (*)(uint64_t))MEMORY[0x24BE99818], MEMORY[0x24BE99760]);
    sub_246545C20(&qword_25758D240, MEMORY[0x24BE996E0], MEMORY[0x24BE996C8]);
    sub_2465DBEF8();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_100_4();
    OUTLINED_FUNCTION_20_3(v65, v69);
  }
  v70 = v93;
  v71 = sub_2465D8FB4(v93, v64);
  OUTLINED_FUNCTION_18_4(v64);
  OUTLINED_FUNCTION_18_4(v70);
  OUTLINED_FUNCTION_18_4((uint64_t)v96);
  OUTLINED_FUNCTION_18_4(v95);
  OUTLINED_FUNCTION_20_23(v44, v4);
  OUTLINED_FUNCTION_20_23(v7, v3);
  if ((v71 & 1) != 0)
  {
    v73 = (uint64_t)v89;
    OUTLINED_FUNCTION_94_3(v4, v72, &qword_25758CD68);
    v74 = OUTLINED_FUNCTION_9_8(v73, 1, v40);
    if (v53)
    {
      OUTLINED_FUNCTION_98_3(v74, &qword_25758CD68);
      v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDD8);
      v78 = (uint64_t)v88;
      OUTLINED_FUNCTION_0_5((uint64_t)v88, v76, v77, v75);
    }
    else
    {
      swift_getKeyPath();
      sub_246545C20(&qword_25758CE48, (uint64_t (*)(uint64_t))MEMORY[0x24BE99818], MEMORY[0x24BE99760]);
      sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
      v78 = (uint64_t)v88;
      OUTLINED_FUNCTION_57_8();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_20_3(v73, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 8));
    }
    v80 = v87;
    OUTLINED_FUNCTION_94_3(v3, v79, &qword_25758CD68);
    v81 = OUTLINED_FUNCTION_9_8(v80, 1, v40);
    if (v53)
    {
      OUTLINED_FUNCTION_98_3(v81, &qword_25758CD68);
      v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDD8);
      OUTLINED_FUNCTION_0_5(v63, v83, v84, v82);
    }
    else
    {
      swift_getKeyPath();
      sub_246545C20(&qword_25758CE48, (uint64_t (*)(uint64_t))MEMORY[0x24BE99818], MEMORY[0x24BE99760]);
      sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
      OUTLINED_FUNCTION_57_8();
      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_20_3(v80, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 8));
    }
    sub_2465D91C0();
    OUTLINED_FUNCTION_18_4(v63);
    OUTLINED_FUNCTION_18_4(v78);
  }
LABEL_33:
  OUTLINED_FUNCTION_18_4(v3);
  OUTLINED_FUNCTION_18_4(v4);
  OUTLINED_FUNCTION_4_3();
}

BOOL sub_2465D8E50(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CD98);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591BB8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CE08);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v4, a1, v8);
  __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v8);
  sub_2465DC948();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BE99578];
  sub_2465DC9CC();
  sub_246545C20(&qword_257591BC0, v9, MEMORY[0x24BE99570]);
  sub_2465DBF4C();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591BC8);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v10) != 1;
  sub_246545BE8((uint64_t)v7, &qword_257591BB8);
  return v11;
}

uint64_t sub_2465D8FB4(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  char v21;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDA8);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_6();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_44_10();
  sub_24659608C(a1, v3, &qword_25758CDA8);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDF8);
  v9 = OUTLINED_FUNCTION_110();
  v11 = OUTLINED_FUNCTION_9_8(v9, v10, v8);
  if (v20)
  {
    OUTLINED_FUNCTION_54_8(v11, &qword_25758CDA8);
    v12 = 0;
    v14 = 0;
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758D240, MEMORY[0x24BE996E0], MEMORY[0x24BE996C8]);
    v12 = sub_2465DBF10();
    v14 = v13;
    OUTLINED_FUNCTION_91_1();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v3, v8);
  }
  OUTLINED_FUNCTION_103_4(a2, v15, &qword_25758CDA8);
  v16 = OUTLINED_FUNCTION_9_8(v2, 1, v8);
  if (v20)
  {
    OUTLINED_FUNCTION_44_2(v16, &qword_25758CDA8);
    if (v14)
    {
LABEL_15:
      v21 = 0;
LABEL_20:
      OUTLINED_FUNCTION_2();
      return v21 & 1;
    }
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758D240, MEMORY[0x24BE996E0], MEMORY[0x24BE996C8]);
    v17 = sub_2465DBF10();
    v19 = v18;
    OUTLINED_FUNCTION_91_1();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v2, v8);
    if (v14)
    {
      if (v19)
      {
        v20 = v12 == v17 && v14 == v19;
        if (v20)
        {
          OUTLINED_FUNCTION_2();
          v21 = 1;
        }
        else
        {
          v21 = OUTLINED_FUNCTION_3_14();
          OUTLINED_FUNCTION_2();
        }
        goto LABEL_20;
      }
      goto LABEL_15;
    }
    if (v19)
    {
      v21 = 0;
      goto LABEL_20;
    }
  }
  v21 = 1;
  return v21 & 1;
}

void sub_2465D91C0()
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
  uint64_t KeyPath;
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
  BOOL v59;
  char v60;
  uint64_t *v61;
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
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char v129;
  uint64_t v130;
  uint64_t v131;
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
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t *v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t *v165;
  uint64_t v166;

  OUTLINED_FUNCTION_14_0();
  v7 = v6;
  v9 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDD0);
  OUTLINED_FUNCTION_1_6();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5_3();
  v148 = v11;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_10_10();
  v149 = v13;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_27_18();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_80_7();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_10_10();
  v150 = v17;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_10_10();
  v151 = v19;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v20);
  v159 = (char *)&v146 - v21;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v22);
  v158 = (char *)&v146 - v23;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_10_10();
  v152 = v25;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_10_10();
  v153 = v27;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v28);
  v164 = (uint64_t *)((char *)&v146 - v29);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v30);
  v160 = (uint64_t)&v146 - v31;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_10_10();
  v154 = v33;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_10_10();
  v155 = v35;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v36);
  v162 = (uint64_t *)((char *)&v146 - v37);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v38);
  v161 = (uint64_t)&v146 - v39;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_10_10();
  v157 = v41;
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_45_16();
  MEMORY[0x24BDAC7A8](v43);
  v165 = (uint64_t *)((char *)&v146 - v44);
  OUTLINED_FUNCTION_8_2();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_131();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_63_3();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_44_10();
  v163 = v9;
  sub_24659608C(v9, v0, &qword_25758CDD0);
  KeyPath = __swift_instantiateConcreteTypeFromMangledName(&qword_25758CDD8);
  v49 = OUTLINED_FUNCTION_9_8(v0, 1, KeyPath);
  v166 = KeyPath;
  if (v59)
  {
    OUTLINED_FUNCTION_54_8(v49, &qword_25758CDD0);
    v50 = 0;
    v52 = 0;
  }
  else
  {
    KeyPath = swift_getKeyPath();
    sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
    v50 = OUTLINED_FUNCTION_73_8();
    v52 = v51;
    OUTLINED_FUNCTION_110_4();
    OUTLINED_FUNCTION_58_4(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(KeyPath - 8) + 8));
  }
  OUTLINED_FUNCTION_85_7(v7, v53, &qword_25758CDD0);
  v54 = OUTLINED_FUNCTION_9_8(v1, 1, KeyPath);
  if (v59)
  {
    OUTLINED_FUNCTION_72_6(v54, &qword_25758CDD0);
    v55 = (uint64_t)v164;
    if (!v52)
      goto LABEL_23;
LABEL_19:
    OUTLINED_FUNCTION_35_13();
    v62 = v163;
    OUTLINED_FUNCTION_6_31(v163, v3);
    v61 = v165;
    OUTLINED_FUNCTION_6_31(v7, (uint64_t)v165);
    v63 = v161;
    goto LABEL_20;
  }
  v156 = v3;
  v147 = v2;
  swift_getKeyPath();
  sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
  v56 = OUTLINED_FUNCTION_46_13();
  v58 = v57;
  swift_release();
  OUTLINED_FUNCTION_58_4(v1, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(KeyPath - 8) + 8));
  if (!v52)
  {
    v2 = v147;
    v55 = (uint64_t)v164;
    v3 = v156;
    if (!v58)
      goto LABEL_23;
    goto LABEL_19;
  }
  v55 = (uint64_t)v164;
  if (!v58)
  {
    v2 = v147;
    v3 = v156;
    goto LABEL_19;
  }
  v59 = v50 == v56 && v52 == v58;
  if (v59)
  {
    OUTLINED_FUNCTION_35_13();
    OUTLINED_FUNCTION_27();
    v2 = v147;
    v3 = v156;
LABEL_23:
    v62 = v163;
    OUTLINED_FUNCTION_6_31(v163, v3);
    v61 = v165;
    OUTLINED_FUNCTION_6_31(v7, (uint64_t)v165);
    goto LABEL_24;
  }
  v60 = OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_35_13();
  OUTLINED_FUNCTION_27();
  v61 = &qword_25758CDD0;
  v62 = v163;
  v3 = v156;
  OUTLINED_FUNCTION_20_23(v163, v156);
  OUTLINED_FUNCTION_88_3(v7, (uint64_t)v165);
  v2 = v147;
  v63 = v161;
  if ((v60 & 1) == 0)
  {
LABEL_20:
    v64 = v2;
    v65 = v5;
    OUTLINED_FUNCTION_18_17((uint64_t)v61);
    OUTLINED_FUNCTION_18_17(v3);
LABEL_21:
    v66 = (uint64_t)v158;
    v67 = v160;
LABEL_40:
    OUTLINED_FUNCTION_6_31(v62, v63);
    v81 = (uint64_t)v162;
    OUTLINED_FUNCTION_6_31(v7, (uint64_t)v162);
    goto LABEL_41;
  }
LABEL_24:
  sub_24659608C(v3, v4, &qword_25758CDD0);
  v68 = v166;
  OUTLINED_FUNCTION_9_8(v4, 1, v166);
  if (v59)
  {
    sub_246545BE8(v4, &qword_25758CDD0);
    v69 = 0;
    v71 = 0;
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
    v69 = sub_2465DBF10();
    v71 = v70;
    v61 = v165;
    v68 = v166;
    swift_release();
    OUTLINED_FUNCTION_58_4(v4, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v68 - 8) + 8));
  }
  v73 = (uint64_t)v61;
  v74 = v157;
  OUTLINED_FUNCTION_29_13(v73, v72, &qword_25758CDD0);
  v75 = OUTLINED_FUNCTION_9_8(v74, 1, v68);
  if (v59)
  {
    OUTLINED_FUNCTION_54_8(v75, &qword_25758CDD0);
    if (v71)
    {
LABEL_39:
      v64 = v2;
      v65 = v5;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_18_17((uint64_t)v165);
      OUTLINED_FUNCTION_18_17(v3);
      OUTLINED_FUNCTION_2_6();
      v66 = (uint64_t)v158;
      v67 = v160;
      v63 = v161;
      v55 = (uint64_t)v164;
      goto LABEL_40;
    }
    v79 = 0;
    v63 = v161;
    goto LABEL_50;
  }
  v147 = v69;
  v156 = v3;
  swift_getKeyPath();
  sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
  v76 = v68;
  v77 = sub_2465DBF10();
  v79 = v78;
  OUTLINED_FUNCTION_36_5();
  OUTLINED_FUNCTION_5_14(v74, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 8));
  if (!v71)
  {
    v62 = v163;
    v63 = v161;
    v3 = v156;
LABEL_50:
    v64 = v2;
    OUTLINED_FUNCTION_18_4((uint64_t)v165);
    OUTLINED_FUNCTION_18_4(v3);
    v55 = (uint64_t)v164;
    if (!v79)
    {
LABEL_53:
      v65 = v5;
      OUTLINED_FUNCTION_6_31(v62, v63);
      OUTLINED_FUNCTION_6_31(v7, (uint64_t)v162);
      v66 = (uint64_t)v158;
      goto LABEL_54;
    }
    v65 = v5;
    OUTLINED_FUNCTION_8_1();
    goto LABEL_21;
  }
  v62 = v163;
  v3 = v156;
  if (!v79)
    goto LABEL_39;
  v64 = v2;
  if (v147 == v77 && v71 == v79)
  {
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_18_17((uint64_t)v165);
    OUTLINED_FUNCTION_18_17(v3);
    OUTLINED_FUNCTION_29_1();
    v63 = v161;
    goto LABEL_53;
  }
  v65 = v5;
  LODWORD(v157) = OUTLINED_FUNCTION_14_24();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_18_4((uint64_t)v165);
  OUTLINED_FUNCTION_18_4(v3);
  OUTLINED_FUNCTION_29_1();
  v63 = v161;
  OUTLINED_FUNCTION_20_23(v62, v161);
  v81 = (uint64_t)v162;
  OUTLINED_FUNCTION_20_23(v7, (uint64_t)v162);
  v66 = (uint64_t)v158;
  v67 = v160;
  v55 = (uint64_t)v164;
  if ((v157 & 1) == 0)
  {
LABEL_41:
    OUTLINED_FUNCTION_18_17(v81);
    OUTLINED_FUNCTION_18_17(v63);
    v83 = v65;
    v84 = v64;
    v85 = (uint64_t)v159;
    goto LABEL_42;
  }
LABEL_54:
  v86 = v155;
  OUTLINED_FUNCTION_29_13(v63, v82, &qword_25758CDD0);
  v87 = OUTLINED_FUNCTION_110();
  v88 = v166;
  v90 = OUTLINED_FUNCTION_9_8(v87, v89, v166);
  if (v59)
  {
    OUTLINED_FUNCTION_54_8(v90, &qword_25758CDD0);
    v91 = 0;
    v93 = 0;
  }
  else
  {
    v88 = swift_getKeyPath();
    sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
    v91 = OUTLINED_FUNCTION_73_8();
    v93 = v92;
    OUTLINED_FUNCTION_110_4();
    OUTLINED_FUNCTION_58_4(v86, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v88 - 8) + 8));
  }
  v83 = v65;
  v95 = v154;
  OUTLINED_FUNCTION_29_13((uint64_t)v162, v94, &qword_25758CDD0);
  v96 = OUTLINED_FUNCTION_9_8(v95, 1, v88);
  v84 = v64;
  if (v59)
  {
    OUTLINED_FUNCTION_54_8(v96, &qword_25758CDD0);
    v85 = (uint64_t)v159;
    if (v93)
    {
LABEL_69:
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_18_17((uint64_t)v162);
      OUTLINED_FUNCTION_18_17(v161);
      OUTLINED_FUNCTION_2_6();
      v67 = v160;
      v55 = (uint64_t)v164;
      goto LABEL_42;
    }
    v100 = 0;
    goto LABEL_71;
  }
  v165 = (uint64_t *)v91;
  swift_getKeyPath();
  sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
  v97 = v95;
  v98 = sub_2465DBF10();
  v100 = v99;
  OUTLINED_FUNCTION_27_10();
  OUTLINED_FUNCTION_58_4(v97, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v88 - 8) + 8));
  v85 = (uint64_t)v159;
  if (!v93)
  {
    v62 = v163;
LABEL_71:
    OUTLINED_FUNCTION_18_17((uint64_t)v162);
    OUTLINED_FUNCTION_18_17(v161);
    v55 = (uint64_t)v164;
    if (!v100)
    {
LABEL_74:
      v67 = v160;
      OUTLINED_FUNCTION_6_31(v62, v160);
      OUTLINED_FUNCTION_6_31(v7, v55);
      goto LABEL_75;
    }
    OUTLINED_FUNCTION_27();
    v67 = v160;
LABEL_42:
    OUTLINED_FUNCTION_6_31(v62, v67);
    OUTLINED_FUNCTION_6_31(v7, v55);
LABEL_43:
    OUTLINED_FUNCTION_18_17(v55);
    OUTLINED_FUNCTION_18_17(v67);
    goto LABEL_44;
  }
  v62 = v163;
  if (!v100)
    goto LABEL_69;
  if (v165 == (uint64_t *)v98 && v93 == v100)
  {
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_18_17((uint64_t)v162);
    OUTLINED_FUNCTION_18_17(v161);
    OUTLINED_FUNCTION_29_1();
    v55 = (uint64_t)v164;
    goto LABEL_74;
  }
  v102 = OUTLINED_FUNCTION_3_14();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_18_4((uint64_t)v162);
  OUTLINED_FUNCTION_18_4(v161);
  OUTLINED_FUNCTION_29_1();
  v103 = v160;
  OUTLINED_FUNCTION_20_23(v62, v160);
  v55 = (uint64_t)v164;
  v67 = v103;
  sub_24659608C(v7, (uint64_t)v164, &qword_25758CDD0);
  if ((v102 & 1) == 0)
    goto LABEL_43;
LABEL_75:
  v105 = v153;
  OUTLINED_FUNCTION_103_4(v67, v104, &qword_25758CDD0);
  v106 = v166;
  v107 = OUTLINED_FUNCTION_9_8(v105, 1, v166);
  if (v59)
  {
    OUTLINED_FUNCTION_44_2(v107, &qword_25758CDD0);
    v165 = 0;
    v109 = 0;
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
    v165 = (uint64_t *)OUTLINED_FUNCTION_54_11();
    v109 = v108;
    v55 = (uint64_t)v164;
    swift_release();
    OUTLINED_FUNCTION_4_20();
  }
  v111 = v152;
  OUTLINED_FUNCTION_29_13(v55, v110, &qword_25758CDD0);
  v112 = OUTLINED_FUNCTION_9_8(v111, 1, v106);
  if (v59)
  {
    OUTLINED_FUNCTION_54_8(v112, &qword_25758CDD0);
    if (v109)
    {
LABEL_90:
      OUTLINED_FUNCTION_4_9();
      OUTLINED_FUNCTION_18_4((uint64_t)v164);
      OUTLINED_FUNCTION_18_4(v160);
      OUTLINED_FUNCTION_2_6();
      goto LABEL_44;
    }
    v114 = 0;
    goto LABEL_92;
  }
  swift_getKeyPath();
  sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
  v162 = (uint64_t *)OUTLINED_FUNCTION_72_8();
  v114 = v113;
  OUTLINED_FUNCTION_36_5();
  OUTLINED_FUNCTION_4_20();
  if (!v109)
  {
    v62 = v163;
LABEL_92:
    OUTLINED_FUNCTION_18_17((uint64_t)v164);
    OUTLINED_FUNCTION_18_17(v160);
    if (!v114)
    {
LABEL_95:
      OUTLINED_FUNCTION_6_31(v62, v66);
      OUTLINED_FUNCTION_6_31(v7, v85);
      goto LABEL_96;
    }
    OUTLINED_FUNCTION_29_1();
LABEL_44:
    OUTLINED_FUNCTION_6_31(v62, v66);
    OUTLINED_FUNCTION_6_31(v7, v85);
LABEL_45:
    OUTLINED_FUNCTION_18_17(v85);
    OUTLINED_FUNCTION_18_17(v66);
    goto LABEL_46;
  }
  v62 = v163;
  if (!v114)
    goto LABEL_90;
  if (v165 == v162 && v109 == v114)
  {
    OUTLINED_FUNCTION_29_1();
    OUTLINED_FUNCTION_18_4((uint64_t)v164);
    OUTLINED_FUNCTION_18_4(v160);
    OUTLINED_FUNCTION_8_1();
    goto LABEL_95;
  }
  v116 = OUTLINED_FUNCTION_14_24();
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_18_4((uint64_t)v164);
  OUTLINED_FUNCTION_18_4(v160);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_20_23(v62, v66);
  OUTLINED_FUNCTION_20_23(v7, v85);
  if ((v116 & 1) == 0)
    goto LABEL_45;
LABEL_96:
  v118 = v151;
  OUTLINED_FUNCTION_103_4(v66, v117, &qword_25758CDD0);
  v119 = v166;
  v120 = OUTLINED_FUNCTION_9_8(v118, 1, v166);
  if (v59)
  {
    OUTLINED_FUNCTION_44_2(v120, &qword_25758CDD0);
    v165 = 0;
    v122 = 0;
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
    v165 = (uint64_t *)OUTLINED_FUNCTION_54_11();
    v122 = v121;
    OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_4_20();
  }
  v124 = v150;
  OUTLINED_FUNCTION_29_13(v85, v123, &qword_25758CDD0);
  v125 = OUTLINED_FUNCTION_9_8(v124, 1, v119);
  if (v59)
  {
    OUTLINED_FUNCTION_54_8(v125, &qword_25758CDD0);
    if (v122)
    {
LABEL_111:
      OUTLINED_FUNCTION_4_9();
      OUTLINED_FUNCTION_18_4(v85);
      OUTLINED_FUNCTION_18_4(v66);
      OUTLINED_FUNCTION_2_6();
      goto LABEL_46;
    }
    v127 = 0;
    goto LABEL_113;
  }
  swift_getKeyPath();
  sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
  v164 = (uint64_t *)OUTLINED_FUNCTION_72_8();
  v127 = v126;
  OUTLINED_FUNCTION_36_5();
  OUTLINED_FUNCTION_4_20();
  if (!v122)
  {
    v62 = v163;
LABEL_113:
    OUTLINED_FUNCTION_18_17(v85);
    OUTLINED_FUNCTION_18_17(v66);
    if (!v127)
    {
LABEL_116:
      OUTLINED_FUNCTION_6_31(v62, v83);
      OUTLINED_FUNCTION_6_31(v7, v84);
      goto LABEL_117;
    }
    OUTLINED_FUNCTION_29_1();
LABEL_46:
    OUTLINED_FUNCTION_6_31(v62, v83);
    OUTLINED_FUNCTION_6_31(v7, v84);
LABEL_47:
    OUTLINED_FUNCTION_18_17(v84);
    OUTLINED_FUNCTION_18_17(v83);
    goto LABEL_48;
  }
  v62 = v163;
  if (!v127)
    goto LABEL_111;
  if (v165 == v164 && v122 == v127)
  {
    OUTLINED_FUNCTION_29_1();
    OUTLINED_FUNCTION_18_4(v85);
    OUTLINED_FUNCTION_18_4(v66);
    OUTLINED_FUNCTION_8_1();
    goto LABEL_116;
  }
  v129 = OUTLINED_FUNCTION_14_24();
  OUTLINED_FUNCTION_29_1();
  OUTLINED_FUNCTION_18_4(v85);
  OUTLINED_FUNCTION_18_4(v66);
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_20_23(v62, v83);
  OUTLINED_FUNCTION_20_23(v7, v84);
  if ((v129 & 1) == 0)
    goto LABEL_47;
LABEL_117:
  v131 = v149;
  OUTLINED_FUNCTION_29_13(v83, v130, &qword_25758CDD0);
  v132 = OUTLINED_FUNCTION_110();
  v133 = v166;
  v135 = OUTLINED_FUNCTION_9_8(v132, v134, v166);
  if (v59)
  {
    OUTLINED_FUNCTION_54_8(v135, &qword_25758CDD0);
    v136 = 0;
    v138 = 0;
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
    OUTLINED_FUNCTION_89_8();
    v136 = sub_2465DBF10();
    v138 = v137;
    OUTLINED_FUNCTION_19_1();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v133 - 8) + 8))(v131, v133);
  }
  v140 = v148;
  OUTLINED_FUNCTION_94_3(v84, v139, &qword_25758CDD0);
  v141 = OUTLINED_FUNCTION_9_8(v140, 1, v133);
  if (v59)
  {
    OUTLINED_FUNCTION_98_3(v141, &qword_25758CDD0);
    if (v138)
      goto LABEL_131;
    v144 = 0;
  }
  else
  {
    swift_getKeyPath();
    sub_246545C20(&qword_25758CE58, MEMORY[0x24BE99410], MEMORY[0x24BE993E8]);
    v142 = sub_2465DBF10();
    v144 = v143;
    OUTLINED_FUNCTION_36_5();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v133 - 8) + 8))(v140, v133);
    if (v138)
    {
      if (v144)
      {
        if (v136 != v142 || v138 != v144)
          OUTLINED_FUNCTION_3_14();
        OUTLINED_FUNCTION_27();
        OUTLINED_FUNCTION_18_4(v84);
        OUTLINED_FUNCTION_18_4(v83);
        OUTLINED_FUNCTION_8_1();
        goto LABEL_48;
      }
LABEL_131:
      OUTLINED_FUNCTION_4_9();
      OUTLINED_FUNCTION_18_4(v84);
      OUTLINED_FUNCTION_18_4(v83);
      OUTLINED_FUNCTION_2_6();
      goto LABEL_48;
    }
  }
  OUTLINED_FUNCTION_18_17(v84);
  OUTLINED_FUNCTION_18_17(v83);
  if (v144)
    OUTLINED_FUNCTION_27();
LABEL_48:
  OUTLINED_FUNCTION_4_3();
}

uint64_t sub_2465DA2D0()
{
  return sub_2465DCBC4();
}

uint64_t OUTLINED_FUNCTION_2_32(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

void OUTLINED_FUNCTION_6_31(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_24659608C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_11_26(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_14_24()
{
  return sub_2465DD278();
}

uint64_t OUTLINED_FUNCTION_18_21(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

void OUTLINED_FUNCTION_20_23(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_24659608C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_23_24()
{
  return swift_getKeyPath();
}

void OUTLINED_FUNCTION_29_13(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_24659608C(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_37_16()
{
  return sub_2465DCEDC();
}

uint64_t OUTLINED_FUNCTION_39_12(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return sub_2465DD0A4();
}

uint64_t OUTLINED_FUNCTION_40_14(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return sub_2465DD0A4();
}

uint64_t OUTLINED_FUNCTION_41_13(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, _QWORD, uint64_t);
  uint64_t v3;

  return v2(a1, *(_QWORD *)(v3 - 112), v1);
}

uint64_t OUTLINED_FUNCTION_46_13()
{
  return sub_2465DBF10();
}

void OUTLINED_FUNCTION_47_12(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_48_11(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_53_14()
{
  return sub_2465DBF10();
}

uint64_t OUTLINED_FUNCTION_54_11()
{
  return sub_2465DBF10();
}

uint64_t OUTLINED_FUNCTION_55_14()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 96) = 0;
  *(_QWORD *)(v0 - 88) = 0xE000000000000000;
  return sub_2465DD158();
}

uint64_t OUTLINED_FUNCTION_56_10()
{
  return sub_2465DCEDC();
}

uint64_t OUTLINED_FUNCTION_57_8()
{
  return sub_2465DBEF8();
}

uint64_t OUTLINED_FUNCTION_58_11()
{
  return sub_2465DBEF8();
}

uint64_t OUTLINED_FUNCTION_60_10()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_65_3()
{
  return swift_getKeyPath();
}

uint64_t OUTLINED_FUNCTION_66_6()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_67_8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_70_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_71_6()
{
  return sub_2465DCE88();
}

uint64_t OUTLINED_FUNCTION_72_8()
{
  return sub_2465DBF10();
}

uint64_t OUTLINED_FUNCTION_73_8()
{
  return sub_2465DBF10();
}

uint64_t OUTLINED_FUNCTION_81_6()
{
  return sub_2465DD044();
}

uint64_t OUTLINED_FUNCTION_84_4()
{
  return sub_2465DD350();
}

void OUTLINED_FUNCTION_85_7(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_24659608C(a1, v3, a3);
}

void OUTLINED_FUNCTION_86_6()
{
  sub_2465D7C3C();
}

uint64_t OUTLINED_FUNCTION_87_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

void OUTLINED_FUNCTION_88_3(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_24659608C(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_89_8()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_93_3()
{
  sub_2465D733C();
}

void OUTLINED_FUNCTION_94_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_24659608C(a1, v3, a3);
}

void OUTLINED_FUNCTION_98_3(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_246545BE8(v2, a2);
}

uint64_t OUTLINED_FUNCTION_101_4()
{
  return swift_getTupleTypeMetadata2();
}

uint64_t OUTLINED_FUNCTION_102_4()
{
  return sub_2465DCEDC();
}

void OUTLINED_FUNCTION_103_4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_24659608C(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_104_3()
{
  return 255;
}

void OUTLINED_FUNCTION_106_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 112) = (char *)&a9 - v9;
}

uint64_t OUTLINED_FUNCTION_107_4()
{
  return sub_2465DBF10();
}

uint64_t OUTLINED_FUNCTION_110_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_114_1()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2465DA654()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v21;

  v0 = sub_2465DBA18();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591BD8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591BE0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v21 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v21 - v14;
  sub_2465DB9C4();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v13, *MEMORY[0x24BE9C1B8], v0);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v0);
  v16 = (uint64_t)&v6[*(int *)(v4 + 48)];
  sub_2465DA8DC((uint64_t)v15, (uint64_t)v6);
  sub_2465DA8DC((uint64_t)v13, v16);
  OUTLINED_FUNCTION_0_33((uint64_t)v6);
  if (v18)
  {
    sub_246534910((uint64_t)v13, &qword_257591BE0);
    sub_246534910((uint64_t)v15, &qword_257591BE0);
    OUTLINED_FUNCTION_0_33(v16);
    if (v18)
      v17 = -1;
    else
      v17 = 0;
  }
  else
  {
    sub_2465DA8DC((uint64_t)v6, (uint64_t)v10);
    OUTLINED_FUNCTION_0_33(v16);
    if (v18)
    {
      sub_246534910((uint64_t)v13, &qword_257591BE0);
      sub_246534910((uint64_t)v15, &qword_257591BE0);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
      v17 = 0;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v16, v0);
      sub_2465DA924();
      v17 = sub_2465DCE34();
      v19 = *(void (**)(char *, uint64_t))(v1 + 8);
      v19(v3, v0);
      OUTLINED_FUNCTION_41_6((uint64_t)v13);
      OUTLINED_FUNCTION_41_6((uint64_t)v15);
      v19(v10, v0);
    }
  }
  OUTLINED_FUNCTION_41_6((uint64_t)v6);
  return v17 & 1;
}

uint64_t sub_2465DA8DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257591BE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2465DA924()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257591BE8;
  if (!qword_257591BE8)
  {
    v1 = sub_2465DBA18();
    result = MEMORY[0x2495605E4](MEMORY[0x24BE9C1F0], v1);
    atomic_store(result, (unint64_t *)&qword_257591BE8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_33(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t sub_2465DA980()
{
  return MEMORY[0x24BDB4C50]();
}

uint64_t sub_2465DA98C()
{
  return MEMORY[0x24BDB4C58]();
}

uint64_t sub_2465DA998()
{
  return MEMORY[0x24BDB4C60]();
}

uint64_t sub_2465DA9A4()
{
  return MEMORY[0x24BDB4D38]();
}

uint64_t sub_2465DA9B0()
{
  return MEMORY[0x24BDB4D40]();
}

uint64_t sub_2465DA9BC()
{
  return MEMORY[0x24BDB58C8]();
}

uint64_t sub_2465DA9C8()
{
  return MEMORY[0x24BDB58D0]();
}

uint64_t sub_2465DA9D4()
{
  return MEMORY[0x24BDB58F0]();
}

uint64_t sub_2465DA9E0()
{
  return MEMORY[0x24BDB5908]();
}

uint64_t sub_2465DA9EC()
{
  return MEMORY[0x24BDB5918]();
}

uint64_t sub_2465DA9F8()
{
  return MEMORY[0x24BDB5928]();
}

uint64_t sub_2465DAA04()
{
  return MEMORY[0x24BDB5BC8]();
}

uint64_t sub_2465DAA10()
{
  return MEMORY[0x24BDB5BD8]();
}

uint64_t sub_2465DAA1C()
{
  return MEMORY[0x24BDB5BE0]();
}

uint64_t sub_2465DAA28()
{
  return MEMORY[0x24BDB5BE8]();
}

uint64_t sub_2465DAA34()
{
  return MEMORY[0x24BDB5BF0]();
}

uint64_t sub_2465DAA40()
{
  return MEMORY[0x24BDB5BF8]();
}

uint64_t sub_2465DAA4C()
{
  return MEMORY[0x24BDB5C00]();
}

uint64_t sub_2465DAA58()
{
  return MEMORY[0x24BDB5C08]();
}

uint64_t sub_2465DAA64()
{
  return MEMORY[0x24BDB5C10]();
}

uint64_t sub_2465DAA70()
{
  return MEMORY[0x24BDB5C18]();
}

uint64_t sub_2465DAA7C()
{
  return MEMORY[0x24BDB5C20]();
}

uint64_t sub_2465DAA88()
{
  return MEMORY[0x24BDB5C28]();
}

uint64_t sub_2465DAA94()
{
  return MEMORY[0x24BDB5C30]();
}

uint64_t sub_2465DAAA0()
{
  return MEMORY[0x24BDB5C38]();
}

uint64_t sub_2465DAAAC()
{
  return MEMORY[0x24BDB5C40]();
}

uint64_t sub_2465DAAB8()
{
  return MEMORY[0x24BDB5C48]();
}

uint64_t sub_2465DAAC4()
{
  return MEMORY[0x24BDB5C50]();
}

uint64_t sub_2465DAAD0()
{
  return MEMORY[0x24BDB5C58]();
}

uint64_t sub_2465DAADC()
{
  return MEMORY[0x24BDB5C60]();
}

uint64_t sub_2465DAAE8()
{
  return MEMORY[0x24BDB5C68]();
}

uint64_t sub_2465DAAF4()
{
  return MEMORY[0x24BDB5C70]();
}

uint64_t sub_2465DAB00()
{
  return MEMORY[0x24BDB5C78]();
}

uint64_t sub_2465DAB0C()
{
  return MEMORY[0x24BDB5C80]();
}

uint64_t sub_2465DAB18()
{
  return MEMORY[0x24BDB5C88]();
}

uint64_t sub_2465DAB24()
{
  return MEMORY[0x24BDB5C90]();
}

uint64_t sub_2465DAB30()
{
  return MEMORY[0x24BDB5C98]();
}

uint64_t sub_2465DAB3C()
{
  return MEMORY[0x24BDB5CA0]();
}

uint64_t sub_2465DAB48()
{
  return MEMORY[0x24BDB5CB0]();
}

uint64_t sub_2465DAB54()
{
  return MEMORY[0x24BDB5F88]();
}

uint64_t sub_2465DAB60()
{
  return MEMORY[0x24BDB5F90]();
}

uint64_t sub_2465DAB6C()
{
  return MEMORY[0x24BDB5F98]();
}

uint64_t sub_2465DAB78()
{
  return MEMORY[0x24BDB5FA0]();
}

uint64_t sub_2465DAB84()
{
  return MEMORY[0x24BDB5FA8]();
}

uint64_t sub_2465DAB90()
{
  return MEMORY[0x24BDB5FB0]();
}

uint64_t sub_2465DAB9C()
{
  return MEMORY[0x24BDB5FB8]();
}

uint64_t sub_2465DABA8()
{
  return MEMORY[0x24BDB5FC0]();
}

uint64_t sub_2465DABB4()
{
  return MEMORY[0x24BDB5FD0]();
}

uint64_t sub_2465DABC0()
{
  return MEMORY[0x24BDB60B0]();
}

uint64_t sub_2465DABCC()
{
  return MEMORY[0x24BDB60B8]();
}

uint64_t sub_2465DABD8()
{
  return MEMORY[0x24BDB60C0]();
}

uint64_t sub_2465DABE4()
{
  return MEMORY[0x24BDB60C8]();
}

uint64_t sub_2465DABF0()
{
  return MEMORY[0x24BDB60D0]();
}

uint64_t sub_2465DABFC()
{
  return MEMORY[0x24BDB60D8]();
}

uint64_t sub_2465DAC08()
{
  return MEMORY[0x24BDB60E0]();
}

uint64_t sub_2465DAC14()
{
  return MEMORY[0x24BDB60E8]();
}

uint64_t sub_2465DAC20()
{
  return MEMORY[0x24BDB60F0]();
}

uint64_t sub_2465DAC2C()
{
  return MEMORY[0x24BDB60F8]();
}

uint64_t sub_2465DAC38()
{
  return MEMORY[0x24BDB6100]();
}

uint64_t sub_2465DAC44()
{
  return MEMORY[0x24BDB6108]();
}

uint64_t sub_2465DAC50()
{
  return MEMORY[0x24BDB6110]();
}

uint64_t sub_2465DAC5C()
{
  return MEMORY[0x24BDB6118]();
}

uint64_t sub_2465DAC68()
{
  return MEMORY[0x24BDB6120]();
}

uint64_t sub_2465DAC74()
{
  return MEMORY[0x24BDB6130]();
}

uint64_t sub_2465DAC80()
{
  return MEMORY[0x24BDB6568]();
}

uint64_t sub_2465DAC8C()
{
  return MEMORY[0x24BDB6578]();
}

uint64_t sub_2465DAC98()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_2465DACA4()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2465DACB0()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_2465DACBC()
{
  return MEMORY[0x24BDCBAD0]();
}

uint64_t sub_2465DACC8()
{
  return MEMORY[0x24BDCBAE8]();
}

uint64_t sub_2465DACD4()
{
  return MEMORY[0x24BDCBB28]();
}

uint64_t sub_2465DACE0()
{
  return MEMORY[0x24BDCBB68]();
}

uint64_t sub_2465DACEC()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_2465DACF8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_2465DAD04()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_2465DAD10()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_2465DAD1C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_2465DAD28()
{
  return MEMORY[0x24BDCC268]();
}

uint64_t sub_2465DAD34()
{
  return MEMORY[0x24BDCC290]();
}

uint64_t sub_2465DAD40()
{
  return MEMORY[0x24BDCC2F8]();
}

uint64_t sub_2465DAD4C()
{
  return MEMORY[0x24BDCC5A8]();
}

uint64_t sub_2465DAD58()
{
  return MEMORY[0x24BDCCB20]();
}

uint64_t sub_2465DAD64()
{
  return MEMORY[0x24BDCCB28]();
}

uint64_t sub_2465DAD70()
{
  return MEMORY[0x24BDCCB30]();
}

uint64_t sub_2465DAD7C()
{
  return MEMORY[0x24BDCCB38]();
}

uint64_t sub_2465DAD88()
{
  return MEMORY[0x24BDCCB40]();
}

uint64_t sub_2465DAD94()
{
  return MEMORY[0x24BDCCB48]();
}

uint64_t sub_2465DADA0()
{
  return MEMORY[0x24BDCCB60]();
}

uint64_t sub_2465DADAC()
{
  return MEMORY[0x24BDCCB68]();
}

uint64_t sub_2465DADB8()
{
  return MEMORY[0x24BDCCB70]();
}

uint64_t sub_2465DADC4()
{
  return MEMORY[0x24BDCCB78]();
}

uint64_t sub_2465DADD0()
{
  return MEMORY[0x24BDCCBB0]();
}

uint64_t sub_2465DADDC()
{
  return MEMORY[0x24BDCCBD8]();
}

uint64_t sub_2465DADE8()
{
  return MEMORY[0x24BDCCBE0]();
}

uint64_t sub_2465DADF4()
{
  return MEMORY[0x24BDCCBF0]();
}

uint64_t sub_2465DAE00()
{
  return MEMORY[0x24BDCCC00]();
}

uint64_t sub_2465DAE0C()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_2465DAE18()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2465DAE24()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2465DAE30()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2465DAE3C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2465DAE48()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2465DAE54()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_2465DAE60()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_2465DAE6C()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_2465DAE78()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2465DAE84()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2465DAE90()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2465DAE9C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2465DAEA8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2465DAEB4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2465DAEC0()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2465DAECC()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2465DAED8()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_2465DAEE4()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2465DAEF0()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_2465DAEFC()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2465DAF08()
{
  return MEMORY[0x24BE999E8]();
}

uint64_t sub_2465DAF14()
{
  return MEMORY[0x24BE999F8]();
}

uint64_t sub_2465DAF20()
{
  return MEMORY[0x24BE99A00]();
}

uint64_t sub_2465DAF2C()
{
  return MEMORY[0x24BE99A08]();
}

uint64_t sub_2465DAF38()
{
  return MEMORY[0x24BE99A10]();
}

uint64_t sub_2465DAF44()
{
  return MEMORY[0x24BE99A18]();
}

uint64_t sub_2465DAF50()
{
  return MEMORY[0x24BE99A28]();
}

uint64_t sub_2465DAF5C()
{
  return MEMORY[0x24BE99A30]();
}

uint64_t sub_2465DAF68()
{
  return MEMORY[0x24BE99A38]();
}

uint64_t sub_2465DAF74()
{
  return MEMORY[0x24BE2E570]();
}

uint64_t sub_2465DAF80()
{
  return MEMORY[0x24BE2E578]();
}

uint64_t sub_2465DAF8C()
{
  return MEMORY[0x24BE2E580]();
}

uint64_t sub_2465DAF98()
{
  return MEMORY[0x24BE2E588]();
}

uint64_t sub_2465DAFA4()
{
  return MEMORY[0x24BE2E590]();
}

uint64_t sub_2465DAFB0()
{
  return MEMORY[0x24BE2E598]();
}

uint64_t sub_2465DAFBC()
{
  return MEMORY[0x24BE95F80]();
}

uint64_t sub_2465DAFC8()
{
  return MEMORY[0x24BE96350]();
}

uint64_t sub_2465DAFD4()
{
  return MEMORY[0x24BE96360]();
}

uint64_t sub_2465DAFE0()
{
  return MEMORY[0x24BE96370]();
}

uint64_t sub_2465DAFEC()
{
  return MEMORY[0x24BE96380]();
}

uint64_t sub_2465DAFF8()
{
  return MEMORY[0x24BE96390]();
}

uint64_t sub_2465DB004()
{
  return MEMORY[0x24BE963A0]();
}

uint64_t sub_2465DB010()
{
  return MEMORY[0x24BE963B0]();
}

uint64_t sub_2465DB01C()
{
  return MEMORY[0x24BE963C0]();
}

uint64_t sub_2465DB028()
{
  return MEMORY[0x24BE963D0]();
}

uint64_t sub_2465DB034()
{
  return MEMORY[0x24BE963E0]();
}

uint64_t sub_2465DB040()
{
  return MEMORY[0x24BE963F0]();
}

uint64_t sub_2465DB04C()
{
  return MEMORY[0x24BE96400]();
}

uint64_t sub_2465DB058()
{
  return MEMORY[0x24BE96410]();
}

uint64_t sub_2465DB064()
{
  return MEMORY[0x24BE96530]();
}

uint64_t sub_2465DB070()
{
  return MEMORY[0x24BE96928]();
}

uint64_t sub_2465DB07C()
{
  return MEMORY[0x24BE96968]();
}

uint64_t sub_2465DB088()
{
  return MEMORY[0x24BE96970]();
}

uint64_t sub_2465DB094()
{
  return MEMORY[0x24BE96980]();
}

uint64_t sub_2465DB0A0()
{
  return MEMORY[0x24BE96990]();
}

uint64_t sub_2465DB0AC()
{
  return MEMORY[0x24BE969A0]();
}

uint64_t sub_2465DB0B8()
{
  return MEMORY[0x24BE969B0]();
}

uint64_t sub_2465DB0C4()
{
  return MEMORY[0x24BE969C0]();
}

uint64_t sub_2465DB0D0()
{
  return MEMORY[0x24BE969D0]();
}

uint64_t sub_2465DB0DC()
{
  return MEMORY[0x24BE969E0]();
}

uint64_t sub_2465DB0E8()
{
  return MEMORY[0x24BE969E8]();
}

uint64_t sub_2465DB0F4()
{
  return MEMORY[0x24BE969F8]();
}

uint64_t sub_2465DB100()
{
  return MEMORY[0x24BE96A00]();
}

uint64_t sub_2465DB10C()
{
  return MEMORY[0x24BE96A10]();
}

uint64_t sub_2465DB118()
{
  return MEMORY[0x24BE96A20]();
}

uint64_t sub_2465DB124()
{
  return MEMORY[0x24BE96A30]();
}

uint64_t sub_2465DB130()
{
  return MEMORY[0x24BE96A48]();
}

uint64_t sub_2465DB13C()
{
  return MEMORY[0x24BE96A68]();
}

uint64_t sub_2465DB148()
{
  return MEMORY[0x24BE96A70]();
}

uint64_t sub_2465DB154()
{
  return MEMORY[0x24BE96A80]();
}

uint64_t sub_2465DB160()
{
  return MEMORY[0x24BE96A88]();
}

uint64_t sub_2465DB16C()
{
  return MEMORY[0x24BE96A90]();
}

uint64_t sub_2465DB178()
{
  return MEMORY[0x24BE96AA0]();
}

uint64_t sub_2465DB184()
{
  return MEMORY[0x24BE96D30]();
}

uint64_t sub_2465DB190()
{
  return MEMORY[0x24BE96D50]();
}

uint64_t sub_2465DB19C()
{
  return MEMORY[0x24BE96D58]();
}

uint64_t sub_2465DB1A8()
{
  return MEMORY[0x24BE96D68]();
}

uint64_t sub_2465DB1B4()
{
  return MEMORY[0x24BE96D78]();
}

uint64_t sub_2465DB1C0()
{
  return MEMORY[0x24BE96D80]();
}

uint64_t sub_2465DB1CC()
{
  return MEMORY[0x24BE96D90]();
}

uint64_t sub_2465DB1D8()
{
  return MEMORY[0x24BE96DA0]();
}

uint64_t sub_2465DB1E4()
{
  return MEMORY[0x24BE96DB0]();
}

uint64_t sub_2465DB1F0()
{
  return MEMORY[0x24BE96DC0]();
}

uint64_t sub_2465DB1FC()
{
  return MEMORY[0x24BE96DD0]();
}

uint64_t sub_2465DB208()
{
  return MEMORY[0x24BE96E10]();
}

uint64_t sub_2465DB214()
{
  return MEMORY[0x24BE96E18]();
}

uint64_t sub_2465DB220()
{
  return MEMORY[0x24BE96E20]();
}

uint64_t sub_2465DB22C()
{
  return MEMORY[0x24BE96E88]();
}

uint64_t sub_2465DB238()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_2465DB244()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_2465DB250()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_2465DB25C()
{
  return MEMORY[0x24BE96EE8]();
}

uint64_t sub_2465DB268()
{
  return MEMORY[0x24BE96F00]();
}

uint64_t sub_2465DB274()
{
  return MEMORY[0x24BE96F40]();
}

uint64_t sub_2465DB280()
{
  return MEMORY[0x24BE96F48]();
}

uint64_t sub_2465DB28C()
{
  return MEMORY[0x24BE96F50]();
}

uint64_t sub_2465DB298()
{
  return MEMORY[0x24BE96F58]();
}

uint64_t sub_2465DB2A4()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_2465DB2B0()
{
  return MEMORY[0x24BE96FD0]();
}

uint64_t sub_2465DB2BC()
{
  return MEMORY[0x24BE96FD8]();
}

uint64_t sub_2465DB2C8()
{
  return MEMORY[0x24BE96FF0]();
}

uint64_t sub_2465DB2D4()
{
  return MEMORY[0x24BE970F8]();
}

uint64_t sub_2465DB2E0()
{
  return MEMORY[0x24BE97258]();
}

uint64_t sub_2465DB2EC()
{
  return MEMORY[0x24BE97270]();
}

uint64_t sub_2465DB2F8()
{
  return MEMORY[0x24BE97280]();
}

uint64_t sub_2465DB304()
{
  return MEMORY[0x24BE97288]();
}

uint64_t sub_2465DB310()
{
  return MEMORY[0x24BE97348]();
}

uint64_t sub_2465DB31C()
{
  return MEMORY[0x24BE97360]();
}

uint64_t sub_2465DB328()
{
  return MEMORY[0x24BE97370]();
}

uint64_t sub_2465DB334()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_2465DB340()
{
  return MEMORY[0x24BE973A8]();
}

uint64_t sub_2465DB34C()
{
  return MEMORY[0x24BE973B0]();
}

uint64_t sub_2465DB358()
{
  return MEMORY[0x24BE973B8]();
}

uint64_t sub_2465DB364()
{
  return MEMORY[0x24BE973C0]();
}

uint64_t sub_2465DB370()
{
  return MEMORY[0x24BE973C8]();
}

uint64_t sub_2465DB37C()
{
  return MEMORY[0x24BE973D0]();
}

uint64_t sub_2465DB388()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_2465DB394()
{
  return MEMORY[0x24BE973F0]();
}

uint64_t sub_2465DB3A0()
{
  return MEMORY[0x24BE973F8]();
}

uint64_t sub_2465DB3AC()
{
  return MEMORY[0x24BE97400]();
}

uint64_t sub_2465DB3B8()
{
  return MEMORY[0x24BE97410]();
}

uint64_t sub_2465DB3C4()
{
  return MEMORY[0x24BE97418]();
}

uint64_t sub_2465DB3D0()
{
  return MEMORY[0x24BE97460]();
}

uint64_t sub_2465DB3DC()
{
  return MEMORY[0x24BE97468]();
}

uint64_t sub_2465DB3E8()
{
  return MEMORY[0x24BE97470]();
}

uint64_t sub_2465DB3F4()
{
  return MEMORY[0x24BE97478]();
}

uint64_t sub_2465DB400()
{
  return MEMORY[0x24BE97480]();
}

uint64_t sub_2465DB40C()
{
  return MEMORY[0x24BE97488]();
}

uint64_t sub_2465DB418()
{
  return MEMORY[0x24BE97490]();
}

uint64_t sub_2465DB424()
{
  return MEMORY[0x24BE97498]();
}

uint64_t sub_2465DB430()
{
  return MEMORY[0x24BE974A8]();
}

uint64_t sub_2465DB43C()
{
  return MEMORY[0x24BE974B0]();
}

uint64_t sub_2465DB448()
{
  return MEMORY[0x24BE974C0]();
}

uint64_t sub_2465DB454()
{
  return MEMORY[0x24BE974C8]();
}

uint64_t sub_2465DB460()
{
  return MEMORY[0x24BE974D0]();
}

uint64_t sub_2465DB46C()
{
  return MEMORY[0x24BE974E0]();
}

uint64_t sub_2465DB478()
{
  return MEMORY[0x24BE974F0]();
}

uint64_t sub_2465DB484()
{
  return MEMORY[0x24BE97508]();
}

uint64_t sub_2465DB490()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_2465DB49C()
{
  return MEMORY[0x24BE97560]();
}

uint64_t sub_2465DB4A8()
{
  return MEMORY[0x24BE975A0]();
}

uint64_t sub_2465DB4B4()
{
  return MEMORY[0x24BE975D0]();
}

uint64_t sub_2465DB4C0()
{
  return MEMORY[0x24BE975D8]();
}

uint64_t sub_2465DB4CC()
{
  return MEMORY[0x24BE975E8]();
}

uint64_t sub_2465DB4D8()
{
  return MEMORY[0x24BE97600]();
}

uint64_t sub_2465DB4E4()
{
  return MEMORY[0x24BE976A8]();
}

uint64_t sub_2465DB4F0()
{
  return MEMORY[0x24BE976B8]();
}

uint64_t sub_2465DB4FC()
{
  return MEMORY[0x24BE976C0]();
}

uint64_t sub_2465DB508()
{
  return MEMORY[0x24BE976D0]();
}

uint64_t sub_2465DB514()
{
  return MEMORY[0x24BE976E0]();
}

uint64_t sub_2465DB520()
{
  return MEMORY[0x24BE97700]();
}

uint64_t sub_2465DB52C()
{
  return MEMORY[0x24BE97750]();
}

uint64_t sub_2465DB538()
{
  return MEMORY[0x24BE97890]();
}

uint64_t sub_2465DB544()
{
  return MEMORY[0x24BE978C8]();
}

uint64_t sub_2465DB550()
{
  return MEMORY[0x24BE978D0]();
}

uint64_t sub_2465DB55C()
{
  return MEMORY[0x24BE978D8]();
}

uint64_t sub_2465DB568()
{
  return MEMORY[0x24BE978E0]();
}

uint64_t sub_2465DB574()
{
  return MEMORY[0x24BE978E8]();
}

uint64_t sub_2465DB580()
{
  return MEMORY[0x24BE978F0]();
}

uint64_t sub_2465DB58C()
{
  return MEMORY[0x24BE978F8]();
}

uint64_t sub_2465DB598()
{
  return MEMORY[0x24BE97900]();
}

uint64_t sub_2465DB5A4()
{
  return MEMORY[0x24BE97968]();
}

uint64_t sub_2465DB5B0()
{
  return MEMORY[0x24BE97AA8]();
}

uint64_t sub_2465DB5BC()
{
  return MEMORY[0x24BE97AB0]();
}

uint64_t sub_2465DB5C8()
{
  return MEMORY[0x24BE97AB8]();
}

uint64_t sub_2465DB5D4()
{
  return MEMORY[0x24BE97C30]();
}

uint64_t sub_2465DB5E0()
{
  return MEMORY[0x24BE97C38]();
}

uint64_t sub_2465DB5EC()
{
  return MEMORY[0x24BE97C40]();
}

uint64_t sub_2465DB5F8()
{
  return MEMORY[0x24BE97C48]();
}

uint64_t sub_2465DB604()
{
  return MEMORY[0x24BE97C50]();
}

uint64_t sub_2465DB610()
{
  return MEMORY[0x24BE97C58]();
}

uint64_t sub_2465DB61C()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_2465DB628()
{
  return MEMORY[0x24BE97DC8]();
}

uint64_t sub_2465DB634()
{
  return MEMORY[0x24BE97E50]();
}

uint64_t sub_2465DB640()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_2465DB64C()
{
  return MEMORY[0x24BE97E78]();
}

uint64_t sub_2465DB658()
{
  return MEMORY[0x24BE97E88]();
}

uint64_t sub_2465DB664()
{
  return MEMORY[0x24BE97E98]();
}

uint64_t sub_2465DB670()
{
  return MEMORY[0x24BE97EA8]();
}

uint64_t sub_2465DB67C()
{
  return MEMORY[0x24BE97F28]();
}

uint64_t sub_2465DB688()
{
  return MEMORY[0x24BE97F30]();
}

uint64_t sub_2465DB694()
{
  return MEMORY[0x24BE97F88]();
}

uint64_t sub_2465DB6A0()
{
  return MEMORY[0x24BE97F90]();
}

uint64_t sub_2465DB6AC()
{
  return MEMORY[0x24BE98070]();
}

uint64_t sub_2465DB6B8()
{
  return MEMORY[0x24BE980F0]();
}

uint64_t sub_2465DB6C4()
{
  return MEMORY[0x24BE98198]();
}

uint64_t sub_2465DB6D0()
{
  return MEMORY[0x24BE981E0]();
}

uint64_t sub_2465DB6DC()
{
  return MEMORY[0x24BE98258]();
}

uint64_t sub_2465DB6E8()
{
  return MEMORY[0x24BE98298]();
}

uint64_t sub_2465DB6F4()
{
  return MEMORY[0x24BE98308]();
}

uint64_t sub_2465DB700()
{
  return MEMORY[0x24BE98310]();
}

uint64_t sub_2465DB70C()
{
  return MEMORY[0x24BE98320]();
}

uint64_t sub_2465DB718()
{
  return MEMORY[0x24BE98408]();
}

uint64_t sub_2465DB724()
{
  return MEMORY[0x24BE98428]();
}

uint64_t sub_2465DB730()
{
  return MEMORY[0x24BE98440]();
}

uint64_t sub_2465DB73C()
{
  return MEMORY[0x24BE98468]();
}

uint64_t sub_2465DB748()
{
  return MEMORY[0x24BE984A0]();
}

uint64_t sub_2465DB754()
{
  return MEMORY[0x24BE984E0]();
}

uint64_t sub_2465DB760()
{
  return MEMORY[0x24BE985C8]();
}

uint64_t sub_2465DB76C()
{
  return MEMORY[0x24BE985D0]();
}

uint64_t sub_2465DB778()
{
  return MEMORY[0x24BE98640]();
}

uint64_t sub_2465DB784()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_2465DB790()
{
  return MEMORY[0x24BE986E8]();
}

uint64_t sub_2465DB79C()
{
  return MEMORY[0x24BE987B0]();
}

uint64_t sub_2465DB7A8()
{
  return MEMORY[0x24BE987B8]();
}

uint64_t sub_2465DB7B4()
{
  return MEMORY[0x24BE98808]();
}

uint64_t sub_2465DB7C0()
{
  return MEMORY[0x24BE98820]();
}

uint64_t sub_2465DB7CC()
{
  return MEMORY[0x24BE98830]();
}

uint64_t sub_2465DB7D8()
{
  return MEMORY[0x24BE98840]();
}

uint64_t sub_2465DB7E4()
{
  return MEMORY[0x24BE98848]();
}

uint64_t sub_2465DB7F0()
{
  return MEMORY[0x24BE98858]();
}

uint64_t sub_2465DB7FC()
{
  return MEMORY[0x24BE98868]();
}

uint64_t sub_2465DB808()
{
  return MEMORY[0x24BE98888]();
}

uint64_t sub_2465DB814()
{
  return MEMORY[0x24BE98898]();
}

uint64_t sub_2465DB820()
{
  return MEMORY[0x24BE988C0]();
}

uint64_t sub_2465DB82C()
{
  return MEMORY[0x24BE988D0]();
}

uint64_t sub_2465DB838()
{
  return MEMORY[0x24BE988E0]();
}

uint64_t sub_2465DB844()
{
  return MEMORY[0x24BE98998]();
}

uint64_t sub_2465DB850()
{
  return MEMORY[0x24BE989A0]();
}

uint64_t sub_2465DB85C()
{
  return MEMORY[0x24BE98B48]();
}

uint64_t sub_2465DB868()
{
  return MEMORY[0x24BE98B50]();
}

uint64_t sub_2465DB874()
{
  return MEMORY[0x24BE98D70]();
}

uint64_t sub_2465DB880()
{
  return MEMORY[0x24BE98D80]();
}

uint64_t sub_2465DB88C()
{
  return MEMORY[0x24BE98DB0]();
}

uint64_t sub_2465DB898()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t sub_2465DB8A4()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t sub_2465DB8B0()
{
  return MEMORY[0x24BE98DE8]();
}

uint64_t sub_2465DB8BC()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t sub_2465DB8C8()
{
  return MEMORY[0x24BE98E38]();
}

uint64_t sub_2465DB8D4()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t sub_2465DB8E0()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_2465DB8EC()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_2465DB8F8()
{
  return MEMORY[0x24BE98EE8]();
}

uint64_t sub_2465DB904()
{
  return MEMORY[0x24BE98EF0]();
}

uint64_t sub_2465DB910()
{
  return MEMORY[0x24BE98F08]();
}

uint64_t sub_2465DB91C()
{
  return MEMORY[0x24BE98F18]();
}

uint64_t sub_2465DB928()
{
  return MEMORY[0x24BE98F28]();
}

uint64_t sub_2465DB934()
{
  return MEMORY[0x24BE98F30]();
}

uint64_t sub_2465DB940()
{
  return MEMORY[0x24BE98F50]();
}

uint64_t sub_2465DB94C()
{
  return MEMORY[0x24BE98F68]();
}

uint64_t sub_2465DB958()
{
  return MEMORY[0x24BE98F78]();
}

uint64_t sub_2465DB964()
{
  return MEMORY[0x24BE98FB0]();
}

uint64_t sub_2465DB970()
{
  return MEMORY[0x24BE98FB8]();
}

uint64_t sub_2465DB97C()
{
  return MEMORY[0x24BE98FC0]();
}

uint64_t sub_2465DB988()
{
  return MEMORY[0x24BE98FC8]();
}

uint64_t sub_2465DB994()
{
  return MEMORY[0x24BE98FE0]();
}

uint64_t sub_2465DB9A0()
{
  return MEMORY[0x24BE98FF0]();
}

uint64_t sub_2465DB9AC()
{
  return MEMORY[0x24BE99000]();
}

uint64_t sub_2465DB9B8()
{
  return MEMORY[0x24BE99010]();
}

uint64_t sub_2465DB9C4()
{
  return MEMORY[0x24BE99038]();
}

uint64_t sub_2465DB9D0()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_2465DB9DC()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_2465DB9E8()
{
  return MEMORY[0x24BE99078]();
}

uint64_t sub_2465DB9F4()
{
  return MEMORY[0x24BE99080]();
}

uint64_t sub_2465DBA00()
{
  return MEMORY[0x24BE99090]();
}

uint64_t sub_2465DBA0C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2465DBA18()
{
  return MEMORY[0x24BE9C1E0]();
}

uint64_t sub_2465DBA24()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_2465DBA30()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_2465DBA3C()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_2465DBA48()
{
  return MEMORY[0x24BE9C6D0]();
}

uint64_t sub_2465DBA54()
{
  return MEMORY[0x24BE9C6D8]();
}

uint64_t sub_2465DBA60()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t sub_2465DBA6C()
{
  return MEMORY[0x24BE9C710]();
}

uint64_t sub_2465DBA78()
{
  return MEMORY[0x24BE9C720]();
}

uint64_t sub_2465DBA84()
{
  return MEMORY[0x24BE9C728]();
}

uint64_t sub_2465DBA90()
{
  return MEMORY[0x24BE9C740]();
}

uint64_t sub_2465DBA9C()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t sub_2465DBAA8()
{
  return MEMORY[0x24BE9C770]();
}

uint64_t sub_2465DBAB4()
{
  return MEMORY[0x24BE9C7A0]();
}

uint64_t sub_2465DBAC0()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t sub_2465DBACC()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_2465DBAD8()
{
  return MEMORY[0x24BE9CAD8]();
}

uint64_t sub_2465DBAE4()
{
  return MEMORY[0x24BE9CAE8]();
}

uint64_t sub_2465DBAF0()
{
  return MEMORY[0x24BE9CAF0]();
}

uint64_t sub_2465DBAFC()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t sub_2465DBB08()
{
  return MEMORY[0x24BE9CB18]();
}

uint64_t sub_2465DBB14()
{
  return MEMORY[0x24BE9CB20]();
}

uint64_t sub_2465DBB20()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_2465DBB2C()
{
  return MEMORY[0x24BE9CCD0]();
}

uint64_t sub_2465DBB38()
{
  return MEMORY[0x24BE9CD40]();
}

uint64_t sub_2465DBB44()
{
  return MEMORY[0x24BE9CD58]();
}

uint64_t sub_2465DBB50()
{
  return MEMORY[0x24BE9CD68]();
}

uint64_t sub_2465DBB5C()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_2465DBB68()
{
  return MEMORY[0x24BE9CF00]();
}

uint64_t sub_2465DBB74()
{
  return MEMORY[0x24BE9CF08]();
}

uint64_t sub_2465DBB80()
{
  return MEMORY[0x24BE9CF10]();
}

uint64_t sub_2465DBB8C()
{
  return MEMORY[0x24BE9D0E0]();
}

uint64_t sub_2465DBB98()
{
  return MEMORY[0x24BE9D0E8]();
}

uint64_t sub_2465DBBA4()
{
  return MEMORY[0x24BE9D0F0]();
}

uint64_t sub_2465DBBB0()
{
  return MEMORY[0x24BE9E008]();
}

uint64_t sub_2465DBBBC()
{
  return MEMORY[0x24BE9E018]();
}

uint64_t sub_2465DBBC8()
{
  return MEMORY[0x24BE9E028]();
}

uint64_t sub_2465DBBD4()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_2465DBBE0()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_2465DBBEC()
{
  return MEMORY[0x24BE99270]();
}

uint64_t sub_2465DBBF8()
{
  return MEMORY[0x24BE99278]();
}

uint64_t sub_2465DBC04()
{
  return MEMORY[0x24BE99280]();
}

uint64_t sub_2465DBC10()
{
  return MEMORY[0x24BE99288]();
}

uint64_t sub_2465DBC1C()
{
  return MEMORY[0x24BE9F798]();
}

uint64_t sub_2465DBC28()
{
  return MEMORY[0x24BE9F7A0]();
}

uint64_t sub_2465DBC34()
{
  return MEMORY[0x24BE9F7B8]();
}

uint64_t sub_2465DBC40()
{
  return MEMORY[0x24BE9F7C0]();
}

uint64_t sub_2465DBC4C()
{
  return MEMORY[0x24BE9F7D0]();
}

uint64_t sub_2465DBC58()
{
  return MEMORY[0x24BE9F830]();
}

uint64_t sub_2465DBC64()
{
  return MEMORY[0x24BE9F838]();
}

uint64_t sub_2465DBC70()
{
  return MEMORY[0x24BE9F990]();
}

uint64_t sub_2465DBC7C()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_2465DBC88()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_2465DBC94()
{
  return MEMORY[0x24BE9FE60]();
}

uint64_t sub_2465DBCA0()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_2465DBCAC()
{
  return MEMORY[0x24BE9FF08]();
}

uint64_t sub_2465DBCB8()
{
  return MEMORY[0x24BE9FF10]();
}

uint64_t sub_2465DBCC4()
{
  return MEMORY[0x24BE9FF30]();
}

uint64_t sub_2465DBCD0()
{
  return MEMORY[0x24BEA02D0]();
}

uint64_t sub_2465DBCDC()
{
  return MEMORY[0x24BEA02D8]();
}

uint64_t sub_2465DBCE8()
{
  return MEMORY[0x24BEA04D8]();
}

uint64_t sub_2465DBCF4()
{
  return MEMORY[0x24BEA0510]();
}

uint64_t sub_2465DBD00()
{
  return MEMORY[0x24BEA05B8]();
}

uint64_t sub_2465DBD0C()
{
  return MEMORY[0x24BEA05C8]();
}

uint64_t sub_2465DBD18()
{
  return MEMORY[0x24BEA05D0]();
}

uint64_t sub_2465DBD24()
{
  return MEMORY[0x24BEA0608]();
}

uint64_t sub_2465DBD30()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_2465DBD3C()
{
  return MEMORY[0x24BEA06C8]();
}

uint64_t sub_2465DBD48()
{
  return MEMORY[0x24BEA08E8]();
}

uint64_t sub_2465DBD54()
{
  return MEMORY[0x24BEA0990]();
}

uint64_t sub_2465DBD60()
{
  return MEMORY[0x24BEA0AF0]();
}

uint64_t sub_2465DBD6C()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_2465DBD78()
{
  return MEMORY[0x24BEA0CF8]();
}

uint64_t sub_2465DBD84()
{
  return MEMORY[0x24BEA0D10]();
}

uint64_t sub_2465DBD90()
{
  return MEMORY[0x24BEA0D48]();
}

uint64_t sub_2465DBD9C()
{
  return MEMORY[0x24BEA0F18]();
}

uint64_t sub_2465DBDA8()
{
  return MEMORY[0x24BEA0F38]();
}

uint64_t sub_2465DBDB4()
{
  return MEMORY[0x24BEA0F60]();
}

uint64_t sub_2465DBDC0()
{
  return MEMORY[0x24BEA1098]();
}

uint64_t sub_2465DBDCC()
{
  return MEMORY[0x24BEA1138]();
}

uint64_t sub_2465DBDD8()
{
  return MEMORY[0x24BEA1250]();
}

uint64_t sub_2465DBDE4()
{
  return MEMORY[0x24BEA1390]();
}

uint64_t sub_2465DBDF0()
{
  return MEMORY[0x24BEA18D8]();
}

uint64_t sub_2465DBDFC()
{
  return MEMORY[0x24BEA1B58]();
}

uint64_t sub_2465DBE08()
{
  return MEMORY[0x24BEA1B60]();
}

uint64_t sub_2465DBE14()
{
  return MEMORY[0x24BEA2020]();
}

uint64_t sub_2465DBE20()
{
  return MEMORY[0x24BEA2CA0]();
}

uint64_t sub_2465DBE2C()
{
  return MEMORY[0x24BEA3500]();
}

uint64_t sub_2465DBE38()
{
  return MEMORY[0x24BEA3518]();
}

uint64_t sub_2465DBE44()
{
  return MEMORY[0x24BEA3538]();
}

uint64_t sub_2465DBE50()
{
  return MEMORY[0x24BE99290]();
}

uint64_t sub_2465DBE5C()
{
  return MEMORY[0x24BE99298]();
}

uint64_t sub_2465DBE68()
{
  return MEMORY[0x24BE992A0]();
}

uint64_t sub_2465DBE74()
{
  return MEMORY[0x24BE992A8]();
}

uint64_t sub_2465DBE80()
{
  return MEMORY[0x24BE992B0]();
}

uint64_t sub_2465DBE8C()
{
  return MEMORY[0x24BE992B8]();
}

uint64_t sub_2465DBE98()
{
  return MEMORY[0x24BE992C0]();
}

uint64_t sub_2465DBEA4()
{
  return MEMORY[0x24BE992C8]();
}

uint64_t sub_2465DBEB0()
{
  return MEMORY[0x24BE992D0]();
}

uint64_t sub_2465DBEBC()
{
  return MEMORY[0x24BEA3558]();
}

uint64_t sub_2465DBEC8()
{
  return MEMORY[0x24BEA3560]();
}

uint64_t sub_2465DBED4()
{
  return MEMORY[0x24BEA3568]();
}

uint64_t sub_2465DBEE0()
{
  return MEMORY[0x24BEA3570]();
}

uint64_t sub_2465DBEEC()
{
  return MEMORY[0x24BEA3578]();
}

uint64_t sub_2465DBEF8()
{
  return MEMORY[0x24BEA3580]();
}

uint64_t sub_2465DBF04()
{
  return MEMORY[0x24BEA3588]();
}

uint64_t sub_2465DBF10()
{
  return MEMORY[0x24BEA3590]();
}

uint64_t sub_2465DBF1C()
{
  return MEMORY[0x24BEA3598]();
}

uint64_t sub_2465DBF28()
{
  return MEMORY[0x24BEA35A0]();
}

uint64_t sub_2465DBF34()
{
  return MEMORY[0x24BEA35A8]();
}

uint64_t sub_2465DBF40()
{
  return MEMORY[0x24BEA35B0]();
}

uint64_t sub_2465DBF4C()
{
  return MEMORY[0x24BEA35D0]();
}

uint64_t sub_2465DBF58()
{
  return MEMORY[0x24BEA35D8]();
}

uint64_t sub_2465DBF64()
{
  return MEMORY[0x24BEA35E8]();
}

uint64_t sub_2465DBF70()
{
  return MEMORY[0x24BEA3650]();
}

uint64_t sub_2465DBF7C()
{
  return MEMORY[0x24BEA3660]();
}

uint64_t sub_2465DBF88()
{
  return MEMORY[0x24BE933F8]();
}

uint64_t sub_2465DBF94()
{
  return MEMORY[0x24BE93400]();
}

uint64_t sub_2465DBFA0()
{
  return MEMORY[0x24BE93408]();
}

uint64_t sub_2465DBFAC()
{
  return MEMORY[0x24BE93410]();
}

uint64_t sub_2465DBFB8()
{
  return MEMORY[0x24BE93418]();
}

uint64_t sub_2465DBFC4()
{
  return MEMORY[0x24BE93420]();
}

uint64_t sub_2465DBFD0()
{
  return MEMORY[0x24BE93428]();
}

uint64_t sub_2465DBFDC()
{
  return MEMORY[0x24BE93430]();
}

uint64_t sub_2465DBFE8()
{
  return MEMORY[0x24BE93440]();
}

uint64_t sub_2465DBFF4()
{
  return MEMORY[0x24BE93448]();
}

uint64_t sub_2465DC000()
{
  return MEMORY[0x24BE93450]();
}

uint64_t sub_2465DC00C()
{
  return MEMORY[0x24BE93460]();
}

uint64_t sub_2465DC018()
{
  return MEMORY[0x24BE93478]();
}

uint64_t sub_2465DC024()
{
  return MEMORY[0x24BE93480]();
}

uint64_t sub_2465DC030()
{
  return MEMORY[0x24BE93488]();
}

uint64_t sub_2465DC03C()
{
  return MEMORY[0x24BE93490]();
}

uint64_t sub_2465DC048()
{
  return MEMORY[0x24BE93498]();
}

uint64_t sub_2465DC054()
{
  return MEMORY[0x24BE934A0]();
}

uint64_t sub_2465DC060()
{
  return MEMORY[0x24BE934A8]();
}

uint64_t sub_2465DC06C()
{
  return MEMORY[0x24BE934B0]();
}

uint64_t sub_2465DC078()
{
  return MEMORY[0x24BE934B8]();
}

uint64_t sub_2465DC084()
{
  return MEMORY[0x24BE934C0]();
}

uint64_t sub_2465DC090()
{
  return MEMORY[0x24BE93570]();
}

uint64_t sub_2465DC09C()
{
  return MEMORY[0x24BE93590]();
}

uint64_t sub_2465DC0A8()
{
  return MEMORY[0x24BE935B8]();
}

uint64_t sub_2465DC0B4()
{
  return MEMORY[0x24BE935C0]();
}

uint64_t sub_2465DC0C0()
{
  return MEMORY[0x24BE935C8]();
}

uint64_t sub_2465DC0CC()
{
  return MEMORY[0x24BE935D0]();
}

uint64_t sub_2465DC0D8()
{
  return MEMORY[0x24BE935D8]();
}

uint64_t sub_2465DC0E4()
{
  return MEMORY[0x24BE935E0]();
}

uint64_t sub_2465DC0F0()
{
  return MEMORY[0x24BE93618]();
}

uint64_t sub_2465DC0FC()
{
  return MEMORY[0x24BE936E0]();
}

uint64_t sub_2465DC108()
{
  return MEMORY[0x24BE936F0]();
}

uint64_t sub_2465DC114()
{
  return MEMORY[0x24BE936F8]();
}

uint64_t sub_2465DC120()
{
  return MEMORY[0x24BE937B8]();
}

uint64_t sub_2465DC12C()
{
  return MEMORY[0x24BE937E8]();
}

uint64_t sub_2465DC138()
{
  return MEMORY[0x24BE937F0]();
}

uint64_t sub_2465DC144()
{
  return MEMORY[0x24BE937F8]();
}

uint64_t sub_2465DC150()
{
  return MEMORY[0x24BE93860]();
}

uint64_t sub_2465DC15C()
{
  return MEMORY[0x24BE93868]();
}

uint64_t sub_2465DC168()
{
  return MEMORY[0x24BE93870]();
}

uint64_t sub_2465DC174()
{
  return MEMORY[0x24BE938C8]();
}

uint64_t sub_2465DC180()
{
  return MEMORY[0x24BE938D8]();
}

uint64_t sub_2465DC18C()
{
  return MEMORY[0x24BE938F0]();
}

uint64_t sub_2465DC198()
{
  return MEMORY[0x24BE93900]();
}

uint64_t sub_2465DC1A4()
{
  return MEMORY[0x24BE93908]();
}

uint64_t sub_2465DC1B0()
{
  return MEMORY[0x24BE93978]();
}

uint64_t sub_2465DC1BC()
{
  return MEMORY[0x24BE93998]();
}

uint64_t sub_2465DC1C8()
{
  return MEMORY[0x24BE939A0]();
}

uint64_t sub_2465DC1D4()
{
  return MEMORY[0x24BE939B8]();
}

uint64_t sub_2465DC1E0()
{
  return MEMORY[0x24BE939E0]();
}

uint64_t sub_2465DC1EC()
{
  return MEMORY[0x24BE939E8]();
}

uint64_t sub_2465DC1F8()
{
  return MEMORY[0x24BE939F0]();
}

uint64_t sub_2465DC204()
{
  return MEMORY[0x24BE93A20]();
}

uint64_t sub_2465DC210()
{
  return MEMORY[0x24BE93A30]();
}

uint64_t sub_2465DC21C()
{
  return MEMORY[0x24BE93A40]();
}

uint64_t sub_2465DC228()
{
  return MEMORY[0x24BE93A88]();
}

uint64_t sub_2465DC234()
{
  return MEMORY[0x24BE93A90]();
}

uint64_t sub_2465DC240()
{
  return MEMORY[0x24BE93BA0]();
}

uint64_t sub_2465DC24C()
{
  return MEMORY[0x24BE93BA8]();
}

uint64_t sub_2465DC258()
{
  return MEMORY[0x24BE93BB0]();
}

uint64_t sub_2465DC264()
{
  return MEMORY[0x24BE93BB8]();
}

uint64_t sub_2465DC270()
{
  return MEMORY[0x24BE93BC0]();
}

uint64_t sub_2465DC27C()
{
  return MEMORY[0x24BE93BC8]();
}

uint64_t sub_2465DC288()
{
  return MEMORY[0x24BE93BD0]();
}

uint64_t sub_2465DC294()
{
  return MEMORY[0x24BE93BD8]();
}

uint64_t sub_2465DC2A0()
{
  return MEMORY[0x24BE93BE0]();
}

uint64_t sub_2465DC2AC()
{
  return MEMORY[0x24BE93C00]();
}

uint64_t sub_2465DC2B8()
{
  return MEMORY[0x24BE93C08]();
}

uint64_t sub_2465DC2C4()
{
  return MEMORY[0x24BE93C20]();
}

uint64_t sub_2465DC2D0()
{
  return MEMORY[0x24BE93C28]();
}

uint64_t sub_2465DC2DC()
{
  return MEMORY[0x24BE93C30]();
}

uint64_t sub_2465DC2E8()
{
  return MEMORY[0x24BE93C38]();
}

uint64_t sub_2465DC2F4()
{
  return MEMORY[0x24BE93C48]();
}

uint64_t sub_2465DC300()
{
  return MEMORY[0x24BE93C50]();
}

uint64_t sub_2465DC30C()
{
  return MEMORY[0x24BE93C58]();
}

uint64_t sub_2465DC318()
{
  return MEMORY[0x24BE93C60]();
}

uint64_t sub_2465DC324()
{
  return MEMORY[0x24BE93C68]();
}

uint64_t sub_2465DC330()
{
  return MEMORY[0x24BE93C70]();
}

uint64_t sub_2465DC33C()
{
  return MEMORY[0x24BE93C78]();
}

uint64_t sub_2465DC348()
{
  return MEMORY[0x24BE93C88]();
}

uint64_t sub_2465DC354()
{
  return MEMORY[0x24BE93C90]();
}

uint64_t sub_2465DC360()
{
  return MEMORY[0x24BE93C98]();
}

uint64_t sub_2465DC36C()
{
  return MEMORY[0x24BE93CA0]();
}

uint64_t sub_2465DC378()
{
  return MEMORY[0x24BE93CA8]();
}

uint64_t sub_2465DC384()
{
  return MEMORY[0x24BE93CB0]();
}

uint64_t sub_2465DC390()
{
  return MEMORY[0x24BE93CB8]();
}

uint64_t sub_2465DC39C()
{
  return MEMORY[0x24BE93CC0]();
}

uint64_t sub_2465DC3A8()
{
  return MEMORY[0x24BE94110]();
}

uint64_t sub_2465DC3B4()
{
  return MEMORY[0x24BE941E8]();
}

uint64_t sub_2465DC3C0()
{
  return MEMORY[0x24BE942A8]();
}

uint64_t sub_2465DC3CC()
{
  return MEMORY[0x24BE990B8]();
}

uint64_t sub_2465DC3D8()
{
  return MEMORY[0x24BE92EC0]();
}

uint64_t sub_2465DC3E4()
{
  return MEMORY[0x24BEA87E8]();
}

uint64_t sub_2465DC3F0()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_2465DC3FC()
{
  return MEMORY[0x24BEA8808]();
}

uint64_t sub_2465DC408()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_2465DC414()
{
  return MEMORY[0x24BEA8AC0]();
}

uint64_t sub_2465DC420()
{
  return MEMORY[0x24BEA8AC8]();
}

uint64_t sub_2465DC42C()
{
  return MEMORY[0x24BEA8AE8]();
}

uint64_t sub_2465DC438()
{
  return MEMORY[0x24BE2E5B0]();
}

uint64_t sub_2465DC444()
{
  return MEMORY[0x24BE2E5B8]();
}

uint64_t sub_2465DC450()
{
  return MEMORY[0x24BE2E5C0]();
}

uint64_t sub_2465DC45C()
{
  return MEMORY[0x24BE2E5C8]();
}

uint64_t sub_2465DC468()
{
  return MEMORY[0x24BE99AC8]();
}

uint64_t sub_2465DC474()
{
  return MEMORY[0x24BE99AE8]();
}

uint64_t sub_2465DC480()
{
  return MEMORY[0x24BE99AF0]();
}

uint64_t sub_2465DC48C()
{
  return MEMORY[0x24BE99B30]();
}

uint64_t sub_2465DC498()
{
  return MEMORY[0x24BE99B38]();
}

uint64_t sub_2465DC4A4()
{
  return MEMORY[0x24BE99B40]();
}

uint64_t sub_2465DC4B0()
{
  return MEMORY[0x24BE99B48]();
}

uint64_t sub_2465DC4BC()
{
  return MEMORY[0x24BE99B50]();
}

uint64_t sub_2465DC4C8()
{
  return MEMORY[0x24BE99B58]();
}

uint64_t sub_2465DC4D4()
{
  return MEMORY[0x24BE99B60]();
}

uint64_t sub_2465DC4E0()
{
  return MEMORY[0x24BE99B68]();
}

uint64_t sub_2465DC4EC()
{
  return MEMORY[0x24BE99B70]();
}

uint64_t sub_2465DC4F8()
{
  return MEMORY[0x24BE99B78]();
}

uint64_t sub_2465DC504()
{
  return MEMORY[0x24BE99BB0]();
}

uint64_t sub_2465DC510()
{
  return MEMORY[0x24BE99BF0]();
}

uint64_t sub_2465DC51C()
{
  return MEMORY[0x24BE99C00]();
}

uint64_t sub_2465DC528()
{
  return MEMORY[0x24BE99C20]();
}

uint64_t sub_2465DC534()
{
  return MEMORY[0x24BE99C28]();
}

uint64_t sub_2465DC540()
{
  return MEMORY[0x24BE99C40]();
}

uint64_t sub_2465DC54C()
{
  return MEMORY[0x24BE99C48]();
}

uint64_t sub_2465DC558()
{
  return MEMORY[0x24BE99C50]();
}

uint64_t sub_2465DC564()
{
  return MEMORY[0x24BE99C58]();
}

uint64_t sub_2465DC570()
{
  return MEMORY[0x24BE99C60]();
}

uint64_t sub_2465DC57C()
{
  return MEMORY[0x24BE99C80]();
}

uint64_t sub_2465DC588()
{
  return MEMORY[0x24BE99C90]();
}

uint64_t sub_2465DC594()
{
  return MEMORY[0x24BE99CA0]();
}

uint64_t sub_2465DC5A0()
{
  return MEMORY[0x24BE99CD0]();
}

uint64_t sub_2465DC5AC()
{
  return MEMORY[0x24BE92148]();
}

uint64_t sub_2465DC5B8()
{
  return MEMORY[0x24BE92160]();
}

uint64_t sub_2465DC5C4()
{
  return MEMORY[0x24BE92168]();
}

uint64_t sub_2465DC5D0()
{
  return MEMORY[0x24BE92170]();
}

uint64_t sub_2465DC5DC()
{
  return MEMORY[0x24BE92178]();
}

uint64_t sub_2465DC5E8()
{
  return MEMORY[0x24BE92188]();
}

uint64_t sub_2465DC5F4()
{
  return MEMORY[0x24BE92190]();
}

uint64_t sub_2465DC600()
{
  return MEMORY[0x24BE92198]();
}

uint64_t sub_2465DC60C()
{
  return MEMORY[0x24BE921A0]();
}

uint64_t sub_2465DC618()
{
  return MEMORY[0x24BE921A8]();
}

uint64_t sub_2465DC624()
{
  return MEMORY[0x24BE921C8]();
}

uint64_t sub_2465DC630()
{
  return MEMORY[0x24BE921D0]();
}

uint64_t sub_2465DC63C()
{
  return MEMORY[0x24BE921D8]();
}

uint64_t sub_2465DC648()
{
  return MEMORY[0x24BE921E0]();
}

uint64_t sub_2465DC654()
{
  return MEMORY[0x24BE921E8]();
}

uint64_t sub_2465DC660()
{
  return MEMORY[0x24BE921F8]();
}

uint64_t sub_2465DC66C()
{
  return MEMORY[0x24BE92450]();
}

uint64_t sub_2465DC678()
{
  return MEMORY[0x24BE92490]();
}

uint64_t sub_2465DC684()
{
  return MEMORY[0x24BE92498]();
}

uint64_t sub_2465DC690()
{
  return MEMORY[0x24BE924C0]();
}

uint64_t sub_2465DC69C()
{
  return MEMORY[0x24BE924C8]();
}

uint64_t sub_2465DC6A8()
{
  return MEMORY[0x24BE924D0]();
}

uint64_t sub_2465DC6B4()
{
  return MEMORY[0x24BE924D8]();
}

uint64_t sub_2465DC6C0()
{
  return MEMORY[0x24BE924E0]();
}

uint64_t sub_2465DC6CC()
{
  return MEMORY[0x24BE92510]();
}

uint64_t sub_2465DC6D8()
{
  return MEMORY[0x24BE92518]();
}

uint64_t sub_2465DC6E4()
{
  return MEMORY[0x24BE92520]();
}

uint64_t sub_2465DC6F0()
{
  return MEMORY[0x24BE92560]();
}

uint64_t sub_2465DC6FC()
{
  return MEMORY[0x24BE92570]();
}

uint64_t sub_2465DC708()
{
  return MEMORY[0x24BE92588]();
}

uint64_t sub_2465DC714()
{
  return MEMORY[0x24BE92840]();
}

uint64_t sub_2465DC720()
{
  return MEMORY[0x24BE92848]();
}

uint64_t sub_2465DC72C()
{
  return MEMORY[0x24BE92860]();
}

uint64_t sub_2465DC738()
{
  return MEMORY[0x24BE92880]();
}

uint64_t sub_2465DC744()
{
  return MEMORY[0x24BE92888]();
}

uint64_t sub_2465DC750()
{
  return MEMORY[0x24BE92898]();
}

uint64_t sub_2465DC75C()
{
  return MEMORY[0x24BE929A8]();
}

uint64_t sub_2465DC768()
{
  return MEMORY[0x24BE929B0]();
}

uint64_t sub_2465DC774()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t sub_2465DC780()
{
  return MEMORY[0x24BE929F0]();
}

uint64_t sub_2465DC78C()
{
  return MEMORY[0x24BE92A00]();
}

uint64_t sub_2465DC798()
{
  return MEMORY[0x24BE92A10]();
}

uint64_t sub_2465DC7A4()
{
  return MEMORY[0x24BE92A28]();
}

uint64_t sub_2465DC7B0()
{
  return MEMORY[0x24BE92A30]();
}

uint64_t sub_2465DC7BC()
{
  return MEMORY[0x24BE92B00]();
}

uint64_t sub_2465DC7C8()
{
  return MEMORY[0x24BE92B78]();
}

uint64_t sub_2465DC7D4()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t sub_2465DC7E0()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_2465DC7EC()
{
  return MEMORY[0x24BE99300]();
}

uint64_t sub_2465DC7F8()
{
  return MEMORY[0x24BE99318]();
}

uint64_t sub_2465DC804()
{
  return MEMORY[0x24BE99328]();
}

uint64_t sub_2465DC810()
{
  return MEMORY[0x24BE99340]();
}

uint64_t sub_2465DC81C()
{
  return MEMORY[0x24BE99358]();
}

uint64_t sub_2465DC828()
{
  return MEMORY[0x24BE99370]();
}

uint64_t sub_2465DC834()
{
  return MEMORY[0x24BE99388]();
}

uint64_t sub_2465DC840()
{
  return MEMORY[0x24BE993A8]();
}

uint64_t sub_2465DC84C()
{
  return MEMORY[0x24BE993B8]();
}

uint64_t sub_2465DC858()
{
  return MEMORY[0x24BE993C8]();
}

uint64_t sub_2465DC864()
{
  return MEMORY[0x24BE993D8]();
}

uint64_t sub_2465DC870()
{
  return MEMORY[0x24BE993F0]();
}

uint64_t sub_2465DC87C()
{
  return MEMORY[0x24BE99400]();
}

uint64_t sub_2465DC888()
{
  return MEMORY[0x24BE99430]();
}

uint64_t sub_2465DC894()
{
  return MEMORY[0x24BE99448]();
}

uint64_t sub_2465DC8A0()
{
  return MEMORY[0x24BE99480]();
}

uint64_t sub_2465DC8AC()
{
  return MEMORY[0x24BE99488]();
}

uint64_t sub_2465DC8B8()
{
  return MEMORY[0x24BE99490]();
}

uint64_t sub_2465DC8C4()
{
  return MEMORY[0x24BE99498]();
}

uint64_t sub_2465DC8D0()
{
  return MEMORY[0x24BE994A0]();
}

uint64_t sub_2465DC8DC()
{
  return MEMORY[0x24BE994C8]();
}

uint64_t sub_2465DC8E8()
{
  return MEMORY[0x24BE994D8]();
}

uint64_t sub_2465DC8F4()
{
  return MEMORY[0x24BE994E8]();
}

uint64_t sub_2465DC900()
{
  return MEMORY[0x24BE99510]();
}

uint64_t sub_2465DC90C()
{
  return MEMORY[0x24BE99520]();
}

uint64_t sub_2465DC918()
{
  return MEMORY[0x24BE99530]();
}

uint64_t sub_2465DC924()
{
  return MEMORY[0x24BE99548]();
}

uint64_t sub_2465DC930()
{
  return MEMORY[0x24BE99550]();
}

uint64_t sub_2465DC93C()
{
  return MEMORY[0x24BE99558]();
}

uint64_t sub_2465DC948()
{
  return MEMORY[0x24BE99578]();
}

uint64_t sub_2465DC954()
{
  return MEMORY[0x24BE99598]();
}

uint64_t sub_2465DC960()
{
  return MEMORY[0x24BE995B0]();
}

uint64_t sub_2465DC96C()
{
  return MEMORY[0x24BE995C0]();
}

uint64_t sub_2465DC978()
{
  return MEMORY[0x24BE995E0]();
}

uint64_t sub_2465DC984()
{
  return MEMORY[0x24BE995F8]();
}

uint64_t sub_2465DC990()
{
  return MEMORY[0x24BE99620]();
}

uint64_t sub_2465DC99C()
{
  return MEMORY[0x24BE99628]();
}

uint64_t sub_2465DC9A8()
{
  return MEMORY[0x24BE99630]();
}

uint64_t sub_2465DC9B4()
{
  return MEMORY[0x24BE99640]();
}

uint64_t sub_2465DC9C0()
{
  return MEMORY[0x24BE99648]();
}

uint64_t sub_2465DC9CC()
{
  return MEMORY[0x24BE99650]();
}

uint64_t sub_2465DC9D8()
{
  return MEMORY[0x24BE99670]();
}

uint64_t sub_2465DC9E4()
{
  return MEMORY[0x24BE99680]();
}

uint64_t sub_2465DC9F0()
{
  return MEMORY[0x24BE99690]();
}

uint64_t sub_2465DC9FC()
{
  return MEMORY[0x24BE99698]();
}

uint64_t sub_2465DCA08()
{
  return MEMORY[0x24BE996A0]();
}

uint64_t sub_2465DCA14()
{
  return MEMORY[0x24BE996B8]();
}

uint64_t sub_2465DCA20()
{
  return MEMORY[0x24BE996D0]();
}

uint64_t sub_2465DCA2C()
{
  return MEMORY[0x24BE99710]();
}

uint64_t sub_2465DCA38()
{
  return MEMORY[0x24BE99720]();
}

uint64_t sub_2465DCA44()
{
  return MEMORY[0x24BE99730]();
}

uint64_t sub_2465DCA50()
{
  return MEMORY[0x24BE99738]();
}

uint64_t sub_2465DCA5C()
{
  return MEMORY[0x24BE99740]();
}

uint64_t sub_2465DCA68()
{
  return MEMORY[0x24BE99748]();
}

uint64_t sub_2465DCA74()
{
  return MEMORY[0x24BE99750]();
}

uint64_t sub_2465DCA80()
{
  return MEMORY[0x24BE99770]();
}

uint64_t sub_2465DCA8C()
{
  return MEMORY[0x24BE99790]();
}

uint64_t sub_2465DCA98()
{
  return MEMORY[0x24BE997A0]();
}

uint64_t sub_2465DCAA4()
{
  return MEMORY[0x24BE997B0]();
}

uint64_t sub_2465DCAB0()
{
  return MEMORY[0x24BE997C0]();
}

uint64_t sub_2465DCABC()
{
  return MEMORY[0x24BE997D0]();
}

uint64_t sub_2465DCAC8()
{
  return MEMORY[0x24BE997E0]();
}

uint64_t sub_2465DCAD4()
{
  return MEMORY[0x24BE997F8]();
}

uint64_t sub_2465DCAE0()
{
  return MEMORY[0x24BE99800]();
}

uint64_t sub_2465DCAEC()
{
  return MEMORY[0x24BE99808]();
}

uint64_t sub_2465DCAF8()
{
  return MEMORY[0x24BE99818]();
}

uint64_t sub_2465DCB04()
{
  return MEMORY[0x24BE99830]();
}

uint64_t sub_2465DCB10()
{
  return MEMORY[0x24BE99838]();
}

uint64_t sub_2465DCB1C()
{
  return MEMORY[0x24BE99840]();
}

uint64_t sub_2465DCB28()
{
  return MEMORY[0x24BE99848]();
}

uint64_t sub_2465DCB34()
{
  return MEMORY[0x24BE99850]();
}

uint64_t sub_2465DCB40()
{
  return MEMORY[0x24BE99858]();
}

uint64_t sub_2465DCB4C()
{
  return MEMORY[0x24BE99860]();
}

uint64_t sub_2465DCB58()
{
  return MEMORY[0x24BE99868]();
}

uint64_t sub_2465DCB64()
{
  return MEMORY[0x24BE99870]();
}

uint64_t sub_2465DCB70()
{
  return MEMORY[0x24BE99878]();
}

uint64_t sub_2465DCB7C()
{
  return MEMORY[0x24BE99888]();
}

uint64_t sub_2465DCB88()
{
  return MEMORY[0x24BE99898]();
}

uint64_t sub_2465DCB94()
{
  return MEMORY[0x24BE998B0]();
}

uint64_t sub_2465DCBA0()
{
  return MEMORY[0x24BE998C0]();
}

uint64_t sub_2465DCBAC()
{
  return MEMORY[0x24BE998D8]();
}

uint64_t sub_2465DCBB8()
{
  return MEMORY[0x24BE998E0]();
}

uint64_t sub_2465DCBC4()
{
  return MEMORY[0x24BE998E8]();
}

uint64_t sub_2465DCBD0()
{
  return MEMORY[0x24BE998F0]();
}

uint64_t sub_2465DCBDC()
{
  return MEMORY[0x24BE998F8]();
}

uint64_t sub_2465DCBE8()
{
  return MEMORY[0x24BE99910]();
}

uint64_t sub_2465DCBF4()
{
  return MEMORY[0x24BE99928]();
}

uint64_t sub_2465DCC00()
{
  return MEMORY[0x24BE99930]();
}

uint64_t sub_2465DCC0C()
{
  return MEMORY[0x24BE99938]();
}

uint64_t sub_2465DCC18()
{
  return MEMORY[0x24BE99968]();
}

uint64_t sub_2465DCC24()
{
  return MEMORY[0x24BE99978]();
}

uint64_t sub_2465DCC30()
{
  return MEMORY[0x24BE99988]();
}

uint64_t sub_2465DCC3C()
{
  return MEMORY[0x24BE99998]();
}

uint64_t sub_2465DCC48()
{
  return MEMORY[0x24BE999A0]();
}

uint64_t sub_2465DCC54()
{
  return MEMORY[0x24BE999C0]();
}

uint64_t sub_2465DCC60()
{
  return MEMORY[0x24BE90B88]();
}

uint64_t sub_2465DCC6C()
{
  return MEMORY[0x24BE90BB8]();
}

uint64_t sub_2465DCC78()
{
  return MEMORY[0x24BE943B8]();
}

uint64_t sub_2465DCC84()
{
  return MEMORY[0x24BE943C0]();
}

uint64_t sub_2465DCC90()
{
  return MEMORY[0x24BE94420]();
}

uint64_t sub_2465DCC9C()
{
  return MEMORY[0x24BE945B8]();
}

uint64_t sub_2465DCCA8()
{
  return MEMORY[0x24BE03DE8]();
}

uint64_t sub_2465DCCB4()
{
  return MEMORY[0x24BE03E00]();
}

uint64_t sub_2465DCCC0()
{
  return MEMORY[0x24BE03E08]();
}

uint64_t sub_2465DCCCC()
{
  return MEMORY[0x24BE03E10]();
}

uint64_t sub_2465DCCD8()
{
  return MEMORY[0x24BE03E18]();
}

uint64_t sub_2465DCCE4()
{
  return MEMORY[0x24BE03E20]();
}

uint64_t sub_2465DCCF0()
{
  return MEMORY[0x24BE03E28]();
}

uint64_t sub_2465DCCFC()
{
  return MEMORY[0x24BE03E30]();
}

uint64_t sub_2465DCD08()
{
  return MEMORY[0x24BE03E38]();
}

uint64_t sub_2465DCD14()
{
  return MEMORY[0x24BE03E40]();
}

uint64_t sub_2465DCD20()
{
  return MEMORY[0x24BE03E50]();
}

uint64_t sub_2465DCD2C()
{
  return MEMORY[0x24BE03E58]();
}

uint64_t sub_2465DCD38()
{
  return MEMORY[0x24BE03ED8]();
}

uint64_t sub_2465DCD44()
{
  return MEMORY[0x24BE03F00]();
}

uint64_t sub_2465DCD50()
{
  return MEMORY[0x24BE03F10]();
}

uint64_t sub_2465DCD5C()
{
  return MEMORY[0x24BE03F90]();
}

uint64_t sub_2465DCD68()
{
  return MEMORY[0x24BE03F98]();
}

uint64_t sub_2465DCD74()
{
  return MEMORY[0x24BE03FA0]();
}

uint64_t sub_2465DCD80()
{
  return MEMORY[0x24BE03FA8]();
}

uint64_t sub_2465DCD8C()
{
  return MEMORY[0x24BE03FB8]();
}

uint64_t sub_2465DCD98()
{
  return MEMORY[0x24BE04018]();
}

uint64_t sub_2465DCDA4()
{
  return MEMORY[0x24BE04040]();
}

uint64_t sub_2465DCDB0()
{
  return MEMORY[0x24BE04048]();
}

uint64_t sub_2465DCDBC()
{
  return MEMORY[0x24BE92F08]();
}

uint64_t sub_2465DCDC8()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_2465DCDD4()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_2465DCDE0()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2465DCDEC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2465DCDF8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2465DCE04()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2465DCE10()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2465DCE1C()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2465DCE28()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2465DCE34()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2465DCE40()
{
  return MEMORY[0x24BDCF870]();
}

uint64_t sub_2465DCE4C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2465DCE58()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2465DCE64()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2465DCE70()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2465DCE7C()
{
  return MEMORY[0x24BE99A40]();
}

uint64_t sub_2465DCE88()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2465DCE94()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2465DCEA0()
{
  return MEMORY[0x24BE92C48]();
}

uint64_t sub_2465DCEAC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2465DCEB8()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2465DCEC4()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_2465DCED0()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_2465DCEDC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2465DCEE8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2465DCEF4()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_2465DCF00()
{
  return MEMORY[0x24BEE0DC8]();
}

uint64_t sub_2465DCF0C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_2465DCF18()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2465DCF24()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_2465DCF30()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2465DCF3C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2465DCF48()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2465DCF54()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2465DCF60()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2465DCF6C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2465DCF78()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2465DCF84()
{
  return MEMORY[0x24BEE1168]();
}

uint64_t sub_2465DCF90()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2465DCF9C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2465DCFA8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2465DCFB4()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_2465DCFC0()
{
  return MEMORY[0x24BDCFC20]();
}

uint64_t sub_2465DCFCC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2465DCFD8()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2465DCFE4()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2465DCFF0()
{
  return MEMORY[0x24BEE6938]();
}

uint64_t sub_2465DCFFC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2465DD008()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2465DD014()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2465DD020()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2465DD02C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2465DD038()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2465DD044()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2465DD050()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2465DD05C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2465DD068()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_2465DD074()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_2465DD080()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2465DD08C()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_2465DD098()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2465DD0A4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2465DD0B0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2465DD0BC()
{
  return MEMORY[0x24BDD04B8]();
}

uint64_t sub_2465DD0C8()
{
  return MEMORY[0x24BDD04D8]();
}

uint64_t sub_2465DD0D4()
{
  return MEMORY[0x24BDD04E8]();
}

uint64_t sub_2465DD0E0()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_2465DD0EC()
{
  return MEMORY[0x24BDD05D0]();
}

uint64_t sub_2465DD0F8()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_2465DD104()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_2465DD110()
{
  return MEMORY[0x24BDD0650]();
}

uint64_t sub_2465DD11C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2465DD128()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2465DD134()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_2465DD140()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2465DD14C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2465DD158()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2465DD164()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2465DD170()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_2465DD17C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2465DD188()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2465DD194()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2465DD1A0()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2465DD1AC()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2465DD1B8()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2465DD1C4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2465DD1D0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2465DD1DC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2465DD1E8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2465DD1F4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2465DD200()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2465DD20C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2465DD218()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2465DD224()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2465DD230()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2465DD23C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2465DD248()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2465DD254()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2465DD260()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2465DD26C()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_2465DD278()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2465DD284()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_2465DD290()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2465DD29C()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2465DD2A8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2465DD2B4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2465DD2C0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2465DD2CC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2465DD2D8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2465DD2E4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2465DD2F0()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2465DD2FC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2465DD308()
{
  return MEMORY[0x24BE92C58]();
}

uint64_t sub_2465DD314()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_2465DD320()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2465DD32C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2465DD338()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2465DD344()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2465DD350()
{
  return MEMORY[0x24BEE4A98]();
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

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

