uint64_t _s8RRSQLite5TableV6renameySSACF_0(const void *a1)
{
  const void *v1;
  _BYTE v3[168];
  _BYTE v4[168];

  OUTLINED_FUNCTION_18_9(v3, a1);
  OUTLINED_FUNCTION_18_9(v4, v1);
  return sub_212515BC0((uint64_t)v3);
}

#error "212516E14: call analysis failed (funcsize=54)"

#error "212516EE4: call analysis failed (funcsize=62)"

#error "212516FF8: call analysis failed (funcsize=51)"

#error "2125170BC: call analysis failed (funcsize=59)"

#error "212517220: call analysis failed (funcsize=71)"

#error "212517350: call analysis failed (funcsize=72)"

#error "212517420: call analysis failed (funcsize=59)"

#error "212517578: call analysis failed (funcsize=71)"

#error "21251767C: call analysis failed (funcsize=61)"

#error "212517740: call analysis failed (funcsize=66)"

#error "2125178BC: call analysis failed (funcsize=70)"

#error "2125179D4: call analysis failed (funcsize=66)"

#error "212517ACC: call analysis failed (funcsize=59)"

uint64_t TableBuilder.column<A>(_:primaryKey:check:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  char *v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  __int128 *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[40];
  _QWORD v44[5];
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  OUTLINED_FUNCTION_50_9();
  v9 = *v8;
  v12 = *v10;
  v11 = v10[1];
  v13 = v10[2];
  v46 = v15;
  v47 = v14;
  v48 = v5;
  v17 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 40);
  OUTLINED_FUNCTION_9_16();
  OUTLINED_FUNCTION_90_1();
  v18 = v17(a4, a5);
  v20 = v19;
  v45 = v9;
  v44[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB780);
  v44[4] = &protocol witness table for Expression<A>;
  v44[0] = v12;
  v44[1] = v11;
  v44[2] = v13;
  OUTLINED_FUNCTION_111_5();
  v25 = OUTLINED_FUNCTION_148_2(v21, v22, v23, v24);
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  v26 = OUTLINED_FUNCTION_84_7();
  OUTLINED_FUNCTION_66_5(v26, v18, v20, v27, v28, v29, (uint64_t)v44, (uint64_t)v43, v38, v40, v42, v25, (uint64_t)&protocol witness table for Expression<A>);
  v30 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_60_4(v30, &qword_254B4DC28, v31, v32, v33, v34, v35, v36, v39, v41);
  OUTLINED_FUNCTION_42_4((uint64_t)v43);
  OUTLINED_FUNCTION_42_4((uint64_t)v44);
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_95_0();
}

#error "212517D28: call analysis failed (funcsize=75)"

#error "212517E34: call analysis failed (funcsize=63)"

#error "212517F68: call analysis failed (funcsize=73)"

#error "212518084: call analysis failed (funcsize=67)"

void TableBuilder.column<A>(_:unique:check:defaultValue:collate:)(uint64_t a1, char a2)
{
  uint64_t v2;
  unint64_t v3;
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
  uint64_t v26;
  __int128 v27;
  _BYTE v28[80];
  _QWORD v29[6];
  _QWORD v30[5];
  unsigned __int8 v31;
  _BYTE v32[16];
  uint64_t v33;

  v8 = *(_QWORD *)(a1 + 16);
  OUTLINED_FUNCTION_75_7(*(_QWORD *)(a1 + 8));
  v33 = v8;
  OUTLINED_FUNCTION_9_16();
  OUTLINED_FUNCTION_136_0();
  v9 = OUTLINED_FUNCTION_95_9();
  v21 = v10;
  v22 = v9;
  OUTLINED_FUNCTION_19_12();
  if (!v4)
  {
    OUTLINED_FUNCTION_14_16();
    if (v7)
      goto LABEL_3;
LABEL_5:
    OUTLINED_FUNCTION_135_5();
    goto LABEL_6;
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB778);
  v30[3] = v11;
  v30[4] = &protocol witness table for Expression<A>;
  v30[0] = v5;
  v30[1] = v4;
  v30[2] = v6;
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v29[3] = OUTLINED_FUNCTION_3_14(v11, v12, v13, v14);
  v29[4] = &protocol witness table for Expression<A>;
  v29[0] = v24;
  v29[1] = v7;
  v29[2] = v23;
LABEL_6:
  OUTLINED_FUNCTION_57_6();
  OUTLINED_FUNCTION_128_5();
  v15 = sub_212519CFC(v2, v3);
  v19 = OUTLINED_FUNCTION_3_14(v15, v16, v17, v18);
  OUTLINED_FUNCTION_65_4((uint64_t)v32, v22, v21, &v31, v20, a2 & 1, (uint64_t)v30, (uint64_t)v29, (uint64_t)v28, &v27, v26, v19, (uint64_t)&protocol witness table for Expression<A>);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_27_5();
  sub_2124D1AF0((uint64_t)v28, &qword_254B4DC28);
  OUTLINED_FUNCTION_42_4((uint64_t)v29);
  OUTLINED_FUNCTION_42_4((uint64_t)v30);
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_67_5();
}

#error "212518290: call analysis failed (funcsize=68)"

#error "2125183F0: call analysis failed (funcsize=66)"

#error "2125184B4: call analysis failed (funcsize=65)"

void TableBuilder.column<A>(_:unique:check:defaultValue:collate:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
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
  uint64_t v34;
  __int128 v35;
  _BYTE v36[80];
  _QWORD v37[6];
  _QWORD v38[5];
  unsigned __int8 v39;
  _BYTE v40[16];
  uint64_t v41;

  OUTLINED_FUNCTION_50_9();
  OUTLINED_FUNCTION_75_7(v16);
  v41 = v8;
  v18 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 40);
  OUTLINED_FUNCTION_9_16();
  OUTLINED_FUNCTION_90_1();
  v30 = v18(a6, a7);
  OUTLINED_FUNCTION_19_12();
  if (!v10)
  {
    OUTLINED_FUNCTION_14_16();
    if (v13)
      goto LABEL_3;
LABEL_5:
    OUTLINED_FUNCTION_135_5();
    goto LABEL_6;
  }
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB778);
  v38[3] = v19;
  v38[4] = &protocol witness table for Expression<A>;
  v38[0] = v11;
  v38[1] = v10;
  v38[2] = v12;
  if (!v13)
    goto LABEL_5;
LABEL_3:
  v37[3] = OUTLINED_FUNCTION_146_5(v19, v20, v21, v22);
  v37[4] = &protocol witness table for Expression<A>;
  v37[0] = v32;
  v37[1] = v13;
  v37[2] = v31;
LABEL_6:
  OUTLINED_FUNCTION_57_6();
  OUTLINED_FUNCTION_128_5();
  sub_212519CFC(v7, v9);
  v23 = OUTLINED_FUNCTION_86_7();
  v27 = OUTLINED_FUNCTION_7_10(v23, v24, v25, v26);
  OUTLINED_FUNCTION_39_4((uint64_t)v40, v30, v28, &v39, v29, a2 & 1, (uint64_t)v38, (uint64_t)v37, (uint64_t)v36, &v35, v34, v27, (uint64_t)&protocol witness table for Expression<A>);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_27_5();
  sub_2124D1AF0((uint64_t)v36, &qword_254B4DC28);
  OUTLINED_FUNCTION_42_4((uint64_t)v37);
  OUTLINED_FUNCTION_42_4((uint64_t)v38);
  OUTLINED_FUNCTION_13_10();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_67_5();
}

#error "2125187A4: call analysis failed (funcsize=84)"

#error "21251886C: call analysis failed (funcsize=64)"

#error "2125189D4: call analysis failed (funcsize=68)"

#error "212518B0C: call analysis failed (funcsize=76)"

#error "212518BD4: call analysis failed (funcsize=64)"

void TableBuilder.primaryKey<A>(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v1 = a1[1];
  v3 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD560);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212534F20;
  *(_QWORD *)(inited + 56) = OUTLINED_FUNCTION_69_5(inited, v5, v6, v7);
  *(_QWORD *)(inited + 64) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 32) = v2;
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 48) = v3;
  OUTLINED_FUNCTION_175();
  OUTLINED_FUNCTION_51_1();
  sub_212518CF0(inited);
  swift_setDeallocating();
  sub_21250F4FC();
  OUTLINED_FUNCTION_14_9();
}

uint64_t sub_212518CF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5[2];

  sub_212526F28(a1, 0x205952414D495250, 0xEB0000000059454BLL, (uint64_t)v5);
  sub_21250F55C();
  v2 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 16);
  sub_21250F464(v2);
  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v3 + 16) = v2 + 1;
  return sub_21249F9E0(v5, v3 + 40 * v2 + 32);
}

uint64_t TableBuilder.primaryKey<A, B>(_:_:)(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *a1;
  v4 = a1[1];
  v6 = a1[2];
  v8 = *a2;
  v7 = a2[1];
  v9 = a2[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD560);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212534EA0;
  v13 = type metadata accessor for Expression(0, a3, v11, v12);
  *(_QWORD *)(inited + 56) = v13;
  *(_QWORD *)(inited + 64) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 32) = v5;
  *(_QWORD *)(inited + 40) = v4;
  *(_QWORD *)(inited + 48) = v6;
  *(_QWORD *)(inited + 96) = OUTLINED_FUNCTION_69_5(v13, v14, v15, v16);
  *(_QWORD *)(inited + 104) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 72) = v8;
  *(_QWORD *)(inited + 80) = v7;
  *(_QWORD *)(inited + 88) = v9;
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  sub_212518CF0(inited);
  swift_setDeallocating();
  return sub_21250F4FC();
}

uint64_t TableBuilder.primaryKey<A, B, C>(_:_:_:)(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t inited;
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
  uint64_t v30;
  uint64_t v31;

  v6 = *a1;
  v7 = a1[1];
  v8 = a1[2];
  v10 = *a2;
  v9 = a2[1];
  v11 = a2[2];
  v12 = a3[1];
  v30 = *a3;
  v13 = a3[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD560);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212536C70;
  *(_QWORD *)(inited + 56) = OUTLINED_FUNCTION_58_10(inited, v15, v16, v17);
  *(_QWORD *)(inited + 64) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 32) = v6;
  *(_QWORD *)(inited + 40) = v7;
  *(_QWORD *)(inited + 48) = v8;
  v20 = type metadata accessor for Expression(0, a5, v18, v19);
  *(_QWORD *)(inited + 96) = v20;
  *(_QWORD *)(inited + 104) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 72) = v10;
  *(_QWORD *)(inited + 80) = v9;
  *(_QWORD *)(inited + 88) = v11;
  *(_QWORD *)(inited + 136) = OUTLINED_FUNCTION_145_6(v20, v21, v22, v23, v24, v25, v26, v27, a5, v30, a6);
  *(_QWORD *)(inited + 144) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 112) = v31;
  *(_QWORD *)(inited + 120) = v12;
  *(_QWORD *)(inited + 128) = v13;
  OUTLINED_FUNCTION_136_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_117_0();
  sub_212518CF0(inited);
  swift_setDeallocating();
  return sub_21250F4FC();
}

#error "212518FE8: call analysis failed (funcsize=66)"

Swift::Void __swiftcall TableBuilder.unique(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  __int128 v2[2];

  sub_212526F28((uint64_t)a1._rawValue, 0x455551494E55, 0xE600000000000000, (uint64_t)v2);
  sub_21250F55C();
  OUTLINED_FUNCTION_119_7();
  OUTLINED_FUNCTION_90_5();
  sub_21249F9E0(v2, v1);
  OUTLINED_FUNCTION_121_4();
}

uint64_t TableBuilder.check(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4[3];

  v1 = a1[1];
  v2 = a1[2];
  v4[0] = *a1;
  v4[1] = v1;
  v4[2] = v2;
  OUTLINED_FUNCTION_117_0();
  OUTLINED_FUNCTION_175();
  TableBuilder.check(_:)(v4);
  OUTLINED_FUNCTION_149_0();
  return swift_bridgeObjectRelease();
}

void TableBuilder.check(_:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;
  _UNKNOWN **v8;

  v2 = *a1;
  v1 = a1[1];
  v3 = a1[2];
  v5[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB780);
  v5[4] = &protocol witness table for Expression<A>;
  v5[0] = v2;
  v5[1] = v1;
  v5[2] = v3;
  *(_QWORD *)&v6 = 0x4B43454843;
  *((_QWORD *)&v6 + 1) = 0xE500000000000000;
  OUTLINED_FUNCTION_90_1();
  OUTLINED_FUNCTION_175();
  sub_212532BCC();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD350);
  v8 = &protocol witness table for Expression<A>;
  sub_21250B420(v5, 0x4B43454843, 0xE500000000000000);
  OUTLINED_FUNCTION_149_0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  sub_21250F55C();
  OUTLINED_FUNCTION_119_7();
  OUTLINED_FUNCTION_90_5();
  sub_21249F9E0(&v6, v4);
  OUTLINED_FUNCTION_14_9();
}

RRSQLite::TableBuilder::Dependency_optional __swiftcall TableBuilder.Dependency.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  RRSQLite::TableBuilder::Dependency_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2125330D0();
  result.value = OUTLINED_FUNCTION_95_0();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t TableBuilder.Dependency.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21251924C + 4 * byte_2125371C0[*v0]))(0x4F49544341204F4ELL, 0xE90000000000004ELL);
}

uint64_t sub_21251924C()
{
  return 0x5443495254534552;
}

uint64_t sub_212519264()
{
  return 0x4C4C554E20544553;
}

uint64_t sub_21251927C()
{
  return 0x4146454420544553;
}

uint64_t sub_21251929C()
{
  return 0x45444143534143;
}

void sub_2125192B4(char *a1)
{
  sub_21251D0E0(*a1);
}

void sub_2125192C0()
{
  sub_21251D4B4();
}

void sub_2125192C8(uint64_t a1)
{
  char *v1;

  sub_21251D554(a1, *v1);
}

void sub_2125192D0()
{
  sub_21251D7D8();
}

RRSQLite::TableBuilder::Dependency_optional sub_2125192D8(Swift::String *a1)
{
  return TableBuilder.Dependency.init(rawValue:)(*a1);
}

uint64_t sub_2125192E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = TableBuilder.Dependency.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void TableBuilder.foreignKey<A>(_:references:_:update:delete:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_105_4();
  OUTLINED_FUNCTION_169_0();
  v7 = type metadata accessor for Expression(0, v6, v4, v5);
  OUTLINED_FUNCTION_90_1();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_117_0();
  OUTLINED_FUNCTION_175();
  OUTLINED_FUNCTION_130_7();
  sub_212519E28(v8, a2, v9, v10, v11, v2, v7, v7, v12, v13);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_149_0();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_83_6();
}

void TableBuilder.foreignKey<A>(_:references:_:update:delete:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
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
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_105_4();
  OUTLINED_FUNCTION_169_0();
  v9 = sub_212532EA8();
  v13 = OUTLINED_FUNCTION_7_10(v9, v10, v11, v12);
  v16 = type metadata accessor for Expression(0, a6, v14, v15);
  OUTLINED_FUNCTION_90_1();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_117_0();
  OUTLINED_FUNCTION_175();
  OUTLINED_FUNCTION_130_7();
  sub_212519E28(v17, a2, v18, v19, v20, v6, v13, v16, v21, v22);
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_149_0();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_83_6();
}

void TableBuilder.foreignKey<A, B>(_:references:_:update:delete:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  unsigned __int8 *v32;
  unsigned __int8 *v33;
  uint64_t inited;
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
  _QWORD *v51;
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
  unsigned __int8 v63;
  unsigned __int8 v64;
  uint64_t v65;
  unsigned __int8 v66;
  unsigned __int8 v67;
  _BYTE v68[40];
  _QWORD v69[5];
  _BYTE v70[40];
  uint64_t v71[19];
  uint64_t v72[6];

  OUTLINED_FUNCTION_16_1();
  v65 = v21;
  v58 = v22;
  v24 = *v23;
  v25 = v23[1];
  v26 = v23[2];
  v28 = v27[1];
  v56 = *v27;
  v29 = v27[2];
  v57 = v30[1];
  v59 = *v30;
  v60 = v31[1];
  v61 = v31[2];
  v62 = *v31;
  v63 = *v33;
  v64 = *v32;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD560);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212534EA0;
  OUTLINED_FUNCTION_51_1();
  v35 = OUTLINED_FUNCTION_206();
  v39 = OUTLINED_FUNCTION_69_5(v35, v36, v37, v38);
  *(_QWORD *)(inited + 56) = v39;
  *(_QWORD *)(inited + 64) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 32) = v24;
  *(_QWORD *)(inited + 40) = v25;
  *(_QWORD *)(inited + 48) = v26;
  v47 = OUTLINED_FUNCTION_145_6(v39, v40, v41, v42, v43, v44, v45, v46, v54, v55, a21);
  *(_QWORD *)(inited + 96) = v47;
  *(_QWORD *)(inited + 104) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 72) = v56;
  *(_QWORD *)(inited + 80) = v28;
  *(_QWORD *)(inited + 88) = v29;
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_90_1();
  OUTLINED_FUNCTION_34_10(inited, v72);
  OUTLINED_FUNCTION_164_3();
  OUTLINED_FUNCTION_158_2();
  sub_2124E3C00(v58, (uint64_t)v70);
  v48 = swift_initStackObject();
  *(_OWORD *)(v48 + 16) = xmmword_212534EA0;
  OUTLINED_FUNCTION_175();
  v49 = swift_bridgeObjectRetain();
  *(_QWORD *)(v48 + 32) = v59;
  *(_QWORD *)(v48 + 40) = v57;
  *(_QWORD *)(v48 + 48) = v49;
  *(_QWORD *)(v48 + 56) = v39;
  *(_QWORD *)(v48 + 96) = v47;
  *(_QWORD *)(v48 + 104) = &protocol witness table for Expression<A>;
  *(_QWORD *)(v48 + 64) = &protocol witness table for Expression<A>;
  *(_QWORD *)(v48 + 72) = v62;
  *(_QWORD *)(v48 + 80) = v60;
  *(_QWORD *)(v48 + 88) = v61;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_117_0();
  OUTLINED_FUNCTION_34_10(v48, v71);
  OUTLINED_FUNCTION_108_4();
  sub_21250F4FC();
  sub_2124E3C00((uint64_t)v70, (uint64_t)v68);
  sub_2124E3C00((uint64_t)v71, (uint64_t)v69);
  v67 = v64;
  v66 = v63;
  OUTLINED_FUNCTION_141_6();
  v50 = v69[4];
  v51 = __swift_project_boxed_opaque_existential_1(v69, v69[3]);
  OUTLINED_FUNCTION_157_3(v57, (uint64_t)v68, (uint64_t)v51, &v67, &v66, v65, v52, v53, v26, v50);
  sub_2124D1AF0((uint64_t)v70, &qword_254B4DC30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v72);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v69);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
  OUTLINED_FUNCTION_3_1();
}

void TableBuilder.foreignKey<A, B, C>(_:references:_:update:delete:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,unsigned __int8 *a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  unsigned __int8 *v40;
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
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
  unsigned __int8 v79;
  unsigned __int8 v80;
  uint64_t v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  _BYTE v84[40];
  _QWORD v85[5];
  _BYTE v86[40];
  uint64_t v87[5];
  uint64_t v88[6];

  OUTLINED_FUNCTION_16_1();
  v81 = v24;
  v72 = v25;
  v28 = *v26;
  v27 = v26[1];
  v29 = v26[2];
  v31 = v30[1];
  v65 = *v30;
  v32 = v30[2];
  v71 = *v33;
  v68 = v33[1];
  v69 = v33[2];
  v35 = v34[1];
  v36 = v34[2];
  v38 = v37[1];
  v73 = *v34;
  v74 = v37[2];
  v75 = *v37;
  v76 = v39[1];
  v77 = v39[2];
  v78 = *v39;
  v79 = *a21;
  v80 = *v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD560);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212536C70;
  OUTLINED_FUNCTION_136_0();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_117_0();
  v42 = swift_bridgeObjectRelease();
  v70 = OUTLINED_FUNCTION_70_4(v42, v43, v44, v45);
  *(_QWORD *)(inited + 56) = v70;
  *(_QWORD *)(inited + 64) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 32) = v28;
  *(_QWORD *)(inited + 40) = v27;
  *(_QWORD *)(inited + 48) = v29;
  OUTLINED_FUNCTION_136_0();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_117_0();
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_44_1();
  v46 = OUTLINED_FUNCTION_229();
  v67 = OUTLINED_FUNCTION_144_3(v46, v47, v48, v49, v50, v51, v52, v53, v62, v63, v64, v65, a23);
  *(_QWORD *)(inited + 96) = v67;
  *(_QWORD *)(inited + 104) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 72) = v66;
  *(_QWORD *)(inited + 80) = v31;
  *(_QWORD *)(inited + 88) = v32;
  OUTLINED_FUNCTION_136_0();
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_55_1();
  OUTLINED_FUNCTION_44_1();
  OUTLINED_FUNCTION_229();
  v56 = type metadata accessor for Expression(0, a24, v54, v55);
  *(_QWORD *)(inited + 136) = v56;
  *(_QWORD *)(inited + 144) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 112) = v71;
  *(_QWORD *)(inited + 120) = v68;
  *(_QWORD *)(inited + 128) = v69;
  OUTLINED_FUNCTION_34_10(inited, v88);
  OUTLINED_FUNCTION_108_4();
  sub_21250F4FC();
  sub_2124E3C00(v72, (uint64_t)v86);
  v57 = swift_initStackObject();
  *(_OWORD *)(v57 + 16) = xmmword_212536C70;
  OUTLINED_FUNCTION_175();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v57 + 32) = v73;
  *(_QWORD *)(v57 + 40) = v35;
  *(_QWORD *)(v57 + 56) = v70;
  *(_QWORD *)(v57 + 64) = &protocol witness table for Expression<A>;
  *(_QWORD *)(v57 + 48) = v36;
  OUTLINED_FUNCTION_175();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_117_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_149_0();
  *(_QWORD *)(v57 + 72) = v75;
  *(_QWORD *)(v57 + 80) = v38;
  *(_QWORD *)(v57 + 96) = v67;
  *(_QWORD *)(v57 + 104) = &protocol witness table for Expression<A>;
  *(_QWORD *)(v57 + 88) = v74;
  OUTLINED_FUNCTION_175();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_117_0();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_149_0();
  *(_QWORD *)(v57 + 136) = v56;
  *(_QWORD *)(v57 + 144) = &protocol witness table for Expression<A>;
  *(_QWORD *)(v57 + 112) = v78;
  *(_QWORD *)(v57 + 120) = v76;
  *(_QWORD *)(v57 + 128) = v77;
  OUTLINED_FUNCTION_34_10(v57, v87);
  OUTLINED_FUNCTION_108_4();
  sub_21250F4FC();
  sub_2124E3C00((uint64_t)v86, (uint64_t)v84);
  sub_2124E3C00((uint64_t)v87, (uint64_t)v85);
  v83 = v80;
  v82 = v79;
  OUTLINED_FUNCTION_141_6();
  v58 = v85[4];
  v59 = __swift_project_boxed_opaque_existential_1(v85, v85[3]);
  OUTLINED_FUNCTION_157_3(v35, (uint64_t)v84, (uint64_t)v59, &v83, &v82, v81, v60, v61, v77, v58);
  sub_2124D1AF0((uint64_t)v86, &qword_254B4DC30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v84);
  OUTLINED_FUNCTION_3_1();
}

void sub_21251990C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  _BYTE v9[40];

  sub_2124E3C00(a1, (uint64_t)v8);
  sub_2124E3C00(a2, (uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD560);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212536C70;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD350);
  *(_QWORD *)(inited + 64) = &protocol witness table for Expression<A>;
  v7 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(inited + 32) = 0x434E455245464552;
  *(_QWORD *)(inited + 40) = 0xEA00000000005345;
  *(_QWORD *)(inited + 48) = v7;
  *(_QWORD *)(inited + 56) = v6;
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  sub_21250B8B0();
  *(_QWORD *)(inited + 136) = v6;
  *(_QWORD *)(inited + 144) = &protocol witness table for Expression<A>;
  sub_21250B420(v9, 0, 0xE000000000000000);
  sub_212526788(inited, a3);
  swift_setDeallocating();
  sub_21250F4FC();
  sub_2124D1AF0((uint64_t)v8, &qword_254B4DC30);
}

uint64_t TableBuilder.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t TableBuilder.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

BOOL static PrimaryKey.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PrimaryKey.hash(into:)()
{
  return sub_2125331CC();
}

uint64_t PrimaryKey.hashValue.getter()
{
  sub_2125331C0();
  sub_2125331CC();
  return sub_2125331E4();
}

uint64_t Module.init(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = sub_212526AF0(34, 0xE100000000000000, a1, a2);
  v8 = v7;
  result = OUTLINED_FUNCTION_16_0();
  *a4 = v6;
  a4[1] = v8;
  a4[2] = a3;
  return result;
}

void Module.expression.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3[5];

  v1 = *v0;
  v2 = v0[1];
  OUTLINED_FUNCTION_34_10(v0[2], v3);
  sub_21250B420(v3, v1, v2);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  OUTLINED_FUNCTION_121_4();
}

uint64_t sub_212519BD0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t inited;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD560);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212534EA0;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD350);
  *(_QWORD *)(inited + 64) = &protocol witness table for Expression<A>;
  *(_QWORD *)(inited + 32) = 0x4B43454843;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  *(_QWORD *)(inited + 48) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(inited + 56) = v5;
  sub_2124E3C00(a1, inited + 72);
  sub_212526788(inited, a2);
  swift_setDeallocating();
  return sub_21250F4FC();
}

uint64_t type metadata accessor for TableBuilder()
{
  return objc_opt_self();
}

uint64_t sub_212519CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_212519CFC(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_212519D10(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_212519D24(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, char a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, __int128 *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v20;
  uint64_t v21;
  __int128 v25;
  unsigned __int8 v26;
  __int128 v27[2];
  uint64_t v28[6];

  v28[3] = a12;
  v28[4] = a13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v28);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a12 - 8) + 16))(boxed_opaque_existential_1, a1, a12);
  v26 = *a4;
  v25 = *a10;
  sub_212514228((uint64_t)v28, a2, a3, &v26, a5, a6, a7, a8, (uint64_t *)v27, a9, (uint64_t *)&v25);
  sub_21250F55C();
  v20 = *(_QWORD *)(*(_QWORD *)(a11 + 16) + 16);
  sub_21250F464(v20);
  v21 = *(_QWORD *)(a11 + 16);
  *(_QWORD *)(v21 + 16) = v20 + 1;
  sub_21249F9E0(v27, v21 + 40 * v20 + 32);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
}

uint64_t sub_212519E28(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t inited;
  __int128 v23;
  uint64_t v24;
  uint64_t i;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v33;
  uint64_t v34;
  __int128 v35[2];
  __int128 v36[2];
  _BYTE v37[40];
  _BYTE v38[40];
  _BYTE v39[40];
  uint64_t v40[5];
  uint64_t v41[6];

  v41[3] = a7;
  v41[4] = a9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v41);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 16))(boxed_opaque_existential_1, a1, a7);
  v40[3] = a8;
  v40[4] = a10;
  v19 = __swift_allocate_boxed_opaque_existential_1(v40);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 16))(v19, a3, a8);
  sub_2124E3C00(a2, (uint64_t)v38);
  sub_2124E3C00((uint64_t)v40, (uint64_t)v39);
  v20 = *a4;
  v21 = *a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD568);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212536C60;
  *(_QWORD *)&v36[0] = 0x204E474945524F46;
  *((_QWORD *)&v36[0] + 1) = 0xEB0000000059454BLL;
  sub_212532BCC();
  v23 = v36[0];
  *(_QWORD *)(inited + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD350);
  *(_QWORD *)(inited + 64) = &protocol witness table for Expression<A>;
  sub_21250B420(v41, v23, *((_QWORD *)&v23 + 1));
  swift_bridgeObjectRelease();
  sub_2124E3C00((uint64_t)v38, (uint64_t)v36);
  sub_2124E3C00((uint64_t)v39, (uint64_t)v37);
  sub_21251990C((uint64_t)v36, (uint64_t)v37, (uint64_t *)(inited + 72));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
  if ((_DWORD)v20 != 5)
  {
    *(_QWORD *)&v36[0] = 0x5441445055204E4FLL;
    *((_QWORD *)&v36[0] + 1) = 0xEA00000000002045;
    __asm { BR              X9 }
  }
  *(_QWORD *)(inited + 144) = 0;
  *(_OWORD *)(inited + 112) = 0u;
  *(_OWORD *)(inited + 128) = 0u;
  if ((_DWORD)v21 != 5)
  {
    *(_QWORD *)&v36[0] = 0x54454C4544204E4FLL;
    *((_QWORD *)&v36[0] + 1) = 0xEA00000000002045;
    __asm { BR              X9 }
  }
  *(_QWORD *)(inited + 184) = 0;
  *(_OWORD *)(inited + 152) = 0u;
  *(_OWORD *)(inited + 168) = 0u;
  v24 = MEMORY[0x24BEE4AF8];
  for (i = 32; i != 192; i += 40)
  {
    sub_2124C7DCC(inited + i, (uint64_t)v36, &qword_253EFD360);
    sub_212519CB4((uint64_t)v36, (uint64_t)&v33);
    if (v34)
    {
      sub_21249F9E0(&v33, (uint64_t)v35);
      sub_21249F9E0(v35, (uint64_t)&v33);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21250EF6C(0, *(_QWORD *)(v24 + 16) + 1, 1, v24);
        v24 = v28;
      }
      v27 = *(_QWORD *)(v24 + 16);
      v26 = *(_QWORD *)(v24 + 24);
      if (v27 >= v26 >> 1)
      {
        sub_21250EF6C(v26 > 1, v27 + 1, 1, v24);
        v24 = v29;
      }
      *(_QWORD *)(v24 + 16) = v27 + 1;
      sub_21249F9E0(&v33, v24 + 40 * v27 + 32);
    }
    else
    {
      sub_2124D1AF0((uint64_t)&v33, &qword_253EFD360);
    }
  }
  swift_bridgeObjectRelease();
  sub_212526788(v24, (uint64_t *)v36);
  swift_bridgeObjectRelease();
  sub_21250F55C();
  v30 = *(_QWORD *)(*(_QWORD *)(a6 + 16) + 16);
  sub_21250F464(v30);
  v31 = *(_QWORD *)(a6 + 16);
  *(_QWORD *)(v31 + 16) = v30 + 1;
  sub_21249F9E0(v36, v31 + 40 * v30 + 32);
  sub_2124D1AF0((uint64_t)v38, &qword_254B4DC30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
}

unint64_t sub_21251A328()
{
  unint64_t result;

  result = qword_254B4DC38;
  if (!qword_254B4DC38)
  {
    result = MEMORY[0x212BED510](&protocol conformance descriptor for TableBuilder.Dependency, &type metadata for TableBuilder.Dependency);
    atomic_store(result, (unint64_t *)&qword_254B4DC38);
  }
  return result;
}

unint64_t sub_21251A368()
{
  unint64_t result;

  result = qword_254B4DC40;
  if (!qword_254B4DC40)
  {
    result = MEMORY[0x212BED510](&protocol conformance descriptor for PrimaryKey, &type metadata for PrimaryKey);
    atomic_store(result, (unint64_t *)&qword_254B4DC40);
  }
  return result;
}

uint64_t method lookup function for TableBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t storeEnumTagSinglePayload for TableBuilder.Dependency(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21251A3FC + 4 * byte_2125371D4[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_21251A430 + 4 * byte_2125371CF[v4]))();
}

uint64_t sub_21251A430(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21251A438(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21251A440);
  return result;
}

uint64_t sub_21251A44C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21251A454);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21251A458(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21251A460(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for TableBuilder.Dependency()
{
  OUTLINED_FUNCTION_1_8();
}

uint64_t getEnumTagSinglePayload for PrimaryKey(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PrimaryKey(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21251A54C + 4 * byte_2125371DE[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21251A580 + 4 * byte_2125371D9[v4]))();
}

uint64_t sub_21251A580(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21251A588(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21251A590);
  return result;
}

uint64_t sub_21251A59C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21251A5A4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21251A5A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21251A5B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for PrimaryKey()
{
  OUTLINED_FUNCTION_1_8();
}

uint64_t destroy for Module()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for Module(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for Module(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Module(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for Module(uint64_t result, int a2, int a3)
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

void type metadata accessor for Module()
{
  OUTLINED_FUNCTION_1_8();
}

uint64_t OUTLINED_FUNCTION_3_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Expression(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_7_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return type metadata accessor for Expression(0, a1, a3, a4);
}

uint64_t OUTLINED_FUNCTION_9_16()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_13_10()
{
  return swift_bridgeObjectRelease();
}

double OUTLINED_FUNCTION_14_16()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 - 128) = 0;
  result = 0.0;
  *(_OWORD *)(v0 - 160) = 0u;
  *(_OWORD *)(v0 - 144) = 0u;
  return result;
}

void OUTLINED_FUNCTION_16_12()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 113) = 2;
}

void OUTLINED_FUNCTION_19_12()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 113) = 2;
}

uint64_t OUTLINED_FUNCTION_20_7(_QWORD *a1)
{
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1(a1, v1);
  return Expressible.asSQL()()._countAndFlagsBits;
}

void OUTLINED_FUNCTION_26_8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  sub_2124D1AF0((uint64_t)va, a2);
}

uint64_t OUTLINED_FUNCTION_27_5()
{
  uint64_t v0;
  unint64_t v1;

  return sub_212519D10(v0, v1);
}

double OUTLINED_FUNCTION_28_7()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_31_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, char a16, uint64_t a17, __int128 a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  return sub_212519D24(v31 - 112, v30, v29, (unsigned __int8 *)(v31 - 113), 0, a16 & 1, v31 - 160, (uint64_t)&a29, (uint64_t)&a19, &a18, a17, a12, a13);
}

void OUTLINED_FUNCTION_33_10(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_212526788(a1, a2);
}

uint64_t OUTLINED_FUNCTION_35_6()
{
  uint64_t v0;

  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_36_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __int128 a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  return sub_212519D24(v30 - 112, v29, v28, (unsigned __int8 *)(v30 - 113), 0, 0, v30 - 160, (uint64_t)&a28, (uint64_t)&a18, &a17, a16, a12, a13);
}

uint64_t OUTLINED_FUNCTION_37_4()
{
  uint64_t v0;

  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_39_4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, __int128 *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;

  return sub_212519D24(a1, a2, v13, a4, 1, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t OUTLINED_FUNCTION_41_9()
{
  uint64_t v0;

  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_42_8(uint64_t a1)
{
  return sub_2125146D8(a1);
}

void OUTLINED_FUNCTION_43_8(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_21250EF6C(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_44_6(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_21250EF6C(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_45_9(uint64_t a1)
{
  uint64_t v1;

  return sub_21250F5C8(a1, v1);
}

uint64_t OUTLINED_FUNCTION_48_8()
{
  uint64_t v0;

  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_54_7()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21250F5C8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_55_8()
{
  uint64_t v0;

  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_56_4()
{
  return sub_212532EA8();
}

uint64_t OUTLINED_FUNCTION_57_6()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21250F5C8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_58_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Expression(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_59_7@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_60_4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  sub_2124D1AF0((uint64_t)va, a2);
}

uint64_t OUTLINED_FUNCTION_61_5@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, char a5@<W4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t *a8@<X8>, uint64_t a9, uint64_t *a10)
{
  return sub_212514228(a1, a2, a3, a4, a5, 0, a6, a7, a8, a9, a10);
}

double OUTLINED_FUNCTION_62_8()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_65_4(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, __int128 *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return sub_212519D24(a1, a2, a3, a4, 0, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t OUTLINED_FUNCTION_66_5(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int128 *a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return sub_212519D24(a1, a2, a3, a4, 0, 0, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t OUTLINED_FUNCTION_69_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Expression(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_70_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Expression(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_71_6()
{
  uint64_t v0;

  return v0 + 256;
}

uint64_t OUTLINED_FUNCTION_72_6(uint64_t a1, uint64_t a2)
{
  return sub_21250F5C8(a1, a2);
}

void OUTLINED_FUNCTION_75_7(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = v1;
  *(_QWORD *)(v2 - 104) = a1;
}

uint64_t OUTLINED_FUNCTION_76_5(uint64_t a1)
{
  uint64_t v1;

  __swift_destroy_boxed_opaque_existential_1(a1);
  return v1;
}

uint64_t OUTLINED_FUNCTION_77_8()
{
  uint64_t v0;

  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_79_5(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_80_8()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_81_9()
{
  uint64_t v0;

  return v0;
}

double OUTLINED_FUNCTION_82_6()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_84_7()
{
  uint64_t v0;

  return v0 - 104;
}

uint64_t OUTLINED_FUNCTION_85_7@<X0>(uint64_t a1@<X8>, __int128 a2)
{
  return sub_21249F9E0(&a2, a1 + 32);
}

uint64_t OUTLINED_FUNCTION_86_7()
{
  return sub_212532EA8();
}

uint64_t OUTLINED_FUNCTION_87_7()
{
  return sub_212532EA8();
}

uint64_t OUTLINED_FUNCTION_88_5()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21250F5C8(v1, v0);
}

void OUTLINED_FUNCTION_90_5()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 16) = v1 + 1;
}

uint64_t OUTLINED_FUNCTION_91_7(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v2, v1);
}

void OUTLINED_FUNCTION_92_6(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  sub_2124D1AF0((uint64_t)va, a2);
}

void OUTLINED_FUNCTION_93_5(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 112) = v1;
  *(_QWORD *)(v3 - 104) = a1;
  *(_QWORD *)(v3 - 96) = v2;
}

uint64_t OUTLINED_FUNCTION_94_7()
{
  return sub_212532EA8();
}

uint64_t OUTLINED_FUNCTION_95_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_96_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,__int128 a29)
{
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  *(_QWORD *)(v29 + 16) = v30;
  return sub_21249F9E0(&a29, v29 + v32 * v31 + 32);
}

uint64_t OUTLINED_FUNCTION_99_6()
{
  uint64_t v0;
  uint64_t v1;

  return sub_212526AF0(34, 0xE100000000000000, v0, v1);
}

uint64_t OUTLINED_FUNCTION_100_6()
{
  uint64_t v0;
  uint64_t v1;

  return sub_212526AF0(34, 0xE100000000000000, v1, v0);
}

uint64_t OUTLINED_FUNCTION_101_5()
{
  uint64_t v0;
  unint64_t v1;

  return sub_212519D10(v0, v1);
}

uint64_t OUTLINED_FUNCTION_102_4()
{
  uint64_t v0;
  unint64_t v1;

  return sub_212519CFC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_103_5(uint64_t a1, uint64_t a2)
{
  return sub_21250F5C8(a1, a2);
}

double OUTLINED_FUNCTION_104_4()
{
  return 0.0;
}

void OUTLINED_FUNCTION_107_4(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = v1;
  *(_QWORD *)(v2 - 104) = a1;
}

char *OUTLINED_FUNCTION_109_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  return &a39;
}

uint64_t *OUTLINED_FUNCTION_110_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  return __swift_allocate_boxed_opaque_existential_1(&a28);
}

void OUTLINED_FUNCTION_112_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;

  sub_2124C7DCC(v39 + v41, (uint64_t)&a39, v40);
}

double OUTLINED_FUNCTION_113_4()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_114_5()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21250F5C8(v1, v0);
}

void OUTLINED_FUNCTION_115_6(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = v1;
  *(_QWORD *)(v2 - 104) = a1;
}

char *OUTLINED_FUNCTION_117_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  return &a41;
}

uint64_t OUTLINED_FUNCTION_118_3()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_119_7()
{
  uint64_t v0;

  sub_21250F464(*(_QWORD *)(*(_QWORD *)(v0 + 16) + 16));
}

uint64_t *OUTLINED_FUNCTION_120_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  return __swift_allocate_boxed_opaque_existential_1(&a30);
}

uint64_t OUTLINED_FUNCTION_122_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int128 *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, char a17)
{
  uint64_t v17;

  return sub_212519D24(a1, a2, v17, a4, 1, a17, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t OUTLINED_FUNCTION_125_5()
{
  return 34;
}

uint64_t OUTLINED_FUNCTION_127_6()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21250F5C8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_128_5()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21250F5C8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_129_3()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21250F5C8(v1, v0);
}

void OUTLINED_FUNCTION_131_3(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = v1;
  *(_QWORD *)(v2 - 104) = a1;
}

uint64_t OUTLINED_FUNCTION_133_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  return sub_212519CB4((uint64_t)&a39, (uint64_t)&a29);
}

uint64_t OUTLINED_FUNCTION_134_6()
{
  return 0x5845444E49;
}

double OUTLINED_FUNCTION_135_5()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_137_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, __int128 a14)
{
  return sub_21249F9E0(&a14, (uint64_t)&a9);
}

void OUTLINED_FUNCTION_139_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t *v9;

  sub_2124D1AF0((uint64_t)&a9, v9);
}

uint64_t OUTLINED_FUNCTION_140_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_212519CB4(a1, (uint64_t)&a9);
}

_QWORD *OUTLINED_FUNCTION_141_6()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 - 128), *(_QWORD *)(v0 - 104));
}

uint64_t OUTLINED_FUNCTION_142_3()
{
  return sub_212532EA8();
}

double OUTLINED_FUNCTION_143_4()
{
  _OWORD *v0;
  double result;

  result = 0.0;
  v0[8] = 0u;
  v0[9] = 0u;
  v0[6] = 0u;
  v0[7] = 0u;
  v0[5] = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_144_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return type metadata accessor for Expression(0, a13, a3, a4);
}

uint64_t OUTLINED_FUNCTION_145_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return type metadata accessor for Expression(0, a11, a3, a4);
}

uint64_t OUTLINED_FUNCTION_146_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Expression(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_147_3()
{
  return sub_212532EA8();
}

uint64_t OUTLINED_FUNCTION_148_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Expression(0, v4, a3, a4);
}

uint64_t *OUTLINED_FUNCTION_149_4@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;

  a20 = v21;
  a21 = a1;
  return __swift_allocate_boxed_opaque_existential_1(&a17);
}

uint64_t OUTLINED_FUNCTION_154_4()
{
  uint64_t v0;

  return v0 - 112;
}

uint64_t OUTLINED_FUNCTION_155_2()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_156_2()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0, v2);
}

uint64_t OUTLINED_FUNCTION_157_3(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;

  return sub_212519E28(a1, a2, a3, a4, a5, a6, v10, v11, a9, a10);
}

uint64_t OUTLINED_FUNCTION_158_2()
{
  return sub_21250F4FC();
}

uint64_t OUTLINED_FUNCTION_160_2(uint64_t a1)
{
  return sub_21250B420(a1, 0, 0xE000000000000000);
}

uint64_t OUTLINED_FUNCTION_161_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)&a37);
}

void OUTLINED_FUNCTION_163_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 160) = v1;
  *(_QWORD *)(v3 - 152) = v0;
  *(_QWORD *)(v3 - 144) = v2;
}

uint64_t OUTLINED_FUNCTION_164_3()
{
  return swift_setDeallocating();
}

uint64_t OUTLINED_FUNCTION_166_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_212526AF0(a1, a2, a3, v3);
}

uint64_t *OUTLINED_FUNCTION_167_2@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;

  a22 = v23;
  a23 = a1;
  return __swift_allocate_boxed_opaque_existential_1(&a19);
}

uint64_t OUTLINED_FUNCTION_168_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_212526AF0(a1, a2, a3, v3);
}

_QWORD *Blob.init(bytes:length:)@<X0>(const void *a1@<X0>, int64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;

  result = sub_21251B390(a1, a2);
  *a3 = result;
  return result;
}

uint64_t Blob.bytes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Blob.init(bytes:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

Swift::String __swiftcall Blob.toHex()()
{
  uint64_t *v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  Swift::String result;
  uint64_t v16;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 16);
  if (v2)
  {
    v16 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_21250F6F0(0, v2, 0);
    sub_21251B41C();
    v3 = 0;
    do
    {
      v4 = *(unsigned __int8 *)(v1 + v3 + 32);
      if (v4 >= 0x10)
        v5 = 0;
      else
        v5 = 48;
      if (v4 >= 0x10)
        v6 = 0xE000000000000000;
      else
        v6 = 0xE100000000000000;
      sub_212532C14();
      swift_bridgeObjectRetain();
      sub_212532BCC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v8 = *(_QWORD *)(v16 + 16);
      v7 = *(_QWORD *)(v16 + 24);
      if (v8 >= v7 >> 1)
        sub_21250F6F0((char *)(v7 > 1), v8 + 1, 1);
      ++v3;
      *(_QWORD *)(v16 + 16) = v8 + 1;
      v9 = v16 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v5;
      *(_QWORD *)(v9 + 40) = v6;
    }
    while (v2 != v3);
    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD4D0);
  sub_2124BF988();
  v10 = sub_212532AAC();
  v12 = v11;
  swift_bridgeObjectRelease();
  v13 = v10;
  v14 = v12;
  result._object = v14;
  result._countAndFlagsBits = v13;
  return result;
}

uint64_t Blob.description.getter()
{
  Blob.toHex()();
  sub_212532BCC();
  swift_bridgeObjectRelease();
  sub_212532BCC();
  return 10104;
}

BOOL == infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_21251B31C(*a1, *a2);
}

BOOL sub_21251B31C(uint64_t a1, uint64_t a2)
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

_QWORD *sub_21251B390(const void *a1, int64_t a2)
{
  _QWORD *v4;
  size_t v5;

  if (!a2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  if (a2 <= 0)
  {
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB8B0);
    v4 = (_QWORD *)swift_allocObject();
    v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a2;
    v4[3] = 2 * v5 - 64;
  }
  memcpy(v4 + 4, a1, a2);
  return v4;
}

unint64_t sub_21251B41C()
{
  unint64_t result;

  result = qword_254B4DCE8;
  if (!qword_254B4DCE8)
  {
    result = MEMORY[0x212BED510](MEMORY[0x24BEE4298], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_254B4DCE8);
  }
  return result;
}

ValueMetadata *type metadata accessor for Blob()
{
  return &type metadata for Blob;
}

_QWORD *sub_21251B468(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253EFD570);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
  v5 = sub_2125264D4((uint64_t)&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_2124CE664();
  if (v5 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

double sub_21251B548@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_21251B750(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), a1);
}

uint64_t sub_21251B550@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = sub_212531570();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  v8 = swift_allocObject();
  v9 = MEMORY[0x24BEE0D00];
  *(_OWORD *)(v8 + 16) = xmmword_212534F20;
  *(_QWORD *)(v8 + 56) = v9;
  *(_QWORD *)(v8 + 64) = &protocol witness table for String;
  if (qword_253EFB790 != -1)
    swift_once();
  swift_beginAccess();
  v10 = (id)qword_253EFB788;
  v11 = (void *)sub_212531504();
  v12 = objc_msgSend(v10, sel_stringFromDate_, v11);

  v13 = sub_212532AF4();
  v15 = v14;

  *(_QWORD *)(v8 + 32) = v13;
  *(_QWORD *)(v8 + 40) = v15;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a1 = 63;
  a1[1] = 0xE100000000000000;
  a1[2] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21251B6D8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_212534F20;
  *(_QWORD *)(v4 + 56) = &type metadata for Blob;
  *(_QWORD *)(v4 + 64) = &protocol witness table for Blob;
  *(_QWORD *)(v4 + 32) = a1;
  *a2 = 63;
  a2[1] = 0xE100000000000000;
  a2[2] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

double sub_21251B750@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double result;
  uint64_t v7;
  __int128 v8;

  sub_2124A9F10(a1, a2);
  sub_21251C220(a1, a2);
  *(_QWORD *)a3 = v7;
  result = *(double *)&v8;
  *(_OWORD *)(a3 + 8) = v8;
  return result;
}

uint64_t sub_21251B7A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  v6 = swift_allocObject();
  v7 = MEMORY[0x24BEE0D00];
  *(_OWORD *)(v6 + 16) = xmmword_212534F20;
  *(_QWORD *)(v6 + 56) = v7;
  *(_QWORD *)(v6 + 64) = &protocol witness table for String;
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  *a3 = 63;
  a3[1] = 0xE100000000000000;
  a3[2] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21251B82C@<X0>(char a1@<W0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_212534F20;
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE4008];
  *(_QWORD *)(v4 + 64) = &protocol witness table for Int64;
  *(_QWORD *)(v4 + 32) = a1 & 1;
  *a2 = 63;
  a2[1] = 0xE100000000000000;
  a2[2] = v4;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21251B8A0@<X0>(_QWORD *a1@<X8>, double a2@<D0>)
{
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  v4 = swift_allocObject();
  v5 = MEMORY[0x24BEE13C8];
  *(_OWORD *)(v4 + 16) = xmmword_212534F20;
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = &protocol witness table for Double;
  *(double *)(v4 + 32) = a2;
  *a1 = 63;
  a1[1] = 0xE100000000000000;
  a1[2] = v4;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21251B918@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  v4 = OUTLINED_FUNCTION_11_13();
  v5 = MEMORY[0x24BEE4008];
  *(_OWORD *)(v4 + 16) = xmmword_212534F20;
  *(_QWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 64) = &protocol witness table for Int64;
  *(_QWORD *)(v4 + 32) = a1;
  *a2 = 63;
  a2[1] = 0xE100000000000000;
  a2[2] = v4;
  return swift_bridgeObjectRelease();
}

void Value.expression.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];

  OUTLINED_FUNCTION_3_15();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Expression(0, v1, v6, v7);
  OUTLINED_FUNCTION_5_7((uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  v9 = MEMORY[0x212BED510](&protocol conformance descriptor for Expression<A>, v8);
  ExpressionType<>.init(value:)((uint64_t)v5, v8, v9, v0);
  v10[0] = v10[3];
  v10[1] = v10[4];
  v10[2] = v10[5];
  ExpressionType.expression.getter();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_41_0();
}

uint64_t type metadata accessor for Expression(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Expression);
}

uint64_t ExpressionType.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(a3, a5);
  v12 = v11;
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 32))(a3, a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 40))(v10, v12, v13, a2, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
}

uint64_t ExpressionType.init(literal:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(a4 + 40))(a1, a2, MEMORY[0x24BEE4AF8], a3);
}

uint64_t ExpressionType.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_212526AF0(34, 0xE100000000000000, a1, a2);
  v8 = v7;
  OUTLINED_FUNCTION_46();
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(a4 + 40))(v6, v8, MEMORY[0x24BEE4AF8], a3, a4);
}

uint64_t sub_21251BBB8()
{
  return ExpressionType.expression.getter();
}

uint64_t ExpressionType.expression.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  OUTLINED_FUNCTION_3_15();
  v4 = (*(uint64_t (**)(void))(v3 + 24))();
  v6 = v5;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 32))(v1, v0);
  *v2 = v4;
  v2[1] = v6;
  v2[2] = result;
  return result;
}

uint64_t sub_21251BC18()
{
  _QWORD *v0;

  return sub_21250C0EC(*v0, v0[1], v0[2]);
}

uint64_t ExpressionType<>.init(value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v23 = a3;
  v21[1] = a5;
  v22 = a2;
  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = sub_212532EA8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - v10;
  v21[0] = a4;
  v12 = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v21 - v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  v16 = OUTLINED_FUNCTION_11_13();
  *(_OWORD *)(v16 + 16) = xmmword_212534F20;
  v17 = (uint64_t *)(v16 + 32);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v24 = a1;
  v18(v11, a1, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, AssociatedTypeWitness) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    *(_QWORD *)(v16 + 64) = 0;
    *(_OWORD *)v17 = 0u;
    *(_OWORD *)(v16 + 48) = 0u;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v21[0] + 56))(AssociatedTypeWitness, v21[0]);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v11, AssociatedTypeWitness);
    *(_QWORD *)(v16 + 56) = v12;
    *(_QWORD *)(v16 + 64) = swift_getAssociatedConformanceWitness();
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
    (*(void (**)(uint64_t *, char *, uint64_t))(v13 + 32))(boxed_opaque_existential_1, v15, v12);
  }
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(v23 + 40))(63, 0xE100000000000000, v16, v22);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v24, v8);
}

Swift::String __swiftcall Expressible.asSQL()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  Swift::String result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  (*(void (**)(uint64_t *__return_ptr))(v0 + 8))(&v10);
  v1 = v12;
  v2 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0)
    v2 = v10 & 0xFFFFFFFFFFFFLL;
  v12 = 0;
  v13 = v2;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v3 = sub_212532BF0();
  if (!v4)
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v3 = 0;
    v4 = (void *)0xE000000000000000;
    goto LABEL_18;
  }
  v5 = v3;
  v6 = v4;
  v7 = 0;
  while (1)
  {
    if (v5 != 63 || v6 != (void *)0xE100000000000000)
    {
      v3 = sub_212533130();
      if ((v3 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        goto LABEL_14;
      }
    }
    if ((v7 & 0x8000000000000000) != 0)
      break;
    if (v7 >= *(_QWORD *)(v1 + 16))
      goto LABEL_17;
    sub_212526FB8(v1 + 32 + 40 * v7++);
LABEL_14:
    swift_bridgeObjectRetain();
    sub_212532BCC();
    OUTLINED_FUNCTION_46();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v3 = sub_212532BF0();
    v5 = v3;
    v6 = v4;
    if (!v4)
      goto LABEL_15;
  }
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t Expression.init(_:_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t Expression.template.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Expression.template.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*Expression.template.modify())()
{
  return nullsub_1;
}

uint64_t Expression.bindings.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Expression.bindings.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*Expression.bindings.modify())()
{
  return nullsub_1;
}

uint64_t sub_21251C0AC(uint64_t a1)
{
  MEMORY[0x212BED510](&protocol conformance descriptor for Expression<A>, a1);
  return ExpressionType.expression.getter();
}

void ExpressionType.asc.getter()
{
  uint64_t v0;
  __n128 *inited;
  uint64_t *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_3_15();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD560);
  inited = (__n128 *)swift_initStackObject();
  v2 = OUTLINED_FUNCTION_2_16(inited, (__n128)xmmword_212534EA0);
  OUTLINED_FUNCTION_5_7((uint64_t)v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16));
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD350);
  inited[6].n128_u64[1] = (unint64_t)&protocol witness table for Expression<A>;
  inited[4].n128_u64[1] = 4412225;
  inited[5].n128_u64[0] = 0xE300000000000000;
  OUTLINED_FUNCTION_4_15(v3, MEMORY[0x24BEE4AF8]);
  swift_setDeallocating();
  sub_21250F4FC();
  OUTLINED_FUNCTION_9_17();
}

void ExpressionType.desc.getter()
{
  uint64_t v0;
  __n128 *inited;
  uint64_t *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_3_15();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD560);
  inited = (__n128 *)swift_initStackObject();
  v2 = OUTLINED_FUNCTION_2_16(inited, (__n128)xmmword_212534EA0);
  OUTLINED_FUNCTION_5_7((uint64_t)v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16));
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD350);
  inited[6].n128_u64[1] = (unint64_t)&protocol witness table for Expression<A>;
  inited[4].n128_u64[1] = 1129530692;
  inited[5].n128_u64[0] = 0xE400000000000000;
  OUTLINED_FUNCTION_4_15(v3, MEMORY[0x24BEE4AF8]);
  swift_setDeallocating();
  sub_21250F4FC();
  OUTLINED_FUNCTION_9_17();
}

void sub_21251C220(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_212534F20;
  *(_QWORD *)(v3 + 56) = &type metadata for Blob;
  *(_QWORD *)(v3 + 64) = &protocol witness table for Blob;
  __asm { BR              X10 }
}

uint64_t sub_21251C2A4()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  sub_212507484(v2, v1 & 0xFFFFFFFFFFFFLL, BYTE6(v1), v2, v1);
  result = sub_2124A9E34(v2, v1);
  *v0 = 63;
  v0[1] = 0xE100000000000000;
  v0[2] = v3;
  return result;
}

uint64_t ExpressionType<>.init(value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  v8 = OUTLINED_FUNCTION_11_13();
  *(_OWORD *)(v8 + 16) = xmmword_212534F20;
  v9 = *(void (**)(uint64_t, uint64_t))(a4 + 56);
  swift_getAssociatedTypeWitness();
  *(_QWORD *)(v8 + 56) = swift_getAssociatedTypeWitness();
  *(_QWORD *)(v8 + 64) = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v8 + 32));
  v10 = swift_checkMetadataState();
  v9(v10, a4);
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(a3 + 40))(63, 0xE100000000000000, v8, a2, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
}

void static ExpressionType<>.null.getter(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  swift_getAssociatedTypeWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = sub_212532EA8();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v12 - v10;
  __swift_storeEnumTagSinglePayload((uint64_t)&v12 - v10, 1, 1, AssociatedTypeWitness);
  ExpressionType<>.init(value:)((uint64_t)v11, a1, a2, a3, a4);
  OUTLINED_FUNCTION_41_0();
}

uint64_t sub_21251C5EC()
{
  uint64_t result;
  uint64_t v1;

  result = sub_212526AF0(34, 0xE100000000000000, 0x4449574F52, 0xE500000000000000);
  qword_254B4DCF0 = result;
  *(_QWORD *)algn_254B4DCF8 = v1;
  qword_254B4DD00 = MEMORY[0x24BEE4AF8];
  return result;
}

uint64_t rowid.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_254B4DA90 != -1)
    swift_once();
  v2 = *(_QWORD *)algn_254B4DCF8;
  v3 = qword_254B4DD00;
  *a1 = qword_254B4DCF0;
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t cast<A, B>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_10_15();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_11();
  (*(void (**)(uint64_t, uint64_t))(a5 + 40))(a3, a5);
  sub_212532BCC();
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_11_14();
  *v5 = v10;
  v5[1] = v11;
  v5[2] = v6;
  return OUTLINED_FUNCTION_1_12();
}

{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_10_15();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7_11();
  (*(void (**)(uint64_t, uint64_t))(a5 + 40))(a3, a5);
  sub_212532BCC();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_14();
  sub_212532EA8();
  *v5 = v10;
  v5[1] = v11;
  v5[2] = v6;
  return OUTLINED_FUNCTION_1_12();
}

uint64_t sub_21251C794@<X0>(_QWORD *a1@<X8>)
{
  double *v1;

  return sub_21251B8A0(a1, *v1);
}

uint64_t sub_21251C79C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_21251B7A8(*v1, v1[1], a1);
}

uint64_t sub_21251C7A4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_21251B6D8(*v1, a1);
}

uint64_t sub_21251C7AC@<X0>(_QWORD *a1@<X8>)
{
  char *v1;

  return sub_21251B82C(*v1, a1);
}

uint64_t sub_21251C7B4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_21251B918(*v1, a1);
}

uint64_t dispatch thunk of ExpressionType.template.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ExpressionType.bindings.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ExpressionType.init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

_QWORD *sub_21251C7E8(_QWORD *a1, _QWORD *a2)
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

uint64_t dispatch thunk of Expressible.expression.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t OUTLINED_FUNCTION_0_13()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  return swift_bridgeObjectRetain();
}

uint64_t *OUTLINED_FUNCTION_2_16(__n128 *a1, __n128 a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  a1[1] = a2;
  *(_QWORD *)(v4 + 56) = v3;
  *(_QWORD *)(v4 + 64) = *(_QWORD *)(v2 + 8);
  return __swift_allocate_boxed_opaque_existential_1((uint64_t *)&a1[2]);
}

void OUTLINED_FUNCTION_4_15(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 88) = a2;
  *(_QWORD *)(v3 + 96) = a1;
  sub_212526788(v3, v2);
}

uint64_t OUTLINED_FUNCTION_5_7@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_7_11()
{
  return sub_212532BCC();
}

uint64_t OUTLINED_FUNCTION_10_15()
{
  return sub_212532BCC();
}

uint64_t OUTLINED_FUNCTION_11_14()
{
  return sub_212532BCC();
}

void Connection.prepare(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_21251E380(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:));
}

{
  uint64_t v3;
  uint64_t v4;

  if (*(_QWORD *)(a3 + 16))
  {
    Connection.prepare(_:_:)(a1, a2, MEMORY[0x24BEE4AF8]);
    if (!v4)
    {
      Statement.bind(_:)(a3);
      OUTLINED_FUNCTION_14_0();
    }
  }
  else
  {
    type metadata accessor for Statement();
    swift_allocObject();
    OUTLINED_FUNCTION_75();
    swift_bridgeObjectRetain();
    sub_21252488C(v3);
  }
  OUTLINED_FUNCTION_27_6();
}

{
  sub_21251E380(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:));
}

void Connection.scalar(_:_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  sub_21251E4AC(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:), a4);
}

{
  Connection.scalar(_:_:)(a1, a2, a3, a4);
}

{
  sub_21251E4AC(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:), a4);
}

void Connection.run(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_21251E400(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:));
}

{
  Connection.run(_:_:)(a1, a2, a3);
}

{
  sub_21251E400(a1, a2, a3, (void (*)(uint64_t))Statement.bind(_:));
}

sqlite3_int64 Connection.lastInsertRowid.getter()
{
  sqlite3 *v0;

  v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_last_insert_rowid(v0);
}

BOOL sub_21251C96C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  id v9;
  uint64_t v11;
  char v12;
  BOOL v13;

  sub_2124D1A58();
  if (qword_253EFD1D8 != -1)
    swift_once();
  sub_212532DD0();
  v4 = sub_21251E0B8();
  if ((v12 & 1) != 0 || v11 != v4)
  {
    v9 = *(id *)(a1 + 88);
    sub_212532E00();
    OUTLINED_FUNCTION_43_9();

    if (!v9)
      return v13;
  }
  else
  {
    v5 = *(_QWORD *)(a2 + 24);
    OUTLINED_FUNCTION_0_0();
    v6 = sqlite3_step(*(sqlite3_stmt **)(a2 + 16));
    v7 = v6;
    sub_21251DFD4(v6, 0);
    OUTLINED_FUNCTION_43_9();
    if (!v5)
      return v7 == 100;
  }
  return v8;
}

void sub_21251CA94()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  id v4;
  sqlite3 *v5;

  OUTLINED_FUNCTION_29_7();
  OUTLINED_FUNCTION_0_14();
  if (qword_253EFD1D8 != -1)
    swift_once();
  OUTLINED_FUNCTION_40_8();
  v3 = OUTLINED_FUNCTION_14_17();
  if ((v2 & 1) != 0 || v1 != v3)
  {
    v4 = OUTLINED_FUNCTION_36_10();
    OUTLINED_FUNCTION_13_11();
    if (v0)
    {
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_95_0();
      OUTLINED_FUNCTION_108();

      goto LABEL_12;
    }
    OUTLINED_FUNCTION_108();

LABEL_11:
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_95_0();
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_5_8();
  if (!v0)
  {
    swift_release();
    v5 = (sqlite3 *)OUTLINED_FUNCTION_46_8();
    sqlite3_last_insert_rowid(v5);
    OUTLINED_FUNCTION_108();
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_108();
LABEL_12:
  OUTLINED_FUNCTION_3_16();
}

void sub_21251CB84()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  id v4;
  sqlite3 *v5;

  OUTLINED_FUNCTION_29_7();
  OUTLINED_FUNCTION_0_14();
  if (qword_253EFD1D8 != -1)
    swift_once();
  OUTLINED_FUNCTION_40_8();
  v3 = OUTLINED_FUNCTION_14_17();
  if ((v2 & 1) != 0 || v1 != v3)
  {
    v4 = OUTLINED_FUNCTION_36_10();
    OUTLINED_FUNCTION_13_11();
    if (v0)
    {
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_95_0();
      OUTLINED_FUNCTION_108();

      goto LABEL_12;
    }
    OUTLINED_FUNCTION_108();

LABEL_11:
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_95_0();
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_5_8();
  if (!v0)
  {
    swift_release();
    v5 = (sqlite3 *)OUTLINED_FUNCTION_46_8();
    sqlite3_changes(v5);
    OUTLINED_FUNCTION_108();
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_108();
LABEL_12:
  OUTLINED_FUNCTION_3_16();
}

uint64_t sub_21251CC78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  sqlite3 *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;
  unsigned int v10;

  sub_2124D1A58();
  if (qword_253EFD1D8 != -1)
    swift_once();
  sub_212532DD0();
  v3 = sub_21251E0B8();
  if ((v9 & 1) != 0 || v8 != v3)
  {
    v6 = (uint64_t)*(id *)(a1 + 88);
    sub_212532E00();
    if (v1)
    {
      swift_bridgeObjectRelease();
      swift_release();

      return v6;
    }
    swift_release();

    v6 = v10;
LABEL_11:
    swift_bridgeObjectRelease();
    return v6;
  }
  v4 = (sqlite3 *)Connection.handle.getter();
  v5 = sub_212532B54();
  v6 = sqlite3_exec(v4, (const char *)(v5 + 32), 0, 0, 0);
  swift_release();
  sub_21251DFD4(v6, 0);
  if (!v1)
  {
    swift_release();
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  swift_release();
  return v6;
}

uint64_t sub_21251CE18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t), uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  id v14;
  uint64_t v19;
  char v20;
  uint64_t v21;

  sub_2124D1A58();
  if (qword_253EFD1D8 != -1)
    swift_once();
  sub_212532DD0();
  v13 = sub_21251E0B8();
  if ((v20 & 1) != 0 || v19 != v13)
  {
    v14 = *(id *)(a1 + 88);
    sub_212532E00();
    if (v21)
    {
      swift_bridgeObjectRelease();
      swift_release();

      goto LABEL_9;
    }
    swift_release();

LABEL_12:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  sub_21251E94C(a2, a3, a4, a5, a6, a7, a8);
  if (!v21)
  {
    swift_release();
    goto LABEL_12;
  }
  swift_bridgeObjectRelease();
  swift_release();
LABEL_9:
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t Connection.changes.getter()
{
  sqlite3 *v0;

  v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_changes(v0);
}

void sub_21251D004(char a1, char a2)
{
  uint64_t v2;
  char v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  unint64_t v9;

  v2 = 0x53534F5243;
  if (a1)
  {
    OUTLINED_FUNCTION_53_6();
    if (v3)
      v5 = 0x52454E4E49;
    else
      v5 = 0x54554F205446454CLL;
    if (v3)
      v6 = v4;
    else
      v6 = 0xEA00000000005245;
  }
  else
  {
    v6 = 0xE500000000000000;
    v5 = 0x53534F5243;
  }
  if (a2)
  {
    OUTLINED_FUNCTION_53_6();
    if (v7)
      v2 = 0x52454E4E49;
    else
      v2 = 0x54554F205446454CLL;
    if (v7)
      v9 = v8;
    else
      v9 = 0xEA00000000005245;
  }
  else
  {
    v9 = 0xE500000000000000;
  }
  if (v5 != v2 || v6 != v9)
    OUTLINED_FUNCTION_36_7();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_21();
}

void sub_21251D0E0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21251D13C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21251D1BC + 4 * byte_212537465[a2]))(0x5443495254534552);
}

void sub_21251D1BC(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x5443495254534552 || v1 != 0xE800000000000000)
    sub_212533130();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_21();
}

void sub_21251D260(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21251D2B0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21251D31C + 4 * byte_21253746F[a2]))(0x4B4341424C4C4F52);
}

void sub_21251D31C(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x4B4341424C4C4F52 || v1 != 0xE800000000000000)
    OUTLINED_FUNCTION_36_7();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_21();
}

uint64_t sub_21251D39C(char a1, char a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v7;

  v2 = 0xE900000000000045;
  v3 = 0x4445525245464544;
  if (a1)
  {
    if (a1 == 1)
      v4 = 0x54414944454D4D49;
    else
      v4 = 0x564953554C435845;
    v5 = 0xE900000000000045;
  }
  else
  {
    v5 = 0xE800000000000000;
    v4 = 0x4445525245464544;
  }
  if (a2)
  {
    if (a2 == 1)
      v3 = 0x54414944454D4D49;
    else
      v3 = 0x564953554C435845;
  }
  else
  {
    v2 = 0xE800000000000000;
  }
  if (v4 == v3 && v5 == v2)
    v7 = 1;
  else
    v7 = sub_212533130();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_21251D49C(char a1)
{
  sub_21251D810(0, a1);
}

void sub_21251D4A8()
{
  sub_21251D4C0();
}

void sub_21251D4B4()
{
  sub_21251D4C0();
}

void sub_21251D4C0()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_49_7(v0);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_0_8();
}

uint64_t sub_21251D4EC()
{
  return sub_21251D728();
}

uint64_t sub_21251D4F8(uint64_t a1, char a2)
{
  if (a2)
    OUTLINED_FUNCTION_53_6();
  else
    OUTLINED_FUNCTION_52_5();
  OUTLINED_FUNCTION_33_11();
  return OUTLINED_FUNCTION_82_5();
}

void sub_21251D554(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21251D598()
{
  OUTLINED_FUNCTION_33_11();
  return OUTLINED_FUNCTION_82_5();
}

void sub_21251D60C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21251D64C()
{
  OUTLINED_FUNCTION_33_11();
  return OUTLINED_FUNCTION_82_5();
}

uint64_t sub_21251D6A8()
{
  sub_212532B9C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21251D728()
{
  sub_2125331C0();
  sub_212532B9C();
  swift_bridgeObjectRelease();
  return sub_2125331E4();
}

void sub_21251D7CC()
{
  sub_21251D7E4();
}

void sub_21251D7D8()
{
  sub_21251D7E4();
}

void sub_21251D7E4()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_51_7();
  OUTLINED_FUNCTION_49_7(v0);
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_0_8();
}

void sub_21251D810(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_51_7();
  if (a2)
    OUTLINED_FUNCTION_53_6();
  else
    OUTLINED_FUNCTION_52_5();
  OUTLINED_FUNCTION_33_11();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_0_8();
}

void Connection.createFunction(_:argumentCount:deterministic:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  sqlite3 *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD *);
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD aBlock[6];

  if ((a4 & 1) == 0)
  {
    v13 = a3;
    if ((a3 & 0x8000000000000000) == 0)
      goto LABEL_5;
    __break(1u);
  }
  v13 = -1;
LABEL_5:
  v14 = OUTLINED_FUNCTION_112_4();
  *(_QWORD *)(v14 + 16) = a6;
  *(_QWORD *)(v14 + 24) = a7;
  aBlock[4] = sub_21251FF78;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21251F7FC;
  aBlock[3] = &block_descriptor_9;
  v15 = _Block_copy(aBlock);
  sub_212532140();
  swift_release();
  v16 = Connection.handle.getter();
  if (v13 > 0x7FFFFFFF)
  {
    __break(1u);
  }
  else
  {
    v17 = (sqlite3 *)v16;
    if ((a5 & 1) != 0)
      v18 = 2049;
    else
      v18 = 1;
    v19 = sub_212532B54();
    sqlite3_create_function_v2(v17, (const char *)(v19 + 32), v13, v18, v15, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_21251F894, 0, 0, 0);
    swift_release();
    OUTLINED_FUNCTION_0_0();
    v20 = *(_QWORD *)(v7 + 72);
    OUTLINED_FUNCTION_117_0();
    sub_2124B18D0(a1, a2, v20);
    v22 = v21;
    swift_endAccess();
    OUTLINED_FUNCTION_95_0();
    OUTLINED_FUNCTION_16_0();
    if (!v22)
    {
      OUTLINED_FUNCTION_117_0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B4DD38);
      v23 = sub_212532A7C();
      OUTLINED_FUNCTION_0_0();
      sub_2125200DC(v23, a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_212520854);
      swift_endAccess();
      OUTLINED_FUNCTION_95_0();
    }
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_117_0();
    v24 = sub_21251F898(aBlock, a1, a2);
    if (*v25)
    {
      _Block_copy(v15);
      v28 = sub_21251FF98((uint64_t)v15, v13);
      OUTLINED_FUNCTION_39_5(v28, v29, v30, v31);
      swift_endAccess();
      _Block_release(v15);
      OUTLINED_FUNCTION_95_0();
    }
    else
    {
      OUTLINED_FUNCTION_39_5((uint64_t)v24, (uint64_t)v25, v26, v27);
      swift_endAccess();
      OUTLINED_FUNCTION_95_0();
      _Block_release(v15);
    }
  }
}

uint64_t sub_21251DAE0@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  switch((_DWORD)result)
  {
    case 9:
      v2 = 2;
      goto LABEL_7;
    case 0x12:
      v2 = 0;
LABEL_7:
      *a2 = v2;
      return result;
    case 0x17:
      v2 = 1;
      goto LABEL_7;
  }
  sub_212532F98();
  swift_bridgeObjectRelease();
  sub_212533100();
  sub_212532BCC();
  swift_bridgeObjectRelease();
  result = sub_21253307C();
  __break(1u);
  return result;
}

BOOL static Connection.Operation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void Connection.Operation.hash(into:)()
{
  sub_2125331CC();
  OUTLINED_FUNCTION_1();
}

void Connection.Operation.hashValue.getter()
{
  OUTLINED_FUNCTION_2_12();
  sub_2125331CC();
  OUTLINED_FUNCTION_3_9();
  OUTLINED_FUNCTION_0_8();
}

uint64_t Connection.handle.getter()
{
  uint64_t v0;
  uint64_t result;

  OUTLINED_FUNCTION_0_0();
  result = *(_QWORD *)(v0 + 16);
  if (!result)
    __break(1u);
  return result;
}

void Connection.__allocating_init(_:readonly:)(uint64_t a1)
{
  OUTLINED_FUNCTION_25_9();
  OUTLINED_FUNCTION_42_9(a1);
  OUTLINED_FUNCTION_47_7();
}

uint64_t Connection.init(_:readonly:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  sqlite3 **v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v3 = sub_212532DE8();
  v17 = *(_QWORD *)(v3 - 8);
  v18 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_164();
  v6 = v5 - v4;
  v7 = sub_2125329D4();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_164();
  v8 = sub_212532DB8();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_164();
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  v9 = (sqlite3 **)(v2 + 16);
  *(_OWORD *)(v2 + 48) = 0u;
  v10 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v2 + 64) = 0;
  *(_QWORD *)(v2 + 72) = v10;
  *(_QWORD *)(v2 + 80) = v10;
  sub_2124D1A58();
  sub_212520004();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD4E0);
  sub_212520044();
  sub_212532EF0();
  sub_2125329BC();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v17 + 104))(v6, *MEMORY[0x24BEE5750], v18);
  *(_QWORD *)(v2 + 88) = sub_212532E18();
  *(_QWORD *)(v2 + 96) = 0;
  *(_BYTE *)(v2 + 104) = 1;
  OUTLINED_FUNCTION_34_12();
  if ((a2 & 1) != 0)
    v11 = 65537;
  else
    v11 = 3211270;
  v12 = sub_212532B54();
  OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_0_0();
  v13 = sqlite3_open_v2((const char *)(v12 + 32), v9, v11, 0);
  swift_endAccess();
  OUTLINED_FUNCTION_94();
  sub_21251DFD4(v13, 0);
  if (v21)
  {
    swift_release();
  }
  else
  {
    v14 = qword_253EFD1D8;
    v15 = *(id *)(v19 + 88);
    if (v14 != -1)
      swift_once();
    sub_21251E0B8();
    sub_212532DDC();

  }
  return v19;
}

uint64_t Connection.Location.description.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_34_12();
  if (v1 == 1)
    v3 = 0;
  else
    v3 = v0;
  if (v1)
    v4 = v3;
  else
    v4 = v2;
  sub_212520088(v0, v1);
  return v4;
}

const char *sub_21251DFD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  sqlite3 *v5;
  const char *result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = qword_253EFD370;
  OUTLINED_FUNCTION_75();
  sub_212532140();
  if (v4 != -1)
    swift_once();
  if (sub_21251FCAC(a1, qword_253EFD368))
  {
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_94();
    return (const char *)a1;
  }
  v5 = (sqlite3 *)Connection.handle.getter();
  result = sqlite3_errmsg(v5);
  if (result)
  {
    v7 = sub_212532BD8();
    v9 = v8;
    OUTLINED_FUNCTION_14_0();
    sub_212520B14();
    swift_allocError();
    *(_QWORD *)v10 = v7;
    *(_QWORD *)(v10 + 8) = v9;
    *(_DWORD *)(v10 + 16) = a1;
    *(_QWORD *)(v10 + 24) = a2;
    swift_willThrow();
    return (const char *)a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_21251E0B8()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  if (*(_BYTE *)(v0 + 104) != 1)
    return *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 96) = v0;
  *(_BYTE *)(v0 + 104) = 0;
  return result;
}

uint64_t Connection.__allocating_init(_:readonly:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[2];

  v4[1] = a2;
  v4[0] = a1;
  v2 = OUTLINED_FUNCTION_25_9();
  OUTLINED_FUNCTION_42_9((uint64_t)v4);
  return v2;
}

uint64_t Connection.deinit()
{
  uint64_t v0;
  sqlite3 *v1;

  v1 = (sqlite3 *)Connection.handle.getter();
  sqlite3_close(v1);
  _Block_release(*(const void **)(v0 + 32));
  _Block_release(*(const void **)(v0 + 40));
  _Block_release(*(const void **)(v0 + 48));
  _Block_release(*(const void **)(v0 + 56));
  _Block_release(*(const void **)(v0 + 64));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t Connection.__deallocating_deinit()
{
  Connection.deinit();
  return swift_deallocClassInstance();
}

BOOL Connection.readonly.getter()
{
  sqlite3 *v0;

  v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_db_readonly(v0, 0) == 1;
}

uint64_t Connection.totalChanges.getter()
{
  sqlite3 *v0;

  v0 = (sqlite3 *)Connection.handle.getter();
  return sqlite3_total_changes(v0);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Connection.execute(_:)(Swift::String a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_117_0();
  sub_21251CC78(v1);
}

const char *sub_21251E21C@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  sqlite3 *v3;
  uint64_t v4;
  uint64_t v5;
  const char *result;

  v3 = (sqlite3 *)Connection.handle.getter();
  v4 = sub_212532B54();
  v5 = sqlite3_exec(v3, (const char *)(v4 + 32), 0, 0, 0);
  swift_release();
  result = sub_21251DFD4(v5, 0);
  if (!v1)
    *a1 = v5;
  return result;
}

void sub_21251E380(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v4;

  Connection.prepare(_:_:)(a1, a2, MEMORY[0x24BEE4AF8]);
  if (!v4)
  {
    a4(a3);
    OUTLINED_FUNCTION_14_0();
  }
  OUTLINED_FUNCTION_47_7();
}

void sub_21251E400(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v4;

  Connection.prepare(_:_:)(a1, a2, MEMORY[0x24BEE4AF8]);
  if (!v4)
  {
    a4(a3);
    Statement.run(_:)(MEMORY[0x24BEE4AF8]);
    OUTLINED_FUNCTION_94();
    OUTLINED_FUNCTION_108();
  }
  OUTLINED_FUNCTION_27_6();
}

void sub_21251E4AC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;

  Connection.prepare(_:_:)(a1, a2, MEMORY[0x24BEE4AF8]);
  if (!v5)
  {
    a4(a3);
    Statement.scalar(_:)(MEMORY[0x24BEE4AF8], a5);
    OUTLINED_FUNCTION_108();
    OUTLINED_FUNCTION_14_0();
  }
}

RRSQLite::Connection::TransactionMode_optional __swiftcall Connection.TransactionMode.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  RRSQLite::Connection::TransactionMode_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2125330D0();
  result.value = OUTLINED_FUNCTION_95_0();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t Connection.TransactionMode.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x54414944454D4D49;
  if (*v0 != 1)
    v1 = 0x564953554C435845;
  if (*v0)
    return v1;
  else
    return 0x4445525245464544;
}

uint64_t sub_21251E5E4(char *a1, char *a2)
{
  return sub_21251D39C(*a1, *a2);
}

uint64_t sub_21251E5F0()
{
  return sub_21251D4EC();
}

uint64_t sub_21251E5F8()
{
  return sub_21251D6A8();
}

uint64_t sub_21251E600()
{
  return sub_21251D728();
}

RRSQLite::Connection::TransactionMode_optional sub_21251E608(Swift::String *a1)
{
  return Connection.TransactionMode.init(rawValue:)(*a1);
}

uint64_t sub_21251E614@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Connection.TransactionMode.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t Connection.transaction(_:block:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  sub_212532F98();
  swift_bridgeObjectRelease();
  sub_212532BCC();
  OUTLINED_FUNCTION_111_0();
  sub_212532BCC();
  sub_21251E798(0x204E49474542, 0xE600000000000000, a2, a3, 0xD000000000000012, 0x80000002125399E0);
  return OUTLINED_FUNCTION_111_0();
}

uint64_t sub_21251E798(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  sub_212532140();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_21251CE18(v6, v6, a1, a2, a3, a4, a5, a6);
}

uint64_t Connection.savepoint(_:block:)(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  sub_212526AF0(39, 0xE100000000000000, a1, a2);
  sub_212532BCC();
  OUTLINED_FUNCTION_111_0();
  OUTLINED_FUNCTION_20_8();
  OUTLINED_FUNCTION_20_8();
  sub_21251E798(0x4E494F5045564153, 0xEA00000000002054, a3, a4, 0x4E494F5045564153, 0xEA00000000002054);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_95_0();
}

void sub_21251E94C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v11;

  Connection.run(_:_:)(a2, a3, MEMORY[0x24BEE4AF8]);
  if (!v7)
  {
    v11 = swift_release();
    a4(v11);
    Connection.run(_:_:)(a6, a7, MEMORY[0x24BEE4AF8]);
    swift_release();
  }
}

Swift::Void __swiftcall Connection.interrupt()()
{
  sqlite3 *v0;

  v0 = (sqlite3 *)Connection.handle.getter();
  sqlite3_interrupt(v0);
}

double Connection.busyTimeout.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_0();
  return *(double *)(v0 + 24);
}

double sub_21251EA80@<D0>(uint64_t *a1@<X0>, double *a2@<X8>)
{
  uint64_t v3;
  double result;

  v3 = *a1;
  swift_beginAccess();
  result = *(double *)(v3 + 24);
  *a2 = result;
  return result;
}

uint64_t Connection.busyTimeout.setter(double a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_0();
  *(double *)(v1 + 24) = a1;
  return sub_21251EB00();
}

uint64_t sub_21251EB00()
{
  uint64_t v0;
  sqlite3 *v1;
  uint64_t result;
  double v3;

  v1 = (sqlite3 *)Connection.handle.getter();
  result = swift_beginAccess();
  v3 = *(double *)(v0 + 24) * 1000.0;
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v3 <= -2147483650.0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v3 < 2147483650.0)
    return sqlite3_busy_timeout(v1, (int)v3);
LABEL_7:
  __break(1u);
  return result;
}

void (*Connection.busyTimeout.modify(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_0_0();
  return sub_21251EBD0;
}

void sub_21251EBD0(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_21251EB00();
  OUTLINED_FUNCTION_1();
}

void Connection.busyHandler(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  sqlite3 *v5;
  const void *v6;
  sqlite3 *v7;
  int (__cdecl *v8)(void *, int);
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    OUTLINED_FUNCTION_48_9();
    v4 = OUTLINED_FUNCTION_112_4();
    *(_QWORD *)(v4 + 16) = v3;
    *(_QWORD *)(v4 + 24) = v1;
    OUTLINED_FUNCTION_17_10((uint64_t)sub_21251ECAC, MEMORY[0x24BDAC760], 1107296256, v11, v12);
    OUTLINED_FUNCTION_7_12();
    OUTLINED_FUNCTION_94();
    v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_busy_handler(v5, (int (__cdecl *)(void *, int))sub_21251ECFC, v3);
    v6 = *(const void **)(v2 + 32);
    *(_QWORD *)(v2 + 32) = v3;
    _Block_release(v6);
    OUTLINED_FUNCTION_121_4();
  }
  else
  {
    Connection.handle.getter();
    OUTLINED_FUNCTION_55_0();
    sqlite3_busy_handler(v7, v8, v9);
    v10 = *(const void **)(v2 + 32);
    *(_QWORD *)(v2 + 32) = 0;
    OUTLINED_FUNCTION_1_13(v10);
  }
}

uint64_t sub_21251ECAC(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;

  v3 = *(uint64_t (**)(uint64_t))(a1 + 32);
  sub_212532140();
  v4 = v3(a2);
  swift_release();
  return v4;
}

uint64_t sub_21251ECF4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_21251ED04(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  sqlite3 *v7;
  const void *v8;
  sqlite3 *v9;
  const void *v10;
  _QWORD v11[6];

  if (a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 24) = a2;
    v11[4] = sub_212520AC0;
    v11[5] = v5;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_21251EE18;
    v11[3] = &block_descriptor_36;
    v6 = _Block_copy(v11);
    swift_retain_n();
    swift_release();
    v7 = (sqlite3 *)Connection.handle.getter();
    sqlite3_trace_v2(v7, 1u, (int (__cdecl *)(unsigned int, void *, void *, void *))sub_21251FF50, v6);
    sub_2124AE72C(a1);
    v8 = *(const void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = v6;
    _Block_release(v8);
  }
  else
  {
    v9 = (sqlite3 *)Connection.handle.getter();
    sqlite3_trace_v2(v9, 0, 0, 0);
    v10 = *(const void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;
    _Block_release(v10);
  }
}

uint64_t sub_21251EE18(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  sub_212532140();
  v3(a2);
  return swift_release();
}

void Connection.updateHook(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  sqlite3 *v5;
  const void *v6;
  sqlite3 *v7;
  void (__cdecl *v8)(void *, int, const char *, const char *, sqlite3_int64);
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    OUTLINED_FUNCTION_48_9();
    v4 = OUTLINED_FUNCTION_112_4();
    *(_QWORD *)(v4 + 16) = v3;
    *(_QWORD *)(v4 + 24) = v1;
    OUTLINED_FUNCTION_17_10((uint64_t)sub_21251EF94, MEMORY[0x24BDAC760], 1107296256, v11, v12);
    OUTLINED_FUNCTION_7_12();
    OUTLINED_FUNCTION_94();
    v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_update_hook(v5, (void (__cdecl *)(void *, int, const char *, const char *, sqlite3_int64))sub_21251F00C, v3);
    v6 = *(const void **)(v2 + 48);
    *(_QWORD *)(v2 + 48) = v3;
    _Block_release(v6);
    OUTLINED_FUNCTION_121_4();
  }
  else
  {
    Connection.handle.getter();
    OUTLINED_FUNCTION_55_0();
    sqlite3_update_hook(v7, v8, v9);
    v10 = *(const void **)(v2 + 48);
    *(_QWORD *)(v2 + 48) = 0;
    OUTLINED_FUNCTION_1_13(v10);
  }
}

uint64_t sub_21251EF04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  sub_21251DAE0(a1, &v13);
  v7 = sub_212532BD8();
  v9 = v8;
  v10 = sub_212532BD8();
  a5(&v13, v7, v9, v10, v11, a4);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21251EF94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);

  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  sub_212532140();
  v9(a2, a3, a4, a5);
  return swift_release();
}

uint64_t sub_21251EFF4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    if (a4)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void Connection.commitHook(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  sqlite3 *v5;
  const void *v6;
  sqlite3 *v7;
  int (__cdecl *v8)(void *);
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    OUTLINED_FUNCTION_48_9();
    v4 = OUTLINED_FUNCTION_112_4();
    *(_QWORD *)(v4 + 16) = v3;
    *(_QWORD *)(v4 + 24) = v1;
    OUTLINED_FUNCTION_17_10((uint64_t)sub_21251F10C, MEMORY[0x24BDAC760], 1107296256, v11, v12);
    OUTLINED_FUNCTION_7_12();
    OUTLINED_FUNCTION_94();
    v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_commit_hook(v5, (int (__cdecl *)(void *))sub_21251F14C, v3);
    v6 = *(const void **)(v2 + 56);
    *(_QWORD *)(v2 + 56) = v3;
    _Block_release(v6);
    OUTLINED_FUNCTION_121_4();
  }
  else
  {
    Connection.handle.getter();
    OUTLINED_FUNCTION_55_0();
    sqlite3_commit_hook(v7, v8, v9);
    v10 = *(const void **)(v2 + 56);
    *(_QWORD *)(v2 + 56) = 0;
    OUTLINED_FUNCTION_1_13(v10);
  }
}

uint64_t sub_21251F0C0(void (*a1)(void))
{
  a1();
  return 0;
}

uint64_t sub_21251F10C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = sub_212532140();
  v3 = v1(v2);
  swift_release();
  return v3;
}

uint64_t sub_21251F144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void Connection.rollbackHook(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  sqlite3 *v5;
  const void *v6;
  sqlite3 *v7;
  void (__cdecl *v8)(void *);
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    OUTLINED_FUNCTION_48_9();
    v4 = OUTLINED_FUNCTION_112_4();
    *(_QWORD *)(v4 + 16) = v3;
    *(_QWORD *)(v4 + 24) = v1;
    OUTLINED_FUNCTION_17_10((uint64_t)sub_2124B0598, MEMORY[0x24BDAC760], 1107296256, v11, v12);
    OUTLINED_FUNCTION_7_12();
    OUTLINED_FUNCTION_94();
    v5 = (sqlite3 *)Connection.handle.getter();
    sqlite3_rollback_hook(v5, (void (__cdecl *)(void *))sub_21251F200, v3);
    v6 = *(const void **)(v2 + 64);
    *(_QWORD *)(v2 + 64) = v3;
    _Block_release(v6);
    OUTLINED_FUNCTION_121_4();
  }
  else
  {
    Connection.handle.getter();
    OUTLINED_FUNCTION_55_0();
    sqlite3_rollback_hook(v7, v8, v9);
    v10 = *(const void **)(v2 + 64);
    *(_QWORD *)(v2 + 64) = 0;
    OUTLINED_FUNCTION_1_13(v10);
  }
}

uint64_t sub_21251F204(uint64_t a1, int a2, uint64_t a3, void (*a4)(_QWORD *__return_ptr, _QWORD), int a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v10;
  sqlite3_int64 v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  void (__cdecl *v17)(void *);
  uint64_t v18;
  void (*v19)(_QWORD *__return_ptr, _QWORD);
  sqlite3_int64 v21[7];
  _QWORD v22[3];
  uint64_t v23;
  _QWORD v24[6];

  if (a2 < 0)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v5 = a1;
  v8 = MEMORY[0x24BEE4AF8];
  if (a2)
  {
    v19 = a4;
    v10 = a2;
    v22[0] = MEMORY[0x24BEE4AF8];
    v6 = v22;
    sub_21250F9B4(0, a2, 0);
    v11 = 0;
    v8 = v22[0];
    v5 = 40;
    while (v10 != v11)
    {
      v21[0] = v11;
      sub_21251F610(v21, a3, (uint64_t)v24);
      v22[0] = v8;
      v13 = *(_QWORD *)(v8 + 16);
      v12 = *(_QWORD *)(v8 + 24);
      if (v13 >= v12 >> 1)
      {
        v6 = v22;
        sub_21250F9B4((_QWORD *)(v12 > 1), v13 + 1, 1);
        v8 = v22[0];
      }
      ++v11;
      *(_QWORD *)(v8 + 16) = v13 + 1;
      sub_212521040((uint64_t)v24, v8 + 40 * v13 + 32);
      if (v10 == v11)
      {
        a4 = v19;
        v5 = a1;
        goto LABEL_9;
      }
    }
    __break(1u);
    goto LABEL_33;
  }
LABEL_9:
  LODWORD(v6) = a5;
  a4(v24, v8);
  swift_bridgeObjectRelease();
  sub_212521088((uint64_t)v24, (uint64_t)v22);
  if (v23)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if ((swift_dynamicCast() & 1) != 0)
    {
      LODWORD(v6) = v21[0];
      v14 = *(_QWORD *)(v21[0] + 16);
      if (!(v14 >> 31))
      {
        sqlite3_result_blob((sqlite3_context *)v5, (const void *)(v21[0] + 32), v14, 0);
        sub_2125210D0((uint64_t)v24);
        return swift_bridgeObjectRelease();
      }
      goto LABEL_34;
    }
  }
  else
  {
    sub_2125210D0((uint64_t)v22);
  }
  sub_212521088((uint64_t)v24, (uint64_t)v22);
  if (v23)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if ((swift_dynamicCast() & 1) != 0)
    {
      sqlite3_result_double((sqlite3_context *)v5, *(double *)v21);
      return sub_2125210D0((uint64_t)v24);
    }
  }
  else
  {
    sub_2125210D0((uint64_t)v22);
  }
  sub_212521088((uint64_t)v24, (uint64_t)v22);
  if (v23)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if ((swift_dynamicCast() & 1) != 0)
    {
      sqlite3_result_int64((sqlite3_context *)v5, v21[0]);
      return sub_2125210D0((uint64_t)v24);
    }
  }
  else
  {
    sub_2125210D0((uint64_t)v22);
  }
  sub_212521088((uint64_t)v24, (uint64_t)v22);
  if (v23)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v16 = sub_212532BA8();
      if (v16 >= (uint64_t)0xFFFFFFFF80000000)
      {
        LODWORD(v6) = v16;
        if (v16 <= 0x7FFFFFFF)
        {
          if (qword_253EFB798 == -1)
          {
LABEL_27:
            v17 = (void (__cdecl *)(void *))qword_253EFE2A8;
            v18 = sub_212532B54();
            swift_bridgeObjectRelease();
            sqlite3_result_text((sqlite3_context *)v5, (const char *)(v18 + 32), (int)v6, v17);
            sub_2125210D0((uint64_t)v24);
            return swift_release();
          }
LABEL_37:
          swift_once();
          goto LABEL_27;
        }
LABEL_36:
        __break(1u);
        goto LABEL_37;
      }
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
  }
  else
  {
    sub_2125210D0((uint64_t)v22);
  }
  if (!v24[3])
  {
    sqlite3_result_null((sqlite3_context *)v5);
    return sub_2125210D0((uint64_t)v24);
  }
  sub_212521088((uint64_t)v24, (uint64_t)v22);
  v21[0] = 0;
  v21[1] = 0xE000000000000000;
  sub_212532F98();
  swift_bridgeObjectRelease();
  v21[5] = 0xD000000000000019;
  v21[6] = 0x8000000212539B80;
  sub_212521088((uint64_t)v22, (uint64_t)v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD408);
  sub_212532B3C();
  sub_212532BCC();
  swift_bridgeObjectRelease();
  result = sub_21253307C();
  __break(1u);
  return result;
}

void sub_21251F610(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sqlite3_value *v4;
  sqlite3_int64 v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  const void *v9;
  const void *v10;
  int v11;

  if (!a2)
  {
    __break(1u);
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
LABEL_15:
    sub_212532F98();
    swift_bridgeObjectRelease();
    sub_212533100();
    sub_212532BCC();
    swift_bridgeObjectRelease();
    sub_21253307C();
    __break(1u);
    JUMPOUT(0x21251F7E8);
  }
  v4 = *(sqlite3_value **)(a2 + 8 * *a1);
  switch(sqlite3_value_type(v4))
  {
    case 1:
      v5 = sqlite3_value_int64(v4);
      *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE4008];
      *(_QWORD *)(a3 + 32) = &protocol witness table for Int64;
      goto LABEL_10;
    case 2:
      v8 = sqlite3_value_double(v4);
      *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE13C8];
      *(_QWORD *)(a3 + 32) = &protocol witness table for Double;
      *(double *)a3 = v8;
      return;
    case 3:
      if (!sqlite3_value_text(v4))
        goto LABEL_13;
      v6 = sub_212532BE4();
      *(_QWORD *)(a3 + 24) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(a3 + 32) = &protocol witness table for String;
      *(_QWORD *)a3 = v6;
      *(_QWORD *)(a3 + 8) = v7;
      break;
    case 4:
      v9 = sqlite3_value_blob(v4);
      if (!v9)
        goto LABEL_14;
      v10 = v9;
      v11 = sqlite3_value_bytes(v4);
      *(_QWORD *)(a3 + 24) = &type metadata for Blob;
      *(_QWORD *)(a3 + 32) = &protocol witness table for Blob;
      v5 = (sqlite3_int64)sub_21251B390(v10, v11);
LABEL_10:
      *(_QWORD *)a3 = v5;
      break;
    case 5:
      *(_QWORD *)(a3 + 32) = 0;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      return;
    default:
      goto LABEL_15;
  }
}

uint64_t sub_21251F7FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  sub_212532140();
  v7(a2, a3, a4);
  return swift_release();
}

uint64_t sub_21251F854(sqlite3_context *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (**v6)(void *, sqlite3_context *, uint64_t, uint64_t);

  v6 = (uint64_t (**)(void *, sqlite3_context *, uint64_t, uint64_t))sqlite3_user_data(a1);
  return v6[2](v6, a1, a2, a3);
}

void (*sub_21251F898(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain();
  v6[5] = sub_212520BEC(v6, a2, a3);
  return sub_21251F904;
}

void sub_21251F904(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_21_8(v1);
}

void Connection.createCollation(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  void *v10;
  sqlite3 *v11;
  uint64_t v12;
  uint64_t collation_v2;
  _QWORD v14[6];

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = a4;
  v14[4] = sub_2125200D4;
  v14[5] = v9;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_21251FB34;
  v14[3] = &block_descriptor_30;
  v10 = _Block_copy(v14);
  sub_212532140();
  swift_release();
  v11 = (sqlite3 *)Connection.handle.getter();
  v12 = sub_212532B54();
  collation_v2 = sqlite3_create_collation_v2(v11, (const char *)(v12 + 32), 1, v10, (int (__cdecl *)(void *, int, const void *, int, const void *))sub_21251FC00, 0);
  swift_release();
  sub_21251DFD4(collation_v2, 0);
  if (!v4)
  {
    OUTLINED_FUNCTION_0_0();
    OUTLINED_FUNCTION_117_0();
    _Block_copy(v10);
    sub_2125200DC((uint64_t)v10, a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_212520968);
    swift_endAccess();
    OUTLINED_FUNCTION_95_0();
  }
  _Block_release(v10);
}

uint64_t sub_21251FA9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v4 = sub_212532BE4();
  v6 = v5;
  v7 = sub_212532BE4();
  v9 = a3(v4, v6, v7, v8);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if (v9 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v9 <= 0x7FFFFFFF)
  {
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_21251FB34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  sub_212532140();
  v6 = v5(a2, a3);
  swift_release();
  return v6;
}

uint64_t sub_21251FB88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a3 && a5)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a3, a5);
  result = sub_21253307C();
  __break(1u);
  return result;
}

void sub_21251FC04()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD1C8);
  swift_allocObject();
  qword_253EFD1D0 = sub_212532980();
  OUTLINED_FUNCTION_1();
}

const char *Connection.description.getter()
{
  sqlite3 *v0;
  const char *result;

  v0 = (sqlite3 *)Connection.handle.getter();
  result = sqlite3_db_filename(v0, 0);
  if (result)
    return (const char *)sub_212532BD8();
  __break(1u);
  return result;
}

const char *sub_21251FC64()
{
  return Connection.description.getter();
}

uint64_t sub_21251FC88()
{
  uint64_t result;

  result = sub_212520F04((uint64_t)&unk_24CDCA810);
  qword_253EFD368 = result;
  return result;
}

BOOL sub_21251FCAC(unsigned int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  int v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = MEMORY[0x212BECC1C](*(_QWORD *)(a2 + 40), a1, 4);
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_DWORD *)(v8 + 4 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t Result.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *v0;
  if (v0[3])
  {
    swift_retain_n();
    sub_212532F98();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_16_0();
    v3 = v1;
    sub_212532BCC();
    Statement.description.getter();
    OUTLINED_FUNCTION_41_10();
    swift_bridgeObjectRelease();
    sub_212532BCC();
    sub_212533100();
    OUTLINED_FUNCTION_41_10();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_28_8();
    swift_release_n();
  }
  else
  {
    v3 = *v0;
    swift_bridgeObjectRetain();
    sub_212532BCC();
    sub_212533100();
    sub_212532BCC();
    OUTLINED_FUNCTION_95_0();
    OUTLINED_FUNCTION_28_8();
  }
  return v3;
}

uint64_t sub_21251FECC(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  v3 = sub_212532BE4();
  a2(v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21251FF04(int a1, uint64_t a2, sqlite3_stmt *pStmt)
{
  char *v4;
  char *v5;

  if (pStmt)
  {
    v4 = sqlite3_expanded_sql(pStmt);
    if (v4)
    {
      v5 = v4;
      (*(void (**)(uint64_t, char *))(a2 + 16))(a2, v4);
      sqlite3_free(v5);
    }
  }
  return 0;
}

uint64_t sub_21251FF54()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21251FF78(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;

  return sub_21251F204(a1, a2, a3, *(void (**)(_QWORD *__return_ptr, _QWORD))(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t block_copy_helper_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return sub_212532140();
}

uint64_t block_destroy_helper_9()
{
  return swift_release();
}

uint64_t sub_21251FF98(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_212520758(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

unint64_t sub_212520004()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EFD538;
  if (!qword_253EFD538)
  {
    v1 = sub_212532DB8();
    result = MEMORY[0x212BED510](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_253EFD538);
  }
  return result;
}

unint64_t sub_212520044()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253EFD4E8;
  if (!qword_253EFD4E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_253EFD4E0);
    result = MEMORY[0x212BED510](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_253EFD4E8);
  }
  return result;
}

uint64_t sub_212520088(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 2)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_21252009C(int a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(a1) & 1;
}

uint64_t sub_2125200C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_21251EF04(a1, a2, a3, a4, *(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16));
}

uint64_t sub_2125200CC()
{
  uint64_t v0;

  return sub_21251F0C0(*(void (**)(void))(v0 + 16));
}

uint64_t sub_2125200D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_21251FA9C(a1, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_2125200DC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v4;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v11;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v4;
  *v4 = 0x8000000000000000;
  a4(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *v4 = v11;
  return swift_bridgeObjectRelease();
}

unint64_t sub_212520160()
{
  unint64_t result;

  result = qword_254B4DD40;
  if (!qword_254B4DD40)
  {
    result = MEMORY[0x212BED510](&protocol conformance descriptor for Connection.Operation, &type metadata for Connection.Operation);
    atomic_store(result, (unint64_t *)&qword_254B4DD40);
  }
  return result;
}

unint64_t sub_2125201A0()
{
  unint64_t result;

  result = qword_254B4DD48;
  if (!qword_254B4DD48)
  {
    result = MEMORY[0x212BED510](&protocol conformance descriptor for Connection.TransactionMode, &type metadata for Connection.TransactionMode);
    atomic_store(result, (unint64_t *)&qword_254B4DD48);
  }
  return result;
}

void sub_2125201E0(double *a1)
{
  Connection.busyTimeout.setter(*a1);
  OUTLINED_FUNCTION_1();
}

uint64_t type metadata accessor for Connection()
{
  return objc_opt_self();
}

uint64_t method lookup function for Connection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Connection.__allocating_init(_:readonly:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

unint64_t destroy for Connection.Location(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s8RRSQLite10ConnectionC8LocationOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for Connection.Location(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for Connection.Location(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for Connection.Location(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Connection.Location(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_212520458(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_212520470(_QWORD *result, int a2)
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

void type metadata accessor for Connection.Location()
{
  OUTLINED_FUNCTION_1_8();
}

void type metadata accessor for Connection.Operation()
{
  OUTLINED_FUNCTION_1_8();
}

uint64_t _s8RRSQLite10ConnectionC9OperationOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2125204FC + 4 * byte_212537483[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_212520530 + 4 * byte_21253747E[v4]))();
}

uint64_t sub_212520530(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_212520538(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x212520540);
  return result;
}

uint64_t sub_21252054C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x212520554);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_212520558(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_212520560(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for Connection.TransactionMode()
{
  OUTLINED_FUNCTION_1_8();
}

uint64_t destroy for Result()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for Result(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  sub_212532140();
  return a1;
}

uint64_t assignWithCopy for Result(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  sub_212532140();
  swift_release();
  return a1;
}

uint64_t assignWithTake for Result(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Result(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for Result(uint64_t result, int a2, int a3)
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

void type metadata accessor for Result()
{
  OUTLINED_FUNCTION_1_8();
}

unint64_t sub_212520728(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2125331B4();
  return sub_212520B50(a1, v2);
}

void sub_212520758(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  _QWORD *v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;

  v3 = (_QWORD **)v2;
  v6 = (_QWORD *)*v2;
  v7 = sub_212520728(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v9 = v7;
  v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B4DD68);
  if ((sub_212533028() & 1) == 0)
    goto LABEL_5;
  v11 = sub_212520728(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_9:
    sub_212533154();
    __break(1u);
    return;
  }
  v9 = v11;
LABEL_5:
  v13 = *v3;
  if ((v10 & 1) != 0)
  {
    v14 = v13[7];
    _Block_release(*(const void **)(v14 + 8 * v9));
    *(_QWORD *)(v14 + 8 * v9) = a1;
  }
  else
  {
    sub_212520A7C(v9, a2, a1, v13);
  }
}

uint64_t sub_212520854(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_2124B81E8();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B4DD60);
  if ((sub_212533028() & 1) == 0)
    goto LABEL_5;
  v13 = sub_2124B81E8();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_212533154();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_2124B8E6C(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_212520968(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_2124B81E8();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B4DD50);
  if ((sub_212533028() & 1) == 0)
    goto LABEL_5;
  v13 = sub_2124B81E8();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    sub_212533154();
    __break(1u);
    return;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    _Block_release(*(const void **)(v16 + 8 * v11));
    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_2124B8E6C(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_212520A7C(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

uint64_t sub_212520AC0(uint64_t a1)
{
  uint64_t v1;

  return sub_21251FECC(a1, *(void (**)(uint64_t))(v1 + 16));
}

void sub_212520AC8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);

  v1 = OUTLINED_FUNCTION_54_8();
  sub_21251E94C(v1, v2, v3, v4, v0[6], v0[7], v0[8]);
}

const char *sub_212520AF8@<X0>(_DWORD *a1@<X8>)
{
  return sub_21251E21C(a1);
}

unint64_t sub_212520B14()
{
  unint64_t result;

  result = qword_254B4DD58;
  if (!qword_254B4DD58)
  {
    result = MEMORY[0x212BED510](&protocol conformance descriptor for Result, &type metadata for Result);
    atomic_store(result, (unint64_t *)&qword_254B4DD58);
  }
  return result;
}

unint64_t sub_212520B50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

void (*sub_212520BEC(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v6;

  v6 = malloc(0x58uLL);
  *a1 = v6;
  v6[8] = a3;
  swift_isUniquelyReferenced_nonNull_native();
  swift_bridgeObjectRetain();
  v6[9] = sub_212520E18(v6);
  v6[10] = sub_212520CC8(v6 + 4, a2, a3);
  return sub_212520C7C;
}

void sub_212520C7C(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  OUTLINED_FUNCTION_16_0();
  v2(v1, 0);
  free(v1);
}

void (*sub_212520CC8(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t **a1)
{
  uint64_t *v3;
  uint64_t *v4;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  void (*result)(uint64_t **);

  v4 = v3;
  v8 = malloc(0x30uLL);
  *a1 = v8;
  v8[2] = a3;
  v8[3] = v4;
  v8[1] = a2;
  v9 = *v4;
  v10 = sub_2124B81E8();
  *((_BYTE *)v8 + 40) = v11 & 1;
  if (__OFADD__(*(_QWORD *)(v9 + 16), (v11 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v12 = v10;
  v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B4DD60);
  if ((sub_212533028() & 1) != 0)
  {
    v14 = sub_2124B81E8();
    if ((v13 & 1) == (v15 & 1))
    {
      v12 = v14;
      goto LABEL_5;
    }
LABEL_10:
    result = (void (*)(uint64_t **))sub_212533154();
    __break(1u);
    return result;
  }
LABEL_5:
  v8[4] = v12;
  if ((v13 & 1) != 0)
    v16 = *(_QWORD *)(*(_QWORD *)(*v4 + 56) + 8 * v12);
  else
    v16 = 0;
  *v8 = v16;
  return sub_212520DE0;
}

void sub_212520DE0(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_212520E44(*a1, *((_BYTE *)*a1 + 40), (_QWORD **)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_21_8(v1);
}

uint64_t (*sub_212520E18(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_212520E38;
}

uint64_t sub_212520E38(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t sub_212520E44(uint64_t *a1, char a2, _QWORD **a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  v6 = *a1;
  if (*a1)
  {
    if ((a2 & 1) != 0)
    {
      *(_QWORD *)((*a3)[7] + 8 * a4) = v6;
    }
    else
    {
      sub_2124B8E6C(a4, a5, a6, v6, *a3);
      swift_bridgeObjectRetain();
    }
  }
  else if ((a2 & 1) != 0)
  {
    swift_arrayDestroy();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B4DD70);
    sub_212533040();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_212520F04(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_13;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD550);
  result = sub_212532F8C();
  v3 = result;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return v3;
  }
  v5 = 0;
  v6 = result + 56;
  v7 = *(_QWORD *)(result + 40);
  v8 = ~(-1 << *(_BYTE *)(result + 32));
  while (v5 < *(_QWORD *)(a1 + 16))
  {
    v9 = *(_DWORD *)(a1 + 32 + 4 * v5);
    result = MEMORY[0x212BECC1C](v7, v9, 4);
    v10 = result & v8;
    v11 = (result & (unint64_t)v8) >> 6;
    v12 = *(_QWORD *)(v6 + 8 * v11);
    v13 = 1 << (result & v8);
    v14 = *(_QWORD *)(v3 + 48);
    if ((v13 & v12) != 0)
    {
      while (*(_DWORD *)(v14 + 4 * v10) != v9)
      {
        v10 = (v10 + 1) & v8;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v6 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          goto LABEL_8;
      }
    }
    else
    {
LABEL_8:
      *(_QWORD *)(v6 + 8 * v11) = v13 | v12;
      *(_DWORD *)(v14 + 4 * v10) = v9;
      v15 = *(_QWORD *)(v3 + 16);
      v16 = __OFADD__(v15, 1);
      v17 = v15 + 1;
      if (v16)
        goto LABEL_15;
      *(_QWORD *)(v3 + 16) = v17;
    }
    if (++v5 == v4)
      goto LABEL_13;
  }
  __break(1u);
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_212521040(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_212521088(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD408);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2125210D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD408);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_212521110()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_54_8();
  sub_21250E0D8(v0, v1, v2, v3);
}

void sub_212521128()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_54_8();
  sub_21250E084(v0, v1, v2, v3);
}

const char *sub_212521140@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;

  return sub_212525630(v1, a1);
}

unint64_t OUTLINED_FUNCTION_0_14()
{
  return sub_2124D1A58();
}

void OUTLINED_FUNCTION_1_13(const void *aBlock)
{
  _Block_release(aBlock);
}

void OUTLINED_FUNCTION_5_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  Connection.run(_:_:)(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_7_12()
{
  return sub_212532140();
}

uint64_t OUTLINED_FUNCTION_13_11()
{
  return sub_212532E00();
}

uint64_t OUTLINED_FUNCTION_14_17()
{
  return sub_21251E0B8();
}

void *OUTLINED_FUNCTION_17_10@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

uint64_t OUTLINED_FUNCTION_20_8()
{
  return sub_212532BCC();
}

void OUTLINED_FUNCTION_21_8(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_25_9()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_28_8()
{
  return sub_212532BCC();
}

uint64_t OUTLINED_FUNCTION_33_11()
{
  return sub_212532B9C();
}

id OUTLINED_FUNCTION_36_10()
{
  uint64_t v0;

  return *(id *)(v0 + 88);
}

uint64_t OUTLINED_FUNCTION_39_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t (*v4)(char *, _QWORD);
  va_list va;

  va_start(va, a4);
  return v4(va, 0);
}

uint64_t OUTLINED_FUNCTION_40_8()
{
  return sub_212532DD0();
}

uint64_t OUTLINED_FUNCTION_41_10()
{
  return sub_212532BCC();
}

uint64_t OUTLINED_FUNCTION_42_9(uint64_t a1)
{
  char v1;

  return Connection.init(_:readonly:)(a1, v1);
}

uint64_t OUTLINED_FUNCTION_43_9()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_46_8()
{
  return Connection.handle.getter();
}

uint64_t OUTLINED_FUNCTION_49_7(uint64_t a1, ...)
{
  uint64_t (*v1)(char *, uint64_t);
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return v1(va, v2);
}

uint64_t OUTLINED_FUNCTION_51_7()
{
  return sub_2125331C0();
}

uint64_t OUTLINED_FUNCTION_54_8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

void && infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_63_6(a1, a2, (uint64_t)&qword_253EFB780, a4, a5, (uint64_t)sub_21250EBCC, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  OUTLINED_FUNCTION_63_6(a1, a2, (uint64_t)&qword_253EFB778, a4, a5, (uint64_t)sub_21250ED20, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  sub_2125232F4(a1, a2, (uint64_t)&qword_253EFB778, (uint64_t)&qword_253EFB780, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  sub_2125232F4(a1, a2, (uint64_t)&qword_253EFB780, (uint64_t)&qword_253EFB778, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void + infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_23_7(a1, a2, (uint64_t)&qword_253EFD5C8, 31868, a5, (uint64_t)sub_21250ECFC, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  OUTLINED_FUNCTION_23_7(a1, a2, (uint64_t)&qword_253EFD5D8, 31868, a5, (uint64_t)sub_21250ED08, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void + infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  sub_2125213F8(a1, a2, a3, (uint64_t)&qword_253EFD5C8, (uint64_t)sub_21250ECFC, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

{
  sub_2125213F8(a1, a2, a3, (uint64_t)&qword_253EFD5D8, (uint64_t)sub_21250ED08, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

void + infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_89_7(a1, a2, (uint64_t)&qword_253EFD5D8, (uint64_t)&qword_253EFD5C8, a5, (uint64_t)sub_21250ED08, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_89_7(a1, a2, (uint64_t)&qword_253EFD5C8, (uint64_t)&qword_253EFD5D8, a5, (uint64_t)sub_21250ED08, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void sub_2125213F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  OUTLINED_FUNCTION_13_12();
  a27 = v28;
  a28 = v29;
  v31 = v30;
  v33 = v32;
  v36 = *v34;
  v35 = v34[1];
  v37 = v34[2];
  a17 = __swift_instantiateConcreteTypeFromMangledName(v38);
  a18 = &protocol witness table for Expression<A>;
  a14 = v36;
  a15 = v35;
  a16 = v37;
  a12 = MEMORY[0x24BEE0D00];
  a13 = &protocol witness table for String;
  a9 = v33;
  a10 = v31;
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_92_7((uint64_t)&a14, (uint64_t)&a9);
  v39 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v39, v40, v41, v42, v43);
  OUTLINED_FUNCTION_83_6();
}

void + infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21252150C(a1, a2, a3, a4, a5, 0, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

uint64_t + infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_212521574(a1, a2, a3, a4, a5, 0);
}

{
  return sub_212521670(a1, a2, a3, a4, a5, 0);
}

{
  return sub_2125216F8(a1, a2, a3, a4, a5, 0);
}

{
  return sub_212521FF0(a1, a2, a3, a4, a5, 0);
}

{
  return sub_212522050(a1, a2, a3, a4, a5, 0);
}

void + infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_2125215E4(a1, a2, a3, a4, a5, 0, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void - infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21252150C(a1, a2, a3, a4, a5, 1, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

uint64_t - infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_212521574(a1, a2, a3, a4, a5, 1);
}

{
  return sub_212521670(a1, a2, a3, a4, a5, 1);
}

{
  return sub_2125216F8(a1, a2, a3, a4, a5, 1);
}

{
  return sub_212521FF0(a1, a2, a3, a4, a5, 1);
}

{
  return sub_212522050(a1, a2, a3, a4, a5, 1);
}

void - infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_2125215E4(a1, a2, a3, a4, a5, 1, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void * infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21252150C(a1, a2, a3, a4, a5, 5, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

uint64_t * infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_212521574(a1, a2, a3, a4, a5, 5);
}

{
  return sub_212521670(a1, a2, a3, a4, a5, 5);
}

{
  return sub_2125216F8(a1, a2, a3, a4, a5, 5);
}

{
  return sub_212521FF0(a1, a2, a3, a4, a5, 5);
}

{
  return sub_212522050(a1, a2, a3, a4, a5, 5);
}

void * infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_2125215E4(a1, a2, a3, a4, a5, 5, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void / infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_21252150C(a1, a2, a3, a4, a5, 6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void sub_21252150C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  OUTLINED_FUNCTION_2_17();
  a29 = v30;
  a30 = v31;
  v33 = v32;
  OUTLINED_FUNCTION_7_13(v34, v35, v36, v31);
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_18_10((uint64_t)&a14, (uint64_t)&a9, v33);
  v37 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v37, v38, v39, v40, v41);
  OUTLINED_FUNCTION_39_2();
}

uint64_t / infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_212521574(a1, a2, a3, a4, a5, 6);
}

{
  return sub_212521670(a1, a2, a3, a4, a5, 6);
}

{
  return sub_2125216F8(a1, a2, a3, a4, a5, 6);
}

{
  return sub_212521FF0(a1, a2, a3, a4, a5, 6);
}

{
  return sub_212522050(a1, a2, a3, a4, a5, 6);
}

#error "2125215A8: call analysis failed (funcsize=25)"

void / infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_2125215E4(a1, a2, a3, a4, a5, 6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void sub_2125215E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
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
  int v50;
  unsigned __int8 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  OUTLINED_FUNCTION_22_11();
  a31 = v32;
  a32 = v33;
  v36 = *v34;
  v35 = v34[1];
  v37 = v34[2];
  v40 = *v38;
  v39 = v38[1];
  v41 = v38[2];
  v42 = OUTLINED_FUNCTION_17_11();
  a19 = OUTLINED_FUNCTION_26_9(v42, v43, v44, v45);
  a20 = &protocol witness table for Expression<A>;
  a16 = v36;
  a17 = v35;
  a18 = v37;
  a14 = OUTLINED_FUNCTION_36_11(a19, v46, v47, v48);
  a15 = &protocol witness table for Expression<A>;
  a11 = v40;
  a12 = v39;
  a13 = v41;
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  v49 = OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_57_7(v49, v50, v51);
  v52 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a11);
  OUTLINED_FUNCTION_80_9(v52, v53, v54, v55, v56, v57, v58);
  OUTLINED_FUNCTION_3_17();
}

#error "2125216D8: call analysis failed (funcsize=31)"

#error "212521730: call analysis failed (funcsize=23)"

void % infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212521800(a1, a2, a3, a4, 7, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

uint64_t % infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_212521868(a1, a2, a3, a4, 7);
}

{
  return sub_212521964(a1, a2, a3, a4, 7);
}

{
  return sub_2125219EC(a1, a2, a3, a4, 7);
}

{
  return sub_212522238(a1, a2, a3, a4, 7);
}

{
  return sub_212522298(a1, a2, a3, a4, 7);
}

void % infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_2125218D8(a1, a2, a3, a4, 7, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void << infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212521800(a1, a2, a3, a4, 8, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

uint64_t << infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_212521868(a1, a2, a3, a4, 8);
}

{
  return sub_212521964(a1, a2, a3, a4, 8);
}

{
  return sub_2125219EC(a1, a2, a3, a4, 8);
}

{
  return sub_212522238(a1, a2, a3, a4, 8);
}

{
  return sub_212522298(a1, a2, a3, a4, 8);
}

void << infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_2125218D8(a1, a2, a3, a4, 8, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void >> infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212521800(a1, a2, a3, a4, 9, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

uint64_t >> infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_212521868(a1, a2, a3, a4, 9);
}

{
  return sub_212521964(a1, a2, a3, a4, 9);
}

{
  return sub_2125219EC(a1, a2, a3, a4, 9);
}

{
  return sub_212522238(a1, a2, a3, a4, 9);
}

{
  return sub_212522298(a1, a2, a3, a4, 9);
}

void >> infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_2125218D8(a1, a2, a3, a4, 9, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void & infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212521800(a1, a2, a3, a4, 10, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

uint64_t & infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_212521868(a1, a2, a3, a4, 10);
}

{
  return sub_212521964(a1, a2, a3, a4, 10);
}

{
  return sub_2125219EC(a1, a2, a3, a4, 10);
}

{
  return sub_212522238(a1, a2, a3, a4, 10);
}

{
  return sub_212522298(a1, a2, a3, a4, 10);
}

void & infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_2125218D8(a1, a2, a3, a4, 10, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void | infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212521800(a1, a2, a3, a4, 11, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void sub_212521800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  OUTLINED_FUNCTION_2_17();
  a29 = v30;
  a30 = v31;
  v33 = v32;
  OUTLINED_FUNCTION_7_13(v34, v35, v36, v31);
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_18_10((uint64_t)&a14, (uint64_t)&a9, v33);
  v37 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v37, v38, v39, v40, v41);
  OUTLINED_FUNCTION_39_2();
}

uint64_t | infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_212521868(a1, a2, a3, a4, 11);
}

{
  return sub_212521964(a1, a2, a3, a4, 11);
}

{
  return sub_2125219EC(a1, a2, a3, a4, 11);
}

{
  return sub_212522238(a1, a2, a3, a4, 11);
}

{
  return sub_212522298(a1, a2, a3, a4, 11);
}

#error "21252189C: call analysis failed (funcsize=25)"

void | infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_2125218D8(a1, a2, a3, a4, 11, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void sub_2125218D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _UNKNOWN **a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
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
  int v50;
  unsigned __int8 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  OUTLINED_FUNCTION_22_11();
  a31 = v32;
  a32 = v33;
  v36 = *v34;
  v35 = v34[1];
  v37 = v34[2];
  v40 = *v38;
  v39 = v38[1];
  v41 = v38[2];
  v42 = OUTLINED_FUNCTION_17_11();
  a19 = OUTLINED_FUNCTION_26_9(v42, v43, v44, v45);
  a20 = &protocol witness table for Expression<A>;
  a16 = v36;
  a17 = v35;
  a18 = v37;
  a14 = OUTLINED_FUNCTION_36_11(a19, v46, v47, v48);
  a15 = &protocol witness table for Expression<A>;
  a11 = v40;
  a12 = v39;
  a13 = v41;
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  v49 = OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_57_7(v49, v50, v51);
  v52 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a11);
  OUTLINED_FUNCTION_80_9(v52, v53, v54, v55, v56, v57, v58);
  OUTLINED_FUNCTION_3_17();
}

#error "2125219CC: call analysis failed (funcsize=31)"

#error "212521A24: call analysis failed (funcsize=23)"

uint64_t ^ infix<A>(_:_:)(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return OUTLINED_FUNCTION_85_8(a1, a2, a3, a4, (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))& infix<A>(_:_:), (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t))~ prefix<A>(_:), (void (*)(uint64_t *__return_ptr, uint64_t *, _QWORD *, uint64_t))| infix<A>(_:_:));
}

{
  return sub_212521AB0(a1, a2, a3, a4, (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))& infix<A>(_:_:), (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t))~ prefix<A>(_:), (void (*)(uint64_t *__return_ptr, uint64_t *, _QWORD *, uint64_t))| infix<A>(_:_:), (void (*)(uint64_t *, uint64_t *, uint64_t))& infix<A>(_:_:));
}

{
  return OUTLINED_FUNCTION_85_8(a1, a2, a3, a4, (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))& infix<A>(_:_:), (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t))~ prefix<A>(_:), (void (*)(uint64_t *__return_ptr, uint64_t *, _QWORD *, uint64_t))| infix<A>(_:_:));
}

{
  return sub_212521AB0(a1, a2, a3, a4, (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t *))& infix<A>(_:_:), (void (*)(uint64_t *__return_ptr, uint64_t *, uint64_t))~ prefix<A>(_:), (void (*)(uint64_t *__return_ptr, uint64_t *, _QWORD *, uint64_t))| infix<A>(_:_:), (void (*)(uint64_t *, uint64_t *, uint64_t))& infix<A>(_:_:));
}

uint64_t ^ infix<A>(_:_:)()
{
  return sub_212521C0C();
}

{
  return sub_212521C0C();
}

{
  return sub_212522404();
}

{
  return sub_212522404();
}

uint64_t sub_212521AB0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *__return_ptr, uint64_t *, uint64_t *), void (*a6)(uint64_t *__return_ptr, uint64_t *, uint64_t), void (*a7)(uint64_t *__return_ptr, uint64_t *, _QWORD *, uint64_t), void (*a8)(uint64_t *, uint64_t *, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v19[3];
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

  v11 = a1[1];
  v12 = a1[2];
  v13 = *a2;
  v14 = a2[1];
  v15 = a2[2];
  v29 = *a1;
  v10 = v29;
  v30 = v11;
  v31 = v12;
  v23 = v13;
  v24 = v14;
  v25 = v15;
  a5(&v26, &v29, &v23);
  v23 = v26;
  v24 = v27;
  v25 = v28;
  a6(&v29, &v23, a3);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_56();
  v26 = v29;
  v27 = v30;
  v28 = v31;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v19[0] = v13;
  v19[1] = v14;
  v19[2] = v15;
  a7(&v23, &v20, v19, a3);
  v20 = v23;
  v21 = v24;
  v22 = v25;
  a8(&v26, &v20, a3);
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_86();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_212521C0C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *(*v5)(_QWORD *__return_ptr, _QWORD *);
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t *, uint64_t);
  _BYTE v14[48];
  _QWORD v15[3];
  _QWORD v16[3];

  OUTLINED_FUNCTION_95_10();
  v1 = v0;
  v3 = v2[1];
  v4 = v2[2];
  v16[0] = *v2;
  v16[1] = v3;
  v16[2] = v4;
  v6 = v5(v15, v16);
  OUTLINED_FUNCTION_47_8((uint64_t)v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_229();
  OUTLINED_FUNCTION_66_6();
  v11 = OUTLINED_FUNCTION_109_8((uint64_t)v14, v1);
  OUTLINED_FUNCTION_29_8(v11, v12);
  OUTLINED_FUNCTION_229();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_86();
  return OUTLINED_FUNCTION_27_7();
}

uint64_t sub_212521C88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned __int8 a4@<W3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v11;

  v11 = sub_212521CF4(a4);
  sub_212526BF8(a1, a2, a3, v11, a5, a6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_212521CF4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_212521D1C + 4 * byte_212537730[a1]))(43, 0xE100000000000000);
}

uint64_t sub_212521D1C()
{
  return 45;
}

uint64_t sub_212521D24()
{
  return 21071;
}

uint64_t sub_212521D30()
{
  return 4476481;
}

uint64_t sub_212521D40()
{
  return 542396238;
}

uint64_t sub_212521D50()
{
  return 42;
}

uint64_t sub_212521D58()
{
  return 47;
}

uint64_t sub_212521D60()
{
  return 37;
}

uint64_t sub_212521D68()
{
  return 15420;
}

uint64_t sub_212521D74()
{
  return 15934;
}

uint64_t sub_212521D80()
{
  return 38;
}

uint64_t sub_212521D88()
{
  return 124;
}

uint64_t sub_212521D90()
{
  return 126;
}

uint64_t sub_212521D98()
{
  return 61;
}

uint64_t sub_212521DA0()
{
  return 15649;
}

uint64_t sub_212521DAC()
{
  return 62;
}

uint64_t sub_212521DB4()
{
  return 60;
}

uint64_t sub_212521DBC()
{
  return 15678;
}

uint64_t sub_212521DC8()
{
  return 15676;
}

uint64_t sub_212521DD4()
{
  return 31868;
}

uint64_t sub_212521DE0@<X0>(_QWORD *a1@<X0>, unsigned __int8 a2@<W1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_212521CF4(a2);
  sub_212526A0C(a1, v5, v6, a3);
  return swift_bridgeObjectRelease();
}

uint64_t + infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_212521E7C(a1, a2, a3, &qword_253EFD5C8);
}

{
  return sub_212521E7C(a1, a2, a3, &qword_253EFD5D8);
}

uint64_t sub_212521E7C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
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
  _UNKNOWN **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _UNKNOWN **v21;

  v5 = *a3;
  v4 = a3[1];
  v6 = a3[2];
  v20 = MEMORY[0x24BEE0D00];
  v21 = &protocol witness table for String;
  v18 = a1;
  v19 = a2;
  v16 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v17 = &protocol witness table for Expression<A>;
  v13 = v5;
  v14 = v4;
  v15 = v6;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_92_7((uint64_t)&v18, (uint64_t)&v13);
  v7 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v13);
  return OUTLINED_FUNCTION_5_9(v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18, v19);
}

void + infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212521F70(a1, a2, a3, a4, a5, 0, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void - infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212521F70(a1, a2, a3, a4, a5, 1, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void * infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212521F70(a1, a2, a3, a4, a5, 5, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void / infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212521F70(a1, a2, a3, a4, a5, 6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void sub_212521F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
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

  OUTLINED_FUNCTION_2_17();
  a29 = v33;
  a30 = v34;
  v36 = v35;
  OUTLINED_FUNCTION_7_13(v37, v38, v39, v34);
  v40 = OUTLINED_FUNCTION_73_9();
  a12 = OUTLINED_FUNCTION_36_11(v40, v41, v42, v43);
  a13 = &protocol witness table for Expression<A>;
  a9 = v32;
  a10 = v30;
  a11 = v31;
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_25_10((uint64_t)&a14, (uint64_t)&a9, v36);
  v44 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v44, v45, v46, v47, v48);
  OUTLINED_FUNCTION_39_2();
}

#error "212522008: call analysis failed (funcsize=21)"

#error "212522068: call analysis failed (funcsize=23)"

void - prefix<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[5];

  OUTLINED_FUNCTION_68_8(a1, a2, a3, a4);
  OUTLINED_FUNCTION_38_9();
  OUTLINED_FUNCTION_51_1();
  v5 = sub_212521DE0(v6, 1u, v4);
  OUTLINED_FUNCTION_209_0(v5);
  OUTLINED_FUNCTION_108_3();
}

void - prefix<A>(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  v1 = OUTLINED_FUNCTION_79_6();
  OUTLINED_FUNCTION_148_2(v1, v2, v3, v4);
  OUTLINED_FUNCTION_83_7();
  OUTLINED_FUNCTION_175();
  v5 = sub_212521DE0(v6, 1u, v0);
  OUTLINED_FUNCTION_209_0(v5);
  OUTLINED_FUNCTION_108_3();
}

void % infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_2125221B8(a1, a2, a3, a4, 7, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void << infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_2125221B8(a1, a2, a3, a4, 8, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void >> infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_2125221B8(a1, a2, a3, a4, 9, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void & infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_2125221B8(a1, a2, a3, a4, 10, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void | infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_2125221B8(a1, a2, a3, a4, 11, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void sub_2125221B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
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

  OUTLINED_FUNCTION_2_17();
  a29 = v33;
  a30 = v34;
  v36 = v35;
  OUTLINED_FUNCTION_7_13(v37, v38, v39, v34);
  v40 = OUTLINED_FUNCTION_73_9();
  a12 = OUTLINED_FUNCTION_36_11(v40, v41, v42, v43);
  a13 = &protocol witness table for Expression<A>;
  a9 = v32;
  a10 = v30;
  a11 = v31;
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_25_10((uint64_t)&a14, (uint64_t)&a9, v36);
  v44 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v44, v45, v46, v47, v48);
  OUTLINED_FUNCTION_39_2();
}

#error "212522250: call analysis failed (funcsize=21)"

#error "2125222B0: call analysis failed (funcsize=23)"

void ~ prefix<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[5];

  OUTLINED_FUNCTION_68_8(a1, a2, a3, a4);
  OUTLINED_FUNCTION_38_9();
  OUTLINED_FUNCTION_51_1();
  v5 = sub_212521DE0(v6, 0xCu, v4);
  OUTLINED_FUNCTION_209_0(v5);
  OUTLINED_FUNCTION_108_3();
}

void ~ prefix<A>(_:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  v1 = OUTLINED_FUNCTION_79_6();
  OUTLINED_FUNCTION_148_2(v1, v2, v3, v4);
  OUTLINED_FUNCTION_83_7();
  OUTLINED_FUNCTION_175();
  v5 = sub_212521DE0(v6, 0xCu, v0);
  OUTLINED_FUNCTION_209_0(v5);
  OUTLINED_FUNCTION_108_3();
}

uint64_t sub_212522404()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *(*v5)(_QWORD *__return_ptr);
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t *, uint64_t);
  _BYTE v14[48];
  _QWORD v15[6];

  OUTLINED_FUNCTION_95_10();
  v1 = v0;
  v3 = v2[1];
  v4 = v2[2];
  v15[3] = *v2;
  v15[4] = v3;
  v15[5] = v4;
  v6 = v5(v15);
  OUTLINED_FUNCTION_47_8((uint64_t)v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_229();
  OUTLINED_FUNCTION_66_6();
  v11 = OUTLINED_FUNCTION_109_8(v1, (uint64_t)v14);
  OUTLINED_FUNCTION_29_8(v11, v12);
  OUTLINED_FUNCTION_229();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_86();
  return OUTLINED_FUNCTION_27_7();
}

void == infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_31_14(a1, a2, a3, a4, a5, 61, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  OUTLINED_FUNCTION_33_12(a1, a2, a3, a4, a5, 61, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void == infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_34_13(a1, a2, a3, a4, a5, 61, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_30_10(a1, a2, a3, a4, a5, 61, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t == infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_35_7(a1, a2, a3, a4, a5, 61);
}

{
  return OUTLINED_FUNCTION_32_7(a1, a2, a3, a4, a5, 61);
}

void == infix<A>(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_91_8();
  sub_21252252C(v0, v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_35_2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_91_8();
  sub_212522748(v0, v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_35_2();
}

void != infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_41_11(a1, a2, a3, a4, a5, 15649, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  OUTLINED_FUNCTION_43_10(a1, a2, a3, a4, a5, 15649, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void != infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_44_7(a1, a2, a3, a4, a5, 15649, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_40_9(a1, a2, a3, a4, a5, 15649, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t != infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_45_10(a1, a2, a3, a4, a5, 15649);
}

{
  return OUTLINED_FUNCTION_42_10(a1, a2, a3, a4, a5, 15649);
}

void != infix<A>(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_72_7();
  sub_21252252C(v0, v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_35_2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_72_7();
  sub_212522748(v0, v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_35_2();
}

void sub_21252252C(uint64_t a1@<X3>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, uint64_t a5@<X8>, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _UNKNOWN **v37;
  uint64_t *boxed_opaque_existential_1;
  _BYTE v39[24];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42[3];
  uint64_t v43;
  _UNKNOWN **v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _UNKNOWN **v49;

  OUTLINED_FUNCTION_107_5(a1, a2, a3, a4, a5);
  v8 = v7;
  v10 = v9;
  v11 = OUTLINED_FUNCTION_105_5();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = &v39[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = &v39[-v17];
  v19 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v21 = &v39[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = v10[1];
  v40 = *v10;
  v23 = v10[2];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v18, v8, v11);
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v6) == 1)
  {
    v24 = (*(uint64_t (**)(_BYTE *, uint64_t))(v12 + 8))(v18, v11);
    v28 = OUTLINED_FUNCTION_60_5(v24, v25, v26, v27);
    v48 = v28;
    v49 = &protocol witness table for Expression<A>;
    v45 = v40;
    v46 = v22;
    v47 = v23;
    OUTLINED_FUNCTION_97_8((uint64_t)v15);
    v43 = v28;
    v44 = &protocol witness table for Expression<A>;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_136_0();
    MEMORY[0x212BED510](&protocol conformance descriptor for Expression<A>, v28);
    MEMORY[0x212BED510]("؛", v11);
    OUTLINED_FUNCTION_90_6((uint64_t)v15, (uint64_t)v42);
    v29 = OUTLINED_FUNCTION_100_7();
    sub_21250EBCC(v29, v30, v31, v32, a6);
  }
  else
  {
    v33 = OUTLINED_FUNCTION_59_7((uint64_t)v21, (uint64_t)v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 32));
    v48 = OUTLINED_FUNCTION_60_5(v33, v34, v35, v36);
    v49 = &protocol witness table for Expression<A>;
    v45 = v40;
    v46 = v22;
    v47 = v23;
    v37 = *(_UNKNOWN ***)(v41 + 8);
    v43 = v6;
    v44 = v37;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v42);
    OUTLINED_FUNCTION_59_7((uint64_t)boxed_opaque_existential_1, (uint64_t)v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 16));
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_136_0();
    OUTLINED_FUNCTION_71_7();
    (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v21, v6);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v45);
  OUTLINED_FUNCTION_3_1();
}

void sub_212522748(uint64_t a1@<X3>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, uint64_t a5@<X8>, uint64_t a6)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
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
  uint64_t v32;
  _UNKNOWN **v33;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[24];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _UNKNOWN **v46;
  uint64_t v47[3];
  uint64_t v48;
  _UNKNOWN **v49;

  OUTLINED_FUNCTION_107_5(a1, a2, a3, a4, a5);
  v8 = v7;
  v10 = v9;
  v11 = OUTLINED_FUNCTION_105_5();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = &v39[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = &v39[-v17];
  v19 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v21 = &v39[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = v8[1];
  v40 = *v8;
  v23 = v8[2];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v18, v10, v11);
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v6) == 1)
  {
    v24 = (*(uint64_t (**)(_BYTE *, uint64_t))(v12 + 8))(v18, v11);
    v28 = OUTLINED_FUNCTION_146_5(v24, v25, v26, v27);
    OUTLINED_FUNCTION_97_8((uint64_t)v15);
    v48 = v28;
    v49 = &protocol witness table for Expression<A>;
    MEMORY[0x212BED510](&protocol conformance descriptor for Expression<A>, v28);
    MEMORY[0x212BED510]("؛", v11);
    OUTLINED_FUNCTION_90_6((uint64_t)v15, (uint64_t)v47);
    v45 = v28;
    v46 = &protocol witness table for Expression<A>;
    v42 = v40;
    v43 = v22;
    v44 = v23;
    OUTLINED_FUNCTION_136_0();
    OUTLINED_FUNCTION_51_1();
    v29 = OUTLINED_FUNCTION_100_7();
    sub_21250EBCC(v29, v30, v31, v32, a6);
  }
  else
  {
    OUTLINED_FUNCTION_59_7((uint64_t)v21, (uint64_t)v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 32));
    v33 = *(_UNKNOWN ***)(v41 + 8);
    v48 = v6;
    v49 = v33;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47);
    v35 = OUTLINED_FUNCTION_59_7((uint64_t)boxed_opaque_existential_1, (uint64_t)v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 16));
    v45 = OUTLINED_FUNCTION_146_5(v35, v36, v37, v38);
    v46 = &protocol witness table for Expression<A>;
    v42 = v40;
    v43 = v22;
    v44 = v23;
    OUTLINED_FUNCTION_136_0();
    OUTLINED_FUNCTION_51_1();
    OUTLINED_FUNCTION_71_7();
    (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v21, v6);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v42);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v47);
  OUTLINED_FUNCTION_3_1();
}

void > infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_31_14(a1, a2, a3, a4, a5, 62, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  OUTLINED_FUNCTION_33_12(a1, a2, a3, a4, a5, 62, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void > infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_34_13(a1, a2, a3, a4, a5, 62, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_30_10(a1, a2, a3, a4, a5, 62, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t > infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_35_7(a1, a2, a3, a4, a5, 62);
}

{
  return OUTLINED_FUNCTION_75_8(a1, a2, a3, a4, a5, 62);
}

{
  return OUTLINED_FUNCTION_32_7(a1, a2, a3, a4, a5, 62);
}

{
  return OUTLINED_FUNCTION_74_6(a1, a2, a3, a4, a5, 62);
}

void >= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_41_11(a1, a2, a3, a4, a5, 15678, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  OUTLINED_FUNCTION_43_10(a1, a2, a3, a4, a5, 15678, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void >= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_44_7(a1, a2, a3, a4, a5, 15678, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_40_9(a1, a2, a3, a4, a5, 15678, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t >= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_45_10(a1, a2, a3, a4, a5, 15678);
}

{
  return OUTLINED_FUNCTION_88_6(a1, a2, a3, a4, a5, 15678);
}

{
  return OUTLINED_FUNCTION_42_10(a1, a2, a3, a4, a5, 15678);
}

{
  return OUTLINED_FUNCTION_87_8(a1, a2, a3, a4, a5, 15678);
}

void < infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_31_14(a1, a2, a3, a4, a5, 60, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  OUTLINED_FUNCTION_33_12(a1, a2, a3, a4, a5, 60, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void < infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_34_13(a1, a2, a3, a4, a5, 60, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_30_10(a1, a2, a3, a4, a5, 60, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t < infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_35_7(a1, a2, a3, a4, a5, 60);
}

{
  return OUTLINED_FUNCTION_75_8(a1, a2, a3, a4, a5, 60);
}

{
  return OUTLINED_FUNCTION_32_7(a1, a2, a3, a4, a5, 60);
}

{
  return OUTLINED_FUNCTION_74_6(a1, a2, a3, a4, a5, 60);
}

void <= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_41_11(a1, a2, a3, a4, a5, 15676, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  OUTLINED_FUNCTION_43_10(a1, a2, a3, a4, a5, 15676, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void sub_212522A00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
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

  OUTLINED_FUNCTION_2_17();
  a29 = v30;
  a30 = v31;
  OUTLINED_FUNCTION_7_13(v32, v33, v34, v31);
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_51_8((uint64_t)&a14, (uint64_t)&a9);
  v35 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v35, v36, v37, v38, v39);
  OUTLINED_FUNCTION_39_2();
}

void <= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_44_7(a1, a2, a3, a4, a5, 15676, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_40_9(a1, a2, a3, a4, a5, 15676, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void sub_212522A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
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

  OUTLINED_FUNCTION_22_11();
  a31 = v35;
  a32 = v36;
  OUTLINED_FUNCTION_61_6();
  OUTLINED_FUNCTION_16_13(v37, v38, v39, v40);
  OUTLINED_FUNCTION_98_7();
  v41 = sub_212532EA8();
  a14 = OUTLINED_FUNCTION_7_10(v41, v42, v43, v44);
  a15 = &protocol witness table for Expression<A>;
  a11 = v34;
  a12 = v32;
  a13 = v33;
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  v45 = OUTLINED_FUNCTION_136_0();
  OUTLINED_FUNCTION_58_11(v45, v46);
  v47 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a11);
  OUTLINED_FUNCTION_80_9(v47, v48, v49, v50, v51, v52, v53);
  OUTLINED_FUNCTION_3_17();
}

void sub_212522ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
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

  OUTLINED_FUNCTION_22_11();
  a31 = v35;
  a32 = v36;
  OUTLINED_FUNCTION_61_6();
  v37 = OUTLINED_FUNCTION_17_11();
  OUTLINED_FUNCTION_7_10(v37, v38, v39, v40);
  OUTLINED_FUNCTION_98_7();
  a14 = OUTLINED_FUNCTION_148_2(v41, v42, v43, v44);
  a15 = &protocol witness table for Expression<A>;
  a11 = v34;
  a12 = v32;
  a13 = v33;
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  v45 = OUTLINED_FUNCTION_136_0();
  OUTLINED_FUNCTION_58_11(v45, v46);
  v47 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a11);
  OUTLINED_FUNCTION_80_9(v47, v48, v49, v50, v51, v52, v53);
  OUTLINED_FUNCTION_3_17();
}

void sub_212522B48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
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

  OUTLINED_FUNCTION_2_17();
  a29 = v30;
  a30 = v31;
  v32 = OUTLINED_FUNCTION_17_11();
  OUTLINED_FUNCTION_7_10(v32, v33, v34, v35);
  OUTLINED_FUNCTION_10_16();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_50_10((uint64_t)&a14, (uint64_t)&a9);
  v36 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v36, v37, v38, v39, v40);
  OUTLINED_FUNCTION_39_2();
}

uint64_t <= infix<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return OUTLINED_FUNCTION_45_10(a1, a2, a3, a4, a5, 15676);
}

{
  return OUTLINED_FUNCTION_88_6(a1, a2, a3, a4, a5, 15676);
}

{
  return OUTLINED_FUNCTION_42_10(a1, a2, a3, a4, a5, 15676);
}

{
  return OUTLINED_FUNCTION_87_8(a1, a2, a3, a4, a5, 15676);
}

#error "212522BE8: call analysis failed (funcsize=21)"

#error "212522C4C: call analysis failed (funcsize=22)"

#error "212522CB8: call analysis failed (funcsize=30)"

#error "212522D3C: call analysis failed (funcsize=33)"

void _s8RRSQLite2teoiyAA10ExpressionVySbGSNyxG_ADyxGtAA5ValueRzSLRzAaH8DatatypeAaHPRpzSLAKRQlF_0(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v8;
  uint64_t v9;

  v3 = *a1;
  v4 = a1[1];
  v9 = a1[2];
  OUTLINED_FUNCTION_76_6();
  OUTLINED_FUNCTION_136_0();
  swift_bridgeObjectRelease();
  sub_212532BCC();
  v8 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212534EA0;
  OUTLINED_FUNCTION_96_7();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(_QWORD *)(inited + 56) = AssociatedTypeWitness;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(inited + 64) = AssociatedConformanceWitness;
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_56_5();
  sub_212532AB8();
  *(_QWORD *)(inited + 96) = AssociatedTypeWitness;
  *(_QWORD *)(inited + 104) = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 72));
  OUTLINED_FUNCTION_56_5();
  swift_bridgeObjectRetain();
  sub_21250ED38();
  *a2 = v3;
  a2[1] = v8;
  a2[2] = v9;
}

void _s8RRSQLite2teoiyAA10ExpressionVySbGSnyxG_ADyxGtAA5ValueRzSLRzAaH8DatatypeAaHPRpzSLAKRQlF_0(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t inited;
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  OUTLINED_FUNCTION_76_6();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_212532BCC();
  swift_bridgeObjectRetain();
  sub_212532BCC();
  OUTLINED_FUNCTION_32();
  sub_212532BCC();
  v10 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212534F20;
  OUTLINED_FUNCTION_96_7();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  *(_QWORD *)(inited + 56) = AssociatedTypeWitness;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  *(_QWORD *)(inited + 64) = AssociatedConformanceWitness;
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_56_5();
  OUTLINED_FUNCTION_121_1();
  sub_21250ED38();
  OUTLINED_FUNCTION_121_1();
  sub_21250ED38();
  v8 = v4;
  v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_212534F20;
  sub_212532D70();
  *(_QWORD *)(v9 + 56) = AssociatedTypeWitness;
  *(_QWORD *)(v9 + 64) = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v9 + 32));
  OUTLINED_FUNCTION_56_5();
  sub_21250ED38();
  *a2 = v2;
  a2[1] = v10;
  a2[2] = v8;
}

void ~= infix<A>(_:_:)()
{
  OUTLINED_FUNCTION_54_9();
  OUTLINED_FUNCTION_35_2();
}

{
  OUTLINED_FUNCTION_54_9();
  OUTLINED_FUNCTION_35_2();
}

{
  OUTLINED_FUNCTION_77_9();
  OUTLINED_FUNCTION_35_2();
}

{
  OUTLINED_FUNCTION_77_9();
  OUTLINED_FUNCTION_35_2();
}

{
  OUTLINED_FUNCTION_54_9();
  OUTLINED_FUNCTION_35_2();
}

{
  OUTLINED_FUNCTION_54_9();
  OUTLINED_FUNCTION_35_2();
}

void sub_2125231D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t inited;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_22_11();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6[2];
  v10 = *v6;
  v11 = v6[1];
  swift_bridgeObjectRetain();
  sub_212532BCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212534F20;
  v9 = *(void (**)(uint64_t, uint64_t))(v1 + 56);
  OUTLINED_FUNCTION_96_7();
  *(_QWORD *)(inited + 56) = swift_getAssociatedTypeWitness();
  *(_QWORD *)(inited + 64) = swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_1_7();
  v9(v3, v1);
  OUTLINED_FUNCTION_206();
  sub_21250ED38();
  *v5 = v10;
  v5[1] = v11;
  v5[2] = v7;
  OUTLINED_FUNCTION_3_17();
}

void sub_2125232F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  OUTLINED_FUNCTION_2_17();
  a29 = v30;
  a30 = v31;
  v33 = v32;
  v36 = *v34;
  v35 = v34[1];
  v37 = v34[2];
  v40 = *v38;
  v39 = v38[1];
  v41 = v38[2];
  a17 = OUTLINED_FUNCTION_86_8((uint64_t)v34, (uint64_t)v38, v42);
  a18 = &protocol witness table for Expression<A>;
  a14 = v36;
  a15 = v35;
  a16 = v37;
  a12 = __swift_instantiateConcreteTypeFromMangledName(v33);
  a13 = &protocol witness table for Expression<A>;
  a9 = v40;
  a10 = v39;
  a11 = v41;
  OUTLINED_FUNCTION_175();
  OUTLINED_FUNCTION_51_1();
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  sub_21250EBCC((uint64_t)&a14, (uint64_t)&a9, 1, 4476481, 0xE300000000000000);
  v43 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v43, v44, v45, v46, v47);
  OUTLINED_FUNCTION_39_2();
}

void && infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_64_5(a1, a2, (uint64_t)&qword_253EFB778, a4, a5, (uint64_t)sub_21250ED20, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

{
  OUTLINED_FUNCTION_64_5(a1, a2, (uint64_t)&qword_253EFB780, a4, a5, (uint64_t)sub_21250EBCC, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

void && infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_65_5(a1, a2, (uint64_t)&qword_253EFB778, a4, a5, (uint64_t)sub_21250ED20, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

{
  OUTLINED_FUNCTION_65_5(a1, a2, (uint64_t)&qword_253EFB780, a4, a5, (uint64_t)sub_21250EBCC, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

void || infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  OUTLINED_FUNCTION_23_7(a1, a2, (uint64_t)&qword_253EFB778, 21071, a5, (uint64_t)sub_21250ED20, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

{
  OUTLINED_FUNCTION_23_7(a1, a2, (uint64_t)&qword_253EFB780, 21071, a5, (uint64_t)sub_21250EBCC, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void || infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  OUTLINED_FUNCTION_84_8(a1, a2, (uint64_t)&qword_253EFB778, (uint64_t)&qword_253EFB780, a5, (uint64_t)sub_21250EBCC, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

{
  OUTLINED_FUNCTION_84_8(a1, a2, (uint64_t)&qword_253EFB780, (uint64_t)&qword_253EFB778, a5, (uint64_t)sub_21250EBCC, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void sub_212523444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t *, uint64_t, uint64_t, unint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t *, uint64_t, uint64_t, unint64_t);

  OUTLINED_FUNCTION_22_11();
  a31 = v37;
  a32 = v38;
  v50 = v39;
  OUTLINED_FUNCTION_39_6(v40, v41, v42);
  OUTLINED_FUNCTION_98_7();
  a14 = __swift_instantiateConcreteTypeFromMangledName(v33);
  a15 = &protocol witness table for Expression<A>;
  a11 = v36;
  a12 = v34;
  a13 = v35;
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_136_0();
  v50(&a16, &a11, 1, v32, 0xE200000000000000);
  v43 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a11);
  OUTLINED_FUNCTION_80_9(v43, v44, v45, v46, v47, v48, v49);
  OUTLINED_FUNCTION_3_17();
}

void sub_2125234DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
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
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  OUTLINED_FUNCTION_2_17();
  a29 = v36;
  a30 = v37;
  a17 = OUTLINED_FUNCTION_39_6(v38, v39, v40);
  a18 = &protocol witness table for Expression<A>;
  a14 = v34;
  a15 = v30;
  a16 = v31;
  a12 = a17;
  a13 = &protocol witness table for Expression<A>;
  a9 = v35;
  a10 = v32;
  a11 = v33;
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_136_0();
  OUTLINED_FUNCTION_49_8((uint64_t)&a14, (uint64_t)&a9);
  v41 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v41, v42, v43, v44, v45);
  OUTLINED_FUNCTION_39_2();
}

void || infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_69_6(a1, a2, (uint64_t)&qword_253EFB778, a4, a5, (uint64_t)sub_21250ED20, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

{
  OUTLINED_FUNCTION_69_6(a1, a2, (uint64_t)&qword_253EFB780, a4, a5, (uint64_t)sub_21250EBCC, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

void sub_212523574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  OUTLINED_FUNCTION_13_12();
  a27 = v28;
  a28 = v29;
  v31 = v30;
  v34 = *v32;
  v33 = v32[1];
  v35 = v32[2];
  v37 = OUTLINED_FUNCTION_86_8((uint64_t)v32, v30, v36);
  a18 = &protocol witness table for Expression<A>;
  a14 = v34;
  a15 = v33;
  a16 = v35;
  a17 = v37;
  a12 = MEMORY[0x24BEE1328];
  a13 = &protocol witness table for Bool;
  a9 = v31;
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_121_1();
  OUTLINED_FUNCTION_49_8((uint64_t)&a14, (uint64_t)&a9);
  v38 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v38, v39, v40, v41, v42);
  OUTLINED_FUNCTION_83_6();
}

void || infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  OUTLINED_FUNCTION_70_5(a1, a2, (uint64_t)&qword_253EFB778, a4, a5, (uint64_t)sub_21250ED20, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

{
  OUTLINED_FUNCTION_70_5(a1, a2, (uint64_t)&qword_253EFB780, a4, a5, (uint64_t)sub_21250EBCC, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

void sub_212523628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  OUTLINED_FUNCTION_13_12();
  a27 = v28;
  a28 = v29;
  v32 = *v30;
  v31 = v30[1];
  v33 = v30[2];
  a17 = MEMORY[0x24BEE1328];
  a18 = &protocol witness table for Bool;
  a14 = v34;
  a12 = OUTLINED_FUNCTION_86_8(v34, (uint64_t)v30, v35);
  a13 = &protocol witness table for Expression<A>;
  a9 = v32;
  a10 = v31;
  a11 = v33;
  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_74_0();
  OUTLINED_FUNCTION_49_8((uint64_t)&a14, (uint64_t)&a9);
  v36 = __swift_destroy_boxed_opaque_existential_1((uint64_t)&a9);
  OUTLINED_FUNCTION_5_9(v36, v37, v38, v39, v40);
  OUTLINED_FUNCTION_83_6();
}

void ! prefix(_:)(uint64_t a1)
{
  sub_2125236D8(a1, &qword_253EFB778, (uint64_t (*)(_BYTE *, uint64_t, unint64_t))sub_21250B420);
}

{
  sub_2125236D8(a1, &qword_253EFB780, (uint64_t (*)(_BYTE *, uint64_t, unint64_t))sub_21250B420);
}

void sub_2125236D8(uint64_t a1, uint64_t *a2, uint64_t (*a3)(_BYTE *, uint64_t, unint64_t))
{
  uint64_t v4;
  _BYTE v5[40];

  __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_38_9();
  OUTLINED_FUNCTION_51_1();
  v4 = a3(v5, 542396238, 0xE400000000000000);
  OUTLINED_FUNCTION_209_0(v4);
  OUTLINED_FUNCTION_108_3();
}

uint64_t OUTLINED_FUNCTION_5_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

uint64_t *OUTLINED_FUNCTION_6_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;

  v18 = *(_QWORD *)(a4 + 8);
  a17 = a3;
  a18 = v18;
  return __swift_allocate_boxed_opaque_existential_1(&a14);
}

uint64_t OUTLINED_FUNCTION_7_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return type metadata accessor for Expression(0, a3, a3, a4);
}

uint64_t OUTLINED_FUNCTION_10_16()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_11_15(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_12_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t *v16;

  return sub_212521C88((uint64_t)&a14, (uint64_t)&a9, 1, v14, v15, v16);
}

uint64_t OUTLINED_FUNCTION_16_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return type metadata accessor for Expression(0, a3, a3, a4);
}

uint64_t OUTLINED_FUNCTION_17_11()
{
  return sub_212532EA8();
}

uint64_t OUTLINED_FUNCTION_18_10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unsigned __int8 v3;
  uint64_t v4;

  return sub_212521C88(a1, a2, 1, v3, v4, a3);
}

uint64_t *OUTLINED_FUNCTION_19_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  uint64_t v18;

  v18 = *(_QWORD *)(a4 + 8);
  a17 = a3;
  a18 = v18;
  return __swift_allocate_boxed_opaque_existential_1(&a14);
}

uint64_t *OUTLINED_FUNCTION_20_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  a16 = v18;
  v19 = *(_QWORD *)(v16 + 8);
  a12 = v17;
  a13 = v19;
  return __swift_allocate_boxed_opaque_existential_1(&a9);
}

uint64_t OUTLINED_FUNCTION_21_9(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(a1, v2, v1);
}

void OUTLINED_FUNCTION_23_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_2125234DC(a1, a2, a3, a4, 0xE200000000000000, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

uint64_t OUTLINED_FUNCTION_25_10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unsigned __int8 v3;
  uint64_t v4;

  return sub_212521C88(a1, a2, 1, v3, v4, a3);
}

uint64_t OUTLINED_FUNCTION_26_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return type metadata accessor for Expression(0, a1, a3, a4);
}

uint64_t OUTLINED_FUNCTION_27_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29_8(uint64_t a1, uint64_t (*a2)(char *, uint64_t *, uint64_t), ...)
{
  uint64_t v2;
  uint64_t v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  va_arg(va1, _QWORD);
  va_arg(va1, _QWORD);
  va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v4 = v8;
  v6 = v9;
  v7 = v10;
  return a2(va1, (uint64_t *)va, v2);
}

void OUTLINED_FUNCTION_30_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_212522ADC(a1, a2, a3, a4, a5, a6, 0xE100000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void OUTLINED_FUNCTION_31_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212522A00(a1, a2, a3, a4, a5, a6, 0xE100000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

uint64_t OUTLINED_FUNCTION_32_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_212522C88(a1, a2, a3, a4, a5, a6, 0xE100000000000000);
}

void OUTLINED_FUNCTION_33_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212522B48(a1, a2, a3, a4, a5, a6, 0xE100000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void OUTLINED_FUNCTION_34_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_212522A68(a1, a2, a3, a4, a5, a6, 0xE100000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t OUTLINED_FUNCTION_35_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_212522BC4(a1, a2, a3, a4, a5, a6, 0xE100000000000000);
}

uint64_t OUTLINED_FUNCTION_36_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Expression(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_38_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_39_6(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

void OUTLINED_FUNCTION_40_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_212522ADC(a1, a2, a3, a4, a5, a6, 0xE200000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

void OUTLINED_FUNCTION_41_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212522A00(a1, a2, a3, a4, a5, a6, 0xE200000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

uint64_t OUTLINED_FUNCTION_42_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_212522C88(a1, a2, a3, a4, a5, a6, 0xE200000000000000);
}

void OUTLINED_FUNCTION_43_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_212522B48(a1, a2, a3, a4, a5, a6, 0xE200000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void OUTLINED_FUNCTION_44_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_212522A68(a1, a2, a3, a4, a5, a6, 0xE200000000000000, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t OUTLINED_FUNCTION_45_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_212522BC4(a1, a2, a3, a4, a5, a6, 0xE200000000000000);
}

_QWORD *OUTLINED_FUNCTION_47_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  _QWORD *(*v6)(uint64_t *__return_ptr, uint64_t *, uint64_t);
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  va_arg(va1, _QWORD);
  va_arg(va1, _QWORD);
  va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v8 = v12;
  v10 = v13;
  v11 = v14;
  return v6((uint64_t *)va1, (uint64_t *)va, v5);
}

uint64_t OUTLINED_FUNCTION_49_8(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  return v2(a1, a2, 1, v4, v3);
}

void OUTLINED_FUNCTION_50_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_21250EBCC(a1, a2, 1, v3, v2);
}

void OUTLINED_FUNCTION_51_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_21250ED20(a1, a2, 1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_52_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  unsigned __int8 v14;
  uint64_t *v15;
  uint64_t v16;

  return sub_212521C88((uint64_t)&a14, (uint64_t)&a9, 1, v14, v16, v15);
}

uint64_t OUTLINED_FUNCTION_53_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  unsigned __int8 v14;
  uint64_t *v15;
  uint64_t v16;

  return sub_212521C88((uint64_t)&a14, (uint64_t)&a9, 1, v14, v16, v15);
}

void OUTLINED_FUNCTION_54_9()
{
  sub_2125231D0();
}

uint64_t *OUTLINED_FUNCTION_55_9@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  a11 = a1;
  a12 = a2;
  a8 = v16;
  a9 = v14;
  a10 = v15;
  v17 = *(_QWORD *)(v12 + 8);
  a6 = v13;
  a7 = v17;
  return __swift_allocate_boxed_opaque_existential_1(&a3);
}

uint64_t OUTLINED_FUNCTION_56_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_57_7(uint64_t a1, int a2, unsigned __int8 a3, ...)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  return sub_212521C88((uint64_t)va1, (uint64_t)va, 1, a3, v4, v3);
}

void OUTLINED_FUNCTION_58_11(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  sub_21250EBCC((uint64_t)va1, (uint64_t)va, 1, v2, a2);
}

uint64_t OUTLINED_FUNCTION_60_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Expression(0, v4, a3, a4);
}

void OUTLINED_FUNCTION_63_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  sub_2125234DC(a1, a2, a3, 4476481, 0xE300000000000000, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30);
}

void OUTLINED_FUNCTION_64_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  sub_212523574(a1, a2, a3, 4476481, 0xE300000000000000, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

void OUTLINED_FUNCTION_65_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  sub_212523628(a1, a2, a3, 4476481, 0xE300000000000000, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

uint64_t OUTLINED_FUNCTION_68_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return type metadata accessor for Expression(0, a2, a3, a4);
}

void OUTLINED_FUNCTION_69_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  sub_212523574(a1, a2, a3, 21071, 0xE200000000000000, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

void OUTLINED_FUNCTION_70_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _UNKNOWN **a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, _UNKNOWN **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  sub_212523628(a1, a2, a3, 21071, 0xE200000000000000, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28);
}

void OUTLINED_FUNCTION_71_7()
{
  uint64_t v0;

  sub_21250EBCC(v0 - 120, v0 - 160, 1, *(_QWORD *)(v0 - 208), *(_QWORD *)(v0 - 200));
}

uint64_t OUTLINED_FUNCTION_73_9()
{
  return sub_212532EA8();
}

uint64_t OUTLINED_FUNCTION_74_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_212522D0C(a1, a2, a3, a4, a5, a6, 0xE100000000000000);
}

uint64_t OUTLINED_FUNCTION_75_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_212522C24(a1, a2, a3, a4, a5, a6, 0xE100000000000000);
}

uint64_t OUTLINED_FUNCTION_76_6()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 104) = 0;
  *(_QWORD *)(v0 - 96) = 0xE000000000000000;
  return sub_212532F98();
}

void OUTLINED_FUNCTION_77_9()
{
  sub_2125231D0();
}

uint64_t OUTLINED_FUNCTION_79_6()
{
  return sub_212532EA8();
}

uint64_t OUTLINED_FUNCTION_80_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_83_7()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_84_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_212523444(a1, a2, a3, a4, 21071, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t OUTLINED_FUNCTION_85_8(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t *__return_ptr, uint64_t *, uint64_t *), void (*a6)(uint64_t *__return_ptr, uint64_t *, uint64_t), void (*a7)(uint64_t *__return_ptr, uint64_t *, _QWORD *, uint64_t))
{
  return sub_212521AB0(a1, a2, a3, a4, a5, a6, a7, (void (*)(uint64_t *, uint64_t *, uint64_t))a5);
}

uint64_t OUTLINED_FUNCTION_86_8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_87_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_212522D0C(a1, a2, a3, a4, a5, a6, 0xE200000000000000);
}

uint64_t OUTLINED_FUNCTION_88_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_212522C24(a1, a2, a3, a4, a5, a6, 0xE200000000000000);
}

void OUTLINED_FUNCTION_89_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _UNKNOWN **a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32)
{
  sub_212523444(a1, a2, a3, a4, 31868, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26,
    a27,
    a28,
    a29,
    a30,
    a31,
    a32);
}

uint64_t OUTLINED_FUNCTION_90_6@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return ExpressionType<>.init(value:)(a1, v2, v3, *(_QWORD *)(v4 - 176), a2);
}

uint64_t OUTLINED_FUNCTION_92_7(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t);

  return v2(a1, a2, 1, 31868, 0xE200000000000000);
}

uint64_t OUTLINED_FUNCTION_96_7()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_97_8(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_100_7()
{
  uint64_t v0;

  return v0 - 120;
}

uint64_t OUTLINED_FUNCTION_105_5()
{
  return sub_212532EA8();
}

void OUTLINED_FUNCTION_107_5(uint64_t a1@<X3>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, uint64_t a5@<X8>)
{
  uint64_t v5;

  *(_QWORD *)(v5 - 200) = a3;
  *(_QWORD *)(v5 - 192) = a4;
  *(_QWORD *)(v5 - 208) = a2;
  *(_QWORD *)(v5 - 176) = a1;
  *(_QWORD *)(v5 - 168) = a5;
}

uint64_t OUTLINED_FUNCTION_109_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v4;

  return v3(a1, a2, v2, v4);
}

void Collation.expression.getter(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v3 = v1[1];
  if (v3)
  {
    if (v3 == 1)
    {
      v4 = 0xE600000000000000;
      v5 = 0x455341434F4ELL;
    }
    else if (v3 == 2)
    {
      v4 = 0xE500000000000000;
      v5 = 0x4D49525452;
    }
    else
    {
      v6 = *v1;
      swift_bridgeObjectRetain();
      v5 = sub_212526AF0(34, 0xE100000000000000, v6, v3);
      v4 = v7;
      sub_212519D10(v6, v3);
    }
  }
  else
  {
    v4 = 0xE600000000000000;
    v5 = 0x5952414E4942;
  }
  *a1 = v5;
  a1[1] = v4;
  a1[2] = MEMORY[0x24BEE4AF8];
}

uint64_t Collation.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = v0[1];
  switch(v1)
  {
    case 0:
      return 0x5952414E4942;
    case 1:
      return 0x455341434F4ELL;
    case 2:
      return 0x4D49525452;
  }
  return sub_212526AF0(34, 0xE100000000000000, *v0, v1);
}

uint64_t getEnumTagSinglePayload for Collation(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Collation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Collation()
{
  return &type metadata for Collation;
}

uint64_t sub_212523F50(uint64_t result, uint64_t a2)
{
  int v3;
  unint64_t v4;
  int v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  sqlite3_stmt **v19;
  uint64_t v20;

  v3 = result;
  v4 = HIDWORD(result);
  if (result < 0 != (int)result < 0)
  {
    if ((int)result >= 0)
      v5 = result;
    else
      v5 = -(int)result;
    if (result >= 0)
      v6 = HIDWORD(result);
    else
      v6 = -HIDWORD(result);
    v7 = __CFADD__(v5, v6);
    v8 = (v5 + v6);
    if (v7)
    {
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      return result;
    }
    if ((int)result < 0)
      v9 = v8;
    else
      v9 = -v8;
    if (v9)
    {
LABEL_13:
      v20 = MEMORY[0x24BEE4AF8];
      result = (uint64_t)sub_21250F6F0(0, v9 & ~(v9 >> 63), 0);
      if ((v9 & 0x8000000000000000) == 0)
      {
        v10 = v20;
        v19 = (sqlite3_stmt **)(a2 + 16);
        result = swift_beginAccess();
        v11 = v3;
        while (v9)
        {
          result = (uint64_t)sqlite3_column_name(*v19, v11);
          if (!result)
            goto LABEL_33;
          result = sub_212532BD8();
          v12 = result;
          v14 = v13;
          v16 = *(_QWORD *)(v20 + 16);
          v15 = *(_QWORD *)(v20 + 24);
          if (v16 >= v15 >> 1)
            result = (uint64_t)sub_21250F6F0((char *)(v15 > 1), v16 + 1, 1);
          *(_QWORD *)(v20 + 16) = v16 + 1;
          v17 = v20 + 16 * v16;
          *(_QWORD *)(v17 + 32) = v12;
          *(_QWORD *)(v17 + 40) = v14;
          if ((int)v4 < v3)
            goto LABEL_28;
          if (v11 >= (int)v4)
            goto LABEL_29;
          ++v11;
          if (!--v9)
          {
            swift_release();
            return v10;
          }
        }
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
      }
      __break(1u);
      goto LABEL_31;
    }
  }
  else
  {
    v18 = HIDWORD(result) - result;
    if (__OFSUB__(HIDWORD(result), (_DWORD)result))
      goto LABEL_32;
    v9 = v18;
    if (v18)
      goto LABEL_13;
  }
  swift_release();
  return MEMORY[0x24BEE4AF8];
}

Swift::OpaquePointer_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Statement.failableNext()()
{
  uint64_t v0;
  Swift::Bool v1;
  BOOL v2;
  void *v3;
  uint64_t v4[2];
  Swift::OpaquePointer_optional result;

  OUTLINED_FUNCTION_75();
  v2 = OUTLINED_FUNCTION_19_14();
  v3 = 0;
  if (!v0 && v2)
  {
    Statement.row.getter(v4);
    v3 = (void *)sub_212525E78(v4[0], v4[1]);
  }
  result.value._rawValue = v3;
  result.is_nil = v1;
  return result;
}

void sub_212524150()
{
  uint64_t v0;

  Statement.failableNext()();
  if (v0)
    OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_110_5();
}

void sub_212524180(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  unint64_t v4;
  uint64_t v5;

  v4 = (unint64_t)Statement.failableNext()();
  if (v5)
  {
    OUTLINED_FUNCTION_29();
LABEL_3:
    *a2 = 0;
    a2[1] = 0;
    return;
  }
  if (!v4)
    goto LABEL_3;
  *a2 = a1;
  a2[1] = v4;
  swift_bridgeObjectRetain();
}

uint64_t FailableIterator.next()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

void Statement.columnNames.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (*(_QWORD *)(v0 + 48))
    goto LABEL_6;
  Statement.columnCount.getter();
  if (v1 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v1 > 0x7FFFFFFF)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((v1 & 0x80000000) == 0)
  {
    v2 = v1 << 32;
    OUTLINED_FUNCTION_75();
    *(_QWORD *)(v0 + 48) = sub_212523F50(v2, v0);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
LABEL_6:
    swift_bridgeObjectRetain();
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t Statement.bind(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return OUTLINED_FUNCTION_75();
  sub_212524C28(1);
  OUTLINED_FUNCTION_65_1();
  if (v2 == sqlite3_bind_parameter_count(*(sqlite3_stmt **)(v1 + 16)))
  {
    v4 = 0;
    v5 = a1 + 32;
    do
    {
      sub_212524C80(v5, ++v4);
      v5 += 40;
    }
    while (v2 != v4);
    return OUTLINED_FUNCTION_75();
  }
  sub_212532F98();
  sqlite3_bind_parameter_count(*(sqlite3_stmt **)(v1 + 16));
  sub_212533100();
  swift_bridgeObjectRelease();
  sub_212532BCC();
  sub_212533100();
  sub_212532BCC();
  swift_bridgeObjectRelease();
  sub_212532BCC();
  result = OUTLINED_FUNCTION_2_18();
  __break(1u);
  return result;
}

{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  sqlite3_stmt *v15;
  uint64_t v16;
  int v17;
  uint64_t result;
  uint64_t v19;
  int64_t v20;
  __int128 v21;
  _OWORD v22[2];
  uint64_t v23;
  _QWORD v24[2];
  uint64_t v25;

  sub_212524C28(1);
  v19 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_65_1();
  v6 = 0;
  v20 = (unint64_t)(v3 + 63) >> 6;
  if (!v5)
    goto LABEL_6;
LABEL_4:
  v7 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v8 = v7 | (v6 << 6);
LABEL_5:
  v9 = *(_QWORD *)(a1 + 56);
  v10 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v8);
  v11 = v10[1];
  *(_QWORD *)&v21 = *v10;
  *((_QWORD *)&v21 + 1) = v11;
  sub_212521088(v9 + 40 * v8, (uint64_t)v22);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_212526064((uint64_t)&v21, (uint64_t)v24, &qword_254B4DD78);
    if (!v24[1])
    {
      swift_release();
      return OUTLINED_FUNCTION_75();
    }
    sub_212526064((uint64_t)&v25, (uint64_t)&v21, &qword_253EFD408);
    v15 = *(sqlite3_stmt **)(v1 + 16);
    v16 = sub_212532B54();
    v17 = sqlite3_bind_parameter_index(v15, (const char *)(v16 + 32));
    swift_release();
    if (v17 < 1)
      goto LABEL_31;
    swift_bridgeObjectRelease();
    sub_212524C80((uint64_t)&v21, v17);
    sub_2124C2750((uint64_t)&v21, &qword_253EFD408);
    if (v5)
      goto LABEL_4;
LABEL_6:
    v12 = v6 + 1;
    if (__OFADD__(v6, 1))
      break;
    if (v12 < v20)
    {
      v13 = *(_QWORD *)(v19 + 8 * v12);
      if (v13)
        goto LABEL_9;
      v14 = v6 + 2;
      ++v6;
      if (v12 + 1 < v20)
      {
        v13 = *(_QWORD *)(v19 + 8 * v14);
        if (v13)
          goto LABEL_12;
        v6 = v12 + 1;
        if (v12 + 2 < v20)
        {
          v13 = *(_QWORD *)(v19 + 8 * (v12 + 2));
          if (v13)
          {
            v12 += 2;
            goto LABEL_9;
          }
          v14 = v12 + 3;
          v6 = v12 + 2;
          if (v12 + 3 < v20)
          {
            v13 = *(_QWORD *)(v19 + 8 * v14);
            if (!v13)
            {
              while (1)
              {
                v12 = v14 + 1;
                if (__OFADD__(v14, 1))
                  goto LABEL_30;
                if (v12 >= v20)
                {
                  v6 = v20 - 1;
                  goto LABEL_23;
                }
                v13 = *(_QWORD *)(v19 + 8 * v12);
                ++v14;
                if (v13)
                  goto LABEL_9;
              }
            }
LABEL_12:
            v12 = v14;
LABEL_9:
            v5 = (v13 - 1) & v13;
            v8 = __clz(__rbit64(v13)) + (v12 << 6);
            v6 = v12;
            goto LABEL_5;
          }
        }
      }
    }
LABEL_23:
    v5 = 0;
    v23 = 0;
    memset(v22, 0, sizeof(v22));
    v21 = 0u;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  sub_212532F98();
  swift_bridgeObjectRelease();
  sub_212532BCC();
  result = OUTLINED_FUNCTION_2_18();
  __break(1u);
  return result;
}

uint64_t Statement.run(_:)(uint64_t a1)
{
  uint64_t v1;

  Statement.bind(_:)(a1);
  v1 = OUTLINED_FUNCTION_18_11();
  OUTLINED_FUNCTION_14_0();
  return v1;
}

{
  uint64_t v1;

  Statement.bind(_:)(a1);
  v1 = OUTLINED_FUNCTION_18_11();
  OUTLINED_FUNCTION_14_0();
  return v1;
}

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
  unsigned int v10;
  id v11;
  uint64_t v13;
  char v14;
  char v15;

  v3 = v2;
  v4 = v1;
  if (*(_QWORD *)(a1 + 16))
  {
    Statement.bind(_:)(a1);
    v5 = OUTLINED_FUNCTION_18_11();
    OUTLINED_FUNCTION_7_14();
    if (!v2)
      return v5;
  }
  else
  {
    sub_212524C28(0);
    sub_2124D1A58();
    v6 = *(_QWORD *)(v1 + 24);
    OUTLINED_FUNCTION_0_0();
    do
    {
      while (1)
      {
        v7 = qword_253EFD1D8;
        sub_212532140();
        if (v7 != -1)
          swift_once();
        sub_212532DD0();
        v8 = sub_21251E0B8();
        if ((v14 & 1) != 0 || v13 != v8)
          break;
        v9 = sqlite3_step(*(sqlite3_stmt **)(v4 + 16));
        v10 = sub_21251DFD4(v9, 0);
        OUTLINED_FUNCTION_7_14();
        if (v3)
          return v4;
        if (v10 != 100)
          goto LABEL_16;
      }
      v11 = *(id *)(v6 + 88);
      sub_212532E00();
      OUTLINED_FUNCTION_7_14();

      if (v3)
        return v4;
    }
    while ((v15 & 1) != 0);
LABEL_16:
    sub_212532140();
  }
  return v4;
}

uint64_t Statement.scalar(_:)(uint64_t a1)
{
  Statement.bind(_:)(a1);
  OUTLINED_FUNCTION_10_17(MEMORY[0x24BEE4AF8]);
  return OUTLINED_FUNCTION_14_0();
}

{
  Statement.bind(_:)(a1);
  OUTLINED_FUNCTION_10_17(MEMORY[0x24BEE4AF8]);
  return OUTLINED_FUNCTION_14_0();
}

uint64_t sub_21252488C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  sqlite3 *v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v1 + 16) = 0;
  *(_BYTE *)(v1 + 40) = 1;
  *(_QWORD *)(v1 + 56) = 0;
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)(v1 + 48) = 0;
  *(_QWORD *)(v1 + 24) = a1;
  *(_QWORD *)(v1 + 32) = 0;
  v3 = (sqlite3 *)Connection.handle.getter();
  v4 = sub_212532B54();
  OUTLINED_FUNCTION_75();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_0();
  v5 = sqlite3_prepare_v2(v3, (const char *)(v4 + 32), -1, (sqlite3_stmt **)(v1 + 16), 0);
  swift_endAccess();
  swift_release();
  OUTLINED_FUNCTION_14_18(v5);
  if (v2)
    swift_release();
  OUTLINED_FUNCTION_14_0();
  return v1;
}

void Statement.deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_15();
  sqlite3_finalize(*(sqlite3_stmt **)(v0 + 16));
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_110_5();
}

uint64_t Statement.__deallocating_deinit()
{
  Statement.deinit();
  return swift_deallocClassInstance();
}

void Statement.columnCount.getter()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 40) == 1)
  {
    OUTLINED_FUNCTION_0_15();
    *(_QWORD *)(v0 + 32) = sqlite3_column_count(*(sqlite3_stmt **)(v0 + 16));
    *(_BYTE *)(v0 + 40) = 0;
  }
  OUTLINED_FUNCTION_110_5();
}

uint64_t Statement.columnCount.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  *(_BYTE *)(v1 + 40) = 0;
  return result;
}

void Statement.columnCount.modify(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  a1[1] = v1;
  Statement.columnCount.getter();
  *a1 = v3;
  OUTLINED_FUNCTION_1();
}

_QWORD *sub_212524A4C(_QWORD *result)
{
  uint64_t v1;

  v1 = result[1];
  *(_QWORD *)(v1 + 32) = *result;
  *(_BYTE *)(v1 + 40) = 0;
  return result;
}

uint64_t sub_212524A5C()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return Statement.columnNames.setter(v0);
}

uint64_t Statement.columnNames.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 48) = a1;
  return swift_bridgeObjectRelease();
}

void Statement.columnNames.modify(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  a1[1] = v1;
  Statement.columnNames.getter();
  *a1 = v3;
  OUTLINED_FUNCTION_1();
}

void sub_212524AC4(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) != 0)
  {
    v2 = swift_bridgeObjectRetain();
    Statement.columnNames.setter(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    Statement.columnNames.setter(*a1);
    OUTLINED_FUNCTION_1();
  }
}

void Statement.row.getter(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1[7];
  if (v3)
  {
    v4 = v1[8];
LABEL_5:
    *a1 = v3;
    a1[1] = v4;
    return;
  }
  OUTLINED_FUNCTION_0_15();
  v3 = v1[2];
  if (v3)
  {
    OUTLINED_FUNCTION_75();
    Statement.columnCount.getter();
    v4 = v5;
    swift_release();
    v1[7] = v3;
    v1[8] = v4;
    goto LABEL_5;
  }
  __break(1u);
}

void sub_212524B6C(_QWORD *a1@<X8>)
{
  uint64_t v2;
  _QWORD v3[2];

  Statement.row.getter(v3);
  v2 = v3[1];
  *a1 = v3[0];
  a1[1] = v2;
}

_QWORD *sub_212524BA4(_QWORD *a1)
{
  uint64_t v1;
  _QWORD v3[2];

  v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  return Statement.row.setter(v3);
}

_QWORD *Statement.row.setter(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = result[1];
  *(_QWORD *)(v1 + 56) = *result;
  *(_QWORD *)(v1 + 64) = v2;
  return result;
}

void Statement.row.modify(_QWORD *a1)
{
  uint64_t v1;

  a1[2] = v1;
  Statement.row.getter(a1);
  OUTLINED_FUNCTION_1();
}

_QWORD *sub_212524C14(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = result[1];
  v1 = result[2];
  *(_QWORD *)(v1 + 56) = *result;
  *(_QWORD *)(v1 + 64) = v2;
  return result;
}

uint64_t sub_212524C28(char a1)
{
  uint64_t v1;
  uint64_t result;

  swift_beginAccess();
  result = sqlite3_reset(*(sqlite3_stmt **)(v1 + 16));
  if ((a1 & 1) != 0)
    return sqlite3_clear_bindings(*(sqlite3_stmt **)(v1 + 16));
  return result;
}

uint64_t sub_212524C80(uint64_t a1, uint64_t a2)
{
  sqlite3_stmt **v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  void (__cdecl *v8)(void *);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;
  _UNKNOWN **v17;

  if (!*(_QWORD *)(a1 + 24))
  {
    swift_beginAccess();
    if (a2 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else if (a2 <= 0x7FFFFFFF)
    {
      return sqlite3_bind_null(v2[2], a2);
    }
    __break(1u);
    goto LABEL_46;
  }
  sub_212521088(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v3 = v13;
      swift_beginAccess();
      if (a2 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a2 <= 0x7FFFFFFF)
        {
          v4 = *(_QWORD *)(v13 + 16);
          if (!(v4 >> 31))
          {
            v2 = (sqlite3_stmt **)v2[2];
            if (qword_253EFB798 == -1)
            {
LABEL_8:
              sqlite3_bind_blob((sqlite3_stmt *)v2, a2, (const void *)(v3 + 32), v4, (void (__cdecl *)(void *))qword_253EFE2A8);
              return swift_bridgeObjectRelease();
            }
LABEL_49:
            swift_once();
            goto LABEL_8;
          }
LABEL_48:
          __break(1u);
          goto LABEL_49;
        }
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
LABEL_46:
      __break(1u);
      goto LABEL_47;
    }
  }
  else
  {
    sub_2124C2750((uint64_t)v15, &qword_253EFD408);
  }
  sub_212521088(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_beginAccess();
      if (a2 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
      }
      else if (a2 <= 0x7FFFFFFF)
      {
        return sqlite3_bind_double(v2[2], a2, *(double *)&v13);
      }
      __break(1u);
      goto LABEL_52;
    }
  }
  else
  {
    sub_2124C2750((uint64_t)v15, &qword_253EFD408);
  }
  sub_212521088(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_beginAccess();
      if (a2 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a2 <= 0x7FFFFFFF)
          return sqlite3_bind_int64(v2[2], a2, v13);
        goto LABEL_53;
      }
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
  }
  else
  {
    sub_2124C2750((uint64_t)v15, &qword_253EFD408);
  }
  sub_212521088(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_beginAccess();
      if (a2 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (a2 <= 0x7FFFFFFF)
        {
          v2 = (sqlite3_stmt **)v2[2];
          if (qword_253EFB798 == -1)
          {
LABEL_30:
            v8 = (void (__cdecl *)(void *))qword_253EFE2A8;
            v9 = sub_212532B54();
            swift_bridgeObjectRelease();
            sqlite3_bind_text((sqlite3_stmt *)v2, a2, (const char *)(v9 + 32), -1, v8);
            return swift_release();
          }
LABEL_56:
          swift_once();
          goto LABEL_30;
        }
LABEL_55:
        __break(1u);
        goto LABEL_56;
      }
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
  }
  else
  {
    sub_2124C2750((uint64_t)v15, &qword_253EFD408);
  }
  v10 = MEMORY[0x24BEE4008];
  sub_212521088(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v11 = v13;
LABEL_39:
      v16 = v10;
      v17 = &protocol witness table for Int64;
      v15[0] = v11;
      sub_212524C80(v15, a2);
      v12 = (__int128 *)v15;
      return sub_2124C2750((uint64_t)v12, &qword_253EFD408);
    }
  }
  else
  {
    sub_2124C2750((uint64_t)v15, &qword_253EFD408);
  }
  sub_212521088(a1, (uint64_t)v15);
  if (v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v11 = v13;
      goto LABEL_39;
    }
  }
  else
  {
    sub_2124C2750((uint64_t)v15, &qword_253EFD408);
  }
  sub_212521088(a1, (uint64_t)&v13);
  if (!v14)
  {
    v12 = &v13;
    return sub_2124C2750((uint64_t)v12, &qword_253EFD408);
  }
  sub_21249F9E0(&v13, (uint64_t)v15);
  *(_QWORD *)&v13 = 0;
  *((_QWORD *)&v13 + 1) = 0xE000000000000000;
  sub_212532F98();
  sub_212532BCC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
  sub_21253301C();
  result = sub_21253307C();
  __break(1u);
  return result;
}

Swift::Bool __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Statement.step()()
{
  OUTLINED_FUNCTION_75();
  return OUTLINED_FUNCTION_19_14();
}

void Statement.scalar(_:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v4 = v3;
  if (*(_QWORD *)(a1 + 16))
  {
    Statement.bind(_:)(a1);
    Statement.scalar(_:)(MEMORY[0x24BEE4AF8]);
    OUTLINED_FUNCTION_14_0();
  }
  else
  {
    sub_212524C28(0);
    v6 = *(_QWORD *)(v2 + 24);
    OUTLINED_FUNCTION_75();
    sub_21251C96C(v6, v2);
    if (!v4)
    {
      Statement.row.getter(&v7);
      Cursor.subscript.getter(0, a2);
    }
  }
}

void Cursor.subscript.getter(uint64_t iCol@<X0>, uint64_t a2@<X8>)
{
  sqlite3_stmt **v2;
  int v4;
  sqlite3_stmt *v5;
  sqlite3_stmt *v6;
  int v7;
  sqlite3_int64 v8;
  sqlite3_stmt *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  sqlite3_stmt *v13;
  int v14;
  int v15;
  sqlite3_stmt *v16;
  int v17;
  double v18;

  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  v4 = iCol;
  if (iCol > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    sub_212532F98();
    swift_bridgeObjectRelease();
    sub_212533100();
    sub_212532BCC();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_18();
    __break(1u);
    JUMPOUT(0x21252561CLL);
  }
  v5 = *v2;
  switch(sqlite3_column_type(*v2, iCol))
  {
    case 1:
      v6 = (sqlite3_stmt *)OUTLINED_FUNCTION_16_14();
      v8 = sqlite3_column_int64(v6, v7);
      *(_QWORD *)(a2 + 24) = MEMORY[0x24BEE4008];
      *(_QWORD *)(a2 + 32) = &protocol witness table for Int64;
      goto LABEL_10;
    case 2:
      v16 = (sqlite3_stmt *)OUTLINED_FUNCTION_16_14();
      v18 = sqlite3_column_double(v16, v17);
      *(_QWORD *)(a2 + 24) = MEMORY[0x24BEE13C8];
      *(_QWORD *)(a2 + 32) = &protocol witness table for Double;
      *(double *)a2 = v18;
      return;
    case 3:
      v9 = (sqlite3_stmt *)OUTLINED_FUNCTION_16_14();
      if (!sqlite3_column_text(v9, v10))
        goto LABEL_16;
      v11 = sub_212532BE4();
      *(_QWORD *)(a2 + 24) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(a2 + 32) = &protocol witness table for String;
      *(_QWORD *)a2 = v11;
      *(_QWORD *)(a2 + 8) = v12;
      break;
    case 4:
      *(_QWORD *)(a2 + 24) = &type metadata for Blob;
      *(_QWORD *)(a2 + 32) = &protocol witness table for Blob;
      if (sqlite3_column_blob(v5, v4))
      {
        v13 = (sqlite3_stmt *)OUTLINED_FUNCTION_16_14();
        v15 = sqlite3_column_bytes(v13, v14);
        v8 = (sqlite3_int64)OUTLINED_FUNCTION_11_16(v15);
LABEL_10:
        *(_QWORD *)a2 = v8;
      }
      else
      {
        *(_QWORD *)a2 = MEMORY[0x24BEE4AF8];
      }
      break;
    case 5:
      *(_QWORD *)(a2 + 32) = 0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      return;
    default:
      goto LABEL_17;
  }
}

const char *sub_212525630@<X0>(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  const char *result;

  OUTLINED_FUNCTION_0_0();
  v5 = sqlite3_step(*(sqlite3_stmt **)(a1 + 16));
  result = OUTLINED_FUNCTION_14_18(v5);
  if (!v2)
    *a2 = (_DWORD)result == 100;
  return result;
}

uint64_t Statement.makeIterator()()
{
  sub_212524C28(0);
  return sub_212532140();
}

uint64_t sub_2125256B0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  Statement.makeIterator()();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2125256E0()
{
  return sub_212525700();
}

uint64_t sub_212525700()
{
  return 0;
}

uint64_t sub_212525708()
{
  return sub_212525728();
}

uint64_t sub_212525728()
{
  uint64_t v0;

  v0 = sub_212525CF8();
  swift_release();
  return v0;
}

uint64_t sub_21252575C()
{
  return sub_212525780();
}

uint64_t sub_212525784()
{
  return sub_212532C68();
}

uint64_t Array.init<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v8 = sub_212532EA8();
  v22 = *(_QWORD *)(v8 - 8);
  v23 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v21 - v10;
  v12 = *(_QWORD *)(a2 - 8);
  v13 = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v21 - v16;
  v24 = sub_212532A4C();
  v27 = v24;
  v18 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
  v19 = v25;
  v25 = a4;
  v26 = a1;
  v18(a3, a4);
  if (v19)
  {
    OUTLINED_FUNCTION_6_11();
    return swift_bridgeObjectRelease();
  }
  else
  {
    while (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, a2) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v11, a2);
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, a2);
      sub_212532CF8();
      sub_212532CEC();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v17, a2);
      v18(a3, v25);
    }
    OUTLINED_FUNCTION_6_11();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v23);
    return v27;
  }
}

unint64_t sub_212525968@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  uint64_t v3;

  result = (unint64_t)Statement.failableNext()();
  if (!v3)
    *a1 = result;
  return result;
}

void sub_212525994(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_212524150();
  *a1 = v2;
}

const char *Statement.description.getter()
{
  uint64_t v0;
  const char *result;

  OUTLINED_FUNCTION_0_15();
  result = sqlite3_sql(*(sqlite3_stmt **)(v0 + 16));
  if (result)
    return (const char *)sub_212532BD8();
  __break(1u);
  return result;
}

void sub_2125259EC()
{
  Statement.description.getter();
  OUTLINED_FUNCTION_1();
}

double Cursor.subscript.getter(uint64_t iCol)
{
  sqlite3_stmt **v1;
  double result;

  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (iCol <= 0x7FFFFFFF)
  {
    return sqlite3_column_double(*v1, iCol);
  }
  __break(1u);
  return result;
}

sqlite3_int64 Cursor.subscript.getter(sqlite3_int64 result)
{
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    return OUTLINED_FUNCTION_5_10(result, result);
  }
  __break(1u);
  return result;
}

{
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (result <= 0x7FFFFFFF)
  {
    return OUTLINED_FUNCTION_5_10(result, result);
  }
  __break(1u);
  return result;
}

uint64_t Cursor.subscript.getter(uint64_t iCol)
{
  sqlite3_stmt **v1;

  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (iCol > 0x7FFFFFFF)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  iCol = (uint64_t)sqlite3_column_text(*v1, iCol);
  if (iCol)
    return sub_212532BE4();
LABEL_7:
  __break(1u);
  return iCol;
}

uint64_t Cursor.subscript.getter@<X0>(uint64_t iCol@<X0>, _QWORD *a2@<X8>)
{
  sqlite3_stmt **v2;
  int v4;
  sqlite3_stmt *v5;
  int v6;

  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_8;
  }
  v4 = iCol;
  if (iCol > 0x7FFFFFFF)
  {
LABEL_8:
    __break(1u);
    return iCol;
  }
  v5 = *v2;
  if (sqlite3_column_blob(v5, iCol))
  {
    v6 = sqlite3_column_bytes(v5, v4);
    iCol = (uint64_t)OUTLINED_FUNCTION_11_16(v6);
  }
  else
  {
    iCol = MEMORY[0x24BEE4AF8];
  }
  *a2 = iCol;
  return iCol;
}

BOOL Cursor.subscript.getter(_BOOL8 iCol)
{
  sqlite3_stmt **v1;

  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (iCol <= 0x7FFFFFFF)
  {
    return sqlite3_column_int64(*v1, iCol) != 0;
  }
  __break(1u);
  return iCol;
}

uint64_t Cursor.makeIterator()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v1 = *v0;
  v2 = v0[1];
  v3 = OUTLINED_FUNCTION_77_0();
  *(_QWORD *)(v3 + 16) = 0;
  v4 = (_QWORD *)OUTLINED_FUNCTION_77_0();
  v4[2] = v3;
  v4[3] = v1;
  v4[4] = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB880);
  result = OUTLINED_FUNCTION_77_0();
  *(_QWORD *)(result + 16) = sub_2125260B8;
  *(_QWORD *)(result + 24) = v4;
  return result;
}

void sub_212525C04(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t *v6;
  uint64_t v7;

  v6 = (uint64_t *)(a1 + 16);
  swift_beginAccess();
  if (*(_QWORD *)(a1 + 16) >= a2)
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_OWORD *)(a3 + 24) = xmmword_2125377A0;
  }
  else
  {
    swift_beginAccess();
    v7 = *v6 + 1;
    if (__OFADD__(*v6, 1))
    {
      __break(1u);
    }
    else
    {
      *v6 = v7;
      Cursor.subscript.getter(v7 - 1, a3);
    }
  }
}

uint64_t sub_212525CBC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = Cursor.makeIterator()();
  *a1 = result;
  return result;
}

uint64_t sub_212525CE0()
{
  return sub_212525700();
}

uint64_t sub_212525CE8()
{
  _QWORD *v0;

  return sub_212525758(*v0, v0[1]);
}

uint64_t sub_212525CF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  return sub_21252577C(a1, a2, a3, *v3, v3[1]);
}

uint64_t sub_212525CF8()
{
  uint64_t result;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;

  sub_212532140();
  sub_212524C28(0);
  result = (unint64_t)Statement.failableNext()();
  v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v3 = 0;
LABEL_21:

  }
  else
  {
    v4 = result;
    v3 = 0;
    v5 = (uint64_t *)(MEMORY[0x24BEE4AF8] + 32);
    while (v4)
    {
      if (!v3)
      {
        v6 = v2[3];
        if ((uint64_t)((v6 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_27;
        v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
        if (v7 <= 1)
          v8 = 1;
        else
          v8 = v7;
        __swift_instantiateConcreteTypeFromMangledName(qword_254B4DD98);
        v9 = (_QWORD *)swift_allocObject();
        v10 = (uint64_t)(_swift_stdlib_malloc_size(v9) - 32) / 8;
        v9[2] = v8;
        v9[3] = 2 * v10;
        v11 = (unint64_t)(v9 + 4);
        v12 = v2[3];
        v13 = v12 >> 1;
        if (v2[2])
        {
          if (v9 != v2 || v11 >= (unint64_t)&v2[v13 + 4])
            memmove(v9 + 4, v2 + 4, 8 * v13);
          v2[2] = 0;
        }
        v5 = (uint64_t *)(v11 + 8 * v13);
        v3 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - (v12 >> 1);
        result = swift_release();
        v2 = v9;
      }
      v15 = __OFSUB__(v3--, 1);
      if (v15)
      {
        __break(1u);
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }
      *v5++ = v4;
      result = (unint64_t)Statement.failableNext()();
      v4 = result;
      if (v1)
        goto LABEL_21;
    }
  }
  swift_release();
  result = swift_bridgeObjectRelease();
  v16 = v2[3];
  if (v16 < 2)
    return (uint64_t)v2;
  v17 = v16 >> 1;
  v15 = __OFSUB__(v17, v3);
  v18 = v17 - v3;
  if (!v15)
  {
    v2[2] = v18;
    return (uint64_t)v2;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_212525E78(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _BYTE v23[40];
  _BYTE v24[40];

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  v4 = (uint64_t *)(v3 + 16);
  sub_212532140();
  swift_beginAccess();
  v5 = *v4;
  v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (*v4 < a2)
  {
    v7 = 0;
    v8 = MEMORY[0x24BEE4AF8] + 32;
    while (1)
    {
      *v4 = v5 + 1;
      Cursor.subscript.getter(v5, (uint64_t)v23);
      result = sub_212526064((uint64_t)v23, (uint64_t)v24, &qword_253EFD408);
      if (!v7)
      {
        v10 = v6[3];
        if ((uint64_t)((v10 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_26;
        v11 = v10 & 0xFFFFFFFFFFFFFFFELL;
        if (v11 <= 1)
          v12 = 1;
        else
          v12 = v11;
        __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB898);
        v13 = (_QWORD *)swift_allocObject();
        v14 = (uint64_t)(_swift_stdlib_malloc_size(v13) - 32) / 40;
        v13[2] = v12;
        v13[3] = 2 * v14;
        v15 = (unint64_t)(v13 + 4);
        v16 = v6[3];
        v17 = v16 >> 1;
        if (v6[2])
        {
          if (v13 != v6 || v15 >= (unint64_t)&v6[5 * v17 + 4])
            memmove(v13 + 4, v6 + 4, 40 * v17);
          v6[2] = 0;
        }
        v8 = v15 + 40 * v17;
        v7 = (v14 & 0x7FFFFFFFFFFFFFFFLL) - (v16 >> 1);
        result = swift_release();
        v6 = v13;
      }
      v19 = __OFSUB__(v7--, 1);
      if (v19)
        break;
      sub_212526064((uint64_t)v24, v8, &qword_253EFD408);
      v8 += 40;
      v5 = *v4;
      if (*v4 >= a2)
        goto LABEL_21;
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v7 = 0;
LABEL_21:
  result = swift_release_n();
  v20 = v6[3];
  if (v20 < 2)
    return (uint64_t)v6;
  v21 = v20 >> 1;
  v19 = __OFSUB__(v21, v7);
  v22 = v21 - v7;
  if (!v19)
  {
    v6[2] = v22;
    return (uint64_t)v6;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_212526064(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2125260A8()
{
  return swift_deallocObject();
}

void sub_2125260B8(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_212525C04(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 32), a1);
}

unint64_t sub_2125260C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B4DD80;
  if (!qword_254B4DD80)
  {
    v1 = type metadata accessor for Statement();
    result = MEMORY[0x212BED510](&protocol conformance descriptor for Statement, v1);
    atomic_store(result, (unint64_t *)&qword_254B4DD80);
  }
  return result;
}

uint64_t type metadata accessor for Statement()
{
  return objc_opt_self();
}

unint64_t sub_212526124(uint64_t a1)
{
  unint64_t result;

  result = sub_2125260C8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_21252614C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B4DD88;
  if (!qword_254B4DD88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B4DD90);
    result = MEMORY[0x212BED510](MEMORY[0x24BEE2420], v1);
    atomic_store(result, (unint64_t *)&qword_254B4DD88);
  }
  return result;
}

void sub_212526190(_QWORD *a1@<X8>)
{
  uint64_t v2;

  Statement.columnCount.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_1();
}

void sub_2125261B4(uint64_t *a1)
{
  Statement.columnCount.setter(*a1);
  OUTLINED_FUNCTION_1();
}

void sub_2125261D4(_QWORD *a1@<X8>)
{
  uint64_t v2;

  Statement.columnNames.getter();
  *a1 = v2;
  OUTLINED_FUNCTION_1();
}

uint64_t method lookup function for Statement()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FailableIterator.failableNext()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t getEnumTagSinglePayload for Cursor(uint64_t a1, int a2)
{
  int v2;

  if (a2)
  {
    if (a2 == 1 || !*(_BYTE *)(a1 + 16))
    {
      if (*(_QWORD *)a1)
        v2 = -1;
      else
        v2 = 0;
    }
    else
    {
      v2 = *(_DWORD *)a1 + 1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Cursor(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for Cursor()
{
  return &type metadata for Cursor;
}

uint64_t sub_2125262B0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];
  uint64_t v16;
  _BYTE v17[40];

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v10;
  v11[3] = a4;
  v11[4] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFB880);
  result = swift_allocObject();
  v13 = result;
  v14 = 0;
  *(_QWORD *)(result + 16) = sub_2125266D0;
  *(_QWORD *)(result + 24) = v11;
  if (!a2 || !a3)
  {
LABEL_11:
    *a1 = v13;
    return v14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    sub_2125260B8((uint64_t)v15);
    if (v16 == 1)
    {
      v14 = 0;
LABEL_9:
      sub_2124C2750((uint64_t)v15, &qword_253EFB7A0);
    }
    else
    {
      v14 = 0;
      while (1)
      {
        sub_212526064((uint64_t)v15, (uint64_t)v17, &qword_253EFD408);
        sub_212526064((uint64_t)v17, a2, &qword_253EFD408);
        if (a3 - 1 == v14)
          break;
        a2 += 40;
        sub_2125260B8((uint64_t)v15);
        ++v14;
        if (v16 == 1)
          goto LABEL_9;
      }
      v14 = a3;
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_212526404()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_212526428(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  void *v10;

  result = sub_212524C28(0);
  v8 = 0;
  if (!a2 || !a3)
  {
LABEL_6:
    *a1 = v3;
    return v8;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v9 = (unint64_t)Statement.failableNext()();
    v8 = 0;
    if (v10)
    {
LABEL_5:

    }
    else
    {
      while (v9)
      {
        *(_QWORD *)(a2 + 8 * v8) = v9;
        if (a3 - 1 == v8)
        {
          v8 = a3;
          goto LABEL_6;
        }
        v9 = (unint64_t)Statement.failableNext()();
        ++v8;
        if (v10)
          goto LABEL_5;
      }
    }
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t sub_2125264D4(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

uint64_t OUTLINED_FUNCTION_0_15()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_18()
{
  return sub_21253307C();
}

sqlite3_int64 OUTLINED_FUNCTION_5_10(uint64_t a1, int a2)
{
  sqlite3_stmt **v2;

  return sqlite3_column_int64(*v2, a2);
}

uint64_t OUTLINED_FUNCTION_6_11()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(*(_QWORD *)(v1 - 88), v0);
}

uint64_t OUTLINED_FUNCTION_7_14()
{
  return swift_release();
}

void OUTLINED_FUNCTION_10_17(uint64_t a1)
{
  uint64_t v1;

  Statement.scalar(_:)(a1, v1);
}

_QWORD *OUTLINED_FUNCTION_11_16(int a1)
{
  const void *v1;

  return sub_21251B390(v1, a1);
}

const char *OUTLINED_FUNCTION_14_18(uint64_t a1)
{
  return sub_21251DFD4(a1, 0);
}

uint64_t OUTLINED_FUNCTION_16_14()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_18_11()
{
  return Statement.run(_:)();
}

BOOL OUTLINED_FUNCTION_19_14()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21251C96C(v0, v1);
}

void * infix(_:_:)(_QWORD *a1@<X8>)
{
  *a1 = 42;
  a1[1] = 0xE100000000000000;
  a1[2] = MEMORY[0x24BEE4AF8];
}

void sub_212526788(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[3];

  v2 = a2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = (_QWORD *)(a1 + 32);
    swift_bridgeObjectRetain();
    v5 = MEMORY[0x24BEE4AF8];
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v7 = v4[3];
      v8 = v4[4];
      __swift_project_boxed_opaque_existential_1(v4, v7);
      (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v8 + 8))(v30, v7, v8);
      v10 = v30[0];
      v9 = v30[1];
      v11 = v30[2];
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_21_3(0, *(_QWORD *)(v5 + 16) + 1);
        v5 = v24;
      }
      v13 = *(_QWORD *)(v5 + 16);
      v12 = *(_QWORD *)(v5 + 24);
      if (v13 >= v12 >> 1)
      {
        OUTLINED_FUNCTION_21_3(v12 > 1, v13 + 1);
        v5 = v25;
      }
      *(_QWORD *)(v5 + 16) = v13 + 1;
      v14 = v5 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v10;
      *(_QWORD *)(v14 + 40) = v9;
      v15 = *(_QWORD *)(v11 + 16);
      v16 = v6[2];
      v17 = v16 + v15;
      if (__OFADD__(v16, v15))
        break;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v17 > v6[3] >> 1)
      {
        if (v16 <= v17)
          v19 = v16 + v15;
        else
          v19 = v16;
        sub_21250EF80(isUniquelyReferenced_nonNull_native, v19, 1, v6);
        v6 = v20;
      }
      if (*(_QWORD *)(v11 + 16))
      {
        if ((v6[3] >> 1) - v6[2] < v15)
          goto LABEL_26;
        __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD408);
        swift_arrayInitWithCopy();
        if (v15)
        {
          v21 = v6[2];
          v22 = __OFADD__(v21, v15);
          v23 = v21 + v15;
          if (v22)
            goto LABEL_27;
          v6[2] = v23;
        }
      }
      else if (v15)
      {
        goto LABEL_25;
      }
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v4 += 5;
      if (!--v3)
      {
        swift_bridgeObjectRelease();
        v2 = a2;
        goto LABEL_23;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
  }
  else
  {
    v5 = MEMORY[0x24BEE4AF8];
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_23:
    v30[0] = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD4D0);
    sub_212527130((unint64_t *)&qword_253EFD4D8, &qword_253EFD4D0, MEMORY[0x24BEE12B0]);
    v26 = sub_212532AAC();
    v28 = v27;
    swift_bridgeObjectRelease();
    v2[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD350);
    v2[4] = (uint64_t)&protocol witness table for Expression<A>;
    *v2 = v26;
    v2[1] = v28;
    v2[2] = (uint64_t)v6;
  }
}

uint64_t sub_212526A0C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;

  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_73_7();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  OUTLINED_FUNCTION_7_15();
  swift_bridgeObjectRelease();
  sub_212532BCC();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_73_7();
  OUTLINED_FUNCTION_7_15();
  swift_bridgeObjectRelease();
  return Expression.init(_:_:)(a2, a3, v7, a4);
}

uint64_t sub_212526AF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_bridgeObjectRetain();
  sub_21250A990(0, 0xE000000000000000, a3, a4, a1, a2);
  OUTLINED_FUNCTION_0_16();
  sub_212532BCC();
  OUTLINED_FUNCTION_149_0();
  OUTLINED_FUNCTION_0_16();
  return 0;
}

void sub_212526BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE v5[24];
  uint64_t v6;

  sub_212521088(a1, (uint64_t)v5);
  if (v6)
  {
    sub_212526DE0((uint64_t)v5, a2, a3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
    OUTLINED_FUNCTION_121_4();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_212526BF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X5>, uint64_t *a6@<X8>)
{
  char v6;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  _UNKNOWN **v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _UNKNOWN **v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v6 = a3;
  v10 = type metadata accessor for Expression(0, a5, a3, a4);
  v24 = 32;
  v25 = 0xE100000000000000;
  sub_212532BCC();
  OUTLINED_FUNCTION_73_7();
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD560);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212534EA0;
  sub_21249F954(a1, inited + 32);
  sub_21249F954(a2, inited + 72);
  sub_212526788(inited, &v24);
  swift_setDeallocating();
  sub_21250F4FC();
  swift_bridgeObjectRelease();
  v12 = v27;
  v13 = v28;
  __swift_project_boxed_opaque_existential_1(&v24, v27);
  ((void (*)(uint64_t *__return_ptr, uint64_t, _UNKNOWN **))v13[1])(&v22, v12, v13);
  v20 = v22;
  v21 = v23;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD350);
  v15 = MEMORY[0x212BED510](&protocol conformance descriptor for Expression<A>, v10);
  v16 = sub_212527130(&qword_254B4DAA0, &qword_253EFD350, (uint64_t)&protocol conformance descriptor for Expression<A>);
  ExpressionType.init<A>(_:)((uint64_t)&v20, v10, v14, v15, v16);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
  v18 = v30;
  v19 = v31;
  if ((v6 & 1) != 0)
  {
    v27 = v10;
    v28 = &protocol witness table for Expression<A>;
    v24 = v29;
    v25 = v30;
    v26 = v31;
    sub_212526A0C(&v24, 0, 0xE000000000000000, a6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)&v24);
  }
  else
  {
    *a6 = v29;
    a6[1] = v18;
    a6[2] = v19;
  }
  return result;
}

uint64_t sub_212526DE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _BYTE v13[40];

  v6 = OUTLINED_FUNCTION_5_11();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v13[-v8 - 8];
  v10 = OUTLINED_FUNCTION_5_11();
  MEMORY[0x24BDAC7A8](v10);
  sub_21249F954(a1, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
  swift_dynamicCast();
  (*(void (**)(char *, uint64_t, uint64_t))(a3 + 48))(v9, a2, a3);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_dynamicCast();
}

void sub_212526F28(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = a2;
  v9 = a3;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_73_7();
  v6 = v8;
  v7 = v9;
  *(_QWORD *)(a4 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD350);
  *(_QWORD *)(a4 + 32) = &protocol witness table for Expression<A>;
  sub_212526788(a1, &v8);
  sub_21250B420(&v8, v6, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v8);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_121_4();
}

uint64_t sub_212526FB8(uint64_t a1)
{
  uint64_t v1;
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _BYTE v8[40];

  sub_212521088(a1, (uint64_t)&v6);
  if (v7)
  {
    sub_21249F9E0(&v6, (uint64_t)v8);
    sub_21249F954((uint64_t)v8, (uint64_t)&v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_253EFD400);
    if (OUTLINED_FUNCTION_2_19())
    {
      v4 = 10104;
      v5 = 0xE200000000000000;
      Blob.toHex()();
      sub_212532BCC();
      OUTLINED_FUNCTION_149_0();
      OUTLINED_FUNCTION_73_7();
      swift_bridgeObjectRelease();
      v1 = 10104;
    }
    else
    {
      if (!OUTLINED_FUNCTION_2_19())
      {
        sub_21249F9E0(&v6, (uint64_t)&v4);
        sub_21253301C();
        v1 = 0;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v4);
        v2 = (__int128 *)v8;
        goto LABEL_9;
      }
      v1 = sub_212526AF0(39, 0xE100000000000000, v4, v5);
      OUTLINED_FUNCTION_149_0();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
    v2 = &v6;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
    return v1;
  }
  sub_2125210D0((uint64_t)&v6);
  return 1280070990;
}

void sub_212527120()
{
  qword_253EFE2A8 = -1;
}

uint64_t sub_212527130(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212BED510](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_16()
{
  return sub_212532AA0();
}

uint64_t OUTLINED_FUNCTION_2_19()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_5_11()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_7_15()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t Bool.datatypeValue.getter(char a1)
{
  return a1 & 1;
}

BOOL static Bool.fromDatatypeValue(_:)(uint64_t a1)
{
  return a1 != 0;
}

void static Double.declaredDatatype.getter()
{
  OUTLINED_FUNCTION_7_16();
}

uint64_t sub_2125271E0()
{
  return 1279346002;
}

double sub_2125271F0@<D0>(double *a1@<X0>, _QWORD *a2@<X8>)
{
  double result;

  result = *a1;
  *a2 = *(_QWORD *)a1;
  return result;
}

double sub_2125271FC@<D0>(_QWORD *a1@<X8>)
{
  double *v1;
  double result;

  result = *v1;
  *a1 = *(_QWORD *)v1;
  return result;
}

uint64_t static Int64.declaredDatatype.getter()
{
  return 0x52454745544E49;
}

uint64_t sub_212527224()
{
  return 0x52454745544E49;
}

void static String.declaredDatatype.getter()
{
  OUTLINED_FUNCTION_7_16();
}

void static String.fromDatatypeValue(_:)()
{
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_1();
}

void String.datatypeValue.getter()
{
  OUTLINED_FUNCTION_3_18();
  OUTLINED_FUNCTION_1();
}

void sub_212527288(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  static String.fromDatatypeValue(_:)();
  *a1 = v2;
  a1[1] = v3;
}

void sub_2125272B4(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  String.datatypeValue.getter();
  *a1 = v2;
  a1[1] = v3;
  OUTLINED_FUNCTION_1();
}

void static Blob.declaredDatatype.getter()
{
  OUTLINED_FUNCTION_7_16();
}

uint64_t static Blob.fromDatatypeValue(_:)@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return OUTLINED_FUNCTION_0_17(*a1, a2);
}

uint64_t Blob.datatypeValue.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return OUTLINED_FUNCTION_0_17(*v1, a1);
}

uint64_t static Bool.declaredDatatype.getter()
{
  return OUTLINED_FUNCTION_2_20((uint64_t *)aInteger);
}

uint64_t static Bool.declaredDatatype.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_1_14(a1, a2, aInteger);
}

void static Bool.declaredDatatype.modify()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
}

void sub_212527350(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  *a2 = static Bool.fromDatatypeValue(_:)(*a1);
  OUTLINED_FUNCTION_1();
}

void sub_212527378(uint64_t *a1@<X8>)
{
  char *v1;

  *a1 = Bool.datatypeValue.getter(*v1);
  OUTLINED_FUNCTION_1();
}

uint64_t static Int.declaredDatatype.getter()
{
  return OUTLINED_FUNCTION_2_20((uint64_t *)aInteger_0);
}

uint64_t sub_2125273A8(uint64_t *a1)
{
  uint64_t v2;

  OUTLINED_FUNCTION_0_0();
  v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static Int.declaredDatatype.setter(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_1_14(a1, a2, aInteger_0);
}

uint64_t sub_212527400(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  OUTLINED_FUNCTION_0_0();
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

void static Int.declaredDatatype.modify()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1();
}

_UNKNOWN **sub_212527490()
{
  return &protocol witness table for Double;
}

_UNKNOWN **sub_21252749C()
{
  return &protocol witness table for Int64;
}

_UNKNOWN **sub_2125274A8()
{
  return &protocol witness table for String;
}

_UNKNOWN **sub_2125274B4()
{
  return &protocol witness table for Blob;
}

_QWORD *sub_2125274C4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2125274D0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t dispatch thunk of static Value.declaredDatatype.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of static Value.fromDatatypeValue(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of Value.datatypeValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t OUTLINED_FUNCTION_0_17@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_1_14(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return sub_212527400(a1, a2, a3, a3 + 1);
}

uint64_t OUTLINED_FUNCTION_2_20(uint64_t *a1)
{
  return sub_2125273A8(a1);
}

uint64_t OUTLINED_FUNCTION_3_18()
{
  return swift_bridgeObjectRetain();
}

uint64_t RRSchemaProvisionalPullerStartedReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setName:", v18);

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalPullerEndedReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setName:", v26);

      }
      else if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v25 = 0;
            goto LABEL_34;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        v25 = *(_BYTE *)(a2 + *v5) ? 0 : v20;
LABEL_34:
        objc_msgSend(a1, "setEntityCount:", v25);
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalPullerFailedReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  void *v25;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setName:", v25);

      }
      else if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_33;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_33:
        objc_msgSend(a1, "setTimeout:", v20 != 0);
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL RRSchemaProvisionalPullerContextReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  RRSchemaProvisionalPullerFailed *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 103)
      {
        v19 = objc_alloc_init(RRSchemaProvisionalPullerFailed);
        if (!PBReaderPlaceMark() || (RRSchemaProvisionalPullerFailedReadFrom(v19, a2) & 1) == 0)
        {
LABEL_35:

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setFailed:", v19, 0, 0);
        goto LABEL_30;
      }
      if ((_DWORD)v18 == 102)
        break;
      if ((_DWORD)v18 == 101)
      {
        v19 = objc_alloc_init(RRSchemaProvisionalPullerStarted);
        if (!PBReaderPlaceMark() || (RRSchemaProvisionalPullerStartedReadFrom(v19, a2) & 1) == 0)
          goto LABEL_35;
        PBReaderRecallMark();
        objc_msgSend(a1, "setStarted:", v19, 0, 0);
LABEL_30:

        goto LABEL_32;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_32:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v19 = objc_alloc_init(RRSchemaProvisionalPullerEnded);
    if (!PBReaderPlaceMark() || (RRSchemaProvisionalPullerEndedReadFrom(v19, a2) & 1) == 0)
      goto LABEL_35;
    PBReaderRecallMark();
    objc_msgSend(a1, "setEnded:", v19, 0, 0);
    goto LABEL_30;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRRGroupIdentifierReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setGroupId:", v26);

      }
      else if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_31;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v25 = 0;
            goto LABEL_34;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_31:
        v25 = *(_BYTE *)(a2 + *v5) ? 0 : v20;
LABEL_34:
        objc_msgSend(a1, "setSeq:", v25);
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRRAnnotationReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v26 = 0;
        v27 = 0;
        v28 = 0;
        while (1)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
            break;
          v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
          *(_QWORD *)(a2 + v29) = v31;
          v28 |= (unint64_t)(v32 & 0x7F) << v26;
          if ((v32 & 0x80) == 0)
            goto LABEL_42;
          v26 += 7;
          v15 = v27++ >= 9;
          if (v15)
          {
            v33 = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_42:
        v33 = *(_BYTE *)(a2 + *v5) ? 0 : v28;
LABEL_45:
        objc_msgSend(a1, "setName:", v33);
      }
      else if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_37;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v25 = 0;
            goto LABEL_40;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        v25 = *(_BYTE *)(a2 + *v5) ? 0 : v20;
LABEL_40:
        objc_msgSend(a1, "setAnnotationAddedTimestampInSeconds:", v25);
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRRAnnotatedEntityReadFrom(void *a1, uint64_t a2, double a3)
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  uint64_t v17;
  int v18;
  RRSchemaProvisionalRRGroupIdentifier *v20;
  uint64_t result;
  uint64_t v22;
  unint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;

  v4 = (int *)MEMORY[0x24BE7AF60];
  v5 = (int *)MEMORY[0x24BE7AF50];
  v6 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v6) == 0;
  v8 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v6))
      return *(_BYTE *)(a2 + *v6) == 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = *v4;
      v13 = *(_QWORD *)(a2 + v12);
      v14 = v13 + 1;
      if (v13 == -1 || v14 > *(_QWORD *)(a2 + *v5))
        break;
      v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v13);
      *(_QWORD *)(a2 + v12) = v14;
      v11 |= (unint64_t)(v15 & 0x7F) << v9;
      if ((v15 & 0x80) == 0)
        goto LABEL_12;
      v9 += 7;
      v16 = v10++ >= 9;
      if (v16)
      {
        v11 = 0;
        v17 = *v6;
        v18 = *(unsigned __int8 *)(a2 + v17);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v6) = 1;
LABEL_12:
    v17 = *v6;
    v18 = *(unsigned __int8 *)(a2 + v17);
    if (*(_BYTE *)(a2 + v17))
      v11 = 0;
LABEL_14:
    if (v18 || (v11 & 7) == 4)
      return *(_BYTE *)(a2 + *v6) == 0;
    switch((v11 >> 3))
    {
      case 1u:
        v20 = (RRSchemaProvisionalRRGroupIdentifier *)objc_alloc_init(MEMORY[0x24BE95EE8]);
        if (!PBReaderPlaceMark() || (USOSchemaUSOGraphReadFrom() & 1) == 0)
          goto LABEL_63;
        PBReaderRecallMark();
        objc_msgSend(a1, "setUsoGraph:", v20, 0, 0);
        goto LABEL_32;
      case 2u:
        PBReaderReadString();
        v20 = (RRSchemaProvisionalRRGroupIdentifier *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "setSwiftClassName:", v20);
        goto LABEL_32;
      case 3u:
        v20 = objc_alloc_init(RRSchemaProvisionalRRGroupIdentifier);
        if (!PBReaderPlaceMark() || (RRSchemaProvisionalRRGroupIdentifierReadFrom(v20, a2) & 1) == 0)
          goto LABEL_63;
        PBReaderRecallMark();
        objc_msgSend(a1, "setGroup:", v20, 0, 0);
        goto LABEL_32;
      case 4u:
        v20 = objc_alloc_init(RRSchemaProvisionalRRAnnotation);
        v39 = 0;
        v40 = 0;
        if (PBReaderPlaceMark() && RRSchemaProvisionalRRAnnotationReadFrom(v20, a2))
        {
          PBReaderRecallMark();
          if (v20)
            objc_msgSend(a1, "addAnnotations:", v20, 0, 0);
LABEL_32:

LABEL_61:
          if (*(_QWORD *)(a2 + *v4) >= *(_QWORD *)(a2 + *v5))
            return *(_BYTE *)(a2 + *v6) == 0;
          continue;
        }
LABEL_63:

        return 0;
      case 5u:
        v22 = *v4;
        v23 = *(_QWORD *)(a2 + v22);
        if (v23 <= 0xFFFFFFFFFFFFFFFBLL && v23 + 4 <= *(_QWORD *)(a2 + *v5))
        {
          LODWORD(a3) = *(_DWORD *)(*(_QWORD *)(a2 + *v8) + v23);
          *(_QWORD *)(a2 + v22) = v23 + 4;
        }
        else
        {
          *(_BYTE *)(a2 + v17) = 1;
          LODWORD(a3) = 0;
        }
        objc_msgSend(a1, "setSaliencyScore:", a3, v39, v40);
        goto LABEL_61;
      case 6u:
        v24 = 0;
        v25 = 0;
        v26 = 0;
        while (2)
        {
          v27 = *v4;
          v28 = *(_QWORD *)(a2 + v27);
          v29 = v28 + 1;
          if (v28 == -1 || v29 > *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v28);
            *(_QWORD *)(a2 + v27) = v29;
            v26 |= (unint64_t)(v30 & 0x7F) << v24;
            if (v30 < 0)
            {
              v24 += 7;
              v16 = v25++ >= 9;
              if (v16)
              {
                v31 = 0;
                goto LABEL_54;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v31 = 0;
        else
          v31 = v26;
LABEL_54:
        objc_msgSend(a1, "setSaliencyComputedAtTimestampInSeconds:", v31, v39, v40);
        goto LABEL_61;
      case 7u:
        v32 = 0;
        v33 = 0;
        v34 = 0;
        while (2)
        {
          v35 = *v4;
          v36 = *(_QWORD *)(a2 + v35);
          v37 = v36 + 1;
          if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v36);
            *(_QWORD *)(a2 + v35) = v37;
            v34 |= (unint64_t)(v38 & 0x7F) << v32;
            if (v38 < 0)
            {
              v32 += 7;
              v16 = v33++ >= 9;
              if (v16)
              {
                v34 = 0;
                goto LABEL_58;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v34 = 0;
LABEL_58:
        objc_msgSend(a1, "setHasReference:", v34 != 0);
        goto LABEL_61;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_61;
    }
  }
}

uint64_t RRSchemaProvisionalRRUsoGraphTier1ReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  id v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 101)
      {
        v18 = objc_alloc_init(MEMORY[0x24BE95EF8]);
        if (!PBReaderPlaceMark() || (USOSchemaUSOGraphTier1ReadFrom() & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setUsoGraphTier1:", v18, 0, 0);

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRREntityPoolResolveFailedReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_29;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v25 = 0;
            goto LABEL_32;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        v25 = *(_BYTE *)(a2 + *v5) ? 0 : v20;
LABEL_32:
        objc_msgSend(a1, "setReason:", v25);
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRREntityPoolResolveEndedReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  RRSchemaProvisionalRRAnnotatedEntity *v26;
  double v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v26 = objc_alloc_init(RRSchemaProvisionalRRAnnotatedEntity);
        v29 = 0;
        v30 = 0;
        if (!PBReaderPlaceMark()
          || !RRSchemaProvisionalRRAnnotatedEntityReadFrom(v26, a2, v27))
        {

          return 0;
        }
        PBReaderRecallMark();
        if (v26)
          objc_msgSend(a1, "addQueryResults:", v26, 0, 0);

      }
      else if ((v10 >> 3) == 2)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_35;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v25 = 0;
            goto LABEL_38;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
        else
          v25 = v20;
LABEL_38:
        objc_msgSend(a1, "setOutcome:", v25, v29, v30);
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRREntityPoolResolveStartedReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  id v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(MEMORY[0x24BE95EE8]);
        if (!PBReaderPlaceMark() || (USOSchemaUSOGraphReadFrom() & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setUsoQuery:", v18, 0, 0);

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL RRSchemaProvisionalRREntityPoolResolveContextReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  unint64_t v18;
  RRSchemaProvisionalRREntityPoolResolveFailed *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 103)
      {
        v19 = objc_alloc_init(RRSchemaProvisionalRREntityPoolResolveFailed);
        if (!PBReaderPlaceMark()
          || (RRSchemaProvisionalRREntityPoolResolveFailedReadFrom(v19, a2) & 1) == 0)
        {
LABEL_35:

          return 0;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setFailed:", v19, 0, 0);
        goto LABEL_30;
      }
      if ((_DWORD)v18 == 102)
        break;
      if ((_DWORD)v18 == 101)
      {
        v19 = objc_alloc_init(RRSchemaProvisionalRREntityPoolResolveStarted);
        if (!PBReaderPlaceMark()
          || (RRSchemaProvisionalRREntityPoolResolveStartedReadFrom(v19, a2) & 1) == 0)
        {
          goto LABEL_35;
        }
        PBReaderRecallMark();
        objc_msgSend(a1, "setStartedOrChanged:", v19, 0, 0);
LABEL_30:

        goto LABEL_32;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_32:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v19 = objc_alloc_init(RRSchemaProvisionalRREntityPoolResolveEnded);
    if (!PBReaderPlaceMark() || (RRSchemaProvisionalRREntityPoolResolveEndedReadFrom(v19, a2) & 1) == 0)
      goto LABEL_35;
    PBReaderRecallMark();
    objc_msgSend(a1, "setEnded:", v19, 0, 0);
    goto LABEL_30;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t RRSchemaProvisionalRREntityPoolReturnedReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  RRSchemaProvisionalRRAnnotatedEntity *v26;
  double v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 101)
      {
        v26 = objc_alloc_init(RRSchemaProvisionalRRAnnotatedEntity);
        v29 = 0;
        v30 = 0;
        if (!PBReaderPlaceMark()
          || !RRSchemaProvisionalRRAnnotatedEntityReadFrom(v26, a2, v27))
        {

          return 0;
        }
        PBReaderRecallMark();
        if (v26)
          objc_msgSend(a1, "addCandidateEntities:", v26, 0, 0);

      }
      else if ((v10 >> 3) == 102)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_35;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v25 = 0;
            goto LABEL_38;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
        else
          v25 = v20;
LABEL_38:
        objc_msgSend(a1, "setEntityCount:", v25, v29, v30);
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL RRSchemaProvisionalRRClientEventMetadataReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  id v18;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v18 = objc_alloc_init(MEMORY[0x24BE95C78]);
        if (!PBReaderPlaceMark() || (SISchemaUUIDReadFrom() & 1) == 0)
          goto LABEL_31;
        PBReaderRecallMark();
        objc_msgSend(a1, "setRrID:", v18, 0, 0);
LABEL_26:

        goto LABEL_28;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_28:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v18 = objc_alloc_init(MEMORY[0x24BE95C78]);
    if (!PBReaderPlaceMark() || (SISchemaUUIDReadFrom() & 1) == 0)
    {
LABEL_31:

      return 0;
    }
    PBReaderRecallMark();
    objc_msgSend(a1, "setRequestId:", v18, 0, 0);
    goto LABEL_26;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

BOOL RRSchemaProvisionalRRClientEventReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  RRSchemaProvisionalPullerContext *v18;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 'e':
        v18 = objc_alloc_init(RRSchemaProvisionalPullerContext);
        if (!PBReaderPlaceMark() || !RRSchemaProvisionalPullerContextReadFrom(v18, a2))
          goto LABEL_42;
        PBReaderRecallMark();
        objc_msgSend(a1, "setPullerContext:", v18, 0, 0);
        goto LABEL_35;
      case 'f':
        v18 = objc_alloc_init(RRSchemaProvisionalRREntityPoolReturned);
        if (!PBReaderPlaceMark() || (RRSchemaProvisionalRREntityPoolReturnedReadFrom(v18, a2) & 1) == 0)
          goto LABEL_42;
        PBReaderRecallMark();
        objc_msgSend(a1, "setEntityPoolReturned:", v18, 0, 0);
        goto LABEL_35;
      case 'g':
        v18 = objc_alloc_init(RRSchemaProvisionalRREntityPoolResolveContext);
        if (!PBReaderPlaceMark() || !RRSchemaProvisionalRREntityPoolResolveContextReadFrom(v18, a2))
          goto LABEL_42;
        PBReaderRecallMark();
        objc_msgSend(a1, "setEntityPoolResolveContext:", v18, 0, 0);
        goto LABEL_35;
      case 'h':
        v18 = objc_alloc_init(RRSchemaProvisionalRRUsoGraphTier1);
        if (!PBReaderPlaceMark() || (RRSchemaProvisionalRRUsoGraphTier1ReadFrom(v18, a2) & 1) == 0)
          goto LABEL_42;
        PBReaderRecallMark();
        objc_msgSend(a1, "setRrUsoGraphTier1:", v18, 0, 0);
        goto LABEL_35;
      default:
        if ((v10 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_36:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
        v18 = objc_alloc_init(RRSchemaProvisionalRRClientEventMetadata);
        if (PBReaderPlaceMark() && RRSchemaProvisionalRRClientEventMetadataReadFrom(v18, a2))
        {
          PBReaderRecallMark();
          objc_msgSend(a1, "setEventMetadata:", v18, 0, 0);
LABEL_35:

          goto LABEL_36;
        }
LABEL_42:

        return 0;
    }
  }
}

uint64_t sub_21253127C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_212531288()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_212531294()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2125312A0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2125312AC()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2125312B8()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2125312C4()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2125312D0()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2125312DC()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2125312E8()
{
  return MEMORY[0x24BDCBC48]();
}

uint64_t sub_2125312F4()
{
  return MEMORY[0x24BDCBC70]();
}

uint64_t sub_212531300()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_21253130C()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_212531318()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_212531324()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_212531330()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_21253133C()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_212531348()
{
  return MEMORY[0x24BDCBD70]();
}

uint64_t sub_212531354()
{
  return MEMORY[0x24BDCBDD0]();
}

uint64_t sub_212531360()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_21253136C()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_212531378()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_212531384()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_212531390()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_21253139C()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_2125313A8()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_2125313B4()
{
  return MEMORY[0x24BDCCB20]();
}

uint64_t sub_2125313C0()
{
  return MEMORY[0x24BDCCB30]();
}

uint64_t sub_2125313CC()
{
  return MEMORY[0x24BDCCB40]();
}

uint64_t sub_2125313D8()
{
  return MEMORY[0x24BDCCB60]();
}

uint64_t sub_2125313E4()
{
  return MEMORY[0x24BDCCB70]();
}

uint64_t sub_2125313F0()
{
  return MEMORY[0x24BDCCBB8]();
}

uint64_t sub_2125313FC()
{
  return MEMORY[0x24BDCCBD0]();
}

uint64_t sub_212531408()
{
  return MEMORY[0x24BDCCBD8]();
}

uint64_t sub_212531414()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_212531420()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21253142C()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_212531438()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_212531444()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_212531450()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_21253145C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_212531468()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_212531474()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_212531480()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_21253148C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_212531498()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2125314A4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2125314B0()
{
  return MEMORY[0x24BDCDB58]();
}

uint64_t sub_2125314BC()
{
  return MEMORY[0x24BDCDB68]();
}

uint64_t sub_2125314C8()
{
  return MEMORY[0x24BDCDBD0]();
}

uint64_t sub_2125314D4()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_2125314E0()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_2125314EC()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_2125314F8()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_212531504()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_212531510()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_21253151C()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_212531528()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_212531534()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_212531540()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21253154C()
{
  return MEMORY[0x24BDCE8A8]();
}

uint64_t sub_212531558()
{
  return MEMORY[0x24BDCE8B0]();
}

uint64_t sub_212531564()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_212531570()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21253157C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_212531588()
{
  return MEMORY[0x24BDCE9C0]();
}

uint64_t sub_212531594()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_2125315A0()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2125315AC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2125315B8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2125315C4()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_2125315D0()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_2125315DC()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_2125315E8()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_2125315F4()
{
  return MEMORY[0x24BDCEBE8]();
}

uint64_t sub_212531600()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_21253160C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_212531618()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_212531624()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_212531630()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_21253163C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_212531648()
{
  return MEMORY[0x24BDCF030]();
}

uint64_t sub_212531654()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_212531660()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_21253166C()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_212531678()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_212531684()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_212531690()
{
  return MEMORY[0x24BDCF4A8]();
}

uint64_t sub_21253169C()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_2125316A8()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_2125316B4()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_2125316C0()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2125316CC()
{
  return MEMORY[0x24BE0C8F0]();
}

uint64_t sub_2125316D8()
{
  return MEMORY[0x24BE0C8F8]();
}

uint64_t sub_2125316E4()
{
  return MEMORY[0x24BE0C900]();
}

uint64_t sub_2125316F0()
{
  return MEMORY[0x24BE0C908]();
}

uint64_t sub_2125316FC()
{
  return MEMORY[0x24BE0C9F0]();
}

uint64_t sub_212531708()
{
  return MEMORY[0x24BE0CA08]();
}

uint64_t sub_212531714()
{
  return MEMORY[0x24BE0CA50]();
}

uint64_t sub_212531720()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_21253172C()
{
  return MEMORY[0x24BE9E020]();
}

uint64_t sub_212531738()
{
  return MEMORY[0x24BE9EB50]();
}

uint64_t sub_212531744()
{
  return MEMORY[0x24BE9EB68]();
}

uint64_t sub_212531750()
{
  return MEMORY[0x24BE9EB88]();
}

uint64_t sub_21253175C()
{
  return MEMORY[0x24BE9EBB0]();
}

uint64_t sub_212531768()
{
  return MEMORY[0x24BE9ED48]();
}

uint64_t sub_212531774()
{
  return MEMORY[0x24BE9ED50]();
}

uint64_t sub_212531780()
{
  return MEMORY[0x24BE9ED58]();
}

uint64_t sub_21253178C()
{
  return MEMORY[0x24BE9ED60]();
}

uint64_t sub_212531798()
{
  return MEMORY[0x24BE9ED70]();
}

uint64_t sub_2125317A4()
{
  return MEMORY[0x24BE9ED78]();
}

uint64_t sub_2125317B0()
{
  return MEMORY[0x24BE9ED90]();
}

uint64_t sub_2125317BC()
{
  return MEMORY[0x24BE9EDA8]();
}

uint64_t sub_2125317C8()
{
  return MEMORY[0x24BE9EDB0]();
}

uint64_t sub_2125317D4()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_2125317E0()
{
  return MEMORY[0x24BE9F738]();
}

uint64_t sub_2125317EC()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_2125317F8()
{
  return MEMORY[0x24BE9F7F0]();
}

uint64_t sub_212531804()
{
  return MEMORY[0x24BE9F808]();
}

uint64_t sub_212531810()
{
  return MEMORY[0x24BE9F860]();
}

uint64_t sub_21253181C()
{
  return MEMORY[0x24BE9F888]();
}

uint64_t sub_212531828()
{
  return MEMORY[0x24BE9F8C0]();
}

uint64_t sub_212531834()
{
  return MEMORY[0x24BE9F968]();
}

uint64_t sub_212531840()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_21253184C()
{
  return MEMORY[0x24BE9F998]();
}

uint64_t sub_212531858()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_212531864()
{
  return MEMORY[0x24BE9FA48]();
}

uint64_t sub_212531870()
{
  return MEMORY[0x24BE9FAA0]();
}

uint64_t sub_21253187C()
{
  return MEMORY[0x24BE9FEC0]();
}

uint64_t sub_212531888()
{
  return MEMORY[0x24BE9FEC8]();
}

uint64_t sub_212531894()
{
  return MEMORY[0x24BE9FED8]();
}

uint64_t sub_2125318A0()
{
  return MEMORY[0x24BE9FF88]();
}

uint64_t sub_2125318AC()
{
  return MEMORY[0x24BEA00A8]();
}

uint64_t sub_2125318B8()
{
  return MEMORY[0x24BEA00B8]();
}

uint64_t sub_2125318C4()
{
  return MEMORY[0x24BEA0110]();
}

uint64_t sub_2125318D0()
{
  return MEMORY[0x24BEA0118]();
}

uint64_t sub_2125318DC()
{
  return MEMORY[0x24BEA0240]();
}

uint64_t sub_2125318E8()
{
  return MEMORY[0x24BEA0318]();
}

uint64_t sub_2125318F4()
{
  return MEMORY[0x24BEA0368]();
}

uint64_t sub_212531900()
{
  return MEMORY[0x24BEA0390]();
}

uint64_t sub_21253190C()
{
  return MEMORY[0x24BEA04E8]();
}

uint64_t sub_212531918()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_212531924()
{
  return MEMORY[0x24BEA06C0]();
}

uint64_t sub_212531930()
{
  return MEMORY[0x24BEA06C8]();
}

uint64_t sub_21253193C()
{
  return MEMORY[0x24BEA0728]();
}

uint64_t sub_212531948()
{
  return MEMORY[0x24BEA08A0]();
}

uint64_t sub_212531954()
{
  return MEMORY[0x24BEA08A8]();
}

uint64_t sub_212531960()
{
  return MEMORY[0x24BEA0990]();
}

uint64_t sub_21253196C()
{
  return MEMORY[0x24BEA09E0]();
}

uint64_t sub_212531978()
{
  return MEMORY[0x24BEA0B38]();
}

uint64_t sub_212531984()
{
  return MEMORY[0x24BEA0B50]();
}

uint64_t sub_212531990()
{
  return MEMORY[0x24BEA0B58]();
}

uint64_t sub_21253199C()
{
  return MEMORY[0x24BEA0B60]();
}

uint64_t sub_2125319A8()
{
  return MEMORY[0x24BEA0B68]();
}

uint64_t sub_2125319B4()
{
  return MEMORY[0x24BEA0B70]();
}

uint64_t sub_2125319C0()
{
  return MEMORY[0x24BEA0C18]();
}

uint64_t sub_2125319CC()
{
  return MEMORY[0x24BEA0C60]();
}

uint64_t sub_2125319D8()
{
  return MEMORY[0x24BEA0C80]();
}

uint64_t sub_2125319E4()
{
  return MEMORY[0x24BEA0D98]();
}

uint64_t sub_2125319F0()
{
  return MEMORY[0x24BEA0DA0]();
}

uint64_t sub_2125319FC()
{
  return MEMORY[0x24BEA0DA8]();
}

uint64_t sub_212531A08()
{
  return MEMORY[0x24BEA0DB0]();
}

uint64_t sub_212531A14()
{
  return MEMORY[0x24BEA0DB8]();
}

uint64_t sub_212531A20()
{
  return MEMORY[0x24BEA0DC8]();
}

uint64_t sub_212531A2C()
{
  return MEMORY[0x24BEA0DD0]();
}

uint64_t sub_212531A38()
{
  return MEMORY[0x24BEA0E08]();
}

uint64_t sub_212531A44()
{
  return MEMORY[0x24BEA0E10]();
}

uint64_t sub_212531A50()
{
  return MEMORY[0x24BEA0E18]();
}

uint64_t sub_212531A5C()
{
  return MEMORY[0x24BEA0E20]();
}

uint64_t sub_212531A68()
{
  return MEMORY[0x24BEA0E30]();
}

uint64_t sub_212531A74()
{
  return MEMORY[0x24BEA0E38]();
}

uint64_t sub_212531A80()
{
  return MEMORY[0x24BEA0FE8]();
}

uint64_t sub_212531A8C()
{
  return MEMORY[0x24BEA1000]();
}

uint64_t sub_212531A98()
{
  return MEMORY[0x24BEA1008]();
}

uint64_t sub_212531AA4()
{
  return MEMORY[0x24BEA1010]();
}

uint64_t sub_212531AB0()
{
  return MEMORY[0x24BEA1018]();
}

uint64_t sub_212531ABC()
{
  return MEMORY[0x24BEA1020]();
}

uint64_t sub_212531AC8()
{
  return MEMORY[0x24BEA1028]();
}

uint64_t sub_212531AD4()
{
  return MEMORY[0x24BEA1068]();
}

uint64_t sub_212531AE0()
{
  return MEMORY[0x24BEA1070]();
}

uint64_t sub_212531AEC()
{
  return MEMORY[0x24BEA1440]();
}

uint64_t sub_212531AF8()
{
  return MEMORY[0x24BEA1450]();
}

uint64_t sub_212531B04()
{
  return MEMORY[0x24BEA1458]();
}

uint64_t sub_212531B10()
{
  return MEMORY[0x24BEA1460]();
}

uint64_t sub_212531B1C()
{
  return MEMORY[0x24BEA1470]();
}

uint64_t sub_212531B28()
{
  return MEMORY[0x24BEA1478]();
}

uint64_t sub_212531B34()
{
  return MEMORY[0x24BEA14B0]();
}

uint64_t sub_212531B40()
{
  return MEMORY[0x24BEA14B8]();
}

uint64_t sub_212531B4C()
{
  return MEMORY[0x24BEA14C0]();
}

uint64_t sub_212531B58()
{
  return MEMORY[0x24BEA14D0]();
}

uint64_t sub_212531B64()
{
  return MEMORY[0x24BEA14D8]();
}

uint64_t sub_212531B70()
{
  return MEMORY[0x24BEA14E0]();
}

uint64_t sub_212531B7C()
{
  return MEMORY[0x24BEA1508]();
}

uint64_t sub_212531B88()
{
  return MEMORY[0x24BEA1510]();
}

uint64_t sub_212531B94()
{
  return MEMORY[0x24BEA1568]();
}

uint64_t sub_212531BA0()
{
  return MEMORY[0x24BEA1720]();
}

uint64_t sub_212531BAC()
{
  return MEMORY[0x24BEA1788]();
}

uint64_t sub_212531BB8()
{
  return MEMORY[0x24BEA1948]();
}

uint64_t sub_212531BC4()
{
  return MEMORY[0x24BEA1968]();
}

uint64_t sub_212531BD0()
{
  return MEMORY[0x24BEA1970]();
}

uint64_t sub_212531BDC()
{
  return MEMORY[0x24BEA1B30]();
}

uint64_t sub_212531BE8()
{
  return MEMORY[0x24BEA1D08]();
}

uint64_t sub_212531BF4()
{
  return MEMORY[0x24BEA1D10]();
}

uint64_t sub_212531C00()
{
  return MEMORY[0x24BEA1D20]();
}

uint64_t sub_212531C0C()
{
  return MEMORY[0x24BEA1D28]();
}

uint64_t sub_212531C18()
{
  return MEMORY[0x24BEA1DF8]();
}

uint64_t sub_212531C24()
{
  return MEMORY[0x24BEA1E08]();
}

uint64_t sub_212531C30()
{
  return MEMORY[0x24BEA1E10]();
}

uint64_t sub_212531C3C()
{
  return MEMORY[0x24BEA1E48]();
}

uint64_t sub_212531C48()
{
  return MEMORY[0x24BEA2070]();
}

uint64_t sub_212531C54()
{
  return MEMORY[0x24BEA2078]();
}

uint64_t sub_212531C60()
{
  return MEMORY[0x24BEA2080]();
}

uint64_t sub_212531C6C()
{
  return MEMORY[0x24BEA2088]();
}

uint64_t sub_212531C78()
{
  return MEMORY[0x24BEA2098]();
}

uint64_t sub_212531C84()
{
  return MEMORY[0x24BEA20A0]();
}

uint64_t sub_212531C90()
{
  return MEMORY[0x24BEA20D8]();
}

uint64_t sub_212531C9C()
{
  return MEMORY[0x24BEA20E0]();
}

uint64_t sub_212531CA8()
{
  return MEMORY[0x24BEA20F0]();
}

uint64_t sub_212531CB4()
{
  return MEMORY[0x24BEA2100]();
}

uint64_t sub_212531CC0()
{
  return MEMORY[0x24BEA2108]();
}

uint64_t sub_212531CCC()
{
  return MEMORY[0x24BEA2350]();
}

uint64_t sub_212531CD8()
{
  return MEMORY[0x24BEA2360]();
}

uint64_t sub_212531CE4()
{
  return MEMORY[0x24BEA2368]();
}

uint64_t sub_212531CF0()
{
  return MEMORY[0x24BEA2390]();
}

uint64_t sub_212531CFC()
{
  return MEMORY[0x24BEA2398]();
}

uint64_t sub_212531D08()
{
  return MEMORY[0x24BEA23A0]();
}

uint64_t sub_212531D14()
{
  return MEMORY[0x24BEA23A8]();
}

uint64_t sub_212531D20()
{
  return MEMORY[0x24BEA23B0]();
}

uint64_t sub_212531D2C()
{
  return MEMORY[0x24BEA23B8]();
}

uint64_t sub_212531D38()
{
  return MEMORY[0x24BEA23D0]();
}

uint64_t sub_212531D44()
{
  return MEMORY[0x24BEA23D8]();
}

uint64_t sub_212531D50()
{
  return MEMORY[0x24BEA2590]();
}

uint64_t sub_212531D5C()
{
  return MEMORY[0x24BEA25A0]();
}

uint64_t sub_212531D68()
{
  return MEMORY[0x24BEA25A8]();
}

uint64_t sub_212531D74()
{
  return MEMORY[0x24BEA25D8]();
}

uint64_t sub_212531D80()
{
  return MEMORY[0x24BEA25E0]();
}

uint64_t sub_212531D8C()
{
  return MEMORY[0x24BEA25F8]();
}

uint64_t sub_212531D98()
{
  return MEMORY[0x24BEA2600]();
}

uint64_t sub_212531DA4()
{
  return MEMORY[0x24BEA2608]();
}

uint64_t sub_212531DB0()
{
  return MEMORY[0x24BEA2610]();
}

uint64_t sub_212531DBC()
{
  return MEMORY[0x24BEA2618]();
}

uint64_t sub_212531DC8()
{
  return MEMORY[0x24BEA2620]();
}

uint64_t sub_212531DD4()
{
  return MEMORY[0x24BEA27B8]();
}

uint64_t sub_212531DE0()
{
  return MEMORY[0x24BEA27C0]();
}

uint64_t sub_212531DEC()
{
  return MEMORY[0x24BEA27D8]();
}

uint64_t sub_212531DF8()
{
  return MEMORY[0x24BEA27E0]();
}

uint64_t sub_212531E04()
{
  return MEMORY[0x24BEA2860]();
}

uint64_t sub_212531E10()
{
  return MEMORY[0x24BEA2868]();
}

uint64_t sub_212531E1C()
{
  return MEMORY[0x24BEA28B0]();
}

uint64_t sub_212531E28()
{
  return MEMORY[0x24BEA28B8]();
}

uint64_t sub_212531E34()
{
  return MEMORY[0x24BEA28C0]();
}

uint64_t sub_212531E40()
{
  return MEMORY[0x24BEA2A68]();
}

uint64_t sub_212531E4C()
{
  return MEMORY[0x24BEA2A78]();
}

uint64_t sub_212531E58()
{
  return MEMORY[0x24BEA2A80]();
}

uint64_t sub_212531E64()
{
  return MEMORY[0x24BEA2A90]();
}

uint64_t sub_212531E70()
{
  return MEMORY[0x24BEA2A98]();
}

uint64_t sub_212531E7C()
{
  return MEMORY[0x24BEA2AA0]();
}

uint64_t sub_212531E88()
{
  return MEMORY[0x24BEA2AA8]();
}

uint64_t sub_212531E94()
{
  return MEMORY[0x24BEA2AB0]();
}

uint64_t sub_212531EA0()
{
  return MEMORY[0x24BEA2AB8]();
}

uint64_t sub_212531EAC()
{
  return MEMORY[0x24BEA2AC0]();
}

uint64_t sub_212531EB8()
{
  return MEMORY[0x24BEA2AF8]();
}

uint64_t sub_212531EC4()
{
  return MEMORY[0x24BEA2B00]();
}

uint64_t sub_212531ED0()
{
  return MEMORY[0x24BEA2B10]();
}

uint64_t sub_212531EDC()
{
  return MEMORY[0x24BEA2B18]();
}

uint64_t sub_212531EE8()
{
  return MEMORY[0x24BEA2B38]();
}

uint64_t sub_212531EF4()
{
  return MEMORY[0x24BEA2B48]();
}

uint64_t sub_212531F00()
{
  return MEMORY[0x24BEA2B50]();
}

uint64_t sub_212531F0C()
{
  return MEMORY[0x24BEA2B58]();
}

uint64_t sub_212531F18()
{
  return MEMORY[0x24BEA2B68]();
}

uint64_t sub_212531F24()
{
  return MEMORY[0x24BEA2B70]();
}

uint64_t sub_212531F30()
{
  return MEMORY[0x24BEA2BA0]();
}

uint64_t sub_212531F3C()
{
  return MEMORY[0x24BEA2BB8]();
}

uint64_t sub_212531F48()
{
  return MEMORY[0x24BEA2BC0]();
}

uint64_t sub_212531F54()
{
  return MEMORY[0x24BEA2D10]();
}

uint64_t sub_212531F60()
{
  return MEMORY[0x24BEA2D20]();
}

uint64_t sub_212531F6C()
{
  return MEMORY[0x24BEA2D28]();
}

uint64_t sub_212531F78()
{
  return MEMORY[0x24BEA2D30]();
}

uint64_t sub_212531F84()
{
  return MEMORY[0x24BEA2D38]();
}

uint64_t sub_212531F90()
{
  return MEMORY[0x24BEA2D50]();
}

uint64_t sub_212531F9C()
{
  return MEMORY[0x24BEA2D58]();
}

uint64_t sub_212531FA8()
{
  return MEMORY[0x24BEA2E50]();
}

uint64_t sub_212531FB4()
{
  return MEMORY[0x24BEA2E58]();
}

uint64_t sub_212531FC0()
{
  return MEMORY[0x24BEA2E60]();
}

uint64_t sub_212531FCC()
{
  return MEMORY[0x24BEA2E70]();
}

uint64_t sub_212531FD8()
{
  return MEMORY[0x24BEA2E80]();
}

uint64_t sub_212531FE4()
{
  return MEMORY[0x24BEA2E90]();
}

uint64_t sub_212531FF0()
{
  return MEMORY[0x24BEA2E98]();
}

uint64_t sub_212531FFC()
{
  return MEMORY[0x24BEA2F08]();
}

uint64_t sub_212532008()
{
  return MEMORY[0x24BEA3740]();
}

uint64_t sub_212532014()
{
  return MEMORY[0x24BEA37F0]();
}

uint64_t sub_212532020()
{
  return MEMORY[0x24BEA3800]();
}

uint64_t sub_21253202C()
{
  return MEMORY[0x24BEA3810]();
}

uint64_t sub_212532038()
{
  return MEMORY[0x24BEA3818]();
}

uint64_t sub_212532044()
{
  return MEMORY[0x24BEA3820]();
}

uint64_t sub_212532050()
{
  return MEMORY[0x24BEA87E8]();
}

uint64_t sub_21253205C()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_212532068()
{
  return MEMORY[0x24BEA8808]();
}

uint64_t sub_212532074()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_212532080()
{
  return MEMORY[0x24BEA8820]();
}

uint64_t sub_21253208C()
{
  return MEMORY[0x24BEA8828]();
}

uint64_t sub_212532098()
{
  return MEMORY[0x24BEA8888]();
}

uint64_t sub_2125320A4()
{
  return MEMORY[0x24BEA8A80]();
}

uint64_t sub_2125320B0()
{
  return MEMORY[0x24BEA8A88]();
}

uint64_t sub_2125320BC()
{
  return MEMORY[0x24BEA8AA8]();
}

uint64_t sub_2125320C8()
{
  return MEMORY[0x24BEA8B10]();
}

uint64_t sub_2125320D4()
{
  return MEMORY[0x24BEA8B20]();
}

uint64_t sub_2125320E0()
{
  return MEMORY[0x24BEA8BF0]();
}

uint64_t sub_2125320EC()
{
  return MEMORY[0x24BEA8CF0]();
}

uint64_t sub_2125320F8()
{
  return MEMORY[0x24BEA8CF8]();
}

uint64_t sub_212532104()
{
  return MEMORY[0x24BEA8D00]();
}

uint64_t sub_212532110()
{
  return MEMORY[0x24BEA8D08]();
}

uint64_t sub_21253211C()
{
  return MEMORY[0x24BEA8D10]();
}

uint64_t sub_212532128()
{
  return MEMORY[0x24BEA8D18]();
}

uint64_t sub_212532134()
{
  return MEMORY[0x24BEA8DC8]();
}

uint64_t sub_212532140()
{
  return MEMORY[0x24BEA8DF0]();
}

uint64_t sub_21253214C()
{
  return MEMORY[0x24BEA8DF8]();
}

uint64_t sub_212532158()
{
  return MEMORY[0x24BEA8E10]();
}

uint64_t sub_212532164()
{
  return MEMORY[0x24BE53910]();
}

uint64_t sub_212532170()
{
  return MEMORY[0x24BE53918]();
}

uint64_t sub_21253217C()
{
  return MEMORY[0x24BE53928]();
}

uint64_t sub_212532188()
{
  return MEMORY[0x24BE53F08]();
}

uint64_t sub_212532194()
{
  return MEMORY[0x24BE53F10]();
}

uint64_t sub_2125321A0()
{
  return MEMORY[0x24BE53F18]();
}

uint64_t sub_2125321AC()
{
  return MEMORY[0x24BE53F50]();
}

uint64_t sub_2125321B8()
{
  return MEMORY[0x24BE53F58]();
}

uint64_t sub_2125321C4()
{
  return MEMORY[0x24BEA5B10]();
}

uint64_t sub_2125321D0()
{
  return MEMORY[0x24BEA5B18]();
}

uint64_t sub_2125321DC()
{
  return MEMORY[0x24BEA5B20]();
}

uint64_t sub_2125321E8()
{
  return MEMORY[0x24BEA5B28]();
}

uint64_t sub_2125321F4()
{
  return MEMORY[0x24BEA5B30]();
}

uint64_t sub_212532200()
{
  return MEMORY[0x24BEE6210]();
}

uint64_t sub_21253220C()
{
  return MEMORY[0x24BEE62A8]();
}

uint64_t sub_212532218()
{
  return MEMORY[0x24BEE6310]();
}

uint64_t sub_212532224()
{
  return MEMORY[0x24BEE6318]();
}

uint64_t sub_212532230()
{
  return MEMORY[0x24BEE6320]();
}

uint64_t sub_21253223C()
{
  return MEMORY[0x24BEE6368]();
}

uint64_t sub_212532248()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_212532254()
{
  return MEMORY[0x24BE54058]();
}

uint64_t sub_212532260()
{
  return MEMORY[0x24BE54068]();
}

uint64_t sub_21253226C()
{
  return MEMORY[0x24BE54070]();
}

uint64_t sub_212532278()
{
  return MEMORY[0x24BE54078]();
}

uint64_t sub_212532284()
{
  return MEMORY[0x24BE54088]();
}

uint64_t sub_212532290()
{
  return MEMORY[0x24BE54098]();
}

uint64_t sub_21253229C()
{
  return MEMORY[0x24BE540D0]();
}

uint64_t sub_2125322A8()
{
  return MEMORY[0x24BE540F8]();
}

uint64_t sub_2125322B4()
{
  return MEMORY[0x24BE54138]();
}

uint64_t sub_2125322C0()
{
  return MEMORY[0x24BE54140]();
}

uint64_t sub_2125322CC()
{
  return MEMORY[0x24BE54148]();
}

uint64_t sub_2125322D8()
{
  return MEMORY[0x24BE541A8]();
}

uint64_t sub_2125322E4()
{
  return MEMORY[0x24BE541B8]();
}

uint64_t sub_2125322F0()
{
  return MEMORY[0x24BE541C8]();
}

uint64_t sub_2125322FC()
{
  return MEMORY[0x24BE541D0]();
}

uint64_t sub_212532308()
{
  return MEMORY[0x24BE541D8]();
}

uint64_t sub_212532314()
{
  return MEMORY[0x24BE541E8]();
}

uint64_t sub_212532320()
{
  return MEMORY[0x24BE541F8]();
}

uint64_t sub_21253232C()
{
  return MEMORY[0x24BE54200]();
}

uint64_t sub_212532338()
{
  return MEMORY[0x24BE54220]();
}

uint64_t sub_212532344()
{
  return MEMORY[0x24BE54240]();
}

uint64_t sub_212532350()
{
  return MEMORY[0x24BE54250]();
}

uint64_t sub_21253235C()
{
  return MEMORY[0x24BE54270]();
}

uint64_t sub_212532368()
{
  return MEMORY[0x24BE54298]();
}

uint64_t sub_212532374()
{
  return MEMORY[0x24BE542A8]();
}

uint64_t sub_212532380()
{
  return MEMORY[0x24BE542B8]();
}

uint64_t sub_21253238C()
{
  return MEMORY[0x24BE542C8]();
}

uint64_t sub_212532398()
{
  return MEMORY[0x24BE542E0]();
}

uint64_t sub_2125323A4()
{
  return MEMORY[0x24BE542E8]();
}

uint64_t sub_2125323B0()
{
  return MEMORY[0x24BE542F8]();
}

uint64_t sub_2125323BC()
{
  return MEMORY[0x24BE54308]();
}

uint64_t sub_2125323C8()
{
  return MEMORY[0x24BE54310]();
}

uint64_t sub_2125323D4()
{
  return MEMORY[0x24BE54320]();
}

uint64_t sub_2125323E0()
{
  return MEMORY[0x24BE54328]();
}

uint64_t sub_2125323EC()
{
  return MEMORY[0x24BE54388]();
}

uint64_t sub_2125323F8()
{
  return MEMORY[0x24BE54398]();
}

uint64_t sub_212532404()
{
  return MEMORY[0x24BE54428]();
}

uint64_t sub_212532410()
{
  return MEMORY[0x24BE54430]();
}

uint64_t sub_21253241C()
{
  return MEMORY[0x24BE54448]();
}

uint64_t sub_212532428()
{
  return MEMORY[0x24BE54450]();
}

uint64_t sub_212532434()
{
  return MEMORY[0x24BE54460]();
}

uint64_t sub_212532440()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_21253244C()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_212532458()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_212532464()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_212532470()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21253247C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_212532488()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_212532494()
{
  return MEMORY[0x24BEA5540]();
}

uint64_t sub_2125324A0()
{
  return MEMORY[0x24BEA5570]();
}

uint64_t sub_2125324AC()
{
  return MEMORY[0x24BEA5578]();
}

uint64_t sub_2125324B8()
{
  return MEMORY[0x24BEA5580]();
}

uint64_t sub_2125324C4()
{
  return MEMORY[0x24BEA5598]();
}

uint64_t sub_2125324D0()
{
  return MEMORY[0x24BEA55A0]();
}

uint64_t sub_2125324DC()
{
  return MEMORY[0x24BEA55A8]();
}

uint64_t sub_2125324E8()
{
  return MEMORY[0x24BEA55B0]();
}

uint64_t sub_2125324F4()
{
  return MEMORY[0x24BEA55B8]();
}

uint64_t sub_212532500()
{
  return MEMORY[0x24BEA55D8]();
}

uint64_t sub_21253250C()
{
  return MEMORY[0x24BEA55E0]();
}

uint64_t sub_212532518()
{
  return MEMORY[0x24BEA55E8]();
}

uint64_t sub_212532524()
{
  return MEMORY[0x24BEA55F0]();
}

uint64_t sub_212532530()
{
  return MEMORY[0x24BEA5608]();
}

uint64_t sub_21253253C()
{
  return MEMORY[0x24BEA5610]();
}

uint64_t sub_212532548()
{
  return MEMORY[0x24BEA5618]();
}

uint64_t sub_212532554()
{
  return MEMORY[0x24BEA5628]();
}

uint64_t sub_212532560()
{
  return MEMORY[0x24BEA5640]();
}

uint64_t sub_21253256C()
{
  return MEMORY[0x24BEA5648]();
}

uint64_t sub_212532578()
{
  return MEMORY[0x24BEA5650]();
}

uint64_t sub_212532584()
{
  return MEMORY[0x24BEA5658]();
}

uint64_t sub_212532590()
{
  return MEMORY[0x24BEA5668]();
}

uint64_t sub_21253259C()
{
  return MEMORY[0x24BEA5670]();
}

uint64_t sub_2125325A8()
{
  return MEMORY[0x24BEA5678]();
}

uint64_t sub_2125325B4()
{
  return MEMORY[0x24BEA5680]();
}

uint64_t sub_2125325C0()
{
  return MEMORY[0x24BEA5698]();
}

uint64_t sub_2125325CC()
{
  return MEMORY[0x24BEA56A8]();
}

uint64_t sub_2125325D8()
{
  return MEMORY[0x24BEA56B0]();
}

uint64_t sub_2125325E4()
{
  return MEMORY[0x24BEA56B8]();
}

uint64_t sub_2125325F0()
{
  return MEMORY[0x24BEA56C0]();
}

uint64_t sub_2125325FC()
{
  return MEMORY[0x24BEA56C8]();
}

uint64_t sub_212532608()
{
  return MEMORY[0x24BEA56D8]();
}

uint64_t sub_212532614()
{
  return MEMORY[0x24BEA56E0]();
}

uint64_t sub_212532620()
{
  return MEMORY[0x24BEA56E8]();
}

uint64_t sub_21253262C()
{
  return MEMORY[0x24BEA56F0]();
}

uint64_t sub_212532638()
{
  return MEMORY[0x24BEA56F8]();
}

uint64_t sub_212532644()
{
  return MEMORY[0x24BEA5700]();
}

uint64_t sub_212532650()
{
  return MEMORY[0x24BEA5708]();
}

uint64_t sub_21253265C()
{
  return MEMORY[0x24BEA5710]();
}

uint64_t sub_212532668()
{
  return MEMORY[0x24BEA5720]();
}

uint64_t sub_212532674()
{
  return MEMORY[0x24BEA5728]();
}

uint64_t sub_212532680()
{
  return MEMORY[0x24BEA5738]();
}

uint64_t sub_21253268C()
{
  return MEMORY[0x24BEA5740]();
}

uint64_t sub_212532698()
{
  return MEMORY[0x24BEA5748]();
}

uint64_t sub_2125326A4()
{
  return MEMORY[0x24BEA5750]();
}

uint64_t sub_2125326B0()
{
  return MEMORY[0x24BEA5758]();
}

uint64_t sub_2125326BC()
{
  return MEMORY[0x24BEA5768]();
}

uint64_t sub_2125326C8()
{
  return MEMORY[0x24BEA5770]();
}

uint64_t sub_2125326D4()
{
  return MEMORY[0x24BEA5778]();
}

uint64_t sub_2125326E0()
{
  return MEMORY[0x24BEA5780]();
}

uint64_t sub_2125326EC()
{
  return MEMORY[0x24BEA5790]();
}

uint64_t sub_2125326F8()
{
  return MEMORY[0x24BEA5798]();
}

uint64_t sub_212532704()
{
  return MEMORY[0x24BEA57A0]();
}

uint64_t sub_212532710()
{
  return MEMORY[0x24BEA57A8]();
}

uint64_t sub_21253271C()
{
  return MEMORY[0x24BEA57B0]();
}

uint64_t sub_212532728()
{
  return MEMORY[0x24BEA57B8]();
}

uint64_t sub_212532734()
{
  return MEMORY[0x24BEA57C0]();
}

uint64_t sub_212532740()
{
  return MEMORY[0x24BEA57C8]();
}

uint64_t sub_21253274C()
{
  return MEMORY[0x24BEA57D0]();
}

uint64_t sub_212532758()
{
  return MEMORY[0x24BEA57D8]();
}

uint64_t sub_212532764()
{
  return MEMORY[0x24BEA57E0]();
}

uint64_t sub_212532770()
{
  return MEMORY[0x24BEA57F0]();
}

uint64_t sub_21253277C()
{
  return MEMORY[0x24BEA57F8]();
}

uint64_t sub_212532788()
{
  return MEMORY[0x24BEA5818]();
}

uint64_t sub_212532794()
{
  return MEMORY[0x24BEA5820]();
}

uint64_t sub_2125327A0()
{
  return MEMORY[0x24BEA5848]();
}

uint64_t sub_2125327AC()
{
  return MEMORY[0x24BEA5858]();
}

uint64_t sub_2125327B8()
{
  return MEMORY[0x24BEA58B8]();
}

uint64_t sub_2125327C4()
{
  return MEMORY[0x24BEA58C0]();
}

uint64_t sub_2125327D0()
{
  return MEMORY[0x24BEA5930]();
}

uint64_t sub_2125327DC()
{
  return MEMORY[0x24BEA5948]();
}

uint64_t sub_2125327E8()
{
  return MEMORY[0x24BEA5970]();
}

uint64_t sub_2125327F4()
{
  return MEMORY[0x24BEA59B0]();
}

uint64_t sub_212532800()
{
  return MEMORY[0x24BEA59D8]();
}

uint64_t sub_21253280C()
{
  return MEMORY[0x24BEA59F0]();
}

uint64_t sub_212532818()
{
  return MEMORY[0x24BEA59F8]();
}

uint64_t sub_212532824()
{
  return MEMORY[0x24BEA5A08]();
}

uint64_t sub_212532830()
{
  return MEMORY[0x24BEA5A10]();
}

uint64_t sub_21253283C()
{
  return MEMORY[0x24BEA5A20]();
}

uint64_t sub_212532848()
{
  return MEMORY[0x24BEA5A28]();
}

uint64_t sub_212532854()
{
  return MEMORY[0x24BEA5A30]();
}

uint64_t sub_212532860()
{
  return MEMORY[0x24BEA5A38]();
}

uint64_t sub_21253286C()
{
  return MEMORY[0x24BEA5A40]();
}

uint64_t sub_212532878()
{
  return MEMORY[0x24BEA5A58]();
}

uint64_t sub_212532884()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_212532890()
{
  return MEMORY[0x24BEA5A90]();
}

uint64_t sub_21253289C()
{
  return MEMORY[0x24BEA5A98]();
}

uint64_t sub_2125328A8()
{
  return MEMORY[0x24BEA5AD0]();
}

uint64_t sub_2125328B4()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_2125328C0()
{
  return MEMORY[0x24BEB9740]();
}

uint64_t sub_2125328CC()
{
  return MEMORY[0x24BEB9758]();
}

uint64_t sub_2125328D8()
{
  return MEMORY[0x24BEB9760]();
}

uint64_t sub_2125328E4()
{
  return MEMORY[0x24BEB97A0]();
}

uint64_t sub_2125328F0()
{
  return MEMORY[0x24BEB97A8]();
}

uint64_t sub_2125328FC()
{
  return MEMORY[0x24BEB97C0]();
}

uint64_t sub_212532908()
{
  return MEMORY[0x24BEB97C8]();
}

uint64_t sub_212532914()
{
  return MEMORY[0x24BEB97D0]();
}

uint64_t sub_212532920()
{
  return MEMORY[0x24BEB97D8]();
}

uint64_t sub_21253292C()
{
  return MEMORY[0x24BEB9890]();
}

uint64_t sub_212532938()
{
  return MEMORY[0x24BEB9898]();
}

uint64_t sub_212532944()
{
  return MEMORY[0x24BEB9970]();
}

uint64_t sub_212532950()
{
  return MEMORY[0x24BEB9A18]();
}

uint64_t sub_21253295C()
{
  return MEMORY[0x24BEB9BA0]();
}

uint64_t sub_212532968()
{
  return MEMORY[0x24BEB9D20]();
}

uint64_t sub_212532974()
{
  return MEMORY[0x24BEBA4B0]();
}

uint64_t sub_212532980()
{
  return MEMORY[0x24BEE53F0]();
}

uint64_t sub_21253298C()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_212532998()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_2125329A4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2125329B0()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_2125329BC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2125329C8()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_2125329D4()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2125329E0()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2125329EC()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2125329F8()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t sub_212532A04()
{
  return MEMORY[0x24BEE55E0]();
}

uint64_t sub_212532A10()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_212532A1C()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_212532A28()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_212532A34()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_212532A40()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_212532A4C()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_212532A58()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_212532A64()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_212532A70()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_212532A7C()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_212532A88()
{
  return MEMORY[0x24BEE0410]();
}

uint64_t sub_212532A94()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_212532AA0()
{
  return MEMORY[0x24BEE06E8]();
}

uint64_t sub_212532AAC()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_212532AB8()
{
  return MEMORY[0x24BEE08B8]();
}

uint64_t sub_212532AC4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_212532AD0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_212532ADC()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_212532AE8()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_212532AF4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_212532B00()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_212532B0C()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_212532B18()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_212532B24()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_212532B30()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_212532B3C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_212532B48()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_212532B54()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_212532B60()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_212532B6C()
{
  return MEMORY[0x24BEA5AF0]();
}

uint64_t sub_212532B78()
{
  return MEMORY[0x24BEA5AF8]();
}

uint64_t sub_212532B84()
{
  return MEMORY[0x24BEA5B00]();
}

uint64_t sub_212532B90()
{
  return MEMORY[0x24BEA5B08]();
}

uint64_t sub_212532B9C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_212532BA8()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_212532BB4()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_212532BC0()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_212532BCC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_212532BD8()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_212532BE4()
{
  return MEMORY[0x24BEE0BF0]();
}

uint64_t sub_212532BF0()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_212532BFC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_212532C08()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_212532C14()
{
  return MEMORY[0x24BEE0D58]();
}

uint64_t sub_212532C20()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_212532C2C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_212532C38()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_212532C44()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_212532C50()
{
  return MEMORY[0x24BEE0E60]();
}

uint64_t sub_212532C5C()
{
  return MEMORY[0x24BEE0E68]();
}

uint64_t sub_212532C68()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_212532C74()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_212532C80()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_212532C8C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_212532C98()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_212532CA4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_212532CB0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_212532CBC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_212532CC8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_212532CD4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_212532CE0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_212532CEC()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_212532CF8()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_212532D04()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_212532D10()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_212532D1C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_212532D28()
{
  return MEMORY[0x24BEE6968]();
}

uint64_t sub_212532D34()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_212532D40()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_212532D4C()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_212532D58()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_212532D64()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_212532D70()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_212532D7C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_212532D88()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_212532D94()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_212532DA0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_212532DAC()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_212532DB8()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_212532DC4()
{
  return MEMORY[0x24BEE56C0]();
}

uint64_t sub_212532DD0()
{
  return MEMORY[0x24BEE56D8]();
}

uint64_t sub_212532DDC()
{
  return MEMORY[0x24BEE56E0]();
}

uint64_t sub_212532DE8()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_212532DF4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_212532E00()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_212532E0C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_212532E18()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_212532E24()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_212532E30()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_212532E3C()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_212532E48()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_212532E54()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_212532E60()
{
  return MEMORY[0x24BDD0150]();
}

uint64_t sub_212532E6C()
{
  return MEMORY[0x24BDD0158]();
}

uint64_t sub_212532E78()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_212532E84()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_212532E90()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_212532E9C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_212532EA8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_212532EB4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_212532EC0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_212532ECC()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_212532ED8()
{
  return MEMORY[0x24BDD0590]();
}

uint64_t sub_212532EE4()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_212532EF0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_212532EFC()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_212532F08()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_212532F14()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_212532F20()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_212532F2C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_212532F38()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_212532F44()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_212532F50()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_212532F5C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_212532F68()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_212532F74()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_212532F80()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_212532F8C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_212532F98()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_212532FA4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_212532FB0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_212532FBC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_212532FC8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_212532FD4()
{
  return MEMORY[0x24BEE6D68]();
}

uint64_t sub_212532FE0()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_212532FEC()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_212532FF8()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_212533004()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_212533010()
{
  return MEMORY[0x24BEE2BA8]();
}

uint64_t sub_21253301C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_212533028()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_212533034()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_212533040()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_21253304C()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_212533058()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_212533064()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_212533070()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21253307C()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_212533088()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_212533094()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2125330A0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2125330AC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2125330B8()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_2125330C4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2125330D0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2125330DC()
{
  return MEMORY[0x24BEE3540]();
}

uint64_t sub_2125330E8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2125330F4()
{
  return MEMORY[0x24BEE3550]();
}

uint64_t sub_212533100()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21253310C()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_212533118()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_212533124()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_212533130()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21253313C()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_212533148()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_212533154()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_212533160()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21253316C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_212533178()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_212533184()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_212533190()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21253319C()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_2125331A8()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_2125331B4()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2125331C0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2125331CC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2125331D8()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2125331E4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x24BE08CA8]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x24BE08D98]();
}

uint64_t AFIsNano()
{
  return MEMORY[0x24BE08DB8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

uint64_t CARenderServerSnapshot()
{
  return MEMORY[0x24BDE5560]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5258](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

uint64_t LNStructuredDataRepresentationsAsString()
{
  return MEMORY[0x24BE5FF78]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x24BE7AFA0]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x24BE7AFF0]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

uint64_t SISchemaUUIDReadFrom()
{
  return MEMORY[0x24BE95F00]();
}

uint64_t USOSchemaUSOGraphReadFrom()
{
  return MEMORY[0x24BE95F08]();
}

uint64_t USOSchemaUSOGraphTier1ReadFrom()
{
  return MEMORY[0x24BE95F10]();
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

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
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

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDDF78](a1);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x24BEDDF80](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_handler(sqlite3 *a1, int (__cdecl *a2)(void *, int), void *a3)
{
  return MEMORY[0x24BEDDFE8](a1, a2, a3);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x24BEDDFF0](a1, *(_QWORD *)&ms);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x24BEDDFF8](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

void *__cdecl sqlite3_commit_hook(sqlite3 *a1, int (__cdecl *a2)(void *), void *a3)
{
  return (void *)MEMORY[0x24BEDE088](a1, a2, a3);
}

int sqlite3_create_collation_v2(sqlite3 *a1, const char *zName, int eTextRep, void *pArg, int (__cdecl *xCompare)(void *, int, const void *, int, const void *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x24BEDE0A0](a1, zName, *(_QWORD *)&eTextRep, pArg, xCompare, xDestroy);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x24BEDE0B0](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

const char *__cdecl sqlite3_db_filename(sqlite3 *db, const char *zDbName)
{
  return (const char *)MEMORY[0x24BEDE0D0](db, zDbName);
}

int sqlite3_db_readonly(sqlite3 *db, const char *zDbName)
{
  return MEMORY[0x24BEDE0E0](db, zDbName);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x24BEDE118](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x24BEDE120](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x24BEDE148](a1);
}

void sqlite3_interrupt(sqlite3 *a1)
{
  MEMORY[0x24BEDE168](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x24BEDE180](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE1E8](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
  MEMORY[0x24BEDE1F8](a1, a2);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
  MEMORY[0x24BEDE218](a1, a2);
}

void sqlite3_result_null(sqlite3_context *a1)
{
  MEMORY[0x24BEDE220](a1);
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE238](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cdecl sqlite3_rollback_hook(sqlite3 *a1, void (__cdecl *a2)(void *), void *a3)
{
  return (void *)MEMORY[0x24BEDE258](a1, a2, a3);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x24BEDE2A0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

int sqlite3_total_changes(sqlite3 *a1)
{
  return MEMORY[0x24BEDE2E0](a1);
}

int sqlite3_trace_v2(sqlite3 *a1, unsigned int uMask, int (__cdecl *xCallback)(unsigned int, void *, void *, void *), void *pCtx)
{
  return MEMORY[0x24BEDE2E8](a1, *(_QWORD *)&uMask, xCallback, pCtx);
}

void *__cdecl sqlite3_update_hook(sqlite3 *a1, void (__cdecl *a2)(void *, int, const char *, const char *, sqlite3_int64), void *a3)
{
  return (void *)MEMORY[0x24BEDE2F8](a1, a2, a3);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x24BEDE300](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x24BEDE308](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE310](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  double result;

  MEMORY[0x24BEDE320](a1);
  return result;
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE340](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE358](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE368](a1);
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

