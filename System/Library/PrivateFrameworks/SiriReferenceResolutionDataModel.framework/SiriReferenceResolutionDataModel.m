ValueMetadata *type metadata accessor for RRConstants()
{
  return &type metadata for RRConstants;
}

ValueMetadata *type metadata accessor for RRConstants.RBSConstants()
{
  return &type metadata for RRConstants.RBSConstants;
}

void RREntity.id.getter()
{
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

void RREntity.appBundleId.getter()
{
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

uint64_t RREntity.usoEntity.getter()
{
  return swift_retain();
}

uint64_t RREntity.typedValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_3() + 28);
  return sub_21CC54768(v3, a1);
}

uint64_t type metadata accessor for RREntity()
{
  uint64_t result;

  result = qword_254072D00;
  if (!qword_254072D00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21CC54768(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220789FB8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void RREntity.dataType.getter()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

void RREntity.data.getter()
{
  uint64_t v0;
  unint64_t v1;

  OUTLINED_FUNCTION_3();
  v0 = OUTLINED_FUNCTION_57();
  sub_21CC5484C(v0, v1);
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC5484C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21CC54860(a1, a2);
  return a1;
}

uint64_t sub_21CC54860(uint64_t a1, unint64_t a2)
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

uint64_t RREntity.group.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(OUTLINED_FUNCTION_3() + 40);
  *(_QWORD *)a1 = *(_QWORD *)v3;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v3 + 8);
  return swift_bridgeObjectRetain();
}

__n128 RREntity.group.setter(__n128 *a1)
{
  __n128 *v1;
  unint64_t v2;
  __n128 result;
  __n128 v4;

  v4 = *a1;
  v2 = a1[1].n128_u64[0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_86();
  result = v4;
  *v1 = v4;
  v1[1].n128_u64[0] = v2;
  return result;
}

uint64_t (*RREntity.group.modify())()
{
  OUTLINED_FUNCTION_3();
  return nullsub_1;
}

uint64_t RREntity.metadata.getter()
{
  OUTLINED_FUNCTION_3();
  return swift_bridgeObjectRetain();
}

void RREntity.metadata.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(int *)(OUTLINED_FUNCTION_3() + 44);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  OUTLINED_FUNCTION_44();
}

uint64_t (*RREntity.metadata.modify())()
{
  OUTLINED_FUNCTION_3();
  return nullsub_1;
}

void RREntity.restrictedEntityKey.getter()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

void RREntity.restrictedEntityKey.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_86();
  *v2 = a1;
  v2[1] = a2;
  OUTLINED_FUNCTION_44();
}

uint64_t (*RREntity.restrictedEntityKey.modify())()
{
  OUTLINED_FUNCTION_3();
  return nullsub_1;
}

uint64_t RREntity.description.getter()
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
  int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_61();
  v5 = v3 - v4;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - v7;
  v21 = 0;
  *(_QWORD *)&v22 = 0xE000000000000000;
  sub_21CC752E8();
  v23 = v21;
  v24 = v22;
  sub_21CC751EC();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_75();
  sub_21CC751EC();
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_75();
  sub_21CC751EC();
  sub_21CC75078();
  OUTLINED_FUNCTION_68();
  swift_release();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_75();
  sub_21CC751EC();
  v9 = OUTLINED_FUNCTION_3();
  sub_21CC54768(v0 + *(int *)(v9 + 28), (uint64_t)v8);
  v10 = sub_21CC75180();
  v11 = OUTLINED_FUNCTION_95((uint64_t)v8);
  sub_21CC54E50((uint64_t)v8);
  if (v11 == 1)
  {
    v12 = 0xE300000000000000;
    v13 = 7104878;
  }
  else
  {
    v14 = OUTLINED_FUNCTION_72();
    sub_21CC54768(v14, v15);
    if (OUTLINED_FUNCTION_95(v5) == 1)
    {
      sub_21CC54E50(v5);
      v13 = 0;
      v12 = 0;
    }
    else
    {
      v13 = sub_21CC75174();
      v12 = v16;
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v5, v10);
    }
  }
  v21 = v13;
  *(_QWORD *)&v22 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072A10);
  sub_21CC75324();
  OUTLINED_FUNCTION_59();
  sub_21CC751EC();
  swift_bridgeObjectRetain();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  sub_21CC751EC();
  v17 = v1 + *(int *)(v9 + 40);
  v21 = *(_QWORD *)v17;
  v22 = *(_OWORD *)(v17 + 8);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072AA8);
  sub_21CC751D4();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  sub_21CC751EC();
  v18 = OUTLINED_FUNCTION_23();
  MEMORY[0x220789A60](v18, &type metadata for RRMetadata);
  OUTLINED_FUNCTION_59();
  sub_21CC751EC();
  OUTLINED_FUNCTION_90();
  sub_21CC751EC();
  sub_21CC751EC();
  OUTLINED_FUNCTION_71();
  return v23;
}

uint64_t UsoEntity.debugString.getter()
{
  uint64_t v0;

  sub_21CC75078();
  v0 = OUTLINED_FUNCTION_68();
  swift_release();
  return v0;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_21CC54E50(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void RREntity.init(id:appBundleId:usoEntity:dataType:data:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __n128 *a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 *v13;
  uint64_t v14;
  _QWORD *v15;
  __n128 v16;
  uint64_t v17;

  OUTLINED_FUNCTION_10();
  v16 = *a10;
  OUTLINED_FUNCTION_3();
  v12 = OUTLINED_FUNCTION_49();
  __swift_storeEnumTagSinglePayload(v10, 1, 1, v12);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_9(v13, v16, v17, a6, a7, a8);
  *(_QWORD *)(v11 + v14) = MEMORY[0x24BEE4AF8];
  *v15 = 0;
  v15[1] = 0;
  OUTLINED_FUNCTION_20();
}

void RREntity.init(id:appBundleId:usoEntity:dataType:data:group:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __n128 *a10, uint64_t a11)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 *v14;
  uint64_t v15;
  _QWORD *v16;
  __n128 v17;
  uint64_t v19;

  OUTLINED_FUNCTION_10();
  v17 = *a10;
  OUTLINED_FUNCTION_3();
  v13 = OUTLINED_FUNCTION_49();
  __swift_storeEnumTagSinglePayload(v11, 1, 1, v13);
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_9(v14, v17, a6, a11, a7, a8);
  *(_QWORD *)(v12 + v15) = v19;
  *v16 = 0;
  v16[1] = 0;
  OUTLINED_FUNCTION_20();
}

void RREntity.init(id:appBundleId:typedValue:dataType:data:group:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t *a22)
{
  void *v22;
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
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *boxed_opaque_existential_0;
  void *v47;
  uint64_t v48;
  int *v49;
  _QWORD *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  _QWORD *v56;
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
  void *v72;
  uint64_t v73[4];

  OUTLINED_FUNCTION_2();
  v71 = v24;
  v72 = v22;
  v68 = v25;
  v69 = v26;
  v64 = v27;
  v65 = v28;
  v30 = v29;
  v67 = v31;
  v63 = v32;
  v34 = v33;
  v70 = a21;
  v59 = sub_21CC75168();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_15();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_61();
  v62 = v36 - v37;
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v38);
  v40 = (char *)&v59 - v39;
  v41 = OUTLINED_FUNCTION_12();
  v42 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_63();
  v43 = *a22;
  v66 = a22[1];
  v60 = a22[2];
  v61 = v43;
  v44 = OUTLINED_FUNCTION_72();
  sub_21CC54768(v44, v45);
  if (__swift_getEnumTagSinglePayload((uint64_t)v40, 1, v41) == 1)
  {
    sub_21CC54E50((uint64_t)v40);
    goto LABEL_5;
  }
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v23, v40, v41);
  v73[3] = v41;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v73);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v42 + 16))(boxed_opaque_existential_0, v23, v41);
  OUTLINED_FUNCTION_97();
  sub_21CC7515C();
  sub_21CC75144();
  v47 = v72;
  sub_21CC75150();
  if (v47)
  {

    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_69();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v73);
    v72 = 0;
LABEL_5:
    OUTLINED_FUNCTION_52();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_50();
    OUTLINED_FUNCTION_51();
  }
  v72 = 0;
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_69();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v73);
  v48 = v62;
  sub_21CC54768(v30, v62);
  sub_21CC54E50(v30);
  v49 = (int *)OUTLINED_FUNCTION_3();
  v50 = (_QWORD *)((char *)v34 + v49[10]);
  v51 = (_QWORD *)((char *)v34 + v49[12]);
  v52 = v67;
  *v34 = v63;
  v34[1] = v52;
  v53 = v68;
  v34[2] = v64;
  v34[3] = v53;
  v34[4] = a10;
  sub_21CC55414(v48, (uint64_t)v34 + v49[7]);
  v54 = (_QWORD *)((char *)v34 + v49[8]);
  v55 = v69;
  *v54 = v65;
  v54[1] = v55;
  v56 = (_QWORD *)((char *)v34 + v49[9]);
  v57 = v70;
  *v56 = v71;
  v56[1] = v57;
  v58 = v66;
  *v50 = v61;
  v50[1] = v58;
  v50[2] = v60;
  *(_QWORD *)((char *)v34 + v49[11]) = MEMORY[0x24BEE4AF8];
  *v51 = 0;
  v51[1] = 0;
  OUTLINED_FUNCTION_0();
}

__n128 RREntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:restrictedEntityKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 *a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int *v20;
  __n128 *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  __n128 result;
  unint64_t v26;
  __n128 v27;

  OUTLINED_FUNCTION_10();
  v27 = *a11;
  v26 = a11[1].n128_u64[0];
  v20 = (int *)OUTLINED_FUNCTION_3();
  v21 = (__n128 *)((char *)v19 + v20[10]);
  v22 = (_QWORD *)((char *)v19 + v20[12]);
  *v19 = v18;
  v19[1] = v17;
  v19[2] = v16;
  v19[3] = v15;
  v19[4] = v14;
  sub_21CC55414(a6, (uint64_t)v19 + v20[7]);
  v23 = (_QWORD *)((char *)v19 + v20[8]);
  *v23 = a7;
  v23[1] = a8;
  v24 = (_QWORD *)((char *)v19 + v20[9]);
  *v24 = a9;
  v24[1] = a10;
  result = v27;
  *v21 = v27;
  v21[1].n128_u64[0] = v26;
  *(_QWORD *)((char *)v19 + v20[11]) = a12;
  *v22 = a13;
  v22[1] = a14;
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

unint64_t sub_21CC55380()
{
  unint64_t result;

  result = qword_25531CD40;
  if (!qword_25531CD40)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RREntityError, &type metadata for RREntityError);
    atomic_store(result, (unint64_t *)&qword_25531CD40);
  }
  return result;
}

uint64_t sub_21CC553BC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_21CC553D0(a1, a2);
  return a1;
}

uint64_t sub_21CC553D0(uint64_t a1, unint64_t a2)
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

uint64_t sub_21CC55414(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

void RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:)()
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
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v5 = v4;
  v22 = v6;
  v23 = v7;
  v20 = v8;
  v21 = v9;
  v11 = v10;
  v13 = v12;
  v14 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_14();
  v16 = OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_48(v16);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v0, v5, v3);
  OUTLINED_FUNCTION_88();
  OUTLINED_FUNCTION_45(v11, v20, v21, v22, v23, v1, v17, v13, v18, v19, 0);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v5, v3);
  OUTLINED_FUNCTION_0();
}

{
  __int128 *v0;
  __int128 *v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  OUTLINED_FUNCTION_2();
  v1 = v0;
  v20 = v2;
  v4 = v3;
  v6 = v5;
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *v1;
  v10 = *((_QWORD *)v1 + 2);
  v11 = OUTLINED_FUNCTION_12();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v11);
  v21 = v19;
  v22 = v10;
  OUTLINED_FUNCTION_88();
  v12 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_73(v12, v13, v14, v6, v4, v15, v16, v17, v18, 0);
  OUTLINED_FUNCTION_0();
}

uint64_t RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X7>, _QWORD *a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;

  v33 = a7[1];
  v29 = a7[2];
  v30 = *a7;
  v18 = (int *)OUTLINED_FUNCTION_3();
  v19 = (_QWORD *)((char *)a8 + v18[10]);
  *v19 = 0;
  v19[1] = 0;
  v34 = v19;
  v19[2] = 0;
  v20 = (_QWORD *)((char *)a8 + v18[12]);
  *v20 = 0;
  v20[1] = 0;
  v35 = v20;
  *a8 = a1;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = a4;
  a8[4] = a5;
  v31 = (uint64_t)a8 + v18[7];
  sub_21CC54768(a6, v31);
  swift_getMetatypeMetadata();
  swift_retain();
  v21 = OUTLINED_FUNCTION_80();
  v22 = (_QWORD *)((char *)a8 + v18[8]);
  *v22 = v21;
  v22[1] = v23;
  sub_21CC74F70();
  OUTLINED_FUNCTION_6();
  sub_21CC74F64();
  v24 = sub_21CC74F58();
  v26 = v25;
  swift_release();
  if (v32)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_7();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37();
    sub_21CC54E50(a6);
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_79();
    OUTLINED_FUNCTION_98();
    sub_21CC54E50(v31);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_41();
    return OUTLINED_FUNCTION_41();
  }
  else
  {
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_37();
    sub_21CC54E50(a6);
    v28 = (_QWORD *)((char *)a8 + v18[9]);
    *v28 = v24;
    v28[1] = v26;
    swift_bridgeObjectRelease();
    *v34 = v30;
    v34[1] = v33;
    v34[2] = v29;
    *(_QWORD *)((char *)a8 + v18[11]) = a9;
    result = OUTLINED_FUNCTION_28();
    *v35 = a10;
    v35[1] = a11;
  }
  return result;
}

void RREntity.init<A>(id:appBundleId:typedValue:intentEntity:group:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_96();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_63();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_51();
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_51();
}

void sub_21CC55828(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1)
  {
    *(_QWORD *)(v8 - 168) = v2;
    sub_21CC54768(v2, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v6, v4, v1);
    *(_QWORD *)(v8 - 104) = *(_QWORD *)(v8 - 152);
    *(_QWORD *)(v8 - 96) = v3;
    *(_QWORD *)(v8 - 88) = *(_QWORD *)(v8 - 160);
    OUTLINED_FUNCTION_88();
    RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(*(_QWORD *)(v8 - 136), *(_QWORD *)(v8 - 72), *(_QWORD *)(v8 - 128), *(_QWORD *)(v8 - 112), a1, v7, v10, *(_QWORD **)(v8 - 144), v12, v13, 0);
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_67();
    v11 = *(_QWORD *)(v8 - 168);
  }
  else
  {
    OUTLINED_FUNCTION_87();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_75();
    sub_21CC55380();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_67();
    v11 = v2;
  }
  sub_21CC54E50(v11);
  OUTLINED_FUNCTION_0();
}

void RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:restrictedEntityKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 *v26;
  __int128 *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t);
  __int128 v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;

  OUTLINED_FUNCTION_2();
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v48 = v30;
  v49 = v31;
  v46 = v32;
  v47 = v33;
  v44 = v35;
  v45 = v34;
  v36 = *(_QWORD *)(a22 - 8);
  OUTLINED_FUNCTION_96();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_15();
  v43 = *v27;
  v39 = *((_QWORD *)v27 + 2);
  v40 = OUTLINED_FUNCTION_12();
  __swift_storeEnumTagSinglePayload(v23, 1, 1, v40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v22, v29, a22);
  v50 = v43;
  v51 = v39;
  OUTLINED_FUNCTION_45(v45, v46, v47, v48, v49, v23, (uint64_t *)&v50, v44, MEMORY[0x24BEE4AF8], v25, a21);
  v41 = OUTLINED_FUNCTION_84();
  v42(v41, a22);
  OUTLINED_FUNCTION_0();
}

{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t v32;

  OUTLINED_FUNCTION_2();
  v24 = v23;
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v25);
  v26 = OUTLINED_FUNCTION_8();
  __swift_storeEnumTagSinglePayload(v22, 1, 1, v26);
  OUTLINED_FUNCTION_83();
  v32 = MEMORY[0x24BEE4AF8];
  v27 = OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_73(v27, v28, v29, a21, a22, v30, v31, v32, v24, a21);
  OUTLINED_FUNCTION_0();
}

void RREntity.init<A>(id:appBundleId:usoEntity:intentEntity:group:metadata:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
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
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45[3];

  OUTLINED_FUNCTION_2();
  v43 = v24;
  v44 = v23;
  v26 = v25;
  v41 = v27;
  v42 = v28;
  v40 = v29;
  v31 = v30;
  v33 = v32;
  v34 = *(_QWORD *)(a21 - 8);
  OUTLINED_FUNCTION_96();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_14();
  swift_bridgeObjectRelease();
  v37 = OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_48(v37);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v21, v26, a21);
  memset(v45, 0, sizeof(v45));
  OUTLINED_FUNCTION_45(v31, v40, v41, v42, v44, v22, v45, v33, v43, 0, 0);
  v38 = OUTLINED_FUNCTION_84();
  v39(v38, a21);
  OUTLINED_FUNCTION_0();
}

{
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
  uint64_t *v32;
  _QWORD *v33;
  uint64_t v34;

  OUTLINED_FUNCTION_2();
  v23 = v22;
  v34 = v24;
  v26 = v25;
  OUTLINED_FUNCTION_27();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v27);
  v28 = OUTLINED_FUNCTION_8();
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v28);
  OUTLINED_FUNCTION_83();
  v29 = OUTLINED_FUNCTION_25();
  RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(v29, v30, v31, v26, a21, v21, v34, v32, v33, v23, 0, 0);
  OUTLINED_FUNCTION_0();
}

void RREntity.init<A>(id:appBundleId:typedValue:intentEntity:group:metadata:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_96();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_15();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_51();
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_51();
}

void sub_21CC55B88(uint64_t a1)
{
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

  if (a1)
  {
    *(_QWORD *)(v8 - 160) = v6;
    *(_QWORD *)(v8 - 152) = v3;
    v10 = *(_QWORD *)(v8 - 72);
    sub_21CC54768(v10, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v1, v2);
    *(_QWORD *)(v8 - 104) = 0;
    *(_QWORD *)(v8 - 96) = 0;
    *(_QWORD *)(v8 - 88) = 0;
    RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(*(_QWORD *)(v8 - 136), *(_QWORD *)(v8 - 152), *(_QWORD *)(v8 - 128), *(_QWORD *)(v8 - 112), a1, v7, (uint64_t *)(v8 - 104), *(_QWORD **)(v8 - 144), *(_QWORD *)(v8 - 120), 0, 0);
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_66();
    v11 = v10;
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_87();
    OUTLINED_FUNCTION_75();
    sub_21CC55380();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_66();
    v11 = *(_QWORD *)(v8 - 72);
  }
  sub_21CC54E50(v11);
  OUTLINED_FUNCTION_0();
}

uint64_t RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  _QWORD *v37;

  v34 = a8[1];
  v29 = a8[2];
  v30 = *a8;
  v18 = (int *)OUTLINED_FUNCTION_3();
  v19 = (_QWORD *)((char *)a9 + v18[10]);
  *v19 = 0;
  v19[1] = 0;
  v19[2] = 0;
  v20 = (_QWORD *)((char *)a9 + v18[12]);
  *v20 = 0;
  v20[1] = 0;
  v37 = v20;
  *a9 = a1;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  v36 = a6;
  v31 = (uint64_t)a9 + v18[7];
  sub_21CC54768(a6, v31);
  swift_getMetatypeMetadata();
  swift_retain();
  v21 = OUTLINED_FUNCTION_80();
  v22 = (_QWORD *)((char *)a9 + v18[8]);
  *v22 = v21;
  v22[1] = v23;
  v24 = static RRCoder.encode<A>(_:)(a7);
  v26 = v25;
  OUTLINED_FUNCTION_7();
  swift_unknownObjectRelease();
  if (v33)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21CC54E50(v36);
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_79();
    OUTLINED_FUNCTION_98();
    sub_21CC54E50(v31);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_41();
  }
  else
  {
    sub_21CC54E50(v36);
    v28 = (_QWORD *)((char *)a9 + v18[9]);
    *v28 = v24;
    v28[1] = v26;
    swift_bridgeObjectRelease();
    *v19 = v30;
    v19[1] = v34;
    v19[2] = v29;
    *(_QWORD *)((char *)a9 + v18[11]) = a10;
    result = OUTLINED_FUNCTION_28();
    *v37 = a11;
    v37[1] = a12;
  }
  return result;
}

void sub_21CC55F74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1)
  {
    sub_21CC54768(v1, v3);
    *(_QWORD *)(v8 - 104) = v7;
    *(_QWORD *)(v8 - 96) = v6;
    *(_QWORD *)(v8 - 88) = v2;
    OUTLINED_FUNCTION_88();
    RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(*(_QWORD *)(v8 - 128), v4, *(_QWORD *)(v8 - 120), v5, a1, v3, *(_QWORD *)(v8 - 72), v10, *(_QWORD **)(v8 - 136), v11, v12, 0);
    sub_21CC54E50(v1);
    OUTLINED_FUNCTION_7();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_75();
    swift_bridgeObjectRelease();
    sub_21CC55380();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7();
    swift_unknownObjectRelease();
    sub_21CC54E50(v1);
  }
  OUTLINED_FUNCTION_0();
}

void sub_21CC561E4(uint64_t a1)
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
  {
    *(_QWORD *)(v8 - 152) = v5;
    sub_21CC54768(v3, v4);
    *(_QWORD *)(v8 - 104) = v2;
    *(_QWORD *)(v8 - 96) = v7;
    *(_QWORD *)(v8 - 88) = v1;
    RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(*(_QWORD *)(v8 - 136), v6, *(_QWORD *)(v8 - 128), *(_QWORD *)(v8 - 72), a1, v4, *(_QWORD *)(v8 - 152), (uint64_t *)(v8 - 104), *(_QWORD **)(v8 - 144), *(_QWORD *)(v8 - 112), 0, 0);
    sub_21CC54E50(v3);
    OUTLINED_FUNCTION_7();
  }
  else
  {
    OUTLINED_FUNCTION_87();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21CC55380();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_42();
    OUTLINED_FUNCTION_7();
    swift_unknownObjectRelease();
    sub_21CC54E50(v3);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t static RREntity.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  BOOL v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  int *v86;
  char v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  _QWORD *v91;
  int *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _QWORD *v101;
  uint64_t v102;

  v93 = (int *)OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_61();
  v7 = v5 - v6;
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_29();
  v102 = v9;
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_29();
  v97 = v11;
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_29();
  v96 = v13;
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_29();
  v98 = v15;
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_29();
  v95 = v17;
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_29();
  v99 = v19;
  OUTLINED_FUNCTION_19();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_29();
  v100 = v21;
  OUTLINED_FUNCTION_19();
  v23 = MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v93 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = (char *)&v93 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v93 - v32;
  MEMORY[0x24BDAC7A8](v31);
  v35 = (char *)&v93 - v34;
  v36 = *a1 == *a2 && a1[1] == a2[1];
  v101 = a2;
  v37 = (uint64_t)a1;
  v94 = v7;
  if (v36)
  {
    sub_21CC57E1C((uint64_t)a1, (uint64_t)&v93 - v34);
    OUTLINED_FUNCTION_78();
  }
  else
  {
    v38 = OUTLINED_FUNCTION_22();
    v39 = (uint64_t)a1;
    v40 = v38;
    sub_21CC57E1C(v39, (uint64_t)v35);
    OUTLINED_FUNCTION_78();
    if ((v40 & 1) == 0)
    {
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_101();
      v41 = v37;
      OUTLINED_FUNCTION_24(v37);
      v42 = (uint64_t)v101;
      OUTLINED_FUNCTION_33((uint64_t)v101);
LABEL_13:
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_34(v41);
      OUTLINED_FUNCTION_53();
      v46 = v96;
      v45 = v97;
LABEL_20:
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_35();
LABEL_34:
      OUTLINED_FUNCTION_34(v41);
      OUTLINED_FUNCTION_33(v42);
      goto LABEL_35;
    }
  }
  if (*((_QWORD *)v35 + 2) == *((_QWORD *)v33 + 2) && *((_QWORD *)v35 + 3) == *((_QWORD *)v33 + 3))
  {
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_101();
    OUTLINED_FUNCTION_24(v37);
    OUTLINED_FUNCTION_33((uint64_t)v101);
  }
  else
  {
    v44 = OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_82();
    OUTLINED_FUNCTION_101();
    v41 = v37;
    OUTLINED_FUNCTION_24(v37);
    v42 = (uint64_t)v101;
    OUTLINED_FUNCTION_33((uint64_t)v101);
    if ((v44 & 1) == 0)
      goto LABEL_13;
  }
  sub_21CC75078();
  v47 = OUTLINED_FUNCTION_68();
  v49 = v48;
  swift_release();
  sub_21CC75078();
  v50 = OUTLINED_FUNCTION_68();
  v52 = v51;
  swift_release();
  if (v47 == v50 && v49 == v52)
  {
    OUTLINED_FUNCTION_92();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_46();
    v41 = v37;
    OUTLINED_FUNCTION_34(v37);
    v42 = (uint64_t)v101;
    OUTLINED_FUNCTION_53();
    v46 = v96;
    v45 = v97;
    v55 = v95;
  }
  else
  {
    v54 = OUTLINED_FUNCTION_22();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_46();
    v41 = v37;
    OUTLINED_FUNCTION_34(v37);
    v42 = (uint64_t)v101;
    OUTLINED_FUNCTION_53();
    v46 = v96;
    v45 = v97;
    v55 = v95;
    if ((v54 & 1) == 0)
      goto LABEL_20;
  }
  v56 = v93[8];
  v57 = &v28[v56];
  v58 = *(_QWORD *)&v28[v56 + 8];
  v59 = &v25[v56];
  v60 = *((_QWORD *)v59 + 1);
  if (!v58)
  {
    OUTLINED_FUNCTION_76();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_35();
    if (!v60)
    {
LABEL_44:
      v63 = v100;
      OUTLINED_FUNCTION_34(v41);
      v64 = v99;
      OUTLINED_FUNCTION_33(v42);
      goto LABEL_45;
    }
LABEL_33:
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  if (!v60)
  {
    OUTLINED_FUNCTION_91();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_35();
    goto LABEL_33;
  }
  if (*(_QWORD *)v57 == *(_QWORD *)v59 && v58 == v60)
  {
    OUTLINED_FUNCTION_91();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_90();
    goto LABEL_44;
  }
  v62 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_91();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_90();
  v63 = v100;
  OUTLINED_FUNCTION_34(v41);
  v64 = v99;
  OUTLINED_FUNCTION_33(v42);
  if ((v62 & 1) == 0)
  {
LABEL_35:
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_35();
LABEL_36:
    OUTLINED_FUNCTION_39();
    OUTLINED_FUNCTION_24(v42);
LABEL_37:
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_40();
LABEL_38:
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_54();
LABEL_39:
    sub_21CC57E60(v46);
    sub_21CC57E60(v45);
    OUTLINED_FUNCTION_81();
    OUTLINED_FUNCTION_100();
LABEL_40:
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_85();
LABEL_41:
    LOBYTE(v65) = 0;
    return v65 & 1;
  }
LABEL_45:
  v67 = v93[9];
  v68 = *(_QWORD *)(v63 + v67);
  v69 = *(_QWORD *)(v63 + v67 + 8);
  v70 = (uint64_t *)(v64 + v67);
  v71 = *v70;
  v72 = v70[1];
  if (v69 >> 60 == 15)
  {
    v101 = (_QWORD *)v68;
    sub_21CC5484C(v71, v72);
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_60();
    if (v72 >> 60 == 15)
    {
      OUTLINED_FUNCTION_94();
      OUTLINED_FUNCTION_39();
      v73 = v98;
      OUTLINED_FUNCTION_24(v42);
      goto LABEL_52;
    }
LABEL_50:
    OUTLINED_FUNCTION_94();
    OUTLINED_FUNCTION_102();
    goto LABEL_36;
  }
  if (v72 >> 60 == 15)
  {
    v74 = v68;
    sub_21CC54860(v68, v69);
    sub_21CC54860(v74, v69);
    sub_21CC57E60(v99);
    sub_21CC57E60(v100);
    v101 = (_QWORD *)v74;
    sub_21CC553BC(v74, v69);
    goto LABEL_50;
  }
  v75 = v68;
  sub_21CC5484C(v68, v69);
  sub_21CC5484C(v71, v72);
  sub_21CC5484C(v75, v69);
  v76 = MEMORY[0x2207897C0](v75, v69, v71, v72);
  OUTLINED_FUNCTION_102();
  OUTLINED_FUNCTION_89();
  sub_21CC57E60(v99);
  sub_21CC57E60(v100);
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_39();
  v73 = v98;
  OUTLINED_FUNCTION_24(v42);
  if ((v76 & 1) == 0)
    goto LABEL_37;
LABEL_52:
  v77 = v93[10];
  v78 = (_QWORD *)(v55 + v77);
  v79 = *(_QWORD *)(v55 + v77 + 8);
  v80 = (_QWORD *)(v73 + v77);
  v81 = v80[1];
  if (!v79)
  {
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_40();
    if (!v81)
    {
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_54();
      v85 = v94;
      goto LABEL_67;
    }
LABEL_65:
    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_71();
    goto LABEL_38;
  }
  if (!v81)
  {
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_71();
    goto LABEL_65;
  }
  v82 = v78[2];
  v83 = v80[2];
  v84 = *v78 == *v80 && v79 == v81;
  if (!v84 && (OUTLINED_FUNCTION_22() & 1) == 0)
  {
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_92();
    goto LABEL_38;
  }
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_54();
  v36 = v82 == v83;
  v85 = v94;
  if (!v36)
    goto LABEL_39;
LABEL_67:
  v86 = v93;
  v87 = sub_21CC56A24(*(_QWORD *)(v46 + v93[11]), *(_QWORD *)(v45 + v93[11]));
  sub_21CC57E60(v46);
  sub_21CC57E60(v45);
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_100();
  if ((v87 & 1) == 0)
    goto LABEL_40;
  v88 = v86[12];
  v89 = (_QWORD *)(v102 + v88);
  v90 = *(_QWORD *)(v102 + v88 + 8);
  v91 = (_QWORD *)(v85 + v88);
  v65 = v91[1];
  if (!v90)
  {
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_85();
    if (!v65)
    {
      LOBYTE(v65) = 1;
      return v65 & 1;
    }
    OUTLINED_FUNCTION_59();
    goto LABEL_41;
  }
  if (v65)
  {
    if (*v89 == *v91 && v90 == v65)
      LOBYTE(v65) = 1;
    else
      LOBYTE(v65) = OUTLINED_FUNCTION_22();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_85();
  OUTLINED_FUNCTION_71();
  return v65 & 1;
}

uint64_t sub_21CC56A24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    if (a1 != a2)
      __asm { BR              X10 }
  }
  return 1;
}

void RREntity.convertData<A>(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v4 = (uint64_t *)(v0 + *(int *)(OUTLINED_FUNCTION_3() + 36));
  v5 = v4[1];
  if (v5 >> 60 == 15)
  {
    OUTLINED_FUNCTION_93(v3, 1);
  }
  else
  {
    v6 = *v4;
    sub_21CC74F4C();
    OUTLINED_FUNCTION_6();
    sub_21CC54860(v6, v5);
    sub_21CC74F40();
    sub_21CC74F34();
    if (v1)
    {
      swift_release();
      OUTLINED_FUNCTION_99();
    }
    else
    {
      OUTLINED_FUNCTION_99();
      swift_release();
      OUTLINED_FUNCTION_93(v3, 0);
    }
  }
  OUTLINED_FUNCTION_0();
}

uint64_t RREntity.convertData<A>(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if (*(_QWORD *)(v0 + *(int *)(OUTLINED_FUNCTION_3() + 36) + 8) >> 60 == 15)
    return 0;
  v2 = OUTLINED_FUNCTION_72();
  sub_21CC54860(v2, v3);
  v1 = static RRCoder.decode<A>(_:from:)();
  v4 = OUTLINED_FUNCTION_72();
  sub_21CC553BC(v4, v5);
  return v1;
}

BOOL sub_21CC56FC4(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_21CC56FD4()
{
  return sub_21CC754C8();
}

uint64_t sub_21CC56FF8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  char v13;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965;
    if (v6 || (sub_21CC75450() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x7469746E456F7375 && a2 == 0xE900000000000079;
      if (v7 || (sub_21CC75450() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6C61566465707974 && a2 == 0xEA00000000006575;
        if (v8 || (sub_21CC75450() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6570795461746164 && a2 == 0xE800000000000000;
          if (v9 || (sub_21CC75450() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 1635017060 && a2 == 0xE400000000000000;
            if (v10 || (sub_21CC75450() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x70756F7267 && a2 == 0xE500000000000000;
              if (v11 || (sub_21CC75450() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else
              {
                v12 = a1 == 0x617461646174656DLL && a2 == 0xE800000000000000;
                if (v12 || (sub_21CC75450() & 1) != 0)
                {
                  swift_bridgeObjectRelease();
                  return 7;
                }
                else if (a1 == 0xD000000000000013 && a2 == 0x800000021CC75AC0)
                {
                  swift_bridgeObjectRelease();
                  return 8;
                }
                else
                {
                  v13 = sub_21CC75450();
                  swift_bridgeObjectRelease();
                  if ((v13 & 1) != 0)
                    return 8;
                  else
                    return 9;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t sub_21CC57384()
{
  return 9;
}

uint64_t sub_21CC5738C()
{
  sub_21CC754BC();
  sub_21CC754C8();
  return sub_21CC754EC();
}

uint64_t sub_21CC573D0()
{
  return 0;
}

uint64_t sub_21CC573DC(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21CC57404 + 4 * byte_21CC762B6[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_21CC57404()
{
  return 0x6C646E7542707061;
}

uint64_t sub_21CC57424()
{
  return 0x7469746E456F7375;
}

uint64_t sub_21CC57440()
{
  return 0x6C61566465707974;
}

uint64_t sub_21CC5745C()
{
  return 0x6570795461746164;
}

uint64_t sub_21CC57474()
{
  return 1635017060;
}

uint64_t sub_21CC57484()
{
  return 0x70756F7267;
}

uint64_t sub_21CC57498()
{
  return 0x617461646174656DLL;
}

unint64_t sub_21CC574B0()
{
  return 0xD000000000000013;
}

BOOL sub_21CC574CC(char *a1, char *a2)
{
  return sub_21CC56FC4(*a1, *a2);
}

uint64_t sub_21CC574D8()
{
  return sub_21CC5738C();
}

uint64_t sub_21CC574E0()
{
  return sub_21CC56FD4();
}

uint64_t sub_21CC574E8()
{
  sub_21CC754BC();
  sub_21CC754C8();
  return sub_21CC754EC();
}

uint64_t sub_21CC57528()
{
  unsigned __int8 *v0;

  return sub_21CC573DC(*v0);
}

uint64_t sub_21CC57530@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC56FF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC57554()
{
  return sub_21CC573D0();
}

uint64_t sub_21CC57570@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC57384();
  *a1 = result;
  return result;
}

uint64_t sub_21CC57594()
{
  sub_21CC57EC0();
  return sub_21CC75534();
}

uint64_t sub_21CC575BC()
{
  sub_21CC57EC0();
  return sub_21CC75540();
}

uint64_t RREntity.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CD48);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_5();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC57EC0();
  sub_21CC75528();
  OUTLINED_FUNCTION_43();
  if (!v1)
  {
    OUTLINED_FUNCTION_43();
    OUTLINED_FUNCTION_97();
    sub_21CC58014(&qword_25531CD58, (uint64_t (*)(uint64_t))MEMORY[0x24BEA3820], MEMORY[0x24BEA3830]);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_12();
    sub_21CC58014(&qword_25531CD60, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A28]);
    sub_21CC753FC();
    OUTLINED_FUNCTION_31(4);
    sub_21CC57EFC();
    OUTLINED_FUNCTION_30();
    sub_21CC57F38();
    OUTLINED_FUNCTION_30();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531CD78);
    sub_21CC580CC(&qword_25531CD80, (void (*)(void))sub_21CC57FB8);
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_31(8);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

void RREntity.init(from:)()
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
  uint64_t *v10;
  int *v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t *v28;
  __int128 v29;
  uint64_t v30;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v23 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_5();
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CD90);
  v6 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_62();
  v10 = (uint64_t *)(v9 - v8);
  v12 = (uint64_t *)((char *)v10 + v11[10]);
  *v12 = 0;
  v12[1] = 0;
  v27 = v12;
  v28 = v10;
  v12[2] = 0;
  v13 = (uint64_t *)((char *)v10 + v11[12]);
  *v13 = 0;
  v13[1] = 0;
  v25 = v11;
  v26 = v13;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_21CC57EC0();
  sub_21CC75510();
  if (v0)
  {
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_41();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = v6;
    *v28 = sub_21CC7539C();
    v28[1] = v14;
    LOBYTE(v29) = 1;
    v28[2] = sub_21CC7539C();
    v28[3] = v15;
    OUTLINED_FUNCTION_97();
    sub_21CC58014(&qword_25531CD98, (uint64_t (*)(uint64_t))MEMORY[0x24BEA3820], MEMORY[0x24BEA3838]);
    OUTLINED_FUNCTION_16();
    v28[4] = v29;
    OUTLINED_FUNCTION_12();
    LOBYTE(v29) = 3;
    sub_21CC58014(&qword_25531CDA0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A40]);
    sub_21CC75390();
    sub_21CC55414(v1, (uint64_t)v28 + v25[7]);
    v16 = OUTLINED_FUNCTION_47(4);
    v17 = (uint64_t *)((char *)v28 + v25[8]);
    *v17 = v16;
    v17[1] = v18;
    sub_21CC58054();
    OUTLINED_FUNCTION_32();
    *(_OWORD *)((char *)v28 + v25[9]) = v29;
    sub_21CC58090();
    OUTLINED_FUNCTION_32();
    *(_OWORD *)v27 = v29;
    v27[2] = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531CD78);
    sub_21CC580CC(&qword_25531CDB8, (void (*)(void))sub_21CC58130);
    OUTLINED_FUNCTION_16();
    *(uint64_t *)((char *)v28 + v25[11]) = v29;
    v19 = OUTLINED_FUNCTION_47(8);
    v21 = v20;
    OUTLINED_FUNCTION_4(*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
    swift_bridgeObjectRelease();
    *v26 = v19;
    v26[1] = v21;
    sub_21CC57E1C((uint64_t)v28, v23);
    OUTLINED_FUNCTION_74();
    sub_21CC57E60((uint64_t)v28);
  }
  OUTLINED_FUNCTION_0();
}

void sub_21CC57D04()
{
  RREntity.init(from:)();
}

uint64_t sub_21CC57D18(_QWORD *a1)
{
  return RREntity.encode(to:)(a1);
}

uint64_t static RREntityError.== infix(_:_:)()
{
  return 1;
}

uint64_t RREntityError.hash(into:)()
{
  return sub_21CC754C8();
}

uint64_t RREntityError.hashValue.getter()
{
  sub_21CC754BC();
  sub_21CC754C8();
  return sub_21CC754EC();
}

uint64_t sub_21CC57DA0()
{
  return 1;
}

uint64_t sub_21CC57DA8()
{
  return RREntityError.hashValue.getter();
}

uint64_t sub_21CC57DBC()
{
  return RREntityError.hash(into:)();
}

uint64_t sub_21CC57DD0()
{
  sub_21CC754BC();
  sub_21CC754C8();
  return sub_21CC754EC();
}

uint64_t sub_21CC57E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RREntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CC57E60(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RREntity();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_21CC57EC0()
{
  unint64_t result;

  result = qword_25531CD50;
  if (!qword_25531CD50)
  {
    result = MEMORY[0x220789FD0]("iXD1T:", &type metadata for RREntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CD50);
  }
  return result;
}

unint64_t sub_21CC57EFC()
{
  unint64_t result;

  result = qword_25531CD68;
  if (!qword_25531CD68)
  {
    result = MEMORY[0x220789FD0](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25531CD68);
  }
  return result;
}

unint64_t sub_21CC57F38()
{
  unint64_t result;

  result = qword_25531CD70;
  if (!qword_25531CD70)
  {
    result = MEMORY[0x220789FD0]("UTD1 2", &type metadata for GroupIdentifier);
    atomic_store(result, (unint64_t *)&qword_25531CD70);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220789FC4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21CC57FB8()
{
  unint64_t result;

  result = qword_25531CD88;
  if (!qword_25531CD88)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRMetadata, &type metadata for RRMetadata);
    atomic_store(result, (unint64_t *)&qword_25531CD88);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_21CC58014(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x220789FD0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21CC58054()
{
  unint64_t result;

  result = qword_25531CDA8;
  if (!qword_25531CDA8)
  {
    result = MEMORY[0x220789FD0](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25531CDA8);
  }
  return result;
}

unint64_t sub_21CC58090()
{
  unint64_t result;

  result = qword_25531CDB0;
  if (!qword_25531CDB0)
  {
    result = MEMORY[0x220789FD0]("mTD1H2", &type metadata for GroupIdentifier);
    atomic_store(result, (unint64_t *)&qword_25531CDB0);
  }
  return result;
}

uint64_t sub_21CC580CC(unint64_t *a1, void (*a2)(void))
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531CD78);
    a2();
    v5 = OUTLINED_FUNCTION_72();
    result = MEMORY[0x220789FD0](v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21CC58130()
{
  unint64_t result;

  result = qword_25531CDC0;
  if (!qword_25531CDC0)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRMetadata, &type metadata for RRMetadata);
    atomic_store(result, (unint64_t *)&qword_25531CDC0);
  }
  return result;
}

unint64_t sub_21CC58170()
{
  unint64_t result;

  result = qword_25531CDC8;
  if (!qword_25531CDC8)
  {
    result = MEMORY[0x220789FD0]("-ZD1d<", &type metadata for RREntityError);
    atomic_store(result, (unint64_t *)&qword_25531CDC8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RREntity(uint64_t *a1, uint64_t *a2, int *a3)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  char *v20;
  _OWORD *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
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
    a1[4] = a2[4];
    v12 = sub_21CC75180();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
    v15 = a3[8];
    v16 = a3[9];
    v17 = (uint64_t *)((char *)v4 + v15);
    v18 = (uint64_t *)((char *)a2 + v15);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = (char *)v4 + v16;
    v21 = (_OWORD *)((char *)a2 + v16);
    v22 = *(uint64_t *)((char *)a2 + v16 + 8);
    swift_bridgeObjectRetain();
    if (v22 >> 60 == 15)
    {
      *(_OWORD *)v20 = *v21;
    }
    else
    {
      v23 = *(_QWORD *)v21;
      sub_21CC54860(v23, v22);
      *(_QWORD *)v20 = v23;
      *((_QWORD *)v20 + 1) = v22;
    }
    v24 = a3[10];
    v25 = a3[11];
    v26 = (uint64_t *)((char *)v4 + v24);
    v27 = (uint64_t *)((char *)a2 + v24);
    v28 = v27[2];
    v26[1] = v27[1];
    v26[2] = v28;
    *v26 = *v27;
    *(uint64_t *)((char *)v4 + v25) = *(uint64_t *)((char *)a2 + v25);
    v29 = a3[12];
    v30 = (uint64_t *)((char *)v4 + v29);
    v31 = (uint64_t *)((char *)a2 + v29);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for RREntity(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_21CC75180();
  if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  v6 = (uint64_t *)(a1 + *(int *)(a2 + 36));
  v7 = v6[1];
  if (v7 >> 60 != 15)
    sub_21CC553D0(*v6, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for RREntity(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  char *v18;
  _OWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  v8 = a3[7];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_21CC75180();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  v13 = a3[8];
  v14 = a3[9];
  v15 = (_QWORD *)((char *)a1 + v13);
  v16 = (_QWORD *)((char *)a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = (char *)a1 + v14;
  v19 = (_OWORD *)((char *)a2 + v14);
  v20 = *(_QWORD *)((char *)a2 + v14 + 8);
  swift_bridgeObjectRetain();
  if (v20 >> 60 == 15)
  {
    *(_OWORD *)v18 = *v19;
  }
  else
  {
    v21 = *(_QWORD *)v19;
    sub_21CC54860(v21, v20);
    *(_QWORD *)v18 = v21;
    *((_QWORD *)v18 + 1) = v20;
  }
  v22 = a3[10];
  v23 = a3[11];
  v24 = (_QWORD *)((char *)a1 + v22);
  v25 = (_QWORD *)((char *)a2 + v22);
  v26 = v25[2];
  v24[1] = v25[1];
  v24[2] = v26;
  *v24 = *v25;
  *(_QWORD *)((char *)a1 + v23) = *(_QWORD *)((char *)a2 + v23);
  v27 = a3[12];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for RREntity(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  v6 = a3[7];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_21CC75180();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = *(_QWORD *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  v14 = a3[8];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[9];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v20 = *(_QWORD *)((char *)a2 + v17 + 8);
  if (*(_QWORD *)((char *)a1 + v17 + 8) >> 60 != 15)
  {
    if (v20 >> 60 != 15)
    {
      v22 = *v19;
      sub_21CC54860(v22, v20);
      v23 = *v18;
      v24 = v18[1];
      *v18 = v22;
      v18[1] = v20;
      sub_21CC553D0(v23, v24);
      goto LABEL_14;
    }
    sub_21CC58850((uint64_t)v18);
    goto LABEL_12;
  }
  if (v20 >> 60 == 15)
  {
LABEL_12:
    *(_OWORD *)v18 = *(_OWORD *)v19;
    goto LABEL_14;
  }
  v21 = *v19;
  sub_21CC54860(v21, v20);
  *v18 = v21;
  v18[1] = v20;
LABEL_14:
  v25 = a3[10];
  v26 = (_QWORD *)((char *)a1 + v25);
  v27 = (char *)a2 + v25;
  *v26 = *(_QWORD *)((char *)a2 + v25);
  v26[1] = *(_QWORD *)((char *)a2 + v25 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v26[2] = *((_QWORD *)v27 + 2);
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = a3[12];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (_QWORD *)((char *)a2 + v28);
  *v29 = *v30;
  v29[1] = v30[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_21CC58850(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

uint64_t initializeWithTake for RREntity(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  __int128 v17;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_21CC75180();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  v12 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  v13 = a3[10];
  v14 = a3[11];
  v15 = a1 + v13;
  v16 = (__int128 *)(a2 + v13);
  v17 = *v16;
  *(_QWORD *)(v15 + 16) = *((_QWORD *)v16 + 2);
  *(_OWORD *)v15 = v17;
  *(_QWORD *)(a1 + v14) = *(_QWORD *)(a2 + v14);
  *(_OWORD *)(a1 + a3[12]) = *(_OWORD *)(a2 + a3[12]);
  return a1;
}

_QWORD *assignWithTake for RREntity(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int EnumTagSinglePayload;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_release();
  v8 = a3[7];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_21CC75180();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (EnumTagSinglePayload)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v14 = *(_QWORD *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
LABEL_7:
  v16 = a3[8];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = a3[9];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v24 = *(_QWORD *)((char *)a1 + v21 + 8);
  if (v24 >> 60 != 15)
  {
    v25 = v23[1];
    if (v25 >> 60 != 15)
    {
      v26 = *v22;
      *v22 = *v23;
      v22[1] = v25;
      sub_21CC553D0(v26, v24);
      goto LABEL_12;
    }
    sub_21CC58850((uint64_t)v22);
  }
  *(_OWORD *)v22 = *(_OWORD *)v23;
LABEL_12:
  v27 = a3[10];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (char *)a2 + v27;
  v30 = *(_QWORD *)((char *)a2 + v27 + 8);
  *v28 = *(_QWORD *)((char *)a2 + v27);
  v28[1] = v30;
  swift_bridgeObjectRelease();
  v28[2] = *((_QWORD *)v29 + 2);
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  swift_bridgeObjectRelease();
  v31 = a3[12];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  v35 = *v33;
  v34 = v33[1];
  *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RREntity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21CC58B8C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for RREntity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_21CC58C10(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(a1 + 8) = (a2 - 1);
    OUTLINED_FUNCTION_44();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
    __swift_storeEnumTagSinglePayload(a1 + *(int *)(a4 + 28), a2, a2, v7);
  }
}

void sub_21CC58C78()
{
  unint64_t v0;

  sub_21CC58D28();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_21CC58D28()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254072EB8)
  {
    sub_21CC75180();
    v0 = sub_21CC75294();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254072EB8);
  }
}

uint64_t getEnumTagSinglePayload for RREntityError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RREntityError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21CC58E14 + 4 * byte_21CC762BF[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21CC58E34 + 4 * byte_21CC762C4[v4]))();
}

_BYTE *sub_21CC58E14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21CC58E34(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CC58E3C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CC58E44(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CC58E4C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CC58E54(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21CC58E60()
{
  return 0;
}

ValueMetadata *type metadata accessor for RREntityError()
{
  return &type metadata for RREntityError;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RREntity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF8)
  {
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
    v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v5 = v6 - 9;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for RREntity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC58F58 + 4 * byte_21CC762CE[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_21CC58F8C + 4 * byte_21CC762C9[v4]))();
}

uint64_t sub_21CC58F8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC58F94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC58F9CLL);
  return result;
}

uint64_t sub_21CC58FA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC58FB0);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_21CC58FB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC58FBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC58FC8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21CC58FD0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RREntity.CodingKeys()
{
  return &type metadata for RREntity.CodingKeys;
}

unint64_t sub_21CC58FEC()
{
  unint64_t result;

  result = qword_25531CDD0;
  if (!qword_25531CDD0)
  {
    result = MEMORY[0x220789FD0]("!XD1|:", &type metadata for RREntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CDD0);
  }
  return result;
}

unint64_t sub_21CC5902C()
{
  unint64_t result;

  result = qword_25531CDD8;
  if (!qword_25531CDD8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC764F0, &type metadata for RREntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CDD8);
  }
  return result;
}

unint64_t sub_21CC5906C()
{
  unint64_t result;

  result = qword_25531CDE0;
  if (!qword_25531CDE0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76518, &type metadata for RREntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CDE0);
  }
  return result;
}

uint64_t sub_21CC590A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t result;

  if (a7 != 1)
  {
    if (a7 != 5)
      return result;
    swift_bridgeObjectRetain();
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_21CC590E8()
{
  unint64_t result;

  result = qword_25531CDE8;
  if (!qword_25531CDE8)
  {
    result = MEMORY[0x220789FD0]("1ZD10)", &type metadata for RRSurroundingText);
    atomic_store(result, (unint64_t *)&qword_25531CDE8);
  }
  return result;
}

uint64_t sub_21CC59124(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21CC5914C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t result;

  if (a7 != 1)
  {
    if (a7 != 5)
      return result;
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return type metadata accessor for RREntity();
}

uint64_t OUTLINED_FUNCTION_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_8()
{
  _OWORD *v0;
  uint64_t v1;

  *(_OWORD *)(v1 - 144) = *v0;
  return sub_21CC75180();
}

__n128 OUTLINED_FUNCTION_9@<Q0>(__n128 *a1@<X8>, __n128 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __n128 result;

  *v6 = v7;
  v6[1] = a5;
  v12 = (_QWORD *)(v10 + *(int *)(v11 + 36));
  *v12 = a6;
  v12[1] = v8;
  result = a2;
  *a1 = a2;
  a1[1].n128_u64[0] = v9;
  return result;
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_21CC75180();
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;

  return sub_21CC57E60(v0);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_21CC753CC();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_21CC75438();
}

void OUTLINED_FUNCTION_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  *v5 = v4;
  v5[1] = v3;
  v5[2] = v2;
  v5[3] = v1;
  v5[4] = v0;
}

uint64_t OUTLINED_FUNCTION_22()
{
  return sub_21CC75450();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1)
{
  uint64_t v1;

  return sub_21CC57E1C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_21CC753FC();
}

uint64_t OUTLINED_FUNCTION_31@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return sub_21CC753F0();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_21CC75390();
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1)
{
  uint64_t v1;

  return sub_21CC57E1C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_34(uint64_t a1)
{
  uint64_t v1;

  return sub_21CC57E1C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_35()
{
  uint64_t v0;

  return sub_21CC57E60(v0);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return sub_21CC751EC();
}

uint64_t OUTLINED_FUNCTION_37()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_38()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21CC57E1C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21CC57E1C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_40()
{
  uint64_t v0;

  return sub_21CC57E60(v0);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_21CC75408();
}

uint64_t OUTLINED_FUNCTION_45@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X7>, _QWORD *a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

uint64_t OUTLINED_FUNCTION_46()
{
  uint64_t v0;

  return sub_21CC57E60(v0);
}

uint64_t OUTLINED_FUNCTION_47@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 112) = a1;
  return sub_21CC75378();
}

uint64_t OUTLINED_FUNCTION_48(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_21CC75180();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_21CC75000();
}

void OUTLINED_FUNCTION_51()
{
  JUMPOUT(0x22078988CLL);
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_21CC7500C();
}

uint64_t OUTLINED_FUNCTION_53()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21CC57E1C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_54()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21CC57E1C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_57()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_58()
{
  uint64_t v0;

  return sub_21CC57E60(v0);
}

uint64_t OUTLINED_FUNCTION_59()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_60()
{
  uint64_t v0;

  return sub_21CC57E60(v0);
}

uint64_t OUTLINED_FUNCTION_65(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return sub_21CC5914C(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t OUTLINED_FUNCTION_66()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_67()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_21CC7503C();
}

uint64_t OUTLINED_FUNCTION_69()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 224));
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_72()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_73@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X7>, _QWORD *a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;

  return RREntity.init<A>(id:appBundleId:usoEntity:typedValue:intentEntity:group:metadata:restrictedEntityKey:)(a1, a2, a3, a4, a5, v10, *(_QWORD *)(v11 - 112), a6, a7, a8, a9, a10);
}

uint64_t OUTLINED_FUNCTION_74()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0Tm(v0);
}

uint64_t OUTLINED_FUNCTION_75()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_76()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_78()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21CC57E1C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_79()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_80()
{
  return sub_21CC751D4();
}

uint64_t OUTLINED_FUNCTION_81()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21CC57E1C(v0, *(_QWORD *)(v1 - 88));
}

uint64_t OUTLINED_FUNCTION_82()
{
  uint64_t v0;

  return sub_21CC57E60(v0);
}

__n128 OUTLINED_FUNCTION_83()
{
  uint64_t v0;
  uint64_t v1;
  __n128 result;

  result = *(__n128 *)(v1 - 144);
  *(__n128 *)(v1 - 104) = result;
  *(_QWORD *)(v1 - 88) = v0;
  return result;
}

uint64_t OUTLINED_FUNCTION_84()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_85()
{
  uint64_t v0;

  return sub_21CC57E60(*(_QWORD *)(v0 - 88));
}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_89()
{
  unint64_t v0;
  uint64_t v1;

  return sub_21CC553BC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_90()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_91()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_92()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_93(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_94()
{
  unint64_t v0;
  uint64_t v1;

  return sub_21CC553BC(*(_QWORD *)(v1 - 96), v0);
}

uint64_t OUTLINED_FUNCTION_95(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_97()
{
  return sub_21CC75138();
}

uint64_t OUTLINED_FUNCTION_98()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_99()
{
  unint64_t v0;
  uint64_t v1;

  return sub_21CC553BC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_100()
{
  uint64_t v0;
  uint64_t v1;

  return sub_21CC57E1C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_101()
{
  uint64_t v0;

  return sub_21CC57E60(v0);
}

uint64_t OUTLINED_FUNCTION_102()
{
  uint64_t v0;
  unint64_t v1;

  return sub_21CC553BC(v0, v1);
}

void RRResult.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  char *v6;

  type metadata accessor for RRCandidate(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_62();
  type metadata accessor for RRResult(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_62();
  sub_21CC5B7F8(v0, v4 - v3, v5);
  v6 = (char *)sub_21CC59814 + 4 * byte_21CC76600[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_21CC59814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_21CC5B688(v1, v0, type metadata accessor for RRCandidate);
  *(_QWORD *)(v2 - 64) = 0;
  *(_QWORD *)(v2 - 56) = 0xE000000000000000;
  sub_21CC752E8();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_27_0(v3 + 2);
  *(_QWORD *)(v2 - 80) = 0;
  *(_QWORD *)(v2 - 72) = 0xE000000000000000;
  RREntity.description.getter();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_0();
  sub_21CC75264();
  sub_21CC751EC();
  OUTLINED_FUNCTION_71();
  v4 = *(_QWORD *)(v2 - 64);
  sub_21CC5B860(v0, type metadata accessor for RRCandidate);
  return v4;
}

uint64_t type metadata accessor for RRCandidate(uint64_t a1)
{
  return sub_21CC599D4(a1, (uint64_t *)&unk_254072CF0);
}

uint64_t type metadata accessor for RRResult(uint64_t a1)
{
  return sub_21CC599D4(a1, (uint64_t *)&unk_2540728E8);
}

uint64_t sub_21CC599D4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21CC59A04(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x74614D646E756F66 && a2 == 0xEA00000000006863;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000021CC75B90 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000021CC75BB0 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000021CC75BD0 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x686374614D6F6ELL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v7 = sub_21CC75450();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_21CC59C0C()
{
  return 5;
}

uint64_t sub_21CC59C14(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21CC59C4C + 4 * byte_21CC76605[a1]))(0x74614D646E756F66, 0xEA00000000006863);
}

unint64_t sub_21CC59C4C()
{
  return 0xD000000000000013;
}

uint64_t sub_21CC59CA4()
{
  return 0x686374614D6F6ELL;
}

uint64_t sub_21CC59CBC()
{
  return sub_21CC754C8();
}

uint64_t sub_21CC59CE0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x74616469646E6163 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_21CC75450();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_21CC59D70()
{
  return 0x74616469646E6163;
}

uint64_t sub_21CC59D8C()
{
  return 0x74616469646E6163;
}

uint64_t sub_21CC59DA8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x74616469646E6163 && a2 == 0xEA00000000007365)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_21CC75450();
    OUTLINED_FUNCTION_71();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_21CC59E34()
{
  sub_21CC754BC();
  OUTLINED_FUNCTION_31_0();
  sub_21CC754EC();
  OUTLINED_FUNCTION_30_0();
}

uint64_t sub_21CC59E64()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_21CC59E80()
{
  return 0;
}

uint64_t sub_21CC59E8C()
{
  unsigned __int8 *v0;

  return sub_21CC59C14(*v0);
}

uint64_t sub_21CC59E94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC59A04(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC59EB8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC59C0C();
  *a1 = result;
  return result;
}

uint64_t sub_21CC59EDC()
{
  sub_21CC5B49C();
  return sub_21CC75534();
}

uint64_t sub_21CC59F04()
{
  sub_21CC5B49C();
  return sub_21CC75540();
}

void sub_21CC59F30()
{
  sub_21CC59E34();
}

uint64_t sub_21CC59F50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC59CE0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_21CC59F78()
{
  sub_21CC5B64C();
  return sub_21CC75534();
}

uint64_t sub_21CC59FA0()
{
  sub_21CC5B64C();
  return sub_21CC75540();
}

uint64_t sub_21CC59FCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC59DA8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_21CC59FF4()
{
  sub_21CC5B5D4();
  return sub_21CC75534();
}

uint64_t sub_21CC5A01C()
{
  sub_21CC5B5D4();
  return sub_21CC75540();
}

uint64_t sub_21CC5A044()
{
  sub_21CC5B610();
  return sub_21CC75534();
}

uint64_t sub_21CC5A06C()
{
  sub_21CC5B610();
  return sub_21CC75540();
}

void sub_21CC5A094()
{
  sub_21CC754BC();
  OUTLINED_FUNCTION_31_0();
  sub_21CC754EC();
  OUTLINED_FUNCTION_30_0();
}

uint64_t sub_21CC5A0C0()
{
  sub_21CC5B514();
  return sub_21CC75534();
}

uint64_t sub_21CC5A0E8()
{
  sub_21CC5B514();
  return sub_21CC75540();
}

uint64_t sub_21CC5A114@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC59E64();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21CC5A13C()
{
  return sub_21CC573D0();
}

uint64_t sub_21CC5A154@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC57DA0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_21CC5A17C()
{
  sub_21CC5B4D8();
  return sub_21CC75534();
}

uint64_t sub_21CC5A1A4()
{
  sub_21CC5B4D8();
  return sub_21CC75540();
}

void RRResult.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
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
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254072A28);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_15_0(v4, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072A48);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072A38);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_16_0(v7, v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072A40);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072A30);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v9);
  v10 = OUTLINED_FUNCTION_17_0();
  type metadata accessor for RRCandidate(v10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_62();
  type metadata accessor for RRResult(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_24_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072A20);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_62();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC5B49C();
  sub_21CC75528();
  sub_21CC5B7F8(v17, v1, type metadata accessor for RRResult);
  v14 = (char *)sub_21CC5A3BC + 4 * byte_21CC7660A[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_21CC5A3BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);

  sub_21CC5B688(v1, v0, type metadata accessor for RRCandidate);
  *(_BYTE *)(v3 - 72) = 0;
  sub_21CC5B64C();
  OUTLINED_FUNCTION_6_0();
  sub_21CC5B7BC(&qword_25531CE18, type metadata accessor for RRCandidate, (uint64_t)&protocol conformance descriptor for RRCandidate);
  v4 = *(_QWORD *)(v3 - 216);
  sub_21CC75438();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 224) + 8))(v2, v4);
  sub_21CC5B860(v0, type metadata accessor for RRCandidate);
  v5 = OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_8_0(v5, v6);
  OUTLINED_FUNCTION_0();
}

void RRResult.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v17;
  uint64_t v18;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51[9];
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
  _QWORD *v66;
  uint64_t v67;

  v56 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CE38);
  v59 = *(_QWORD *)(v4 - 8);
  v60 = v4;
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_15_0(v6, v51[0]);
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CE40);
  v62 = *(_QWORD *)(v55 - 8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_1_0();
  v61 = v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CE48);
  v53 = *(_QWORD *)(v9 - 8);
  v54 = v9;
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1_0();
  v58 = v11;
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CE50);
  v51[6] = *(_QWORD *)(v52 - 8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_16_0(v13, v51[0]);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CE58);
  v51[7] = *(_QWORD *)(v14 - 8);
  v51[8] = v14;
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_1_0();
  v57 = v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CE60);
  v64 = *(_QWORD *)(v17 - 8);
  v65 = v17;
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v18);
  v19 = OUTLINED_FUNCTION_17_0();
  v63 = type metadata accessor for RRResult(v19);
  OUTLINED_FUNCTION_0_0();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v51 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)v51 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)v51 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)v51 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)v51 - v33;
  v35 = a1[3];
  v66 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v35);
  sub_21CC5B49C();
  v36 = v67;
  sub_21CC75510();
  if (!v36)
  {
    v51[4] = (uint64_t)v32;
    v51[1] = (uint64_t)v29;
    v51[2] = (uint64_t)v23;
    v51[3] = (uint64_t)v26;
    v51[5] = (uint64_t)v34;
    v37 = v65;
    v67 = v2;
    v38 = sub_21CC753D8();
    v39 = *(_QWORD *)(v38 + 16);
    if (v39)
    {
      v51[0] = 0;
      v40 = *(unsigned __int8 *)(v38 + 32);
      sub_21CC5D880(1, v39, v38, v38 + 32, 0, (2 * v39) | 1);
      v42 = v41;
      v44 = v43;
      swift_bridgeObjectRelease();
      if (v42 == v44 >> 1)
        __asm { BR              X9 }
    }
    v45 = v63;
    v46 = sub_21CC75318();
    swift_allocError();
    v48 = v47;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531CE68);
    *v48 = v45;
    sub_21CC7536C();
    sub_21CC75300();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v48, *MEMORY[0x24BEE26D0], v46);
    swift_willThrow();
    OUTLINED_FUNCTION_4_0();
    v49 = OUTLINED_FUNCTION_25_0();
    v50(v49, v37);
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v66);
  OUTLINED_FUNCTION_0();
}

void sub_21CC5ABA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_32_0();
  v3 = *(_QWORD *)(v2 - 176);
  OUTLINED_FUNCTION_5_0();
  if (v0)
  {
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_25_0();
    JUMPOUT(0x21CC5AB84);
  }
  OUTLINED_FUNCTION_36_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_4_0();
  v4 = OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_14_0(v4, v5);
  swift_storeEnumTagMultiPayload();
  JUMPOUT(0x21CC5AD5CLL);
}

void sub_21CC5AD7C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  RRResult.init(from:)(a1, a2);
}

void sub_21CC5AD90(_QWORD *a1)
{
  RRResult.encode(to:)(a1);
}

void RRCandidate.entity.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_21CC5B7F8(v1, a1, (uint64_t (*)(_QWORD))type metadata accessor for RREntity);
}

double RRCandidate.score.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for RRCandidate(0) + 20));
}

uint64_t RRCandidate.init(entity:score:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  uint64_t result;

  sub_21CC5B688(a1, a2, (uint64_t (*)(_QWORD))type metadata accessor for RREntity);
  result = type metadata accessor for RRCandidate(0);
  *(double *)(a2 + *(int *)(result + 20)) = a3;
  return result;
}

uint64_t RRCandidate.description.getter()
{
  RREntity.description.getter();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_12_0();
  type metadata accessor for RRCandidate(0);
  sub_21CC75264();
  return 0;
}

BOOL sub_21CC5AEB4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_21CC5AEC4()
{
  return sub_21CC754C8();
}

uint64_t sub_21CC5AEE8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x797469746E65 && a2 == 0xE600000000000000;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_21CC75450();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21CC5AFC4()
{
  return 2;
}

uint64_t sub_21CC5AFCC()
{
  sub_21CC754BC();
  sub_21CC754C8();
  return sub_21CC754EC();
}

uint64_t sub_21CC5B010(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65726F6373;
  else
    return 0x797469746E65;
}

BOOL sub_21CC5B040(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_21CC5AEB4(*a1, *a2);
}

uint64_t sub_21CC5B04C()
{
  return sub_21CC5AFCC();
}

uint64_t sub_21CC5B054()
{
  return sub_21CC5AEC4();
}

uint64_t sub_21CC5B05C()
{
  char *v0;

  return sub_21CC5B010(*v0);
}

uint64_t sub_21CC5B064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC5AEE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC5B088@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC5AFC4();
  *a1 = result;
  return result;
}

uint64_t sub_21CC5B0AC()
{
  sub_21CC5B824();
  return sub_21CC75534();
}

uint64_t sub_21CC5B0D4()
{
  sub_21CC5B824();
  return sub_21CC75540();
}

uint64_t RRCandidate.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CE88);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_62();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC5B824();
  sub_21CC75528();
  type metadata accessor for RREntity();
  sub_21CC5B7BC(&qword_25531CE98, (uint64_t (*)(uint64_t))type metadata accessor for RREntity, (uint64_t)&protocol conformance descriptor for RREntity);
  sub_21CC75438();
  if (!v1)
  {
    type metadata accessor for RRCandidate(0);
    sub_21CC75420();
  }
  return OUTLINED_FUNCTION_36_0(v7, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

void RRCandidate.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  char v22;
  char v23;

  v18 = a2;
  v19 = type metadata accessor for RREntity();
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1_0();
  v20 = v6;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CEA0);
  v7 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_24_0();
  v8 = type metadata accessor for RRCandidate(0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC5B824();
  sub_21CC75510();
  if (v2)
  {
    OUTLINED_FUNCTION_33_0();
  }
  else
  {
    v17 = v8;
    v12 = (uint64_t)v11;
    v13 = v18;
    v23 = 0;
    sub_21CC5B7BC(&qword_25531CEA8, (uint64_t (*)(uint64_t))type metadata accessor for RREntity, (uint64_t)&protocol conformance descriptor for RREntity);
    v14 = v20;
    sub_21CC753CC();
    sub_21CC5B688(v14, v12, (uint64_t (*)(_QWORD))type metadata accessor for RREntity);
    v22 = 1;
    sub_21CC753B4();
    v16 = v15;
    OUTLINED_FUNCTION_8_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    *(_QWORD *)(v12 + *(int *)(v17 + 20)) = v16;
    sub_21CC5B7F8(v12, v13, type metadata accessor for RRCandidate);
    OUTLINED_FUNCTION_33_0();
    sub_21CC5B860(v12, type metadata accessor for RRCandidate);
  }
}

void sub_21CC5B470(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  RRCandidate.init(from:)(a1, a2);
}

uint64_t sub_21CC5B484(_QWORD *a1)
{
  return RRCandidate.encode(to:)(a1);
}

unint64_t sub_21CC5B49C()
{
  unint64_t result;

  result = qword_2540729A0;
  if (!qword_2540729A0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76EB4, &type metadata for RRResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729A0);
  }
  return result;
}

unint64_t sub_21CC5B4D8()
{
  unint64_t result;

  result = qword_2540729B8;
  if (!qword_2540729B8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76E64, &type metadata for RRResult.NoMatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729B8);
  }
  return result;
}

unint64_t sub_21CC5B514()
{
  unint64_t result;

  result = qword_25531CDF8;
  if (!qword_25531CDF8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76E14, &type metadata for RRResult.NeedsDisambiguationPluralCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CDF8);
  }
  return result;
}

unint64_t sub_21CC5B550()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_25531CE08;
  if (!qword_25531CE08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531CE00);
    v2 = MEMORY[0x24BEE12A0];
    v3 = sub_21CC5B738(&qword_25531CE10, &qword_25531CE18, (uint64_t)&protocol conformance descriptor for RRCandidate, MEMORY[0x24BEE12A0]);
    result = MEMORY[0x220789FD0](v2, v1, &v3);
    atomic_store(result, (unint64_t *)&qword_25531CE08);
  }
  return result;
}

unint64_t sub_21CC5B5D4()
{
  unint64_t result;

  result = qword_25531CE20;
  if (!qword_25531CE20)
  {
    result = MEMORY[0x220789FD0]("}TD1<3", &type metadata for RRResult.FoundMatchPluralCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CE20);
  }
  return result;
}

unint64_t sub_21CC5B610()
{
  unint64_t result;

  result = qword_25531CE28;
  if (!qword_25531CE28)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76D74, &type metadata for RRResult.NeedsDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CE28);
  }
  return result;
}

unint64_t sub_21CC5B64C()
{
  unint64_t result;

  result = qword_25531CE30;
  if (!qword_25531CE30)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76D24, &type metadata for RRResult.FoundMatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CE30);
  }
  return result;
}

void sub_21CC5B688(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_21(a1, a2, a3);
  OUTLINED_FUNCTION_35_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_55();
}

unint64_t sub_21CC5B6B4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  result = qword_25531CE70;
  if (!qword_25531CE70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531CE00);
    v2 = MEMORY[0x24BEE12D0];
    v3 = sub_21CC5B738(&qword_25531CE78, &qword_25531CE80, (uint64_t)&protocol conformance descriptor for RRCandidate, MEMORY[0x24BEE12D0]);
    result = MEMORY[0x220789FD0](v2, v1, &v3);
    atomic_store(result, (unint64_t *)&qword_25531CE70);
  }
  return result;
}

uint64_t sub_21CC5B738(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531CDF0);
    sub_21CC5B7BC(a2, type metadata accessor for RRCandidate, a3);
    v11 = v10;
    result = MEMORY[0x220789FD0](a4, v9, &v11);
    atomic_store(result, a1);
  }
  return result;
}

void sub_21CC5B7BC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x220789FD0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_55();
}

void sub_21CC5B7F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_21(a1, a2, a3);
  OUTLINED_FUNCTION_35_0(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_55();
}

unint64_t sub_21CC5B824()
{
  unint64_t result;

  result = qword_25531CE90;
  if (!qword_25531CE90)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76CD4, &type metadata for RRCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CE90);
  }
  return result;
}

void sub_21CC5B860(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_55();
}

uint64_t *initializeBufferWithCopyOfBuffer for RRResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _OWORD *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        v8 = a2[3];
        a1[2] = a2[2];
        a1[3] = v8;
        a1[4] = a2[4];
        v9 = (int *)type metadata accessor for RREntity();
        v10 = v9[7];
        v11 = (char *)a1 + v10;
        v12 = (char *)a2 + v10;
        v13 = sub_21CC75180();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
        {
          v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
          memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
          __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
        }
        v16 = v9[8];
        v17 = (uint64_t *)((char *)a1 + v16);
        v18 = (uint64_t *)((char *)a2 + v16);
        v19 = v18[1];
        *v17 = *v18;
        v17[1] = v19;
        v20 = v9[9];
        v21 = (char *)a1 + v20;
        v22 = (_OWORD *)((char *)a2 + v20);
        v23 = *(uint64_t *)((char *)a2 + v20 + 8);
        swift_bridgeObjectRetain();
        if (v23 >> 60 == 15)
        {
          *(_OWORD *)v21 = *v22;
        }
        else
        {
          v24 = *(_QWORD *)v22;
          sub_21CC54860(v24, v23);
          *(_QWORD *)v21 = v24;
          *((_QWORD *)v21 + 1) = v23;
        }
        v25 = v9[10];
        v26 = (uint64_t *)((char *)a1 + v25);
        v27 = (uint64_t *)((char *)a2 + v25);
        v28 = v27[1];
        *v26 = *v27;
        v26[1] = v28;
        v26[2] = v27[2];
        *(uint64_t *)((char *)a1 + v9[11]) = *(uint64_t *)((char *)a2 + v9[11]);
        v29 = v9[12];
        v30 = (uint64_t *)((char *)a1 + v29);
        v31 = (uint64_t *)((char *)a2 + v29);
        v32 = v31[1];
        *v30 = *v31;
        v30[1] = v32;
        v33 = type metadata accessor for RRCandidate(0);
        *(uint64_t *)((char *)a1 + *(int *)(v33 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v33 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_13;
      case 1u:
      case 2u:
      case 3u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
LABEL_13:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t destroy for RRResult(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;

  result = swift_getEnumCaseMultiPayload();
  if ((result - 1) >= 3)
  {
    if ((_DWORD)result)
      return result;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    v3 = type metadata accessor for RREntity();
    v4 = a1 + *(int *)(v3 + 28);
    v5 = sub_21CC75180();
    if (!__swift_getEnumTagSinglePayload(v4, 1, v5))
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
    swift_bridgeObjectRelease();
    v6 = (uint64_t *)(a1 + *(int *)(v3 + 36));
    v7 = v6[1];
    if (v7 >> 60 != 15)
      sub_21CC553D0(*v6, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for RRResult(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _OWORD *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      v7 = a2[3];
      a1[2] = a2[2];
      a1[3] = v7;
      a1[4] = a2[4];
      v8 = (int *)type metadata accessor for RREntity();
      v9 = v8[7];
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_21CC75180();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      }
      v14 = v8[8];
      v15 = (_QWORD *)((char *)a1 + v14);
      v16 = (_QWORD *)((char *)a2 + v14);
      v17 = v16[1];
      *v15 = *v16;
      v15[1] = v17;
      v18 = v8[9];
      v19 = (char *)a1 + v18;
      v20 = (_OWORD *)((char *)a2 + v18);
      v21 = *(_QWORD *)((char *)a2 + v18 + 8);
      swift_bridgeObjectRetain();
      if (v21 >> 60 == 15)
      {
        *(_OWORD *)v19 = *v20;
      }
      else
      {
        v22 = *(_QWORD *)v20;
        sub_21CC54860(v22, v21);
        *(_QWORD *)v19 = v22;
        *((_QWORD *)v19 + 1) = v21;
      }
      v23 = v8[10];
      v24 = (_QWORD *)((char *)a1 + v23);
      v25 = (_QWORD *)((char *)a2 + v23);
      v26 = v25[1];
      *v24 = *v25;
      v24[1] = v26;
      v24[2] = v25[2];
      *(_QWORD *)((char *)a1 + v8[11]) = *(_QWORD *)((char *)a2 + v8[11]);
      v27 = v8[12];
      v28 = (_QWORD *)((char *)a1 + v27);
      v29 = (_QWORD *)((char *)a2 + v27);
      v30 = v29[1];
      *v28 = *v29;
      v28[1] = v30;
      v31 = type metadata accessor for RRCandidate(0);
      *(_QWORD *)((char *)a1 + *(int *)(v31 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v31 + 20));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_11;
    case 1u:
    case 2u:
    case 3u:
      *a1 = *a2;
      swift_bridgeObjectRetain();
LABEL_11:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *assignWithCopy for RRResult(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  _OWORD *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;

  if (a1 != a2)
  {
    sub_21CC5B860((uint64_t)a1, type metadata accessor for RRResult);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        a1[2] = a2[2];
        a1[3] = a2[3];
        a1[4] = a2[4];
        v6 = (int *)type metadata accessor for RREntity();
        v7 = v6[7];
        v8 = (char *)a1 + v7;
        v9 = (char *)a2 + v7;
        v10 = sub_21CC75180();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
        if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
        {
          v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
          memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
          __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
        }
        v12 = v6[8];
        v13 = (_QWORD *)((char *)a1 + v12);
        v14 = (_QWORD *)((char *)a2 + v12);
        *v13 = *v14;
        v13[1] = v14[1];
        v15 = v6[9];
        v16 = (char *)a1 + v15;
        v17 = (_OWORD *)((char *)a2 + v15);
        v18 = *(_QWORD *)((char *)a2 + v15 + 8);
        swift_bridgeObjectRetain();
        if (v18 >> 60 == 15)
        {
          *(_OWORD *)v16 = *v17;
        }
        else
        {
          v19 = *(_QWORD *)v17;
          sub_21CC54860(v19, v18);
          *(_QWORD *)v16 = v19;
          *((_QWORD *)v16 + 1) = v18;
        }
        v20 = v6[10];
        v21 = (_QWORD *)((char *)a1 + v20);
        v22 = (_QWORD *)((char *)a2 + v20);
        *v21 = *v22;
        v21[1] = v22[1];
        v21[2] = v22[2];
        *(_QWORD *)((char *)a1 + v6[11]) = *(_QWORD *)((char *)a2 + v6[11]);
        v23 = v6[12];
        v24 = (_QWORD *)((char *)a1 + v23);
        v25 = (_QWORD *)((char *)a2 + v23);
        *v24 = *v25;
        v24[1] = v25[1];
        v26 = type metadata accessor for RRCandidate(0);
        *(_QWORD *)((char *)a1 + *(int *)(v26 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v26 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        goto LABEL_12;
      case 1u:
      case 2u:
      case 3u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
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

_OWORD *initializeWithTake for RRResult(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
    v7 = (int *)type metadata accessor for RREntity();
    v8 = v7[7];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_21CC75180();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
    }
    *(_OWORD *)((char *)a1 + v7[8]) = *(_OWORD *)((char *)a2 + v7[8]);
    *(_OWORD *)((char *)a1 + v7[9]) = *(_OWORD *)((char *)a2 + v7[9]);
    v13 = v7[10];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    *(_OWORD *)v14 = *(_OWORD *)v15;
    *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
    *(_QWORD *)((char *)a1 + v7[11]) = *(_QWORD *)((char *)a2 + v7[11]);
    *(_OWORD *)((char *)a1 + v7[12]) = *(_OWORD *)((char *)a2 + v7[12]);
    v16 = type metadata accessor for RRCandidate(0);
    *(_QWORD *)((char *)a1 + *(int *)(v16 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v16 + 20));
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *assignWithTake for RRResult(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  if (a1 != a2)
  {
    sub_21CC5B860((uint64_t)a1, type metadata accessor for RRResult);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      *((_QWORD *)a1 + 4) = *((_QWORD *)a2 + 4);
      v7 = (int *)type metadata accessor for RREntity();
      v8 = v7[7];
      v9 = (char *)a1 + v8;
      v10 = (char *)a2 + v8;
      v11 = sub_21CC75180();
      if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
      {
        v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
        __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      }
      *(_OWORD *)((char *)a1 + v7[8]) = *(_OWORD *)((char *)a2 + v7[8]);
      *(_OWORD *)((char *)a1 + v7[9]) = *(_OWORD *)((char *)a2 + v7[9]);
      v13 = v7[10];
      v14 = (char *)a1 + v13;
      v15 = (char *)a2 + v13;
      *(_OWORD *)v14 = *(_OWORD *)v15;
      *((_QWORD *)v14 + 2) = *((_QWORD *)v15 + 2);
      *(_QWORD *)((char *)a1 + v7[11]) = *(_QWORD *)((char *)a2 + v7[11]);
      *(_OWORD *)((char *)a1 + v7[12]) = *(_OWORD *)((char *)a2 + v7[12]);
      v16 = type metadata accessor for RRCandidate(0);
      *(_QWORD *)((char *)a1 + *(int *)(v16 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v16 + 20));
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_21CC5C440()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21CC5C450()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for RRCandidate(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for RRCandidate(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _OWORD *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;

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
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    a1[4] = a2[4];
    v9 = (int *)type metadata accessor for RREntity();
    v10 = v9[7];
    v11 = (char *)v4 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_21CC75180();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v13))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v13);
    }
    v16 = v9[8];
    v17 = (uint64_t *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    v20 = v9[9];
    v21 = (char *)v4 + v20;
    v22 = (_OWORD *)((char *)a2 + v20);
    v23 = *(uint64_t *)((char *)a2 + v20 + 8);
    swift_bridgeObjectRetain();
    if (v23 >> 60 == 15)
    {
      *(_OWORD *)v21 = *v22;
    }
    else
    {
      v24 = *(_QWORD *)v22;
      sub_21CC54860(v24, v23);
      *(_QWORD *)v21 = v24;
      *((_QWORD *)v21 + 1) = v23;
    }
    v25 = v9[10];
    v26 = (uint64_t *)((char *)v4 + v25);
    v27 = (uint64_t *)((char *)a2 + v25);
    v28 = v27[1];
    *v26 = *v27;
    v26[1] = v28;
    v26[2] = v27[2];
    *(uint64_t *)((char *)v4 + v9[11]) = *(uint64_t *)((char *)a2 + v9[11]);
    v29 = v9[12];
    v30 = (uint64_t *)((char *)v4 + v29);
    v31 = (uint64_t *)((char *)a2 + v29);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for RRCandidate(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  v2 = type metadata accessor for RREntity();
  v3 = a1 + *(int *)(v2 + 28);
  v4 = sub_21CC75180();
  if (!__swift_getEnumTagSinglePayload(v3, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (uint64_t *)(a1 + *(int *)(v2 + 36));
  v6 = v5[1];
  if (v6 >> 60 != 15)
    sub_21CC553D0(*v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for RRCandidate(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _OWORD *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  v8 = (int *)type metadata accessor for RREntity();
  v9 = v8[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_21CC75180();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  }
  v14 = v8[8];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = v8[9];
  v19 = (char *)a1 + v18;
  v20 = (_OWORD *)((char *)a2 + v18);
  v21 = *(_QWORD *)((char *)a2 + v18 + 8);
  swift_bridgeObjectRetain();
  if (v21 >> 60 == 15)
  {
    *(_OWORD *)v19 = *v20;
  }
  else
  {
    v22 = *(_QWORD *)v20;
    sub_21CC54860(v22, v21);
    *(_QWORD *)v19 = v22;
    *((_QWORD *)v19 + 1) = v21;
  }
  v23 = v8[10];
  v24 = (_QWORD *)((char *)a1 + v23);
  v25 = (_QWORD *)((char *)a2 + v23);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  v24[2] = v25[2];
  *(_QWORD *)((char *)a1 + v8[11]) = *(_QWORD *)((char *)a2 + v8[11]);
  v27 = v8[12];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for RRCandidate(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int EnumTagSinglePayload;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_retain();
  swift_release();
  v6 = (int *)type metadata accessor for RREntity();
  v7 = v6[7];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_21CC75180();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10);
  v12 = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10);
  if (EnumTagSinglePayload)
  {
    if (!v12)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v13 = *(_QWORD *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v10);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v8, v9, v10);
LABEL_7:
  v15 = v6[8];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = v6[9];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  v21 = *(_QWORD *)((char *)a2 + v18 + 8);
  if (*(_QWORD *)((char *)a1 + v18 + 8) >> 60 != 15)
  {
    if (v21 >> 60 != 15)
    {
      v23 = *v20;
      sub_21CC54860(v23, v21);
      v24 = *v19;
      v25 = v19[1];
      *v19 = v23;
      v19[1] = v21;
      sub_21CC553D0(v24, v25);
      goto LABEL_14;
    }
    sub_21CC58850((uint64_t)v19);
    goto LABEL_12;
  }
  if (v21 >> 60 == 15)
  {
LABEL_12:
    *(_OWORD *)v19 = *(_OWORD *)v20;
    goto LABEL_14;
  }
  v22 = *v20;
  sub_21CC54860(v22, v21);
  *v19 = v22;
  v19[1] = v21;
LABEL_14:
  v26 = v6[10];
  v27 = (_QWORD *)((char *)a1 + v26);
  v28 = (char *)a2 + v26;
  *v27 = *(_QWORD *)((char *)a2 + v26);
  v27[1] = *(_QWORD *)((char *)a2 + v26 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v27[2] = *((_QWORD *)v28 + 2);
  *(_QWORD *)((char *)a1 + v6[11]) = *(_QWORD *)((char *)a2 + v6[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = v6[12];
  v30 = (_QWORD *)((char *)a1 + v29);
  v31 = (_QWORD *)((char *)a2 + v29);
  *v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for RRCandidate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  int *v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = (int *)type metadata accessor for RREntity();
  v8 = v7[7];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = sub_21CC75180();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  *(_OWORD *)(a1 + v7[8]) = *(_OWORD *)(a2 + v7[8]);
  *(_OWORD *)(a1 + v7[9]) = *(_OWORD *)(a2 + v7[9]);
  v13 = v7[10];
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_QWORD *)(v14 + 16) = *(_QWORD *)(v15 + 16);
  *(_QWORD *)(a1 + v7[11]) = *(_QWORD *)(a2 + v7[11]);
  *(_OWORD *)(a1 + v7[12]) = *(_OWORD *)(a2 + v7[12]);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *assignWithTake for RRCandidate(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  int EnumTagSinglePayload;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_release();
  v8 = (int *)type metadata accessor for RREntity();
  v9 = v8[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_21CC75180();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v12);
  v14 = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12);
  if (EnumTagSinglePayload)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v15 = *(_QWORD *)(v12 - 8);
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v10, v12);
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 40))(v10, v11, v12);
LABEL_7:
  v17 = v8[8];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = v8[9];
  v23 = (_QWORD *)((char *)a1 + v22);
  v24 = (_QWORD *)((char *)a2 + v22);
  v25 = *(_QWORD *)((char *)a1 + v22 + 8);
  if (v25 >> 60 != 15)
  {
    v26 = v24[1];
    if (v26 >> 60 != 15)
    {
      v27 = *v23;
      *v23 = *v24;
      v23[1] = v26;
      sub_21CC553D0(v27, v25);
      goto LABEL_12;
    }
    sub_21CC58850((uint64_t)v23);
  }
  *(_OWORD *)v23 = *(_OWORD *)v24;
LABEL_12:
  v28 = v8[10];
  v29 = (_QWORD *)((char *)a1 + v28);
  v30 = (char *)a2 + v28;
  v31 = *(_QWORD *)((char *)a2 + v28 + 8);
  *v29 = *(_QWORD *)((char *)a2 + v28);
  v29[1] = v31;
  swift_bridgeObjectRelease();
  v29[2] = *((_QWORD *)v30 + 2);
  *(_QWORD *)((char *)a1 + v8[11]) = *(_QWORD *)((char *)a2 + v8[11]);
  swift_bridgeObjectRelease();
  v32 = v8[12];
  v33 = (_QWORD *)((char *)a1 + v32);
  v34 = (_QWORD *)((char *)a2 + v32);
  v36 = *v34;
  v35 = v34[1];
  *v33 = v36;
  v33[1] = v35;
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for RRCandidate()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21CC5CF10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_26_0();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t storeEnumTagSinglePayload for RRCandidate()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_21CC5CF44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_26_0();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t sub_21CC5CF70()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for RREntity();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RRCandidate.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RRCandidate.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC5D0B8 + 4 * byte_21CC76625[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21CC5D0EC + 4 * byte_21CC76620[v4]))();
}

uint64_t sub_21CC5D0EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC5D0F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC5D0FCLL);
  return result;
}

uint64_t sub_21CC5D108(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC5D110);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21CC5D114(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC5D11C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21CC5D128(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for RRCandidate.CodingKeys()
{
  return &type metadata for RRCandidate.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RRResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFC)
  {
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
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for RRResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC5D218 + 4 * byte_21CC7662F[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_21CC5D24C + 4 * byte_21CC7662A[v4]))();
}

uint64_t sub_21CC5D24C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC5D254(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC5D25CLL);
  return result;
}

uint64_t sub_21CC5D268(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC5D270);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21CC5D274(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC5D27C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RRResult.CodingKeys()
{
  return &type metadata for RRResult.CodingKeys;
}

ValueMetadata *type metadata accessor for RRResult.FoundMatchCodingKeys()
{
  return &type metadata for RRResult.FoundMatchCodingKeys;
}

ValueMetadata *type metadata accessor for RRResult.NeedsDisambiguationCodingKeys()
{
  return &type metadata for RRResult.NeedsDisambiguationCodingKeys;
}

ValueMetadata *type metadata accessor for RRResult.FoundMatchPluralCodingKeys()
{
  return &type metadata for RRResult.FoundMatchPluralCodingKeys;
}

uint64_t _s32SiriReferenceResolutionDataModel8RRResultO20FoundMatchCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21CC5D310 + 4 * byte_21CC76634[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21CC5D330 + 4 * byte_21CC76639[v4]))();
}

_BYTE *sub_21CC5D310(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21CC5D330(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CC5D338(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CC5D340(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CC5D348(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CC5D350(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RRResult.NeedsDisambiguationPluralCodingKeys()
{
  return &type metadata for RRResult.NeedsDisambiguationPluralCodingKeys;
}

ValueMetadata *type metadata accessor for RRResult.NoMatchCodingKeys()
{
  return &type metadata for RRResult.NoMatchCodingKeys;
}

unint64_t sub_21CC5D380()
{
  unint64_t result;

  result = qword_25531CEB0;
  if (!qword_25531CEB0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76914, &type metadata for RRResult.NeedsDisambiguationPluralCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CEB0);
  }
  return result;
}

unint64_t sub_21CC5D3C0()
{
  unint64_t result;

  result = qword_25531CEB8;
  if (!qword_25531CEB8)
  {
    result = MEMORY[0x220789FD0]("eXD147", &type metadata for RRResult.FoundMatchPluralCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CEB8);
  }
  return result;
}

unint64_t sub_21CC5D400()
{
  unint64_t result;

  result = qword_25531CEC0;
  if (!qword_25531CEC0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76A84, &type metadata for RRResult.NeedsDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CEC0);
  }
  return result;
}

unint64_t sub_21CC5D440()
{
  unint64_t result;

  result = qword_25531CEC8;
  if (!qword_25531CEC8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76B3C, &type metadata for RRResult.FoundMatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CEC8);
  }
  return result;
}

unint64_t sub_21CC5D480()
{
  unint64_t result;

  result = qword_25531CED0;
  if (!qword_25531CED0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76BF4, &type metadata for RRResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CED0);
  }
  return result;
}

unint64_t sub_21CC5D4C0()
{
  unint64_t result;

  result = qword_25531CED8;
  if (!qword_25531CED8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76CAC, &type metadata for RRCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CED8);
  }
  return result;
}

unint64_t sub_21CC5D500()
{
  unint64_t result;

  result = qword_25531CEE0;
  if (!qword_25531CEE0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76C1C, &type metadata for RRCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CEE0);
  }
  return result;
}

unint64_t sub_21CC5D540()
{
  unint64_t result;

  result = qword_25531CEE8;
  if (!qword_25531CEE8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76C44, &type metadata for RRCandidate.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CEE8);
  }
  return result;
}

unint64_t sub_21CC5D580()
{
  unint64_t result;

  result = qword_2540729D8;
  if (!qword_2540729D8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76AAC, &type metadata for RRResult.FoundMatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729D8);
  }
  return result;
}

unint64_t sub_21CC5D5C0()
{
  unint64_t result;

  result = qword_2540729D0;
  if (!qword_2540729D0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76AD4, &type metadata for RRResult.FoundMatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729D0);
  }
  return result;
}

unint64_t sub_21CC5D600()
{
  unint64_t result;

  result = qword_2540729F8;
  if (!qword_2540729F8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC769F4, &type metadata for RRResult.NeedsDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729F8);
  }
  return result;
}

unint64_t sub_21CC5D640()
{
  unint64_t result;

  result = qword_2540729F0;
  if (!qword_2540729F0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76A1C, &type metadata for RRResult.NeedsDisambiguationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729F0);
  }
  return result;
}

unint64_t sub_21CC5D680()
{
  unint64_t result;

  result = qword_2540729E8;
  if (!qword_2540729E8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC7693C, &type metadata for RRResult.FoundMatchPluralCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729E8);
  }
  return result;
}

unint64_t sub_21CC5D6C0()
{
  unint64_t result;

  result = qword_2540729E0;
  if (!qword_2540729E0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76964, &type metadata for RRResult.FoundMatchPluralCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729E0);
  }
  return result;
}

unint64_t sub_21CC5D700()
{
  unint64_t result;

  result = qword_254072A08;
  if (!qword_254072A08)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76884, &type metadata for RRResult.NeedsDisambiguationPluralCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072A08);
  }
  return result;
}

unint64_t sub_21CC5D740()
{
  unint64_t result;

  result = qword_254072A00;
  if (!qword_254072A00)
  {
    result = MEMORY[0x220789FD0]("=YD1x8", &type metadata for RRResult.NeedsDisambiguationPluralCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072A00);
  }
  return result;
}

unint64_t sub_21CC5D780()
{
  unint64_t result;

  result = qword_2540729C8;
  if (!qword_2540729C8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76834, &type metadata for RRResult.NoMatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729C8);
  }
  return result;
}

unint64_t sub_21CC5D7C0()
{
  unint64_t result;

  result = qword_2540729C0;
  if (!qword_2540729C0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC7685C, &type metadata for RRResult.NoMatchCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729C0);
  }
  return result;
}

unint64_t sub_21CC5D800()
{
  unint64_t result;

  result = qword_2540729B0;
  if (!qword_2540729B0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC76B64, &type metadata for RRResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729B0);
  }
  return result;
}

unint64_t sub_21CC5D840()
{
  unint64_t result;

  result = qword_2540729A8;
  if (!qword_2540729A8)
  {
    result = MEMORY[0x220789FD0]("]VD1\b5", &type metadata for RRResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540729A8);
  }
  return result;
}

uint64_t sub_21CC5D880(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return sub_21CC75360();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_21CC753E4();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_21CC75360();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_21CC753E4();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_21CC75438();
}

uint64_t OUTLINED_FUNCTION_8_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_21CC753CC();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return sub_21CC751EC();
}

_QWORD *OUTLINED_FUNCTION_13_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 - 256);
  *v2 = a1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_14_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_15_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_16_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 184) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 248) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

void OUTLINED_FUNCTION_22_0()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 64) = 0;
  *(_QWORD *)(v0 - 56) = 0xE000000000000000;
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return type metadata accessor for RREntity();
}

void OUTLINED_FUNCTION_27_0(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 64) = a1;
  *(_QWORD *)(v2 - 56) = (v1 - 32) | 0x8000000000000000;
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_21CC754C8();
}

unint64_t OUTLINED_FUNCTION_32_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 4;
  return sub_21CC5B4D8();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0Tm(v0);
}

uint64_t OUTLINED_FUNCTION_35_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_36_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

unint64_t OUTLINED_FUNCTION_37_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 3;
  return sub_21CC5B514();
}

unint64_t OUTLINED_FUNCTION_38_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 2;
  return sub_21CC5B5D4();
}

unint64_t OUTLINED_FUNCTION_39_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 72) = 1;
  return sub_21CC5B610();
}

uint64_t GroupIdentifier.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t GroupIdentifier.seq.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

SiriReferenceResolutionDataModel::GroupIdentifier __swiftcall GroupIdentifier.init(id:seq:)(Swift::String id, Swift::Int seq)
{
  Swift::String *v2;
  SiriReferenceResolutionDataModel::GroupIdentifier result;

  *v2 = id;
  v2[1]._countAndFlagsBits = seq;
  result.id = id;
  result.seq = seq;
  return result;
}

uint64_t GroupIdentifier.description.getter()
{
  swift_bridgeObjectRetain();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  sub_21CC751EC();
  sub_21CC75444();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  return 540697705;
}

BOOL static GroupIdentifier.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  _BOOL8 result;

  v2 = a1[2];
  v3 = a2[2];
  if (*a1 == *a2 && a1[1] == a2[1])
    return v2 == v3;
  v5 = sub_21CC75450();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 == v3;
  return result;
}

uint64_t sub_21CC5DC84(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7431539 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_21CC75450();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21CC5DD48(char a1)
{
  if ((a1 & 1) != 0)
    return 7431539;
  else
    return 25705;
}

uint64_t sub_21CC5DD6C()
{
  char *v0;

  return sub_21CC5DD48(*v0);
}

uint64_t sub_21CC5DD74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC5DC84(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC5DD98()
{
  sub_21CC5DEFC();
  return sub_21CC75534();
}

uint64_t sub_21CC5DDC0()
{
  sub_21CC5DEFC();
  return sub_21CC75540();
}

void GroupIdentifier.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CEF0);
  v7 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_62();
  v6 = v5 - v4;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC5DEFC();
  sub_21CC75528();
  sub_21CC75408();
  if (!v1)
    sub_21CC7542C();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v3);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_21CC5DEFC()
{
  unint64_t result;

  result = qword_25531CEF8;
  if (!qword_25531CEF8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC770F4, &type metadata for GroupIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CEF8);
  }
  return result;
}

void GroupIdentifier.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531CF00);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_62();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC5DEFC();
  sub_21CC75510();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  else
  {
    v6 = sub_21CC7539C();
    v8 = v7;
    swift_bridgeObjectRetain();
    v9 = sub_21CC753C0();
    OUTLINED_FUNCTION_0_1();
    *a2 = v6;
    a2[1] = v8;
    a2[2] = v9;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_0();
}

void sub_21CC5E07C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  GroupIdentifier.init(from:)(a1, a2);
}

void sub_21CC5E090(_QWORD *a1)
{
  GroupIdentifier.encode(to:)(a1);
}

uint64_t GroupIdentifierGenerator.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  GroupIdentifierGenerator.init()();
  return v0;
}

_QWORD *GroupIdentifierGenerator.init()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0;
  v2 = sub_21CC74FF4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_62();
  v6 = v5 - v4;
  v1[4] = -1;
  sub_21CC74FE8();
  v7 = sub_21CC74FDC();
  v9 = v8;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  v1[2] = v7;
  v1[3] = v9;
  return v1;
}

uint64_t sub_21CC5E174@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v2 = v1[4];
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    v1[4] = v4;
    v5 = v1[3];
    *a1 = v1[2];
    a1[1] = v5;
    a1[2] = v4;
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t GroupIdentifierGenerator.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t GroupIdentifierGenerator.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t destroy for GroupIdentifier()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s32SiriReferenceResolutionDataModel15GroupIdentifierVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for GroupIdentifier(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for GroupIdentifier(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for GroupIdentifier(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for GroupIdentifier(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for GroupIdentifier()
{
  return &type metadata for GroupIdentifier;
}

uint64_t type metadata accessor for GroupIdentifierGenerator()
{
  return objc_opt_self();
}

uint64_t method lookup function for GroupIdentifierGenerator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GroupIdentifierGenerator.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of GroupIdentifierGenerator.addGroupIdentifier()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t storeEnumTagSinglePayload for GroupIdentifier.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC5E3D8 + 4 * byte_21CC76F15[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21CC5E40C + 4 * byte_21CC76F10[v4]))();
}

uint64_t sub_21CC5E40C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC5E414(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC5E41CLL);
  return result;
}

uint64_t sub_21CC5E428(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC5E430);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21CC5E434(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC5E43C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GroupIdentifier.CodingKeys()
{
  return &type metadata for GroupIdentifier.CodingKeys;
}

unint64_t sub_21CC5E45C()
{
  unint64_t result;

  result = qword_25531CFD0;
  if (!qword_25531CFD0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC770CC, &type metadata for GroupIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CFD0);
  }
  return result;
}

unint64_t sub_21CC5E49C()
{
  unint64_t result;

  result = qword_25531CFD8;
  if (!qword_25531CFD8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC7703C, &type metadata for GroupIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CFD8);
  }
  return result;
}

unint64_t sub_21CC5E4DC()
{
  unint64_t result;

  result = qword_25531CFE0;
  if (!qword_25531CFE0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC77064, &type metadata for GroupIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531CFE0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void RRAnnotatedEntity.id.getter()
{
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

id sub_21CC5E56C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  void *v3;

  a3();
  v3 = (void *)sub_21CC751BC();
  OUTLINED_FUNCTION_71();
  return OUTLINED_FUNCTION_69_0(v3);
}

void RRAnnotatedEntity.appBundleId.getter()
{
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

uint64_t RRAnnotatedEntity.usoEntity.getter()
{
  return swift_retain();
}

void RRAnnotatedEntity.typedValue.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_21CC65054(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_typedValue, a1, &qword_254072918);
}

void RRAnnotatedEntity.dataType.getter()
{
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

void RRAnnotatedEntity.data.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = OUTLINED_FUNCTION_57();
  sub_21CC5484C(v0, v1);
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

uint64_t RRAnnotatedEntity.group.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group;
  *(_QWORD *)a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v2 + 8);
  return swift_bridgeObjectRetain();
}

void sub_21CC5E6EC()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  sub_21CC5E720(v0);
}

uint64_t sub_21CC5E714()
{
  return sub_21CC5EB94();
}

void sub_21CC5E720(uint64_t a1)
{
  sub_21CC5EBDC(a1, &OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata);
}

void sub_21CC5E72C()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_55();
}

double sub_21CC5E788()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score;
  OUTLINED_FUNCTION_0_2();
  return *(double *)v1;
}

void sub_21CC5E7E4(double a1)
{
  uint64_t v1;
  double *v3;

  v3 = (double *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score);
  OUTLINED_FUNCTION_1_1();
  *v3 = a1;
  OUTLINED_FUNCTION_87_0();
}

void sub_21CC5E82C()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_55();
}

void sub_21CC5E91C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  OUTLINED_FUNCTION_0_2();
  v0 = OUTLINED_FUNCTION_127();
  sub_21CC65054(v0, v1, v2);
  OUTLINED_FUNCTION_63_0();
}

void sub_21CC5E96C()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_1_1();
  v0 = OUTLINED_FUNCTION_57();
  sub_21CC5E9B4(v0, v1);
  swift_endAccess();
  OUTLINED_FUNCTION_63_0();
}

uint64_t sub_21CC5E9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_21CC5E9FC()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_55();
}

void sub_21CC5EA38(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_21CC5EA98();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

void sub_21CC5EA68(uint64_t a1)
{
  sub_21CC5EAD0(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

void sub_21CC5EA98()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_63_0();
}

void sub_21CC5EAD0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = v2 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment;
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)v5 = a1;
  *(_BYTE *)(v5 + 8) = a2 & 1;
  OUTLINED_FUNCTION_87_0();
}

void sub_21CC5EB24()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_55();
}

void sub_21CC5EB60()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  sub_21CC5EBD0(v0);
}

uint64_t sub_21CC5EB88()
{
  return sub_21CC5EB94();
}

uint64_t sub_21CC5EB94()
{
  OUTLINED_FUNCTION_0_2();
  return swift_bridgeObjectRetain();
}

void sub_21CC5EBD0(uint64_t a1)
{
  sub_21CC5EBDC(a1, &OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations);
}

void sub_21CC5EBDC(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  OUTLINED_FUNCTION_1_1();
  *v4 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_63_0();
}

void sub_21CC5EC1C()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_55();
}

id sub_21CC5EC68(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3;
  void *v4;

  a3();
  if (!v3)
    return OUTLINED_FUNCTION_69_0(0);
  v4 = (void *)sub_21CC751BC();
  OUTLINED_FUNCTION_71();
  return OUTLINED_FUNCTION_69_0(v4);
}

uint64_t sub_21CC5ECA4()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_18_1();
  return OUTLINED_FUNCTION_127();
}

void sub_21CC5ED54(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_userId);
  OUTLINED_FUNCTION_1_1();
  *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_87_0();
}

void sub_21CC5EDA8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  sub_21CC5ED54(v1, v2);
}

void sub_21CC5EDE4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC5EE74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_5();
  sub_21CC752E8();
  sub_21CC751EC();
  OUTLINED_FUNCTION_98_0();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_98_0();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_75();
  sub_21CC751EC();
  sub_21CC75078();
  OUTLINED_FUNCTION_68();
  swift_release();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_75();
  sub_21CC751EC();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_113();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072AA8);
  sub_21CC751D4();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  sub_21CC751EC();
  OUTLINED_FUNCTION_0_2();
  v3 = OUTLINED_FUNCTION_23();
  MEMORY[0x220789A60](v3, &type metadata for RRMetadata);
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_113();
  OUTLINED_FUNCTION_0_2();
  sub_21CC75264();
  sub_21CC751EC();
  v4 = v0 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt;
  OUTLINED_FUNCTION_0_2();
  sub_21CC65054(v4, v1, &qword_254072900);
  sub_21CC751D4();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_44_0();
  sub_21CC751EC();
  OUTLINED_FUNCTION_0_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072BD8);
  sub_21CC751D4();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_122();
  OUTLINED_FUNCTION_0_2();
  type metadata accessor for RRAnnotationValue(0);
  OUTLINED_FUNCTION_55_0();
  sub_21CC7518C();
  sub_21CC751EC();
  OUTLINED_FUNCTION_44_0();
  swift_bridgeObjectRelease();
  sub_21CC751EC();
  OUTLINED_FUNCTION_0_2();
  swift_bridgeObjectRetain();
  sub_21CC751EC();
  OUTLINED_FUNCTION_44_0();
  return 0;
}

uint64_t type metadata accessor for RRAnnotationValue(uint64_t a1)
{
  return sub_21CC599D4(a1, (uint64_t *)&unk_254072AB0);
}

uint64_t sub_21CC5F2C8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_95_0();
  return sub_21CC5F688(v0, v1);
}

void sub_21CC5F2E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = OUTLINED_FUNCTION_95_0();
  OUTLINED_FUNCTION_42_0(v0, v1);
  OUTLINED_FUNCTION_51_0(v2, &qword_254072900);
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC5F310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v5;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_10_1();
  sub_21CC65054(a1, v5, &qword_254072900);
  return a5(v5);
}

uint64_t RRAnnotationName.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21CC5F3C0 + 4 * byte_21CC77150[*v0]))(0x656E6F69746E656DLL, 0xEB00000000744164);
}

uint64_t sub_21CC5F3C0()
{
  return 0x6E65657263736E6FLL;
}

uint64_t sub_21CC5F3DC()
{
  return 0x756F726765726F66;
}

unint64_t sub_21CC5F400()
{
  return 0xD000000000000016;
}

uint64_t sub_21CC5F41C()
{
  return 0x6979616C50776F6ELL;
}

uint64_t sub_21CC5F43C()
{
  return 0x744179627261656ELL;
}

uint64_t sub_21CC5F454@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_21CC64E84(a1, a2), (v7 & 1) != 0))
  {
    v8 = v6;
    v9 = *(_QWORD *)(a3 + 56);
    v10 = type metadata accessor for RRAnnotationValue(0);
    sub_21CC5F4E0(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * v8, a4);
    v11 = a4;
    v12 = 0;
    v13 = v10;
  }
  else
  {
    v13 = type metadata accessor for RRAnnotationValue(0);
    v11 = a4;
    v12 = 1;
  }
  return __swift_storeEnumTagSinglePayload(v11, v12, 1, v13);
}

uint64_t sub_21CC5F4E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RRAnnotationValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_21CC5F524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_21CC64E84(a1, a2);
    if ((v3 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_55();
}

void RRAnnotationValue.date.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_26_1(v3, v5);
  v4 = OUTLINED_FUNCTION_5_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v0, v1, v4);
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v4);
  OUTLINED_FUNCTION_44();
}

uint64_t sub_21CC5F5C8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RRAnnotationValue(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_21CC5F604(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  OUTLINED_FUNCTION_59_0(a1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  *(_QWORD *)(v1 + 8) = OUTLINED_FUNCTION_6_1(v2);
  v3 = OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_17_1((uint64_t)v3);
  sub_21CC5F2C8();
  OUTLINED_FUNCTION_44();
}

void sub_21CC5F64C(uint64_t a1, char a2)
{
  sub_21CC5F848(a1, a2, 0x656E6F69746E656DLL, 0xEB00000000744164);
}

uint64_t sub_21CC5F678()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_117();
  return sub_21CC5F688(v0, v1);
}

uint64_t sub_21CC5F688(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  OUTLINED_FUNCTION_110();
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072AC0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5();
  v11 = (uint64_t *)(v3 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations);
  OUTLINED_FUNCTION_0_2();
  v12 = *v11;
  OUTLINED_FUNCTION_23();
  sub_21CC5F454(a1, a2, v12, v4);
  OUTLINED_FUNCTION_59();
  if (OUTLINED_FUNCTION_120(v4))
  {
    sub_21CC6221C(v4, &qword_254072AC0);
    v13 = OUTLINED_FUNCTION_5_1();
    return OUTLINED_FUNCTION_3_1(v2, v14, v15, v13);
  }
  else
  {
    sub_21CC5F4E0(v4, (uint64_t)v9);
    sub_21CC6221C(v4, &qword_254072AC0);
    RRAnnotationValue.date.getter();
    return sub_21CC5F5C8((uint64_t)v9);
  }
}

void sub_21CC5F7B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = OUTLINED_FUNCTION_117();
  OUTLINED_FUNCTION_42_0(v0, v1);
  OUTLINED_FUNCTION_51_0(v2, &qword_254072900);
  OUTLINED_FUNCTION_55();
}

void sub_21CC5F7E4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  OUTLINED_FUNCTION_59_0(a1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  *(_QWORD *)(v1 + 8) = OUTLINED_FUNCTION_6_1(v2);
  v3 = OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_17_1((uint64_t)v3);
  sub_21CC5F678();
  OUTLINED_FUNCTION_44();
}

void sub_21CC5F82C(uint64_t a1, char a2)
{
  sub_21CC5F848(a1, a2, 0x6E65657263736E6FLL, 0xEA00000000007441);
}

void sub_21CC5F848(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  void *v7;
  uint64_t v8;

  v6 = *(void **)(a1 + 8);
  v7 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    sub_21CC65054(*(_QWORD *)(a1 + 16), (uint64_t)v6, &qword_254072900);
    OUTLINED_FUNCTION_42_0(a3, a4);
    sub_21CC6221C((uint64_t)v6, &qword_254072900);
  }
  else
  {
    sub_21CC5FD24(a3, a4, (uint64_t)v7);
  }
  OUTLINED_FUNCTION_81_0(v8, &qword_254072900);
  free(v7);
  free(v6);
}

uint64_t sub_21CC5F8EC()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_67_0();
  return sub_21CC5F688(v0, v1);
}

void sub_21CC5F908()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = OUTLINED_FUNCTION_67_0();
  OUTLINED_FUNCTION_42_0(v0, v1);
  OUTLINED_FUNCTION_51_0(v2, &qword_254072900);
  OUTLINED_FUNCTION_55();
}

void sub_21CC5F934(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  OUTLINED_FUNCTION_59_0(a1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  *(_QWORD *)(v1 + 8) = OUTLINED_FUNCTION_6_1(v2);
  v3 = OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_17_1((uint64_t)v3);
  sub_21CC5F8EC();
  OUTLINED_FUNCTION_44();
}

void sub_21CC5F97C(uint64_t a1, char a2)
{
  sub_21CC5F848(a1, a2, 0x756F726765726F66, 0xEE0074416465646ELL);
}

uint64_t sub_21CC5F9AC()
{
  return sub_21CC5F688(0x744179627261656ELL, 0xE800000000000000);
}

void sub_21CC5F9D0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_42_0(0x744179627261656ELL, 0xE800000000000000);
  OUTLINED_FUNCTION_51_0(v0, &qword_254072900);
  OUTLINED_FUNCTION_55();
}

void sub_21CC5FA0C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  OUTLINED_FUNCTION_59_0(a1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  *(_QWORD *)(v1 + 8) = OUTLINED_FUNCTION_6_1(v2);
  v3 = OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_17_1((uint64_t)v3);
  sub_21CC5F9AC();
  OUTLINED_FUNCTION_44();
}

void sub_21CC5FA54(uint64_t a1, char a2)
{
  sub_21CC5F848(a1, a2, 0x744179627261656ELL, 0xE800000000000000);
}

uint64_t sub_21CC5FA78()
{
  return sub_21CC5F688(0xD000000000000016, 0x800000021CC75A30);
}

void sub_21CC5FAA0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_42_0(0xD000000000000016, 0x800000021CC75A30);
  OUTLINED_FUNCTION_51_0(v0, &qword_254072900);
  OUTLINED_FUNCTION_55();
}

void sub_21CC5FAE0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  OUTLINED_FUNCTION_59_0(a1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  *(_QWORD *)(v1 + 8) = OUTLINED_FUNCTION_6_1(v2);
  v3 = OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_17_1((uint64_t)v3);
  sub_21CC5FA78();
  OUTLINED_FUNCTION_44();
}

void sub_21CC5FB28(uint64_t a1, char a2)
{
  sub_21CC5F848(a1, a2, 0xD000000000000016, 0x800000021CC75A30);
}

id sub_21CC5FB50(void *a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v3;
  uint64_t v6;
  id v7;
  void *v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_27_1();
  v7 = a1;
  a3();

  OUTLINED_FUNCTION_5_1();
  v8 = 0;
  if (OUTLINED_FUNCTION_120(v3) != 1)
  {
    v8 = (void *)sub_21CC74FAC();
    OUTLINED_FUNCTION_66_0();
  }
  return v8;
}

uint64_t sub_21CC5FBE0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_89_0();
  return sub_21CC5F688(v0, v1);
}

void sub_21CC5FBFC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_9_0();
  if (a3)
  {
    sub_21CC74FC4();
    v9 = OUTLINED_FUNCTION_5_1();
    v10 = 0;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_5_1();
    v10 = 1;
  }
  __swift_storeEnumTagSinglePayload(v4, v10, 1, v9);
  v11 = a1;
  a4(v4);

  OUTLINED_FUNCTION_44();
}

void sub_21CC5FC90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = OUTLINED_FUNCTION_89_0();
  OUTLINED_FUNCTION_42_0(v0, v1);
  OUTLINED_FUNCTION_51_0(v2, &qword_254072900);
  OUTLINED_FUNCTION_55();
}

void sub_21CC5FCBC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  OUTLINED_FUNCTION_59_0(a1);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  *(_QWORD *)(v1 + 8) = OUTLINED_FUNCTION_6_1(v2);
  v3 = OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_17_1((uint64_t)v3);
  sub_21CC5FBE0();
  OUTLINED_FUNCTION_44();
}

void sub_21CC5FD04(uint64_t a1, char a2)
{
  sub_21CC5F848(a1, a2, 0x6979616C50776F6ELL, 0xEC0000007441676ELL);
}

void sub_21CC5FD24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254072AC0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_9_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_14();
  sub_21CC65054(a3, (uint64_t)v10, &qword_254072900);
  OUTLINED_FUNCTION_103((uint64_t)v10, 1, v11);
  if (v13)
  {
    sub_21CC6221C((uint64_t)v10, &qword_254072900);
    v14 = type metadata accessor for RRAnnotationValue(0);
    OUTLINED_FUNCTION_3_1(v3, v15, v16, v14);
    OUTLINED_FUNCTION_83_0();
    OUTLINED_FUNCTION_81_0(v17, &qword_254072AC0);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v4, v10, v11);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v4, v11);
    v18 = type metadata accessor for RRAnnotationValue(0);
    __swift_storeEnumTagSinglePayload(v3, 0, 1, v18);
    OUTLINED_FUNCTION_83_0();
    OUTLINED_FUNCTION_81_0(v19, &qword_254072AC0);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v11);
  }
  OUTLINED_FUNCTION_45_0();
}

void sub_21CC5FF7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char *v32;
  char v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;

  v43 = a1;
  v8 = OUTLINED_FUNCTION_5_1();
  v9 = *(_QWORD *)(v8 - 8);
  v41 = v8;
  v42 = v9;
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_102_0();
  v40 = v10;
  MEMORY[0x24BDAC7A8](v11);
  v44 = (char *)&v39 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072AC0);
  OUTLINED_FUNCTION_1();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_101_0();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v39 - v18;
  v20 = type metadata accessor for RRAnnotationValue(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_53_0();
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v39 - v23;
  sub_21CC65054(a3, (uint64_t)v19, &qword_254072AC0);
  v25 = OUTLINED_FUNCTION_103((uint64_t)v19, 1, v20);
  if (!v31)
  {
    sub_21CC65010((uint64_t)v19, (uint64_t)v24);
    sub_21CC5F4E0((uint64_t)v24, v4);
    v26 = v41;
    v27 = *(void (**)(char *, uint64_t, uint64_t))(v42 + 32);
    v27(v44, v4, v41);
    v28 = (uint64_t *)(v3 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations);
    OUTLINED_FUNCTION_0_2();
    v29 = *v28;
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_55_0();
    v30 = v43;
    sub_21CC5F454(v43, a2, v29, v5);
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_44_0();
    OUTLINED_FUNCTION_103(v5, 1, v20);
    if (v31)
    {
      sub_21CC6221C(v5, &qword_254072AC0);
      v34 = v42;
    }
    else
    {
      v32 = v40;
      v27(v40, v5, v26);
      v33 = sub_21CC74FB8();
      v34 = v42;
      v35 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
      v36 = v32;
      v30 = v43;
      v35((uint64_t)v36, v26);
      if ((v33 & 1) != 0)
      {
        v35((uint64_t)v44, v26);
LABEL_10:
        sub_21CC5F5C8((uint64_t)v24);
        goto LABEL_11;
      }
    }
    v37 = OUTLINED_FUNCTION_125();
    sub_21CC5F4E0(v37, v38);
    OUTLINED_FUNCTION_108((uint64_t)v16, 0);
    OUTLINED_FUNCTION_1_1();
    OUTLINED_FUNCTION_18_1();
    sub_21CC60254((uint64_t)v16, v30, a2);
    OUTLINED_FUNCTION_94_0();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v44, v26);
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_81_0(v25, &qword_254072AC0);
  OUTLINED_FUNCTION_108((uint64_t)v16, 1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_18_1();
  sub_21CC60254((uint64_t)v16, v43, a2);
  swift_endAccess();
LABEL_11:
  OUTLINED_FUNCTION_45_0();
}

void sub_21CC60254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072AC0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for RRAnnotationValue(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__swift_getEnumTagSinglePayload(a1, 1, v12) == 1)
  {
    sub_21CC6221C(a1, &qword_254072AC0);
    sub_21CC65090(a2, a3, (uint64_t)v8);
    swift_bridgeObjectRelease();
    sub_21CC6221C((uint64_t)v8, &qword_254072AC0);
  }
  else
  {
    sub_21CC65010(a1, (uint64_t)v11);
    sub_21CC651D0((uint64_t)v11, a2, a3);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_21CC60370@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId + 8);
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id + 8);
  *a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId);
  a1[1] = v2;
  a1[2] = v3;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, __int128 *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  OUTLINED_FUNCTION_99_0();
  return RRAnnotatedEntity.init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:annotations:userId:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16);
}

id RRAnnotatedEntity.init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, __int128 *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  char *v16;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v45;
  __int128 v46;
  uint64_t v48;
  uint64_t v51;
  uint64_t v52;
  objc_super v53;

  OUTLINED_FUNCTION_82_0();
  v48 = v23;
  v46 = *a11;
  v45 = *((_QWORD *)a11 + 2);
  v24 = (uint64_t)&v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt];
  v25 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_1(v24, v26, v27, v25);
  v28 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
  *(_QWORD *)v28 = 0;
  v28[8] = 1;
  v29 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_userId];
  *(_QWORD *)v29 = 0;
  *((_QWORD *)v29 + 1) = 0;
  v30 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id];
  *(_QWORD *)v30 = a1;
  *((_QWORD *)v30 + 1) = a2;
  v31 = (uint64_t *)&v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId];
  *v31 = a3;
  v31[1] = a4;
  *(_QWORD *)&v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_usoEntity] = a5;
  v32 = OUTLINED_FUNCTION_118();
  OUTLINED_FUNCTION_3_1(a3, v33, v34, v32);
  v35 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType];
  *(_QWORD *)v35 = a6;
  *((_QWORD *)v35 + 1) = a7;
  v36 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data];
  *(_QWORD *)v36 = a8;
  *((_QWORD *)v36 + 1) = a10;
  v37 = &v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group];
  *(_OWORD *)v37 = v46;
  *((_QWORD *)v37 + 2) = v45;
  *(_QWORD *)&v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata] = v48;
  *(double *)&v16[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score] = a9;
  OUTLINED_FUNCTION_1_1();
  v38 = v16;
  swift_retain();
  v39 = OUTLINED_FUNCTION_125();
  sub_21CC5484C(v39, v40);
  sub_21CC606D4(v51, v24);
  OUTLINED_FUNCTION_94_0();
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)v28 = 0;
  v28[8] = 1;
  *(_QWORD *)&v38[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations] = v52;
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)v29 = a15;
  *((_QWORD *)v29 + 1) = a16;

  OUTLINED_FUNCTION_71();
  v53.receiver = v38;
  v53.super_class = (Class)OUTLINED_FUNCTION_54_0();
  v41 = objc_msgSendSuper2(&v53, sel_init);
  v42 = OUTLINED_FUNCTION_125();
  sub_21CC553BC(v42, v43);
  swift_release();
  sub_21CC6221C(v51, &qword_254072900);
  return v41;
}

uint64_t sub_21CC606D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RRAnnotatedEntity(uint64_t a1)
{
  return sub_21CC599D4(a1, (uint64_t *)&unk_254072908);
}

void RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  __n128 *v25;
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_99_0();
  v18 = OUTLINED_FUNCTION_30_1();
  RRAnnotatedEntity.init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(v19, v20, v21, v22, v23, a6, a7, a8, v18, v24, v25, v26, v27, a13, a14 & 1, a15, a16, a17);
  OUTLINED_FUNCTION_29_1();
}

void RRAnnotatedEntity.init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, unint64_t a10, __n128 *a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  char *v18;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  char *v40;
  uint64_t v41;
  uint64_t v43;
  __n128 v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;

  OUTLINED_FUNCTION_82_0();
  v45 = v26;
  v44 = *a11;
  v43 = a11[1].n128_i64[0];
  v27 = (uint64_t)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt];
  v28 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_1(v27, v29, v30, v28);
  v31 = &v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
  *(_QWORD *)v31 = 0;
  v31[8] = 1;
  v32 = &v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_userId];
  *(_QWORD *)v32 = 0;
  *((_QWORD *)v32 + 1) = 0;
  v33 = &v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id];
  *(_QWORD *)v33 = a1;
  *((_QWORD *)v33 + 1) = a2;
  v34 = (uint64_t *)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId];
  *v34 = a3;
  v34[1] = a4;
  *(_QWORD *)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_usoEntity] = a5;
  v35 = &v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType];
  *(_QWORD *)v35 = a6;
  *((_QWORD *)v35 + 1) = a7;
  v36 = OUTLINED_FUNCTION_118();
  OUTLINED_FUNCTION_3_1(a3, v37, v38, v36);
  v39 = (uint64_t *)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data];
  *v39 = a8;
  v39[1] = a10;
  OUTLINED_FUNCTION_129(OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group, v41, a7, a10, v43, v44);
  *(_QWORD *)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata] = v45;
  *(double *)&v18[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score] = a9;
  OUTLINED_FUNCTION_1_1();
  v40 = v18;
  swift_retain();
  sub_21CC5484C(a8, a10);
  sub_21CC606D4(v47, v27);
  OUTLINED_FUNCTION_94_0();
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)v31 = v48;
  v31[8] = a15 & 1;
  *(_QWORD *)&v40[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations] = a16;
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)v32 = a17;
  *((_QWORD *)v32 + 1) = a18;

  OUTLINED_FUNCTION_71();
  v49.receiver = v40;
  v49.super_class = (Class)OUTLINED_FUNCTION_54_0();
  objc_msgSendSuper2(&v49, sel_init);
  OUTLINED_FUNCTION_57_0();
  swift_release();
  sub_21CC6221C(v47, &qword_254072900);
  OUTLINED_FUNCTION_35_1();
}

void RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  __n128 *v26;
  uint64_t v27;

  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_99_0();
  v18 = OUTLINED_FUNCTION_30_1();
  RRAnnotatedEntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(v19, v20, v21, v22, v23, a6, a7, a8, v18, v24, v25, v26, v27, a13, a14, a15 & 1, a16, a17, a18);
  OUTLINED_FUNCTION_29_1();
}

void RRAnnotatedEntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, unint64_t a11, __n128 *a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  char *v19;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  __n128 v40;
  objc_super v43;

  v40 = *a12;
  v27 = (uint64_t)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt];
  v39 = a12[1].n128_i64[0];
  v28 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_3_1(v27, v29, v30, v28);
  v31 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
  *(_QWORD *)v31 = 0;
  v31[8] = 1;
  v32 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_userId];
  *(_QWORD *)v32 = 0;
  *((_QWORD *)v32 + 1) = 0;
  v33 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id];
  *(_QWORD *)v33 = a1;
  *((_QWORD *)v33 + 1) = a2;
  v34 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId];
  *(_QWORD *)v34 = a3;
  *((_QWORD *)v34 + 1) = a4;
  *(_QWORD *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_usoEntity] = a5;
  sub_21CC65054(a6, (uint64_t)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_typedValue], &qword_254072918);
  v35 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType];
  *(_QWORD *)v35 = a7;
  *((_QWORD *)v35 + 1) = a8;
  v36 = (uint64_t *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data];
  *v36 = a10;
  v36[1] = a11;
  OUTLINED_FUNCTION_129(OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group, v38, a10, v39, a11, v40);
  *(_QWORD *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata] = a13;
  *(double *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score] = a9;
  OUTLINED_FUNCTION_1_1();
  v37 = v19;
  swift_retain();
  OUTLINED_FUNCTION_123(a10);
  sub_21CC606D4(a14, v27);
  OUTLINED_FUNCTION_94_0();
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)v31 = a15;
  v31[8] = a16 & 1;
  *(_QWORD *)&v37[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations] = a17;
  OUTLINED_FUNCTION_1_1();
  *(_QWORD *)v32 = a18;
  *((_QWORD *)v32 + 1) = a19;

  OUTLINED_FUNCTION_59();
  v43.receiver = v37;
  v43.super_class = (Class)OUTLINED_FUNCTION_54_0();
  objc_msgSendSuper2(&v43, sel_init);
  sub_21CC553BC(a10, a11);
  swift_release();
  sub_21CC6221C(a14, &qword_254072900);
  sub_21CC6221C(a6, &qword_254072918);
  OUTLINED_FUNCTION_35_1();
}

_QWORD *RRAnnotatedEntity.__allocating_init(from:)(uint64_t a1)
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
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  unint64_t v28;
  void (*v29)(unint64_t, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  __n128 v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  double v43;
  id v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  _BYTE v49[4];
  int v50;
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
  _BYTE *v63;
  uint64_t v64;
  _BYTE *v65;
  __n128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __n128 v70;
  uint64_t v71;
  char v72;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_102_0();
  v64 = v5;
  MEMORY[0x24BDAC7A8](v6);
  v65 = &v49[-v7];
  v67 = sub_21CC75180();
  v66.n128_u64[0] = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  OUTLINED_FUNCTION_1_0();
  v66.n128_u64[1] = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_53_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_101_0();
  MEMORY[0x24BDAC7A8](v11);
  v13 = &v49[-v12];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D000);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_27_1();
  v68 = a1;
  v16 = OUTLINED_FUNCTION_128();
  sub_21CC61640();
  v17 = v69;
  sub_21CC75510();
  if (v17)
  {
    __swift_destroy_boxed_opaque_existential_0Tm(v68);
  }
  else
  {
    v18 = v2;
    v19 = v67;
    v62 = v1;
    v63 = v13;
    v69 = v15;
    v70.n128_u8[0] = 0;
    v20 = v14;
    v21 = OUTLINED_FUNCTION_115();
    v61 = v22;
    v70.n128_u8[0] = 1;
    v23 = OUTLINED_FUNCTION_115();
    v25 = v24;
    sub_21CC75138();
    v72 = 2;
    sub_21CC5B7BC(&qword_25531CD98, (uint64_t (*)(uint64_t))MEMORY[0x24BEA3820], MEMORY[0x24BEA3838]);
    OUTLINED_FUNCTION_116();
    v56 = v23;
    v57 = v21;
    v58 = v70.n128_u64[0];
    __swift_storeEnumTagSinglePayload((uint64_t)v63, 1, 1, v19);
    v70.n128_u8[0] = 3;
    sub_21CC5B7BC(&qword_25531CDA0, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A40]);
    v60 = v20;
    OUTLINED_FUNCTION_116();
    v59 = v25;
    OUTLINED_FUNCTION_58_0(v18, 0);
    v27 = (uint64_t)v63;
    sub_21CC6221C((uint64_t)v63, &qword_254072918);
    v28 = v66.n128_u64[1];
    v29 = *(void (**)(unint64_t, uint64_t, uint64_t))(v66.n128_u64[0] + 32);
    v29(v66.n128_u64[1], v18, v19);
    v29(v27, v28, v19);
    OUTLINED_FUNCTION_58_0(v27, 0);
    v70.n128_u8[0] = 4;
    v55 = sub_21CC75378();
    v67 = v30;
    v72 = 5;
    sub_21CC58054();
    OUTLINED_FUNCTION_15_1();
    if (v70.n128_u64[1] >> 60 == 15)
    {
      v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D010);
      v72 = 5;
      sub_21CC61700(&qword_25531D018, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
      OUTLINED_FUNCTION_15_1();
      v32 = v70.n128_u64[0];
      if (v70.n128_u64[0])
      {
        swift_bridgeObjectRelease();
        v70.n128_u64[0] = v31;
        __swift_instantiateConcreteTypeFromMangledName(&qword_25531D038);
        v55 = sub_21CC751D4();
        v67 = v33;
        sub_21CC74F70();
        swift_allocObject();
        sub_21CC74F64();
        v70.n128_u64[0] = v32;
        sub_21CC61700(&qword_25531D040, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
        v66.n128_u64[0] = sub_21CC74F58();
        v66.n128_u64[1] = v34;
        OUTLINED_FUNCTION_85_0();
        swift_release();
      }
      else
      {
        v66.n128_u64[0] = 0;
        v66.n128_u64[1] = 0xF000000000000000;
      }
    }
    else
    {
      v66 = v70;
    }
    v72 = 6;
    sub_21CC58090();
    OUTLINED_FUNCTION_15_1();
    v35 = v61;
    v36 = v70;
    v37 = v71;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531CD78);
    v72 = 7;
    sub_21CC63DBC(&qword_25531CDB8, (uint64_t (*)(void))sub_21CC58130, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_15_1();
    v54 = v36.n128_u64[0];
    v38 = v70.n128_u64[0];
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531D020);
    v72 = 8;
    sub_21CC6167C();
    OUTLINED_FUNCTION_15_1();
    v39 = v70.n128_u64[0];
    OUTLINED_FUNCTION_80_0(9);
    v52 = sub_21CC75378();
    v53 = v40;
    OUTLINED_FUNCTION_80_0(10);
    v51 = sub_21CC75384();
    v50 = v41;
    OUTLINED_FUNCTION_5_1();
    v70.n128_u8[0] = 11;
    sub_21CC5B7BC(&qword_254072A58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    OUTLINED_FUNCTION_15_1();
    sub_21CC65054((uint64_t)v63, v62, &qword_254072918);
    v70.n128_u64[0] = v54;
    v70.n128_u64[1] = v36.n128_u64[1];
    v71 = v37;
    if (v38)
      v42 = v38;
    else
      v42 = MEMORY[0x24BEE4AF8];
    if ((v50 & 1) != 0)
      v43 = 0.0;
    else
      v43 = *(double *)&v51;
    sub_21CC65054((uint64_t)v65, v64, &qword_254072900);
    if (!v39)
    {
      type metadata accessor for RRAnnotationValue(0);
      v39 = sub_21CC75198();
    }
    v44 = objc_allocWithZone((Class)type metadata accessor for RRAnnotatedEntity(0));
    RRAnnotatedEntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(v57, v35, v56, v59, v58, v62, v55, v67, v43, v66.n128_i64[0], v66.n128_u64[1], &v70, v42, v64, 0, 1, v39, v52, v53);
    v16 = v45;
    sub_21CC6221C((uint64_t)v65, &qword_254072900);
    OUTLINED_FUNCTION_130(v46, &qword_254072918);
    v47 = OUTLINED_FUNCTION_106();
    v48(v47);
    __swift_destroy_boxed_opaque_existential_0Tm(v68);
  }
  return v16;
}

unint64_t sub_21CC61640()
{
  unint64_t result;

  result = qword_25531D008;
  if (!qword_25531D008)
  {
    result = MEMORY[0x220789FD0](&unk_21CC77544, &type metadata for RRAnnotatedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D008);
  }
  return result;
}

unint64_t sub_21CC6167C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25531D028;
  if (!qword_25531D028)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531D020);
    sub_21CC5B7BC(&qword_25531D030, type metadata accessor for RRAnnotationValue, (uint64_t)&protocol conformance descriptor for RRAnnotationValue);
    v3[0] = MEMORY[0x24BEE0D38];
    v3[1] = v2;
    result = MEMORY[0x220789FD0](MEMORY[0x24BEE04E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25531D028);
  }
  return result;
}

void sub_21CC61700(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD v7[2];

  if (!*a1)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531D010);
    v7[0] = a2;
    v7[1] = a2;
    atomic_store(MEMORY[0x220789FD0](a3, v6, v7), a1);
  }
  OUTLINED_FUNCTION_90_0();
}

uint64_t sub_21CC61754()
{
  unint64_t v0;

  v0 = sub_21CC75354();
  OUTLINED_FUNCTION_71();
  if (v0 >= 0xC)
    return 12;
  else
    return v0;
}

uint64_t sub_21CC6179C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_34_0 + 4 * byte_21CC77156[a1]))(25705, 0xE200000000000000);
}

unint64_t sub_21CC617EC()
{
  return 0xD000000000000012;
}

uint64_t sub_21CC61808(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_34_0_0
                                                            + 4 * byte_21CC77162[a1]))(25705, 0xE200000000000000);
}

unint64_t sub_21CC61858()
{
  return 0xD000000000000012;
}

void sub_21CC61874(char *a1)
{
  sub_21CC66F60(*a1);
}

void sub_21CC61880()
{
  unsigned __int8 *v0;

  sub_21CC674C8(*v0);
}

void sub_21CC61888(uint64_t a1)
{
  char *v1;

  sub_21CC67628(a1, *v1);
}

void sub_21CC61890(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_21CC67A30(a1, *v1);
}

uint64_t sub_21CC61898@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC61754();
  *a1 = result;
  return result;
}

void sub_21CC618C4(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_21CC6179C(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC618E8()
{
  unsigned __int8 *v0;

  return sub_21CC61808(*v0);
}

uint64_t sub_21CC618F0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC61798();
  *a1 = result;
  return result;
}

void sub_21CC61914(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_21CC61920()
{
  sub_21CC61640();
  return sub_21CC75534();
}

uint64_t sub_21CC61948()
{
  sub_21CC61640();
  return sub_21CC75540();
}

uint64_t sub_21CC61970@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id + 8);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId + 8);
  v22 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId);
  v23 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_usoEntity);
  v6 = v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_typedValue;
  v7 = (int *)OUTLINED_FUNCTION_3();
  sub_21CC65054(v6, (uint64_t)a1 + v7[7], &qword_254072918);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType + 8);
  v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data);
  v10 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data + 8);
  v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group + 8);
  v20 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group);
  v21 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType);
  v19 = *(_QWORD *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group + 16);
  v12 = (uint64_t *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata);
  OUTLINED_FUNCTION_0_2();
  v13 = *v12;
  v14 = (_QWORD *)((char *)a1 + v7[10]);
  v15 = (_QWORD *)((char *)a1 + v7[12]);
  *a1 = v23;
  a1[1] = v3;
  a1[2] = v22;
  a1[3] = v4;
  a1[4] = v5;
  v16 = (_QWORD *)((char *)a1 + v7[8]);
  *v16 = v21;
  v16[1] = v8;
  v17 = (_QWORD *)((char *)a1 + v7[9]);
  *v17 = v9;
  v17[1] = v10;
  *v14 = v20;
  v14[1] = v11;
  v14[2] = v19;
  *(_QWORD *)((char *)a1 + v7[11]) = v13;
  *v15 = 0;
  v15[1] = 0;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_18_1();
  swift_bridgeObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_123(v9);
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_23();
}

void sub_21CC61AF0(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;

  sub_21CC61970(a1);
  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score);
  OUTLINED_FUNCTION_0_2();
  v4 = *v3;
  *(_QWORD *)((char *)a1 + *(int *)(type metadata accessor for RRCandidate(0) + 20)) = v4;
  OUTLINED_FUNCTION_87_0();
}

uint64_t sub_21CC61B48(uint64_t a1)
{
  uint64_t v1;
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char v56;
  double *v57;
  double v58;
  double *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  uint64_t v69;
  char v70;
  void (*v71)(uint64_t);
  uint64_t v72;
  uint64_t v73;
  double v74;
  char *v75;
  char v76;
  char *v77;
  uint64_t *v78;
  uint64_t v79;
  id v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char v90[8];
  uint64_t v91;

  v6 = OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_9_0();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D048);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  OUTLINED_FUNCTION_1();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v83 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v83 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v83 - v17;
  sub_21CC65054(a1, (uint64_t)v90, &qword_25531D050);
  if (!v91)
  {
    sub_21CC6221C((uint64_t)v90, &qword_25531D050);
    goto LABEL_61;
  }
  OUTLINED_FUNCTION_54_0();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v86 = v2;
    v19 = v89;
    OUTLINED_FUNCTION_93_0(OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_id);
    v22 = v22 && v20 == v21;
    if (!v22 && (OUTLINED_FUNCTION_22() & 1) == 0)
      goto LABEL_60;
    OUTLINED_FUNCTION_93_0(OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId);
    v25 = v22 && v23 == v24;
    if (!v25 && (OUTLINED_FUNCTION_22() & 1) == 0)
      goto LABEL_60;
    v83 = v4;
    v85 = v3;
    v84 = v6;
    v87 = v1;
    sub_21CC75078();
    v26 = OUTLINED_FUNCTION_68();
    v28 = v27;
    swift_release();
    v88 = v19;
    sub_21CC75078();
    v29 = OUTLINED_FUNCTION_68();
    v31 = v30;
    swift_release();
    if (v26 == v29 && v28 == v31)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v33 = OUTLINED_FUNCTION_22();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_71();
      if ((v33 & 1) == 0)
      {
LABEL_18:

        goto LABEL_61;
      }
    }
    v34 = v87;
    v35 = *(_QWORD *)(v87 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType + 8);
    v19 = v88;
    v36 = *(_QWORD *)&v88[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType + 8];
    if (v35)
    {
      if (!v36)
        goto LABEL_60;
      v37 = *(_QWORD *)(v87 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType) == *(_QWORD *)&v88[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_dataType]
         && v35 == v36;
      if (!v37 && (OUTLINED_FUNCTION_22() & 1) == 0)
        goto LABEL_60;
    }
    else if (v36)
    {
      goto LABEL_60;
    }
    v38 = *(_QWORD *)(v34 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data);
    v39 = *(_QWORD *)(v34 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data + 8);
    v40 = *(_QWORD *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_data + 8];
    if (v39 >> 60 == 15)
    {
      if (v40 >> 60 == 15)
        goto LABEL_36;
    }
    else if (v40 >> 60 != 15)
    {
      v43 = OUTLINED_FUNCTION_72_0();
      v44 = MEMORY[0x2207897C0](v43);
      OUTLINED_FUNCTION_57_0();
      sub_21CC553BC(v38, v39);
      if ((v44 & 1) == 0)
        goto LABEL_60;
LABEL_36:
      v45 = v87;
      v46 = (_QWORD *)(v87 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group);
      v47 = *(_QWORD *)(v87 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group + 8);
      v48 = &v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group];
      v49 = *(_QWORD *)&v19[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_group + 8];
      if (v47)
      {
        if (v49)
        {
          v50 = v46[2];
          v51 = *((_QWORD *)v48 + 2);
          v52 = *v46 == *(_QWORD *)v48 && v47 == v49;
          if (!v52 && (OUTLINED_FUNCTION_22() & 1) == 0 || v50 != v51)
            goto LABEL_60;
LABEL_46:
          OUTLINED_FUNCTION_0_2();
          OUTLINED_FUNCTION_0_2();
          OUTLINED_FUNCTION_18_1();
          OUTLINED_FUNCTION_23();
          v53 = OUTLINED_FUNCTION_57();
          v55 = v19;
          v56 = sub_21CC56A24(v53, v54);
          OUTLINED_FUNCTION_71();
          OUTLINED_FUNCTION_59();
          if ((v56 & 1) == 0
            || (v57 = (double *)(v45 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score),
                OUTLINED_FUNCTION_0_2(),
                v58 = *v57,
                v59 = (double *)&v55[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_score],
                OUTLINED_FUNCTION_0_2(),
                v58 != *v59))
          {

            goto LABEL_61;
          }
          v60 = v45 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt;
          OUTLINED_FUNCTION_0_2();
          OUTLINED_FUNCTION_73_0(v60, (uint64_t)v18);
          v19 = v88;
          v61 = &v88[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt];
          OUTLINED_FUNCTION_0_2();
          OUTLINED_FUNCTION_73_0((uint64_t)v61, (uint64_t)v16);
          v62 = v85;
          v63 = v85 + *(int *)(v8 + 48);
          OUTLINED_FUNCTION_73_0((uint64_t)v18, v85);
          OUTLINED_FUNCTION_73_0((uint64_t)v16, v63);
          v64 = v84;
          OUTLINED_FUNCTION_103(v62, 1, v84);
          if (v22)
          {
            OUTLINED_FUNCTION_92_0((uint64_t)v16);
            OUTLINED_FUNCTION_92_0((uint64_t)v18);
            v65 = OUTLINED_FUNCTION_103(v63, 1, v64);
            if (v22)
            {
              OUTLINED_FUNCTION_119(v65, &qword_254072900);
              goto LABEL_64;
            }
          }
          else
          {
            sub_21CC65054(v62, (uint64_t)v13, &qword_254072900);
            OUTLINED_FUNCTION_103(v63, 1, v64);
            if (!v66)
            {
              v69 = v83;
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v83 + 32))(v86, v63, v64);
              sub_21CC5B7BC(&qword_25531D058, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
              v70 = sub_21CC751B0();
              v71 = *(void (**)(uint64_t))(v69 + 8);
              v72 = OUTLINED_FUNCTION_57();
              v71(v72);
              OUTLINED_FUNCTION_126((uint64_t)v16);
              OUTLINED_FUNCTION_126((uint64_t)v18);
              ((void (*)(char *, uint64_t))v71)(v13, v64);
              v19 = v88;
              OUTLINED_FUNCTION_126(v62);
              if ((v70 & 1) != 0)
              {
LABEL_64:
                v73 = v45
                    + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment;
                OUTLINED_FUNCTION_0_2();
                v74 = *(double *)v73;
                v75 = v19;
                v76 = *(_BYTE *)(v73 + 8);
                v77 = &v75[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
                OUTLINED_FUNCTION_0_2();
                if ((v76 & 1) != 0)
                {
                  if ((v77[8] & 1) == 0)
                    goto LABEL_18;
                }
                else if ((v77[8] & 1) != 0 || v74 != *(double *)v77)
                {
                  goto LABEL_18;
                }
                v78 = (uint64_t *)(v45 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations);
                OUTLINED_FUNCTION_0_2();
                v79 = *v78;
                v80 = v88;
                v81 = (uint64_t *)&v88[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_annotations];
                OUTLINED_FUNCTION_0_2();
                v82 = *v81;
                OUTLINED_FUNCTION_23();
                OUTLINED_FUNCTION_55_0();
                v67 = sub_21CC62254(v79, v82);

                OUTLINED_FUNCTION_59();
                OUTLINED_FUNCTION_44_0();
                return v67 & 1;
              }
LABEL_60:

              goto LABEL_61;
            }
            OUTLINED_FUNCTION_92_0((uint64_t)v16);
            OUTLINED_FUNCTION_92_0((uint64_t)v18);
            v65 = (*(uint64_t (**)(char *, uint64_t))(v83 + 8))(v13, v64);
          }
          OUTLINED_FUNCTION_119(v65, &qword_25531D048);
          goto LABEL_60;
        }
        OUTLINED_FUNCTION_38_1();
      }
      else if (!v49)
      {
        goto LABEL_46;
      }

      swift_bridgeObjectRelease();
      goto LABEL_61;
    }
    v41 = OUTLINED_FUNCTION_72_0();
    sub_21CC553BC(v41, v42);
    OUTLINED_FUNCTION_57_0();
    goto LABEL_60;
  }
LABEL_61:
  v67 = 0;
  return v67 & 1;
}

void sub_21CC6221C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC62254(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  _QWORD *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  int EnumTagSinglePayload;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  char *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  unint64_t v56;
  uint64_t v57;
  char v59;
  int64_t v60;
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int64_t v73;
  unsigned int v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;

  v70 = sub_21CC74FD0();
  v72 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v69 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for RRAnnotationValue(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v71 = (uint64_t)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v60 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v60 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D0B0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (int64_t *)((char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = MEMORY[0x24BDAC7A8](v15);
  v20 = (int64_t *)((char *)&v60 - v19);
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v73 = 0;
  v63 = a1;
  v23 = *(_QWORD *)(a1 + 64);
  v22 = a1 + 64;
  v21 = v23;
  v24 = 1 << *(_BYTE *)(v22 - 32);
  v25 = -1;
  if (v24 < 64)
    v25 = ~(-1 << v24);
  v26 = v25 & v21;
  v61 = v22;
  v62 = (unint64_t)(v24 + 63) >> 6;
  v60 = v62 - 1;
  v67 = v6;
  v68 = a2;
  v65 = (int64_t *)((char *)&v60 - v19);
  v66 = v17;
  v64 = v11;
  while (1)
  {
    if (v26)
    {
      v75 = (v26 - 1) & v26;
      v27 = __clz(__rbit64(v26)) | (v73 << 6);
LABEL_8:
      v28 = *(_QWORD *)(v63 + 56);
      v29 = (_QWORD *)(*(_QWORD *)(v63 + 48) + 16 * v27);
      v30 = v29[1];
      *v17 = *v29;
      v17[1] = v30;
      v31 = v28 + *(_QWORD *)(v6 + 72) * v27;
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D0B8);
      sub_21CC5F4E0(v31, (uint64_t)v17 + *(int *)(v32 + 48));
      __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v32);
      swift_bridgeObjectRetain();
      goto LABEL_30;
    }
    v33 = v73 + 1;
    if (__OFADD__(v73, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v33 < v62)
    {
      v34 = *(_QWORD *)(v61 + 8 * v33);
      if (v34)
        goto LABEL_12;
      v35 = v73 + 2;
      ++v73;
      if (v33 + 1 < v62)
      {
        v34 = *(_QWORD *)(v61 + 8 * v35);
        if (v34)
          goto LABEL_15;
        v73 = v33 + 1;
        if (v33 + 2 < v62)
        {
          v34 = *(_QWORD *)(v61 + 8 * (v33 + 2));
          if (v34)
          {
            v33 += 2;
            goto LABEL_12;
          }
          v73 = v33 + 2;
          if (v33 + 3 < v62)
          {
            v34 = *(_QWORD *)(v61 + 8 * (v33 + 3));
            if (v34)
            {
              v33 += 3;
              goto LABEL_12;
            }
            v35 = v33 + 4;
            v73 = v33 + 3;
            if (v33 + 4 < v62)
              break;
          }
        }
      }
    }
LABEL_29:
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D0B8);
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v36);
    v75 = 0;
LABEL_30:
    sub_21CC64FC8((uint64_t)v17, (uint64_t)v20);
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D0B8);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v20, 1, v37);
    v39 = EnumTagSinglePayload == 1;
    if (EnumTagSinglePayload == 1)
      return v39;
    v40 = (uint64_t)v20 + *(int *)(v37 + 48);
    v41 = *v20;
    v42 = v20[1];
    sub_21CC65010(v40, (uint64_t)v13);
    v43 = sub_21CC64E84(v41, v42);
    v45 = v44;
    swift_bridgeObjectRelease();
    if ((v45 & 1) == 0)
    {
      sub_21CC5F5C8((uint64_t)v13);
      return 0;
    }
    v74 = v39;
    sub_21CC5F4E0(*(_QWORD *)(a2 + 56) + *(_QWORD *)(v6 + 72) * v43, (uint64_t)v11);
    v46 = (uint64_t)v11;
    v47 = v71;
    sub_21CC5F4E0(v46, v71);
    v48 = v72;
    v49 = *(void (**)(char *, uint64_t, uint64_t))(v72 + 32);
    v50 = v69;
    v51 = (uint64_t)v13;
    v52 = v70;
    v49(v69, v47, v70);
    v76 = 0x2865746164;
    v77 = 0xE500000000000000;
    sub_21CC5B7BC(&qword_254072A60, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    sub_21CC75444();
    sub_21CC751EC();
    swift_bridgeObjectRelease();
    sub_21CC751EC();
    v54 = v76;
    v53 = v77;
    v55 = *(void (**)(char *, uint64_t))(v48 + 8);
    v55(v50, v52);
    sub_21CC5F4E0(v51, v47);
    v49(v50, v47, v52);
    v76 = 0x2865746164;
    v77 = 0xE500000000000000;
    sub_21CC75444();
    sub_21CC751EC();
    swift_bridgeObjectRelease();
    sub_21CC751EC();
    v57 = v76;
    v56 = v77;
    v55(v50, v52);
    if (v54 == v57 && v53 == v56)
    {
      swift_bridgeObjectRelease_n();
      v11 = v64;
      sub_21CC5F5C8((uint64_t)v64);
      result = sub_21CC5F5C8(v51);
      v6 = v67;
      a2 = v68;
      v13 = (char *)v51;
      v20 = v65;
      v17 = v66;
      v26 = v75;
    }
    else
    {
      v59 = sub_21CC75450();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v11 = v64;
      sub_21CC5F5C8((uint64_t)v64);
      result = sub_21CC5F5C8(v51);
      v6 = v67;
      a2 = v68;
      v13 = (char *)v51;
      v20 = v65;
      v17 = v66;
      v26 = v75;
      v39 = v74;
      if ((v59 & 1) == 0)
        return v39;
    }
  }
  v34 = *(_QWORD *)(v61 + 8 * v35);
  if (v34)
  {
LABEL_15:
    v33 = v35;
LABEL_12:
    v75 = (v34 - 1) & v34;
    v27 = __clz(__rbit64(v34)) + (v33 << 6);
    v73 = v33;
    goto LABEL_8;
  }
  while (1)
  {
    v33 = v35 + 1;
    if (__OFADD__(v35, 1))
      break;
    if (v33 >= v62)
    {
      v73 = v60;
      goto LABEL_29;
    }
    v34 = *(_QWORD *)(v61 + 8 * v33);
    ++v35;
    if (v34)
      goto LABEL_12;
  }
LABEL_44:
  __break(1u);
  return result;
}

void sub_21CC6289C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_metadata;
  OUTLINED_FUNCTION_0_2();
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)v1 + 48;
    do
    {
      if (!*(_BYTE *)(v3 + 32))
        break;
      v3 += 56;
      --v2;
    }
    while (v2);
  }
  OUTLINED_FUNCTION_63_0();
}

id RRAnnotatedEntity.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_99_0(), sel_init);
}

void RRAnnotatedEntity.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id RRAnnotatedEntity.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_54_0();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_21CC62A68(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_14();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D060);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_10_1();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC61640();
  sub_21CC75528();
  OUTLINED_FUNCTION_60_0();
  if (!v2)
  {
    OUTLINED_FUNCTION_60_0();
    sub_21CC75138();
    sub_21CC5B7BC(&qword_25531CD58, (uint64_t (*)(uint64_t))MEMORY[0x24BEA3820], MEMORY[0x24BEA3830]);
    OUTLINED_FUNCTION_21_0();
    sub_21CC75180();
    sub_21CC5B7BC(&qword_25531CD60, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9A18], MEMORY[0x24BEB9A28]);
    OUTLINED_FUNCTION_39_1();
    OUTLINED_FUNCTION_91_0();
    sub_21CC57EFC();
    OUTLINED_FUNCTION_39_1();
    sub_21CC57F38();
    OUTLINED_FUNCTION_39_1();
    OUTLINED_FUNCTION_8_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531CD78);
    sub_21CC63DBC(&qword_25531CD80, (uint64_t (*)(void))sub_21CC57FB8, MEMORY[0x24BEE12A0]);
    OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_8_1();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531D020);
    sub_21CC63E18();
    OUTLINED_FUNCTION_21_0();
    v9 = (uint64_t *)(v5 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_userId);
    OUTLINED_FUNCTION_8_1();
    v10 = *v9;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_91_0();
    if (v10)
    {
      OUTLINED_FUNCTION_68_0(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
      OUTLINED_FUNCTION_37_1();
      goto LABEL_11;
    }
    OUTLINED_FUNCTION_37_1();
    OUTLINED_FUNCTION_8_1();
    sub_21CC75420();
    v11 = v5 + OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_saliencyComputedAt;
    OUTLINED_FUNCTION_8_1();
    sub_21CC65054(v11, v3, &qword_254072900);
    OUTLINED_FUNCTION_5_1();
    sub_21CC5B7BC(&qword_254072A50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    OUTLINED_FUNCTION_39_1();
    sub_21CC6221C(v3, &qword_254072900);
  }
  OUTLINED_FUNCTION_68_0(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
LABEL_11:
  OUTLINED_FUNCTION_0();
}

_QWORD *sub_21CC62EA0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = RRAnnotatedEntity.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_21CC62EC8(_QWORD *a1)
{
  sub_21CC62A68(a1);
}

SiriReferenceResolutionDataModel::RRAnnotationName_optional __swiftcall RRAnnotationName.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  SiriReferenceResolutionDataModel::RRAnnotationName_optional result;

  v2 = v1;
  v3 = sub_21CC75354();
  OUTLINED_FUNCTION_71();
  v4 = 6;
  if (v3 < 6)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_44();
  return result;
}

void sub_21CC62F34(char *a1)
{
  sub_21CC67200(*a1);
}

void sub_21CC62F40()
{
  sub_21CC6750C();
}

void sub_21CC62F48(uint64_t a1)
{
  char *v1;

  sub_21CC67778(a1, *v1);
}

void sub_21CC62F50()
{
  sub_21CC67A24();
}

SiriReferenceResolutionDataModel::RRAnnotationName_optional sub_21CC62F58(Swift::String *a1)
{
  return RRAnnotationName.init(rawValue:)(*a1);
}

void sub_21CC62F64(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = RRAnnotationName.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_55();
}

uint64_t RRAnnotationValue.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  v3 = OUTLINED_FUNCTION_5_1();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_9_0();
  type metadata accessor for RRAnnotationValue(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_10_1();
  sub_21CC5F4E0(v0, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v1, v2, v3);
  sub_21CC5B7BC(&qword_254072A60, v4, MEMORY[0x24BDCE988]);
  sub_21CC75444();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  sub_21CC751EC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  return 0x2865746164;
}

uint64_t RRAnnotationValue.init(date:)()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  OUTLINED_FUNCTION_5_1();
  v0 = OUTLINED_FUNCTION_127();
  return v1(v0);
}

void RRAnnotationValue.init(from:)(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  char *v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  uint64_t v30;

  v26 = a2;
  v27 = sub_21CC7530C();
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_24_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_1_0();
  v30 = v8;
  v28 = OUTLINED_FUNCTION_5_1();
  v9 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  OUTLINED_FUNCTION_125();
  sub_21CC75504();
  if (!v2)
  {
    v22 = v9;
    v23 = v11;
    v24 = v3;
    v25 = v4;
    v12 = v27;
    __swift_project_boxed_opaque_existential_1(v29, v29[3]);
    sub_21CC5B7BC(&qword_254072A58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    v13 = v30;
    v14 = v28;
    sub_21CC7545C();
    OUTLINED_FUNCTION_109(v13, 0);
    if (__swift_getEnumTagSinglePayload(v13, 1, v14) == 1)
    {
      sub_21CC6221C(v13, &qword_254072900);
      __swift_project_boxed_opaque_existential_1(a1, a1[3]);
      sub_21CC754F8();
      v15 = v24;
      sub_21CC75300();
      v16 = sub_21CC75318();
      swift_allocError();
      v18 = v17;
      v19 = v25;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v17, v15, v12);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v18, *MEMORY[0x24BEE26D8], v16);
      swift_willThrow();
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v15, v12);
    }
    else
    {
      v20 = v23;
      v21 = *(void (**)(char *, uint64_t, uint64_t))(v22 + 32);
      v21(v23, v13, v14);
      v21(v26, (uint64_t)v20, v14);
    }
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v29);
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  OUTLINED_FUNCTION_0();
}

void RRAnnotationValue.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];
  uint64_t v7;

  v3 = OUTLINED_FUNCTION_5_1();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_10_1();
  type metadata accessor for RRAnnotationValue(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_24_0();
  OUTLINED_FUNCTION_128();
  sub_21CC7551C();
  sub_21CC5F4E0(v0, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v1, v2, v3);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, v7);
  sub_21CC5B7BC(&qword_254072A50, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  sub_21CC75468();
  OUTLINED_FUNCTION_68_0(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v6);
  OUTLINED_FUNCTION_0();
}

uint64_t static RRAnnotationValue.== infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = RRAnnotationValue.description.getter();
  v2 = v1;
  if (v0 == RRAnnotationValue.description.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_59();
  return v5 & 1;
}

void RRAnnotationValue.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for RRAnnotationValue(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_26_1(v2, v4);
  sub_21CC754C8();
  v3 = OUTLINED_FUNCTION_5_1();
  sub_21CC5B7BC(&qword_25531D078, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_21CC751A4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0, v3);
  OUTLINED_FUNCTION_44();
}

uint64_t RRAnnotationValue.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  type metadata accessor for RRAnnotationValue(0);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_27_1();
  sub_21CC754BC();
  v1 = OUTLINED_FUNCTION_127();
  sub_21CC5F4E0(v1, v2);
  sub_21CC754C8();
  OUTLINED_FUNCTION_5_1();
  sub_21CC5B7BC(&qword_25531D078, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_21CC751A4();
  OUTLINED_FUNCTION_66_0();
  return sub_21CC754EC();
}

void sub_21CC63630(_QWORD *a1@<X0>, char *a2@<X8>)
{
  RRAnnotationValue.init(from:)(a1, a2);
}

void sub_21CC63644()
{
  RRAnnotationValue.encode(to:)();
}

uint64_t sub_21CC63660(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  MEMORY[0x24BDAC7A8](a1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21CC754BC();
  sub_21CC5F4E0(v1, (uint64_t)v3);
  sub_21CC754C8();
  v4 = sub_21CC74FD0();
  sub_21CC5B7BC(&qword_25531D078, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  sub_21CC751A4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return sub_21CC754EC();
}

int *RREntity.toAnnotatedEntity(addUsoIdentifierIfNotPresent:configuration:)(char a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  int *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  unint64_t v40;
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
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  double v68;
  __n128 *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  char *v78;
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
  double v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  __n128 v109;
  __int128 v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  __n128 v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  __n128 v126;

  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072900);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072918);
  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21CC75030();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_1_0();
  v15 = *a2;
  v16 = a2[1];
  if (v16 == 1)
    v17 = 0;
  else
    v17 = *a2;
  if (v16 == 1)
    v18 = 0;
  else
    v18 = a2[1];
  v19 = *v3;
  v20 = v3[1];
  v124 = v3[2];
  v21 = v3[3];
  v122 = v8;
  v123 = v21;
  v120 = v17;
  v121 = v19;
  v119 = v18;
  if ((a1 & 1) != 0)
  {
    v118 = v14;
    v22 = v15;
    v23 = v13;
    OUTLINED_FUNCTION_107(v22);
    v24 = v20;
    OUTLINED_FUNCTION_38_1();
    v25 = v123;
    OUTLINED_FUNCTION_38_1();
    v26 = v23;
    sub_21CC75024();
    v116 = v3[4];
    v27 = sub_21CC75120();
    v28 = (int *)v27;
    v29 = *(_QWORD *)(v27 + 16);
    v114 = v24;
    if (v29)
    {
      v30 = (uint64_t)v11;
      v31 = v27 + ((*(unsigned __int8 *)(v118 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v118 + 80));
      v32 = *(_QWORD *)(v118 + 72);
      sub_21CC5B7BC(&qword_25531D080, (uint64_t (*)(uint64_t))MEMORY[0x24BE9F9A0], MEMORY[0x24BE9F9B0]);
      while ((sub_21CC751B0() & 1) == 0)
      {
        v31 += v32;
        if (!--v29)
        {
          OUTLINED_FUNCTION_71();
          v11 = (char *)v30;
          v33 = v123;
          goto LABEL_15;
        }
      }
      OUTLINED_FUNCTION_71();
      v70 = OUTLINED_FUNCTION_3();
      v71 = OUTLINED_FUNCTION_86_0(v70);
      v117 = (char *)v30;
      sub_21CC65054(v71, v30, &qword_254072918);
      v72 = v28[9];
      v73 = (unint64_t *)((char *)v3 + v28[8]);
      v74 = v73[1];
      v115.n128_u64[0] = *v73;
      v76 = *(uint64_t *)((char *)v3 + v72 + 8);
      v112 = *(uint64_t *)((char *)v3 + v72);
      v75 = v112;
      v113 = v74;
      v77 = v28[11];
      v78 = (char *)v3 + v28[10];
      v125 = *(_QWORD *)v78;
      v110 = *(_OWORD *)(v78 + 8);
      v126 = (__n128)v110;
      v79 = *(uint64_t *)((char *)v3 + v77);
      v80 = OUTLINED_FUNCTION_5_1();
      v81 = (uint64_t)v122;
      OUTLINED_FUNCTION_3_1((uint64_t)v122, v82, v83, v80);
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_91();
      OUTLINED_FUNCTION_38_1();
      v84 = v116;
      swift_retain();
      sub_21CC5484C(v75, v76);
      OUTLINED_FUNCTION_88_0();
      OUTLINED_FUNCTION_18_1();
      OUTLINED_FUNCTION_84_0();
      OUTLINED_FUNCTION_78_0();
      OUTLINED_FUNCTION_28_1();
      OUTLINED_FUNCTION_19_1();
      v111 = v81;
      v112 = 0;
      *(_QWORD *)&v110 = v85;
      *((_QWORD *)&v110 + 1) = v79;
      v109.n128_u64[1] = v76;
      v109.n128_u64[0] = 0;
      v86 = OUTLINED_FUNCTION_49_0();
      OUTLINED_FUNCTION_79_0(v86, v87, v88, v89, v84, (uint64_t)v117, v115.n128_i64[0], v113, v90, v109.n128_i64[0], v109.n128_u64[1], (__n128 *)v110, *((uint64_t *)&v110 + 1), v111, v112, v113, v114, v115.n128_i64[0], v115.n128_i64[1]);
      OUTLINED_FUNCTION_112();
      (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v26, v12);
    }
    else
    {
      v33 = v25;
      OUTLINED_FUNCTION_71();
LABEL_15:
      v28 = (int *)sub_21CC7512C();
      sub_21CC75054();
      swift_allocObject();
      OUTLINED_FUNCTION_57();
      v52 = sub_21CC75048();
      sub_21CC7506C();
      v123 = v26;
      sub_21CC75018();
      v53 = MEMORY[0x22078988C](v52);
      if (v53)
      {
        v113 = v53;
        v54 = OUTLINED_FUNCTION_3();
        v55 = OUTLINED_FUNCTION_86_0(v54);
        sub_21CC65054(v55, (uint64_t)v11, &qword_254072918);
        v56 = v28[9];
        v57 = (uint64_t *)((char *)v3 + v28[8]);
        v58 = v57[1];
        v116 = *v57;
        v112 = v58;
        v59 = (uint64_t)v122;
        v115.n128_u64[0] = v52;
        v61 = *(uint64_t *)((char *)v3 + v56);
        v60 = *(uint64_t *)((char *)v3 + v56 + 8);
        v62 = v28[11];
        v63 = (char *)v3 + v28[10];
        v125 = *(_QWORD *)v63;
        v110 = *(_OWORD *)(v63 + 8);
        v126 = (__n128)v110;
        v64 = *(uint64_t *)((char *)v3 + v62);
        v65 = OUTLINED_FUNCTION_5_1();
        OUTLINED_FUNCTION_3_1(v59, v66, v67, v65);
        OUTLINED_FUNCTION_38_1();
        OUTLINED_FUNCTION_91();
        OUTLINED_FUNCTION_55_0();
        sub_21CC5484C(v61, v60);
        OUTLINED_FUNCTION_88_0();
        OUTLINED_FUNCTION_18_1();
        OUTLINED_FUNCTION_84_0();
        OUTLINED_FUNCTION_78_0();
        OUTLINED_FUNCTION_28_1();
        v68 = OUTLINED_FUNCTION_19_1();
        OUTLINED_FUNCTION_79_0(v121, v114, v124, v33, v113, (uint64_t)v11, v116, 0, v68, v61, v60, v69, v64, v59, 0, v113, v114, v115.n128_i64[0], v115.n128_i64[1]);
      }
      else
      {
        v91 = type metadata accessor for RREntity();
        v92 = OUTLINED_FUNCTION_86_0(v91);
        sub_21CC65054(v92, (uint64_t)v11, &qword_254072918);
        v93 = v28[9];
        v94 = (unint64_t *)((char *)v3 + v28[8]);
        v95 = v94[1];
        v115.n128_u64[0] = *v94;
        v96 = *(uint64_t *)((char *)v3 + v93 + 8);
        v112 = *(uint64_t *)((char *)v3 + v93);
        v97 = v112;
        v113 = v95;
        *(_QWORD *)&v110 = v96;
        v109 = OUTLINED_FUNCTION_104(v28[10]);
        v126 = v109;
        v98 = OUTLINED_FUNCTION_5_1();
        OUTLINED_FUNCTION_3_1((uint64_t)v122, v99, v100, v98);
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_91();
        OUTLINED_FUNCTION_55_0();
        swift_retain();
        v101 = v110;
        sub_21CC5484C(v97, v110);
        v28 = (int *)v109.n128_u64[0];
        type metadata accessor for RRAnnotationValue(0);
        OUTLINED_FUNCTION_18_1();
        OUTLINED_FUNCTION_84_0();
        OUTLINED_FUNCTION_78_0();
        OUTLINED_FUNCTION_28_1();
        OUTLINED_FUNCTION_12_1();
        v109.n128_u64[1] = v101;
        *(_QWORD *)&v110 = v102;
        v109.n128_u64[0] = v112;
        v103 = OUTLINED_FUNCTION_49_0();
        OUTLINED_FUNCTION_79_0(v103, v104, v105, v106, v116, (uint64_t)v11, v115.n128_i64[0], v113, v107, v109.n128_i64[0], v109.n128_u64[1], (__n128 *)v110, *((uint64_t *)&v110 + 1), v111, v112, v113, v114, v115.n128_i64[0], v115.n128_i64[1]);
      }
      OUTLINED_FUNCTION_112();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v123, v12);
    }
  }
  else
  {
    v116 = v3[4];
    v34 = OUTLINED_FUNCTION_3();
    v35 = (uint64_t)v11;
    v117 = v11;
    v36 = (int *)v34;
    sub_21CC65054((uint64_t)v3 + *(int *)(v34 + 28), v35, &qword_254072918);
    v37 = v36[9];
    v38 = (uint64_t *)((char *)v3 + v36[8]);
    v39 = v38[1];
    v118 = *v38;
    v41 = *(uint64_t *)((char *)v3 + v37);
    v40 = *(uint64_t *)((char *)v3 + v37 + 8);
    v115 = OUTLINED_FUNCTION_104(v36[10]);
    v126 = v115;
    v42 = OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_3_1((uint64_t)v8, v43, v44, v42);
    OUTLINED_FUNCTION_107(v15);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_38_1();
    OUTLINED_FUNCTION_38_1();
    v45 = v116;
    swift_retain();
    OUTLINED_FUNCTION_123(v41);
    v28 = (int *)v115.n128_u64[0];
    type metadata accessor for RRAnnotationValue(0);
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_84_0();
    OUTLINED_FUNCTION_78_0();
    OUTLINED_FUNCTION_28_1();
    OUTLINED_FUNCTION_12_1();
    v109.n128_u64[1] = v40;
    *(_QWORD *)&v110 = v46;
    v109.n128_u64[0] = v41;
    v47 = OUTLINED_FUNCTION_49_0();
    OUTLINED_FUNCTION_79_0(v47, v48, v49, v50, v45, (uint64_t)v117, v118, v39, v51, v109.n128_i64[0], v109.n128_u64[1], (__n128 *)v110, *((uint64_t *)&v110 + 1), v111, v112, v113, v114, v115.n128_i64[0], v115.n128_i64[1]);
    OUTLINED_FUNCTION_112();
  }
  return v28;
}

void sub_21CC63DBC(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  if (!*a1)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531CD78);
    v7 = a2();
    atomic_store(MEMORY[0x220789FD0](a3, v6, &v7), a1);
  }
  OUTLINED_FUNCTION_90_0();
}

unint64_t sub_21CC63E18()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_25531D068;
  if (!qword_25531D068)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531D020);
    sub_21CC5B7BC(&qword_25531D070, type metadata accessor for RRAnnotationValue, (uint64_t)&protocol conformance descriptor for RRAnnotationValue);
    v3[0] = MEMORY[0x24BEE0D08];
    v3[1] = v2;
    result = MEMORY[0x220789FD0](MEMORY[0x24BEE04C0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_25531D068);
  }
  return result;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_21CC63EC4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2 != 1)
    return swift_bridgeObjectRetain();
  return result;
}

unint64_t sub_21CC63EDC()
{
  unint64_t result;

  result = qword_25531D088;
  if (!qword_25531D088)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRAnnotationName, &type metadata for RRAnnotationName);
    atomic_store(result, (unint64_t *)&qword_25531D088);
  }
  return result;
}

void sub_21CC63F18()
{
  sub_21CC5B7BC(&qword_25531D090, type metadata accessor for RRAnnotationValue, (uint64_t)&protocol conformance descriptor for RRAnnotationValue);
}

void sub_21CC63F44()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_111();
  *v0 = sub_21CC5E714();
  OUTLINED_FUNCTION_55();
}

void sub_21CC63F68()
{
  double *v0;

  OUTLINED_FUNCTION_111();
  *v0 = sub_21CC5E788();
  OUTLINED_FUNCTION_55();
}

void sub_21CC63F88(double *a1)
{
  sub_21CC5E7E4(*a1);
  OUTLINED_FUNCTION_55();
}

void sub_21CC63FA8()
{
  sub_21CC5E91C();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC63FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21CC5F310(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_21CC5E96C);
}

void sub_21CC63FE8()
{
  uint64_t *v0;

  OUTLINED_FUNCTION_111();
  *v0 = sub_21CC5EB88();
  OUTLINED_FUNCTION_55();
}

void sub_21CC6400C()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_111();
  *v0 = sub_21CC5ECA4();
  v0[1] = v1;
  OUTLINED_FUNCTION_55();
}

void sub_21CC64030()
{
  sub_21CC5F2C8();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC6404C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21CC5F310(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_21CC5F2E4);
}

void sub_21CC64068()
{
  sub_21CC5F678();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC64084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21CC5F310(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_21CC5F7B8);
}

void sub_21CC640A0()
{
  sub_21CC5F8EC();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC640BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21CC5F310(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_21CC5F908);
}

void sub_21CC640D8()
{
  sub_21CC5F9AC();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC640F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21CC5F310(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_21CC5F9D0);
}

void sub_21CC64110()
{
  sub_21CC5FA78();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC6412C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21CC5F310(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_21CC5FAA0);
}

void sub_21CC64148()
{
  sub_21CC5FBE0();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC64164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21CC5F310(a1, a2, a3, a4, (uint64_t (*)(uint64_t))sub_21CC5FC90);
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return type metadata accessor for RRAnnotatedEntity(0);
}

void sub_21CC64188()
{
  unint64_t v0;
  unint64_t v1;

  sub_21CC6484C(319, (unint64_t *)&qword_254072EB8, (void (*)(uint64_t))MEMORY[0x24BEB9A18]);
  if (v0 <= 0x3F)
  {
    sub_21CC6484C(319, &qword_254072A68, (void (*)(uint64_t))MEMORY[0x24BDCE900]);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for RRAnnotatedEntity()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RRAnnotatedEntity.metadata.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.metadata.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.metadata.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.score.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.score.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.score.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.saliencyComputedAt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.saliencyComputedAt.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.saliencyComputedAt.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.onScreenSaliencyAdjustment.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.onScreenSaliencyAdjustment.setter(uint64_t a1, char a2)
{
  _QWORD *v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v2) + 0x108))(a1, a2 & 1);
}

uint64_t dispatch thunk of RRAnnotatedEntity.onScreenSaliencyAdjustment.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.annotations.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.annotations.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.annotations.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.userId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.userId.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.userId.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.mentionedAt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.mentionedAt.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.mentionedAt.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.onscreenAt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.onscreenAt.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.onscreenAt.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.foregroundedAt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.foregroundedAt.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.foregroundedAt.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nearbyAt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nearbyAt.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nearbyAt.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.notificationReceivedAt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.notificationReceivedAt.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.notificationReceivedAt.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nowPlayingAt.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nowPlayingAt.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.nowPlayingAt.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.setDateAnnotation(key:value:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.key.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:annotations:userId:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 496))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 504))(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of RRAnnotatedEntity.__allocating_init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 512))(a1, a2, a3, a4, a5, a6);
}

uint64_t dispatch thunk of RRAnnotatedEntity.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 520))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.toRREntity()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x210))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.toRRCandidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x218))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.computeBoundingBoxArea()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x220))();
}

uint64_t dispatch thunk of RRAnnotatedEntity.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x228))();
}

void sub_21CC6484C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_21CC75294();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_55();
}

uint64_t getEnumTagSinglePayload for RRAnnotationName(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFB)
  {
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
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for RRAnnotationName(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC64968 + 4 * byte_21CC77173[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_21CC6499C + 4 * byte_21CC7716E[v4]))();
}

uint64_t sub_21CC6499C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC649A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC649ACLL);
  return result;
}

uint64_t sub_21CC649B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC649C0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_21CC649C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC649CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RRAnnotationName()
{
  return &type metadata for RRAnnotationName;
}

uint64_t *initializeBufferWithCopyOfBuffer for RRAnnotationValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v6 = sub_21CC74FD0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  return a1;
}

uint64_t destroy for RRAnnotationValue(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21CC74FD0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for RRAnnotationValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21CC74FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for RRAnnotationValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21CC74FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for RRAnnotationValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21CC74FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for RRAnnotationValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21CC74FD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for RRAnnotationValue(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21CC74FD0();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for RRAnnotationValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_21CC74FD0();
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v6);
}

uint64_t sub_21CC64C14(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = sub_21CC74FD0();
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RRAnnotatedEntity.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF5)
  {
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
    v5 = (*a1 | (v4 << 8)) - 12;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v5 = v6 - 12;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for RRAnnotatedEntity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC64D44 + 4 * byte_21CC7717D[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_21CC64D78 + 4 * byte_21CC77178[v4]))();
}

uint64_t sub_21CC64D78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC64D80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC64D88);
  return result;
}

uint64_t sub_21CC64D94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC64D9CLL);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_21CC64DA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC64DA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RRAnnotatedEntity.CodingKeys()
{
  return &type metadata for RRAnnotatedEntity.CodingKeys;
}

unint64_t sub_21CC64DC8()
{
  unint64_t result;

  result = qword_25531D098;
  if (!qword_25531D098)
  {
    result = MEMORY[0x220789FD0](&unk_21CC7751C, &type metadata for RRAnnotatedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D098);
  }
  return result;
}

unint64_t sub_21CC64E08()
{
  unint64_t result;

  result = qword_25531D0A0;
  if (!qword_25531D0A0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC77454, &type metadata for RRAnnotatedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D0A0);
  }
  return result;
}

unint64_t sub_21CC64E48()
{
  unint64_t result;

  result = qword_25531D0A8;
  if (!qword_25531D0A8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC7747C, &type metadata for RRAnnotatedEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D0A8);
  }
  return result;
}

unint64_t sub_21CC64E84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21CC754BC();
  sub_21CC751E0();
  v4 = sub_21CC754EC();
  return sub_21CC64EE8(a1, a2, v4);
}

unint64_t sub_21CC64EE8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21CC75450() & 1) == 0)
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
      while (!v14 && (sub_21CC75450() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21CC64FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D0B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CC65010(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RRAnnotationValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_21CC65054(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_57();
  v4(v3);
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC65090@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  swift_bridgeObjectRetain();
  v8 = sub_21CC64E84(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v14 = *v4;
    *v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254072BE0);
    sub_21CC75330();
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v14 + 56);
    v11 = type metadata accessor for RRAnnotationValue(0);
    sub_21CC65010(v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v8, a3);
    sub_21CC7533C();
    *v4 = v14;
    swift_bridgeObjectRelease();
    return __swift_storeEnumTagSinglePayload(a3, 0, 1, v11);
  }
  else
  {
    v13 = type metadata accessor for RRAnnotationValue(0);
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v13);
  }
}

uint64_t sub_21CC651D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_21CC6524C(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CC6524C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v9 = sub_21CC64E84(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072BE0);
  if ((sub_21CC75330() & 1) == 0)
    goto LABEL_5;
  v13 = sub_21CC64E84(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_21CC75480();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    v17 = v16 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for RRAnnotationValue(0) - 8) + 72) * v11;
    return sub_21CC653F4(a1, v17);
  }
  else
  {
    sub_21CC6536C(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_21CC6536C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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
  v10 = type metadata accessor for RRAnnotationValue(0);
  result = sub_21CC65010(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

uint64_t sub_21CC653F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RRAnnotationValue(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_21CC74FD0();
}

void *OUTLINED_FUNCTION_6_1(uint64_t a1)
{
  return malloc(*(_QWORD *)(*(_QWORD *)(a1 - 8) + 64));
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_beginAccess();
}

void *OUTLINED_FUNCTION_11_0()
{
  size_t v0;

  return malloc(v0);
}

double OUTLINED_FUNCTION_12_1()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return sub_21CC75390();
}

uint64_t OUTLINED_FUNCTION_17_1(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_bridgeObjectRetain();
}

double OUTLINED_FUNCTION_19_1()
{
  return 0.0;
}

__n128 OUTLINED_FUNCTION_20_1()
{
  __n128 *v0;

  return v0[2];
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return sub_21CC75438();
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return sub_21CC751EC();
}

uint64_t OUTLINED_FUNCTION_26_1@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  return sub_21CC5F4E0(v2, (uint64_t)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0));
}

id OUTLINED_FUNCTION_28_1()
{
  return objc_allocWithZone((Class)type metadata accessor for RRAnnotatedEntity(0));
}

double OUTLINED_FUNCTION_30_1()
{
  double v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_31_1()
{
  return 0x697461746F6E6E61;
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return 0x6C646E7542707061;
}

uint64_t OUTLINED_FUNCTION_37_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return sub_21CC753FC();
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return 0x6C61566465707974;
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return 0x7469746E456F7375;
}

void OUTLINED_FUNCTION_42_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_21CC5FD24(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  return 0x6570795461746164;
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return 0x617461646174656DLL;
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 144);
}

void OUTLINED_FUNCTION_51_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_21CC6221C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 128) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  uint64_t v0;
  unint64_t v1;

  return sub_21CC553BC(v0, v1);
}

uint64_t OUTLINED_FUNCTION_58_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

_QWORD *OUTLINED_FUNCTION_59_0(_QWORD *result)
{
  uint64_t v1;

  *result = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return sub_21CC75408();
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return 0x644972657375;
}

uint64_t OUTLINED_FUNCTION_62_0()
{
  uint64_t v0;

  sub_21CC553BC(*(_QWORD *)(v0 - 160), *(_QWORD *)(v0 - 152));
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_64_0()
{
  return 0x70756F7267;
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return 0x65726F6373;
}

uint64_t OUTLINED_FUNCTION_66_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return 0x756F726765726F66;
}

uint64_t OUTLINED_FUNCTION_68_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

id OUTLINED_FUNCTION_69_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_71_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_21CC5484C(v0, v3);
  sub_21CC5484C(v1, v2);
  return v0;
}

void OUTLINED_FUNCTION_73_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_21CC65054(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_78_0()
{
  return sub_21CC75198();
}

void OUTLINED_FUNCTION_79_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, uint64_t a10, unint64_t a11, __n128 *a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  RRAnnotatedEntity.init(id:appBundleId:usoEntity:typedValue:dataType:data:group:metadata:score:saliencyComputedAt:onScreenSaliencyAdjustment:annotations:userId:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19);
}

uint64_t OUTLINED_FUNCTION_80_0@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 120) = a1;
  return v1 - 120;
}

void OUTLINED_FUNCTION_81_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_21CC6221C(v2, a2);
}

void OUTLINED_FUNCTION_83_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_21CC5FF7C(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_84_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_85_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_86_0(uint64_t a1)
{
  uint64_t v1;

  return v1 + *(int *)(a1 + 28);
}

uint64_t OUTLINED_FUNCTION_88_0()
{
  return type metadata accessor for RRAnnotationValue(0);
}

uint64_t OUTLINED_FUNCTION_89_0()
{
  return 0x6979616C50776F6ELL;
}

uint64_t OUTLINED_FUNCTION_91_0()
{
  return sub_21CC753F0();
}

void OUTLINED_FUNCTION_92_0(uint64_t a1)
{
  uint64_t *v1;

  sub_21CC6221C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_93_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_94_0()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_95_0()
{
  return 0x656E6F69746E656DLL;
}

uint64_t OUTLINED_FUNCTION_98_0()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_99_0()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_100_0()
{
  return 1635017060;
}

uint64_t OUTLINED_FUNCTION_103(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

__n128 OUTLINED_FUNCTION_104@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = v1 + a1;
  *(_QWORD *)(v2 - 112) = *(_QWORD *)v3;
  return *(__n128 *)(v3 + 8);
}

uint64_t OUTLINED_FUNCTION_105()
{
  return sub_21CC751EC();
}

uint64_t OUTLINED_FUNCTION_106()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_107(uint64_t a1)
{
  uint64_t v1;

  return sub_21CC63EC4(a1, v1);
}

uint64_t OUTLINED_FUNCTION_108(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_109(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_110()
{
  return type metadata accessor for RRAnnotationValue(0);
}

uint64_t OUTLINED_FUNCTION_113()
{
  return sub_21CC751EC();
}

uint64_t OUTLINED_FUNCTION_115()
{
  return sub_21CC7539C();
}

uint64_t OUTLINED_FUNCTION_116()
{
  return sub_21CC753CC();
}

uint64_t OUTLINED_FUNCTION_117()
{
  return 0x6E65657263736E6FLL;
}

uint64_t OUTLINED_FUNCTION_118()
{
  return sub_21CC75180();
}

void OUTLINED_FUNCTION_119(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_21CC6221C(*(_QWORD *)(v2 - 384), a2);
}

uint64_t OUTLINED_FUNCTION_120(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_122()
{
  return sub_21CC751EC();
}

uint64_t OUTLINED_FUNCTION_123(uint64_t a1)
{
  unint64_t v1;

  return sub_21CC5484C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_125()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_126(uint64_t a1)
{
  uint64_t *v1;

  sub_21CC6221C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_127()
{
  uint64_t v0;

  return v0;
}

_QWORD *OUTLINED_FUNCTION_128()
{
  _QWORD *v0;
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(v0, v1);
}

__n128 OUTLINED_FUNCTION_129@<Q0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __n128 a6)
{
  unint64_t v6;
  uint64_t v7;
  __n128 *v8;
  __n128 result;

  v8 = (__n128 *)(v7 + a1);
  result = a6;
  *v8 = a6;
  v8[1].n128_u64[0] = v6;
  return result;
}

void OUTLINED_FUNCTION_130(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_21CC6221C(*(_QWORD *)(v2 - 184), a2);
}

void *static RRCoder.encode<A>(_:)(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5[0] = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 1, v5);
  v2 = v5[0];
  if (v1)
  {
    v3 = (void *)sub_21CC74FA0();

  }
  else
  {
    v3 = v2;
    sub_21CC74F7C();

    swift_willThrow();
  }
  return v3;
}

uint64_t static RRCoder.decode<A>(_:from:)()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  _BYTE v3[24];
  uint64_t v4;

  sub_21CC65D14();
  result = sub_21CC75288();
  if (!v0)
  {
    if (v4)
    {
      if (swift_dynamicCast())
        return v2;
      else
        return 0;
    }
    else
    {
      sub_21CC65D50((uint64_t)v3);
      return 0;
    }
  }
  return result;
}

unint64_t sub_21CC65D14()
{
  unint64_t result;

  result = qword_25531D0C0;
  if (!qword_25531D0C0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25531D0C0);
  }
  return result;
}

uint64_t sub_21CC65D50(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D050);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for RRCoder()
{
  return &type metadata for RRCoder;
}

void RRQuery.description.getter()
{
  uint64_t v0;
  _BYTE v1[72];

  sub_21CC6621C(v0, (uint64_t)v1);
  __asm { BR              X10 }
}

uint64_t sub_21CC65DE0()
{
  uint64_t v0;
  id v1;
  uint64_t v3;
  void *v4;

  OUTLINED_FUNCTION_1_2();
  sub_21CC752E8();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_2();
  v3 = v0;
  if (v4)
  {
    v1 = objc_msgSend(v4, sel_predicateFormat);
    sub_21CC751C8();

  }
  sub_21CC751EC();

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t RROrdinalDirection.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21CC661C8 + 4 * byte_21CC775B0[*v0]))(1413891404, 0xE400000000000000);
}

uint64_t sub_21CC661C8()
{
  return 0x5448474952;
}

uint64_t sub_21CC66210()
{
  return 1262698818;
}

uint64_t sub_21CC6621C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for RRQuery(a2, a1);
  return a2;
}

uint64_t sub_21CC66250(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21CC66298(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D050);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t RRQueryOption.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x446564756C636E49;
  else
    return 0x656C706D6953;
}

SiriReferenceResolutionDataModel::RRQueryOption_optional __swiftcall RRQueryOption.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (SiriReferenceResolutionDataModel::RRQueryOption_optional)rawValue;
}

uint64_t RRQueryOption.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void sub_21CC66348()
{
  sub_21CC67518();
}

void sub_21CC66350()
{
  sub_21CC67888();
}

void sub_21CC66358()
{
  sub_21CC679AC();
}

SiriReferenceResolutionDataModel::RRQueryOption_optional sub_21CC66360(Swift::Int *a1)
{
  return RRQueryOption.init(rawValue:)(*a1);
}

uint64_t sub_21CC66368@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = RRQueryOption.rawValue.getter();
  *a1 = result;
  return result;
}

SiriReferenceResolutionDataModel::RROrdinalDirection_optional __swiftcall RROrdinalDirection.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriReferenceResolutionDataModel::RROrdinalDirection_optional result;
  char v5;

  v2 = v1;
  v3 = sub_21CC75354();
  result.value = swift_bridgeObjectRelease();
  v5 = 6;
  if (v3 < 6)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_21CC663E8(char *a1)
{
  sub_21CC66E24(*a1);
}

void sub_21CC663F4()
{
  sub_21CC67540();
}

void sub_21CC663FC(uint64_t a1)
{
  char *v1;

  sub_21CC67590(a1, *v1);
}

void sub_21CC66404()
{
  sub_21CC67A74();
}

SiriReferenceResolutionDataModel::RROrdinalDirection_optional sub_21CC6640C(Swift::String *a1)
{
  return RROrdinalDirection.init(rawValue:)(*a1);
}

uint64_t sub_21CC66418@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = RROrdinalDirection.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21CC6643C()
{
  sub_21CC66D9C();
  return sub_21CC75210();
}

uint64_t sub_21CC66498()
{
  sub_21CC66D9C();
  return sub_21CC751F8();
}

uint64_t RRExperimentFilter.appBundleId.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RRExperimentFilter.actions.getter()
{
  return swift_bridgeObjectRetain();
}

SiriReferenceResolutionDataModel::RRExperimentFilter __swiftcall RRExperimentFilter.init(appBundleId:actions:)(Swift::String appBundleId, Swift::OpaquePointer actions)
{
  uint64_t v2;
  SiriReferenceResolutionDataModel::RRExperimentFilter result;

  *(Swift::String *)v2 = appBundleId;
  *(Swift::OpaquePointer *)(v2 + 16) = actions;
  result.appBundleId = appBundleId;
  result.actions = actions;
  return result;
}

unint64_t sub_21CC66528()
{
  unint64_t result;

  result = qword_25531D0C8;
  if (!qword_25531D0C8)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRQueryOption, &type metadata for RRQueryOption);
    atomic_store(result, (unint64_t *)&qword_25531D0C8);
  }
  return result;
}

unint64_t sub_21CC66568()
{
  unint64_t result;

  result = qword_25531D0D0;
  if (!qword_25531D0D0)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RROrdinalDirection, &type metadata for RROrdinalDirection);
    atomic_store(result, (unint64_t *)&qword_25531D0D0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for RRMetadata(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for RRQuery(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 64);
  while (2)
  {
    switch(v2)
    {
      case 0:
        v3 = *(void **)a1;
        goto LABEL_6;
      case 1:
        v3 = *(void **)(a1 + 16);
LABEL_6:

        break;
      case 2:
        swift_release();
        break;
      case 3:
        if (*(_QWORD *)(a1 + 24))
          __swift_destroy_boxed_opaque_existential_0Tm(a1);
        if (*(_QWORD *)(a1 + 56))
          __swift_destroy_boxed_opaque_existential_0Tm(a1 + 32);
        break;
      default:
        v2 = *(_DWORD *)a1 + 4;
        continue;
    }
    break;
  }
}

uint64_t initializeWithCopy for RRQuery(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  _OWORD *v9;
  _OWORD *v10;
  uint64_t v11;
  __int128 v12;

  v4 = *(unsigned __int8 *)(a2 + 64);
  while (2)
  {
    switch(v4)
    {
      case 0:
        v5 = *(void **)a2;
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 64) = 0;
        goto LABEL_6;
      case 1:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
        v5 = *(void **)(a2 + 16);
        *(_QWORD *)(a1 + 16) = v5;
        *(_BYTE *)(a1 + 64) = 1;
LABEL_6:
        v6 = v5;
        break;
      case 2:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 64) = 2;
        swift_retain();
        break;
      case 3:
        v7 = *(_QWORD *)(a2 + 24);
        if (v7)
        {
          *(_QWORD *)(a1 + 24) = v7;
          (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
        }
        else
        {
          v8 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v8;
        }
        v9 = (_OWORD *)(a1 + 32);
        v10 = (_OWORD *)(a2 + 32);
        v11 = *(_QWORD *)(a2 + 56);
        if (v11)
        {
          *(_QWORD *)(a1 + 56) = v11;
          (**(void (***)(_OWORD *, _OWORD *))(v11 - 8))(v9, v10);
        }
        else
        {
          v12 = *(_OWORD *)(a2 + 48);
          *v9 = *v10;
          *(_OWORD *)(a1 + 48) = v12;
        }
        *(_BYTE *)(a1 + 64) = 3;
        break;
      default:
        v4 = *(_DWORD *)a2 + 4;
        continue;
    }
    return a1;
  }
}

uint64_t assignWithCopy for RRQuery(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  __int128 v14;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 64);
    while (2)
    {
      switch(v4)
      {
        case 0:
          v5 = *(void **)a1;
          goto LABEL_7;
        case 1:
          v5 = *(void **)(a1 + 16);
LABEL_7:

          break;
        case 2:
          swift_release();
          break;
        case 3:
          if (*(_QWORD *)(a1 + 24))
            __swift_destroy_boxed_opaque_existential_0Tm(a1);
          if (*(_QWORD *)(a1 + 56))
            __swift_destroy_boxed_opaque_existential_0Tm(a1 + 32);
          break;
        default:
          v4 = *(_DWORD *)a1 + 4;
          continue;
      }
      break;
    }
    v6 = *(unsigned __int8 *)(a2 + 64);
    while (2)
    {
      switch(v6)
      {
        case 0:
          v7 = *(void **)a2;
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_BYTE *)(a1 + 64) = 0;
          goto LABEL_18;
        case 1:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
          v7 = *(void **)(a2 + 16);
          *(_QWORD *)(a1 + 16) = v7;
          *(_BYTE *)(a1 + 64) = 1;
LABEL_18:
          v8 = v7;
          break;
        case 2:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          *(_BYTE *)(a1 + 64) = 2;
          swift_retain();
          break;
        case 3:
          v9 = *(_QWORD *)(a2 + 24);
          if (v9)
          {
            *(_QWORD *)(a1 + 24) = v9;
            (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1, a2);
          }
          else
          {
            v10 = *(_OWORD *)(a2 + 16);
            *(_OWORD *)a1 = *(_OWORD *)a2;
            *(_OWORD *)(a1 + 16) = v10;
          }
          v11 = (_OWORD *)(a1 + 32);
          v12 = (_OWORD *)(a2 + 32);
          v13 = *(_QWORD *)(a2 + 56);
          if (v13)
          {
            *(_QWORD *)(a1 + 56) = v13;
            (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
          }
          else
          {
            v14 = *(_OWORD *)(a2 + 48);
            *v11 = *v12;
            *(_OWORD *)(a1 + 48) = v14;
          }
          *(_BYTE *)(a1 + 64) = 3;
          break;
        default:
          v6 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
  }
  return a1;
}

void *__swift_memcpy65_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x41uLL);
}

uint64_t assignWithTake for RRQuery(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  int v6;
  char v7;
  __int128 v8;
  __int128 v9;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 64);
    while (2)
    {
      switch(v4)
      {
        case 0:
          v5 = *(void **)a1;
          goto LABEL_7;
        case 1:
          v5 = *(void **)(a1 + 16);
LABEL_7:

          break;
        case 2:
          swift_release();
          break;
        case 3:
          if (*(_QWORD *)(a1 + 24))
            __swift_destroy_boxed_opaque_existential_0Tm(a1);
          if (*(_QWORD *)(a1 + 56))
            __swift_destroy_boxed_opaque_existential_0Tm(a1 + 32);
          break;
        default:
          v4 = *(_DWORD *)a1 + 4;
          continue;
      }
      break;
    }
    v6 = *(unsigned __int8 *)(a2 + 64);
    while (2)
    {
      switch(v6)
      {
        case 0:
          v7 = 0;
          *(_QWORD *)a1 = *(_QWORD *)a2;
          break;
        case 1:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
          v7 = 1;
          break;
        case 2:
          *(_QWORD *)a1 = *(_QWORD *)a2;
          v7 = 2;
          break;
        case 3:
          v8 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(_OWORD *)(a1 + 16) = v8;
          v9 = *(_OWORD *)(a2 + 48);
          *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
          *(_OWORD *)(a1 + 48) = v9;
          v7 = 3;
          break;
        default:
          v6 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
    *(_BYTE *)(a1 + 64) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for RRQuery(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 65))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 64);
  if (v3 >= 4)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RRQuery(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 64) = 0;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 65) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 65) = 0;
    if (a2)
      *(_BYTE *)(result + 64) = -(char)a2;
  }
  return result;
}

uint64_t sub_21CC66AA0(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 64);
  if (result >= 4)
    return (*(_DWORD *)a1 + 4);
  return result;
}

uint64_t sub_21CC66ABC(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 64) = a2;
  return result;
}

void type metadata accessor for RRQuery()
{
  OUTLINED_FUNCTION_2_1();
}

uint64_t storeEnumTagSinglePayload for RRQueryOption(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC66B3C + 4 * byte_21CC775D3[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21CC66B70 + 4 * byte_21CC775CE[v4]))();
}

uint64_t sub_21CC66B70(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC66B78(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC66B80);
  return result;
}

uint64_t sub_21CC66B8C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC66B94);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21CC66B98(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC66BA0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for RRQueryOption()
{
  OUTLINED_FUNCTION_2_1();
}

uint64_t storeEnumTagSinglePayload for RROrdinalDirection(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC66C04 + 4 * byte_21CC775DD[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_21CC66C38 + 4 * byte_21CC775D8[v4]))();
}

uint64_t sub_21CC66C38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC66C40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC66C48);
  return result;
}

uint64_t sub_21CC66C54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC66C5CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_21CC66C60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC66C68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for RROrdinalDirection()
{
  OUTLINED_FUNCTION_2_1();
}

uint64_t destroy for RRExperimentFilter()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s32SiriReferenceResolutionDataModel18RRExperimentFilterVwCP_0(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for RRExperimentFilter(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for RRExperimentFilter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

void type metadata accessor for RRExperimentFilter()
{
  OUTLINED_FUNCTION_2_1();
}

unint64_t sub_21CC66D9C()
{
  unint64_t result;

  result = qword_25531D0D8;
  if (!qword_25531D0D8)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RROrdinalDirection, &type metadata for RROrdinalDirection);
    atomic_store(result, (unint64_t *)&qword_25531D0D8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return sub_21CC751EC();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_21CC751D4();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return sub_21CC751EC();
}

void sub_21CC66E24(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21CC66E64(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21CC66ED4 + 4 * byte_21CC77866[a2]))(0x5448474952);
}

void sub_21CC66ED4(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x5448474952 || v1 != 0xE500000000000000)
    OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_44();
}

void sub_21CC66F60(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21CC66FA0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21CC670C4 + 4 * byte_21CC77878[a2]))(0x6C646E7542707061);
}

void sub_21CC670C4(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x6C646E7542707061 || v1 != 0xEB00000000644965)
    OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_44();
}

void sub_21CC67200(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21CC6726C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21CC67310 + 4 * byte_21CC7788A[a2]))(0x6E65657263736E6FLL);
}

void sub_21CC67310(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x6E65657263736E6FLL || v1 != 0xEA00000000007441)
    OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_44();
}

uint64_t sub_21CC673C8(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 1769105779;
  else
    v2 = 1919251317;
  if ((a2 & 1) != 0)
    v3 = 1769105779;
  else
    v3 = 1919251317;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = OUTLINED_FUNCTION_22();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_21CC67430(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v8;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x64616F6C796170;
  else
    v3 = 1702060386;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE700000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x64616F6C796170;
  else
    v5 = 1702060386;
  if ((a2 & 1) != 0)
    v6 = 0xE700000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 == v5 && v4 == v6)
    v8 = 1;
  else
    v8 = sub_21CC75450();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_21CC674C8(unsigned __int8 a1)
{
  OUTLINED_FUNCTION_9_1();
  sub_21CC6179C(a1);
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

void sub_21CC6750C()
{
  sub_21CC6754C();
}

void sub_21CC67518()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

void sub_21CC67540()
{
  sub_21CC6754C();
}

void sub_21CC6754C()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_101_1(v0);
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

uint64_t sub_21CC67578()
{
  return sub_21CC678F8();
}

void sub_21CC67584()
{
  sub_21CC679D4();
}

void sub_21CC67590(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21CC675C8()
{
  OUTLINED_FUNCTION_40_1();
  return OUTLINED_FUNCTION_22_2();
}

void sub_21CC67628(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21CC6765C()
{
  OUTLINED_FUNCTION_40_1();
  return OUTLINED_FUNCTION_22_2();
}

void sub_21CC67778(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21CC677C0()
{
  OUTLINED_FUNCTION_40_1();
  return OUTLINED_FUNCTION_22_2();
}

uint64_t sub_21CC67854()
{
  sub_21CC751E0();
  return swift_bridgeObjectRelease();
}

void sub_21CC67888()
{
  sub_21CC754C8();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC678A8()
{
  sub_21CC751E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CC678F8()
{
  sub_21CC754BC();
  sub_21CC751E0();
  swift_bridgeObjectRelease();
  return sub_21CC754EC();
}

uint64_t sub_21CC6796C()
{
  sub_21CC754BC();
  sub_21CC754C8();
  return sub_21CC754EC();
}

void sub_21CC679AC()
{
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_53_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

void sub_21CC679D4()
{
  OUTLINED_FUNCTION_35_2();
  sub_21CC751E0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

void sub_21CC67A24()
{
  sub_21CC67A80();
}

void sub_21CC67A30(uint64_t a1, unsigned __int8 a2)
{
  OUTLINED_FUNCTION_35_2();
  sub_21CC6179C(a2);
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

void sub_21CC67A74()
{
  sub_21CC67A80();
}

void sub_21CC67A80()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_101_1(v0);
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

void static RRMetadata.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X12 }
}

BOOL sub_21CC67B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;

  v12 = !v4
     && (*(double *)&a1 == v7 ? (v10 = *(double *)&a2 == *(double *)&a4) : (v10 = 0),
         v10 ? (v11 = v9 == v8) : (v11 = 0),
         v11)
     && v6 == v5;
  return v12;
}

BOOL static RRBoundingBoxMetadataValue.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

void static RRSurroundingTextsMetadataValue.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(*(_QWORD *)a1 + 16) == *(_QWORD *)(*(_QWORD *)a2 + 16))
  {
    v2 = swift_bridgeObjectRetain();
    sub_21CC68E1C(v2);
    v4 = v3;
    v5 = OUTLINED_FUNCTION_18_1();
    sub_21CC68E1C(v5);
    sub_21CC68EC8(v4, v6);
    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_71();
  }
  OUTLINED_FUNCTION_44();
}

BOOL static RRDataSourceMetadataValue.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

BOOL static RRViewLocationMetadataValue.== infix(_:_:)(float64x2_t *a1, float64x2_t *a2)
{
  _BOOL8 result;

  result = 0;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*a1, *a2), (int32x4_t)vceqq_f64(a1[1], a2[1]))), 0xFuLL))) & 1) != 0&& a1[2].f64[0] == a2[2].f64[0])
  {
    return a1[2].f64[1] == a2[2].f64[1];
  }
  return result;
}

BOOL static RRViewState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void static RRDisplayRepresentation.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  v2 = a1[2];
  v3 = a1[3];
  v5 = a2[2];
  v4 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if ((v6 || (OUTLINED_FUNCTION_22() & 1) != 0) && v3 && v4 && (v2 != v5 || v3 != v4))
    OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_44();
}

void RRMetadata.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_21CC67E70()
{
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_58_1();
  OUTLINED_FUNCTION_57_1();
  OUTLINED_FUNCTION_56_1();
  return OUTLINED_FUNCTION_55_1();
}

uint64_t sub_21CC67F34()
{
  uint64_t v0;

  OUTLINED_FUNCTION_52_0();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_100_1();
  swift_bridgeObjectRelease();
  if (!v0)
  {
    sub_21CC754D4();
    JUMPOUT(0x21CC67F18);
  }
  sub_21CC754D4();
  swift_bridgeObjectRetain();
  sub_21CC751E0();
  return swift_bridgeObjectRelease();
}

uint64_t RRMetadata.hashValue.getter()
{
  OUTLINED_FUNCTION_9_1();
  RRMetadata.hash(into:)();
  return OUTLINED_FUNCTION_14_1();
}

uint64_t sub_21CC67FF8()
{
  uint64_t v0;
  unsigned int v1;

  v0 = sub_21CC75354();
  swift_bridgeObjectRelease();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_21CC6804C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x64616F6C796170;
  else
    return 1702060386;
}

unint64_t sub_21CC6807C(unint64_t result)
{
  if (result >= 6)
    return 6;
  return result;
}

uint64_t sub_21CC6808C(uint64_t result)
{
  return result;
}

uint64_t sub_21CC680A0()
{
  sub_21CC754BC();
  RRMetadata.hash(into:)();
  return sub_21CC754EC();
}

uint64_t sub_21CC680F4(char *a1, char *a2)
{
  return sub_21CC67430(*a1, *a2);
}

uint64_t sub_21CC68100()
{
  return sub_21CC67578();
}

uint64_t sub_21CC68108()
{
  return sub_21CC678A8();
}

uint64_t sub_21CC68110()
{
  return sub_21CC678F8();
}

uint64_t sub_21CC68118@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC67FF8();
  *a1 = result;
  return result;
}

uint64_t sub_21CC68144@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_21CC6804C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_21CC6816C()
{
  char *v0;

  return sub_21CC6804C(*v0);
}

uint64_t sub_21CC68174@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC68048();
  *a1 = result;
  return result;
}

uint64_t sub_21CC68198()
{
  sub_21CC6D6CC();
  return sub_21CC75534();
}

uint64_t sub_21CC681C0()
{
  sub_21CC6D6CC();
  return sub_21CC75540();
}

uint64_t sub_21CC681E8()
{
  return sub_21CC6796C();
}

unint64_t sub_21CC681F0@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_21CC6807C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_21CC68218@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;

  result = sub_21CC6808C(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_21CC68240()
{
  sub_21CC6FEE0();
  return sub_21CC7521C();
}

uint64_t sub_21CC6829C()
{
  sub_21CC6FEE0();
  return sub_21CC75204();
}

void RRMetadata.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_65_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072BE8);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_12_2();
  sub_21CC6D6CC();
  OUTLINED_FUNCTION_18_2();
  if (!v1)
  {
    sub_21CC6D708();
    OUTLINED_FUNCTION_1_3();
    __asm { BR              X9 }
  }
  __swift_destroy_boxed_opaque_existential_0Tm(v0);
  OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_0();
}

void sub_21CC683AC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  OUTLINED_FUNCTION_105_0();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1();
  if (!v0)
  {
    v4 = *(_QWORD *)(v3 - 120);
    v5 = *(_OWORD *)(v3 - 112);
    *(_QWORD *)v1 = *(_QWORD *)(v3 - 128);
    *(_QWORD *)(v1 + 8) = v4;
    *(_OWORD *)(v1 + 16) = v5;
    *(_OWORD *)(v1 + 32) = 0u;
    *(_BYTE *)(v1 + 48) = v2;
  }
  JUMPOUT(0x21CC6837CLL);
}

void RRMetadata.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_95_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C30);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_5();
  v3 = *(unsigned __int8 *)(v0 + 48);
  OUTLINED_FUNCTION_43_0(v1);
  sub_21CC6D6CC();
  OUTLINED_FUNCTION_21_1();
  __asm { BR              X9 }
}

uint64_t sub_21CC6857C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v2 - 144) = 0;
  *(_BYTE *)(v2 - 65) = 0;
  sub_21CC6D8AC();
  OUTLINED_FUNCTION_5_3();
  if (!v0)
  {
    *(_QWORD *)(v2 - 144) = *(_QWORD *)(v2 - 160);
    *(_QWORD *)(v2 - 136) = v1;
    v3 = *(_QWORD *)(v2 - 168);
    *(_QWORD *)(v2 - 128) = *(_QWORD *)(v2 - 176);
    *(_QWORD *)(v2 - 120) = v3;
    OUTLINED_FUNCTION_106_0();
    OUTLINED_FUNCTION_5_3();
  }
  return OUTLINED_FUNCTION_29_2(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 152) + 8));
}

void sub_21CC68764()
{
  RRMetadata.init(from:)();
}

void sub_21CC68778()
{
  RRMetadata.encode(to:)();
}

double RRBoundingBoxMetadataValue.xCoordinate.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double RRBoundingBoxMetadataValue.yCoordinate.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double RRBoundingBoxMetadataValue.width.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double RRBoundingBoxMetadataValue.height.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

void RRBoundingBoxMetadataValue.init(xCoordinate:yCoordinate:width:height:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
}

void RRBoundingBoxMetadataValue.hash(into:)()
{
  OUTLINED_FUNCTION_60_1();
  OUTLINED_FUNCTION_55_1();
  OUTLINED_FUNCTION_56_1();
  OUTLINED_FUNCTION_58_1();
  OUTLINED_FUNCTION_71_1();
}

uint64_t sub_21CC687F0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  char v9;

  v2 = a1 == 0x6E6964726F6F4378 && a2 == 0xEB00000000657461;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E6964726F6F4379 && a2 == 0xEB00000000657461;
    if (v6 || (sub_21CC75450() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6874646977 && a2 == 0xE500000000000000;
      if (v7 || (sub_21CC75450() & 1) != 0)
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
        v9 = sub_21CC75450();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_21CC6899C()
{
  return 4;
}

uint64_t sub_21CC689A4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21CC689E0 + 4 * byte_21CC778C0[a1]))(0x6E6964726F6F4378, 0xEB00000000657461);
}

uint64_t sub_21CC689E0(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_21CC689E8()
{
  return 0x6874646977;
}

uint64_t sub_21CC689FC()
{
  return 0x746867696568;
}

uint64_t sub_21CC68A14()
{
  unsigned __int8 *v0;

  return sub_21CC689A4(*v0);
}

uint64_t sub_21CC68A1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC687F0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC68A40@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC6899C();
  *a1 = result;
  return result;
}

uint64_t sub_21CC68A64()
{
  sub_21CC6DA50();
  return sub_21CC75534();
}

uint64_t sub_21CC68A8C()
{
  sub_21CC6DA50();
  return sub_21CC75540();
}

uint64_t RRBoundingBoxMetadataValue.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_95_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D130);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_43_0(v1);
  sub_21CC6DA50();
  OUTLINED_FUNCTION_21_1();
  sub_21CC6DA8C();
  OUTLINED_FUNCTION_3_3();
  if (!v0)
  {
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_3_3();
  }
  return OUTLINED_FUNCTION_29_2(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
}

uint64_t RRBoundingBoxMetadataValue.hashValue.getter()
{
  OUTLINED_FUNCTION_9_1();
  RRBoundingBoxMetadataValue.hash(into:)();
  return OUTLINED_FUNCTION_14_1();
}

uint64_t RRBoundingBoxMetadataValue.init(from:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D148);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_12_2();
  sub_21CC6DA50();
  OUTLINED_FUNCTION_20_2();
  if (!v1)
  {
    sub_21CC6DAC8();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_28_2();
    *a1 = v5;
    a1[1] = v5;
    a1[2] = v5;
    a1[3] = v5;
  }
  return OUTLINED_FUNCTION_33_0();
}

uint64_t sub_21CC68D94@<X0>(_QWORD *a1@<X8>)
{
  return RRBoundingBoxMetadataValue.init(from:)(a1);
}

uint64_t sub_21CC68DA8()
{
  return RRBoundingBoxMetadataValue.encode(to:)();
}

uint64_t sub_21CC68DC8()
{
  sub_21CC754BC();
  RRBoundingBoxMetadataValue.hash(into:)();
  return sub_21CC754EC();
}

uint64_t RRSurroundingTextsMetadataValue.texts.getter()
{
  return swift_bridgeObjectRetain();
}

SiriReferenceResolutionDataModel::RRSurroundingTextsMetadataValue __swiftcall RRSurroundingTextsMetadataValue.init(texts:)(SiriReferenceResolutionDataModel::RRSurroundingTextsMetadataValue texts)
{
  SiriReferenceResolutionDataModel::RRSurroundingTextsMetadataValue *v1;

  v1->texts._rawValue = texts.texts._rawValue;
  return texts;
}

void sub_21CC68E1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _BYTE v5[8];
  uint64_t v6;
  _OWORD v7[3];

  sub_21CC590E8();
  v6 = sub_21CC75270();
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = 32;
    do
    {
      v4 = *(_OWORD *)(a1 + v3 + 16);
      v7[0] = *(_OWORD *)(a1 + v3);
      v7[1] = v4;
      v7[2] = *(_OWORD *)(a1 + v3 + 32);
      sub_21CC59124((uint64_t)v7);
      sub_21CC6CB2C((uint64_t)v5, (uint64_t)v7);
      swift_bridgeObjectRelease();
      v3 += 48;
      --v2;
    }
    while (v2);
    OUTLINED_FUNCTION_71();
  }
  else
  {
    OUTLINED_FUNCTION_71();
  }
  OUTLINED_FUNCTION_80_1();
}

void sub_21CC68EC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  char v31;
  char v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;

  if (a1 != a2 && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    v4 = 0;
    v5 = *(_QWORD *)(a1 + 56);
    v33 = a1 + 56;
    v6 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v8 = v7 & v5;
    v34 = (unint64_t)(v6 + 63) >> 6;
    v9 = a2 + 56;
    if ((v7 & v5) != 0)
      goto LABEL_7;
LABEL_8:
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
    }
    else
    {
      if (v12 >= v34)
        return;
      v13 = *(_QWORD *)(v33 + 8 * v12);
      v14 = v4 + 1;
      if (v13)
        goto LABEL_27;
      OUTLINED_FUNCTION_73_1();
      if (v15 == v16)
        return;
      OUTLINED_FUNCTION_72_1();
      if (v13)
        goto LABEL_27;
      OUTLINED_FUNCTION_73_1();
      if (v15 == v16)
        return;
      OUTLINED_FUNCTION_72_1();
      if (v13)
        goto LABEL_27;
      OUTLINED_FUNCTION_73_1();
      if (v15 == v16)
        return;
      OUTLINED_FUNCTION_72_1();
      if (v13)
        goto LABEL_27;
      v18 = v17 + 4;
      if (v18 >= v34)
        return;
      v13 = *(_QWORD *)(v33 + 8 * v18);
      if (v13)
      {
        v14 = v18;
LABEL_27:
        v8 = (v13 - 1) & v13;
        v35 = v14;
        for (i = __clz(__rbit64(v13)) + (v14 << 6); ; i = v10 | (v4 << 6))
        {
          v20 = *(_QWORD *)(a1 + 48) + 48 * i;
          v22 = *(_QWORD *)v20;
          v21 = *(_QWORD *)(v20 + 8);
          v38 = *(float64x2_t *)(v20 + 16);
          v39 = *(float64x2_t *)(v20 + 32);
          sub_21CC754BC();
          swift_bridgeObjectRetain();
          RRSurroundingText.hash(into:)();
          v23 = sub_21CC754EC();
          v24 = -1 << *(_BYTE *)(a2 + 32);
          v25 = v23 & ~v24;
          if (((*(_QWORD *)(v9 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
          {
LABEL_43:
            OUTLINED_FUNCTION_79_1();
            return;
          }
          v26 = ~v24;
          v27 = *(_QWORD *)(a2 + 48);
          while (1)
          {
            v28 = v27 + 48 * v25;
            if (*(_QWORD *)v28 != v22 || *(_QWORD *)(v28 + 8) != v21)
              break;
            OUTLINED_FUNCTION_25_1((int32x4_t)vceqq_f64(*(float64x2_t *)(v28 + 16), v38), (int32x4_t)vceqq_f64(*(float64x2_t *)(v28 + 32), v39));
            if ((v32 & 1) != 0)
              goto LABEL_40;
LABEL_38:
            v25 = (v25 + 1) & v26;
            if (((*(_QWORD *)(v9 + ((v25 >> 3) & 0xFFFFFFFFFFFFF8)) >> v25) & 1) == 0)
              goto LABEL_43;
          }
          v36 = *(float64x2_t *)(v28 + 16);
          v37 = *(float64x2_t *)(v28 + 32);
          sub_21CC75450();
          OUTLINED_FUNCTION_25_1((int32x4_t)vceqq_f64(v36, v38), (int32x4_t)vceqq_f64(v37, v39));
          if ((v31 & 1) == 0 || (v30 & 1) == 0)
            goto LABEL_38;
LABEL_40:
          OUTLINED_FUNCTION_79_1();
          v4 = v35;
          if (!v8)
            goto LABEL_8;
LABEL_7:
          v10 = __clz(__rbit64(v8));
          v8 &= v8 - 1;
          v35 = v4;
        }
      }
      while (!__OFADD__(v18, 1))
      {
        OUTLINED_FUNCTION_73_1();
        if (v15 == v16)
          return;
        OUTLINED_FUNCTION_72_1();
        v18 = v19 + 1;
        if (v13)
          goto LABEL_27;
      }
    }
    __break(1u);
  }
}

uint64_t RRSurroundingTextsMetadataValue.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_23();
  v0 = OUTLINED_FUNCTION_57();
  sub_21CC6D610(v0, v1);
  return OUTLINED_FUNCTION_22_2();
}

uint64_t sub_21CC69194(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7374786574 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_21CC75450();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_21CC69210()
{
  return 0x7374786574;
}

void sub_21CC69224()
{
  sub_21CC6A3A8();
}

uint64_t sub_21CC69240@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC69194(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_21CC69268()
{
  sub_21CC6DB04();
  return sub_21CC75534();
}

uint64_t sub_21CC69290()
{
  sub_21CC6DB04();
  return sub_21CC75540();
}

void RRSurroundingTextsMetadataValue.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D158);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_43_0(v3);
  sub_21CC6DB04();
  OUTLINED_FUNCTION_21_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D168);
  sub_21CC6DB7C(&qword_25531D170, (uint64_t (*)(void))sub_21CC6DB40, MEMORY[0x24BEE12A0]);
  OUTLINED_FUNCTION_91_1();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v0, v4);
  OUTLINED_FUNCTION_0();
}

void RRSurroundingTextsMetadataValue.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v2[72];

  v1 = *v0;
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_18_1();
  sub_21CC6D610((uint64_t)v2, v1);
  OUTLINED_FUNCTION_71();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

void RRSurroundingTextsMetadataValue.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;

  OUTLINED_FUNCTION_2();
  a19 = v22;
  a20 = v23;
  v25 = v24;
  v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D180);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&a9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_12_2();
  sub_21CC6DB04();
  OUTLINED_FUNCTION_20_2();
  if (!v20)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531D168);
    sub_21CC6DB7C(&qword_25531D188, (uint64_t (*)(void))sub_21CC6DBE4, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_92_1();
    OUTLINED_FUNCTION_14_0((uint64_t)v30, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
    *v27 = a10;
  }
  __swift_destroy_boxed_opaque_existential_0Tm(v25);
  OUTLINED_FUNCTION_0();
}

#error "21CC694C0: call analysis failed (funcsize=5)"

void sub_21CC694CC()
{
  RRSurroundingTextsMetadataValue.encode(to:)();
}

uint64_t sub_21CC694EC()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_21CC754BC();
  swift_bridgeObjectRetain();
  sub_21CC6D610((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_21CC754EC();
}

void RRSurroundingText.text.getter()
{
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

__n128 RRSurroundingText.boundingBox.getter@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(v1 + 16);
  v3 = *(_OWORD *)(v1 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

__n128 RRSurroundingText.init(text:boundingBox:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  __n128 result;
  __int128 v5;

  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  result = *(__n128 *)a3;
  v5 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a4 + 16) = *(_OWORD *)a3;
  *(_OWORD *)(a4 + 32) = v5;
  return result;
}

uint64_t static RRSurroundingText.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  float64x2_t v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  char v7;
  char v8;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;

  v2 = *(float64x2_t *)(a1 + 16);
  v3 = *(float64x2_t *)(a1 + 32);
  v5 = *(float64x2_t *)(a2 + 16);
  v4 = *(float64x2_t *)(a2 + 32);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    goto LABEL_6;
  v13 = *(float64x2_t *)(a1 + 32);
  v11 = *(float64x2_t *)(a2 + 32);
  v12 = *(float64x2_t *)(a1 + 16);
  v10 = *(float64x2_t *)(a2 + 16);
  v7 = sub_21CC75450();
  v5 = v10;
  v4 = v11;
  v2 = v12;
  v3 = v13;
  v8 = 0;
  if ((v7 & 1) != 0)
LABEL_6:
    OUTLINED_FUNCTION_25_1((int32x4_t)vceqq_f64(v2, v5), (int32x4_t)vceqq_f64(v3, v4));
  return v8 & 1;
}

void RRSurroundingText.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_21CC751E0();
  OUTLINED_FUNCTION_79_1();
  sub_21CC754E0();
  OUTLINED_FUNCTION_57_1();
  OUTLINED_FUNCTION_109_0();
  sub_21CC754E0();
  OUTLINED_FUNCTION_59_1();
}

uint64_t sub_21CC69660(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 1954047348 && a2 == 0xE400000000000000;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E69646E756F62 && a2 == 0xEB00000000786F42)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_21CC75450();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21CC69754(char a1)
{
  if ((a1 & 1) != 0)
    return 0x676E69646E756F62;
  else
    return 1954047348;
}

void sub_21CC6978C()
{
  sub_21CC67518();
}

uint64_t sub_21CC697A4()
{
  char *v0;

  return sub_21CC69754(*v0);
}

uint64_t sub_21CC697AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC69660(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC697D0()
{
  sub_21CC6DC20();
  return sub_21CC75534();
}

uint64_t sub_21CC697F8()
{
  sub_21CC6DC20();
  return sub_21CC75540();
}

uint64_t RRSurroundingText.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;

  OUTLINED_FUNCTION_95_1();
  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25531D198) - 8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_5();
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_21CC6DC20();
  OUTLINED_FUNCTION_61_1();
  OUTLINED_FUNCTION_70_0();
  if (!v0)
  {
    OUTLINED_FUNCTION_106_0();
    OUTLINED_FUNCTION_5_3();
  }
  return OUTLINED_FUNCTION_29_2(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

void RRSurroundingText.hashValue.getter()
{
  OUTLINED_FUNCTION_9_1();
  RRSurroundingText.hash(into:)();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_80_1();
}

void RRSurroundingText.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_65_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D1A8);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_12_2();
  sub_21CC6DC20();
  OUTLINED_FUNCTION_18_2();
  if (v0)
  {
    OUTLINED_FUNCTION_33_0();
  }
  else
  {
    LOBYTE(v6) = 0;
    v3 = OUTLINED_FUNCTION_68_1();
    v5 = v4;
    OUTLINED_FUNCTION_105_0();
    swift_bridgeObjectRetain();
    sub_21CC753CC();
    OUTLINED_FUNCTION_0_1();
    *(_QWORD *)v1 = v3;
    *(_QWORD *)(v1 + 8) = v5;
    *(_OWORD *)(v1 + 16) = v6;
    *(_OWORD *)(v1 + 32) = v7;
    OUTLINED_FUNCTION_33_0();
    OUTLINED_FUNCTION_37_1();
  }
  OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_0();
}

void sub_21CC69A6C()
{
  RRSurroundingText.init(from:)();
}

uint64_t sub_21CC69A80()
{
  return RRSurroundingText.encode(to:)();
}

uint64_t sub_21CC69AA0()
{
  sub_21CC754BC();
  RRSurroundingText.hash(into:)();
  return sub_21CC754EC();
}

double RRViewLocationMetadataValue.xCoordinate.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

double RRViewLocationMetadataValue.yCoordinate.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

double RRViewLocationMetadataValue.zCoordinate.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

double RRViewLocationMetadataValue.width.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 24);
}

double RRViewLocationMetadataValue.height.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 32);
}

double RRViewLocationMetadataValue.depth.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 40);
}

void RRViewLocationMetadataValue.init(xCoordinate:yCoordinate:zCoordinate:width:height:depth:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>)
{
  *a1 = a2;
  a1[1] = a3;
  a1[2] = a4;
  a1[3] = a5;
  a1[4] = a6;
  a1[5] = a7;
}

void RRViewLocationMetadataValue.hash(into:)()
{
  OUTLINED_FUNCTION_60_1();
  OUTLINED_FUNCTION_55_1();
  OUTLINED_FUNCTION_56_1();
  OUTLINED_FUNCTION_58_1();
  OUTLINED_FUNCTION_57_1();
  OUTLINED_FUNCTION_109_0();
  OUTLINED_FUNCTION_59_1();
}

uint64_t sub_21CC69B74(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v2 = a1 == 0x6E6964726F6F4378 && a2 == 0xEB00000000657461;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6E6964726F6F4379 && a2 == 0xEB00000000657461;
    if (v6 || (sub_21CC75450() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6E6964726F6F437ALL && a2 == 0xEB00000000657461;
      if (v7 || (sub_21CC75450() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6874646977 && a2 == 0xE500000000000000;
        if (v8 || (sub_21CC75450() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x746867696568 && a2 == 0xE600000000000000;
          if (v9 || (sub_21CC75450() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6874706564 && a2 == 0xE500000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v11 = sub_21CC75450();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_21CC69DC8()
{
  return 6;
}

uint64_t sub_21CC69DD0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21CC69E0C + 4 * byte_21CC778C4[a1]))(0x6E6964726F6F4378, 0xEB00000000657461);
}

uint64_t sub_21CC69E0C(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_21CC69E14(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_21CC69E1C()
{
  return 0x6874646977;
}

uint64_t sub_21CC69E30()
{
  return 0x746867696568;
}

uint64_t sub_21CC69E44()
{
  return 0x6874706564;
}

uint64_t sub_21CC69E58()
{
  unsigned __int8 *v0;

  return sub_21CC69DD0(*v0);
}

uint64_t sub_21CC69E60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC69B74(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC69E84@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC69DC8();
  *a1 = result;
  return result;
}

uint64_t sub_21CC69EA8()
{
  sub_21CC6DC5C();
  return sub_21CC75534();
}

uint64_t sub_21CC69ED0()
{
  sub_21CC6DC5C();
  return sub_21CC75540();
}

uint64_t RRViewLocationMetadataValue.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_95_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D1B0);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_43_0(v1);
  sub_21CC6DC5C();
  OUTLINED_FUNCTION_21_1();
  sub_21CC6DA8C();
  OUTLINED_FUNCTION_3_3();
  if (!v0)
  {
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_3_3();
    OUTLINED_FUNCTION_3_3();
  }
  return OUTLINED_FUNCTION_29_2(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
}

void RRViewLocationMetadataValue.hashValue.getter()
{
  OUTLINED_FUNCTION_9_1();
  RRViewLocationMetadataValue.hash(into:)();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_80_1();
}

uint64_t RRViewLocationMetadataValue.init(from:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D1C0);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_12_2();
  sub_21CC6DC5C();
  OUTLINED_FUNCTION_18_2();
  if (!v2)
  {
    sub_21CC6DAC8();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_4_2();
    OUTLINED_FUNCTION_28_2();
    *a2 = v7;
    a2[1] = v7;
    a2[2] = v7;
    a2[3] = v7;
    a2[4] = v7;
    a2[5] = v7;
  }
  return __swift_destroy_boxed_opaque_existential_0Tm(a1);
}

uint64_t sub_21CC6A27C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return RRViewLocationMetadataValue.init(from:)(a1, a2);
}

uint64_t sub_21CC6A290()
{
  return RRViewLocationMetadataValue.encode(to:)();
}

uint64_t sub_21CC6A2B0()
{
  sub_21CC754BC();
  RRViewLocationMetadataValue.hash(into:)();
  return sub_21CC754EC();
}

void RRViewState.state.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

SiriReferenceResolutionDataModel::RRViewState __swiftcall RRViewState.init(state:)(SiriReferenceResolutionDataModel::RRViewState state)
{
  _BYTE *v1;

  *v1 = *(_BYTE *)state.state;
  return state;
}

void RRViewState.hash(into:)()
{
  OUTLINED_FUNCTION_69_1();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC6A32C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_21CC75450();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_21CC6A3A8()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

uint64_t sub_21CC6A3CC()
{
  return 0x6574617473;
}

void sub_21CC6A3E0()
{
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

uint64_t sub_21CC6A408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC6A32C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_21CC6A430()
{
  sub_21CC6DC98();
  return sub_21CC75534();
}

uint64_t sub_21CC6A458()
{
  sub_21CC6DC98();
  return sub_21CC75540();
}

void RRViewState.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D1C8);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_43_0(v3);
  sub_21CC6DC98();
  OUTLINED_FUNCTION_21_1();
  sub_21CC6DCD4();
  OUTLINED_FUNCTION_91_1();
  OUTLINED_FUNCTION_14_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_0();
}

void RRViewState.hashValue.getter()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

void RRViewState.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;

  OUTLINED_FUNCTION_2();
  a22 = v25;
  a23 = v26;
  v28 = v27;
  v30 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D1E0);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v31);
  v33 = (char *)&a9 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_12_2();
  sub_21CC6DC98();
  OUTLINED_FUNCTION_20_2();
  if (!v23)
  {
    sub_21CC6DD10();
    OUTLINED_FUNCTION_92_1();
    OUTLINED_FUNCTION_14_0((uint64_t)v33, *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
    *v30 = a13;
  }
  __swift_destroy_boxed_opaque_existential_0Tm(v28);
  OUTLINED_FUNCTION_0();
}

#error "21CC6A62C: call analysis failed (funcsize=5)"

void sub_21CC6A638()
{
  RRViewState.encode(to:)();
}

uint64_t sub_21CC6A658(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v2 = a1 == 0x64657463656C6573 && a2 == 0xE800000000000000;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6867696C68676968 && a2 == 0xEB00000000646574;
    if (v6 || (sub_21CC75450() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x64657375636F66 && a2 == 0xE700000000000000;
      if (v7 || (sub_21CC75450() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x64656C6261736964 && a2 == 0xE800000000000000;
        if (v8 || (sub_21CC75450() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x676E6974696465 && a2 == 0xE700000000000000;
          if (v9 || (sub_21CC75450() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x7972616D697270 && a2 == 0xE700000000000000)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v11 = sub_21CC75450();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_21CC6A8E4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21CC6A918 + 4 * byte_21CC778CA[a1]))(0x64657463656C6573, 0xE800000000000000);
}

uint64_t sub_21CC6A918()
{
  return 0x6867696C68676968;
}

uint64_t sub_21CC6A938()
{
  return 0x64657375636F66;
}

uint64_t sub_21CC6A950()
{
  return 0x64656C6261736964;
}

uint64_t sub_21CC6A964()
{
  return 0x676E6974696465;
}

uint64_t sub_21CC6A97C()
{
  return 0x7972616D697270;
}

uint64_t sub_21CC6A994()
{
  unsigned __int8 *v0;

  return sub_21CC6A8E4(*v0);
}

uint64_t sub_21CC6A99C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC6A658(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC6A9C0()
{
  sub_21CC6DD4C();
  return sub_21CC75534();
}

uint64_t sub_21CC6A9E8()
{
  sub_21CC6DD4C();
  return sub_21CC75540();
}

uint64_t sub_21CC6AA10()
{
  sub_21CC6DE00();
  return sub_21CC75534();
}

uint64_t sub_21CC6AA38()
{
  sub_21CC6DE00();
  return sub_21CC75540();
}

uint64_t sub_21CC6AA60()
{
  sub_21CC6DDC4();
  return sub_21CC75534();
}

uint64_t sub_21CC6AA88()
{
  sub_21CC6DDC4();
  return sub_21CC75540();
}

uint64_t sub_21CC6AAB0()
{
  sub_21CC6DE3C();
  return sub_21CC75534();
}

uint64_t sub_21CC6AAD8()
{
  sub_21CC6DE3C();
  return sub_21CC75540();
}

uint64_t sub_21CC6AB00()
{
  sub_21CC6DE78();
  return sub_21CC75534();
}

uint64_t sub_21CC6AB28()
{
  sub_21CC6DE78();
  return sub_21CC75540();
}

uint64_t sub_21CC6AB50()
{
  sub_21CC6DD88();
  return sub_21CC75534();
}

uint64_t sub_21CC6AB78()
{
  sub_21CC6DD88();
  return sub_21CC75540();
}

uint64_t sub_21CC6ABA0()
{
  sub_21CC6DEB4();
  return sub_21CC75534();
}

uint64_t sub_21CC6ABC8()
{
  sub_21CC6DEB4();
  return sub_21CC75540();
}

void RRState.encode(to:)()
{
  unsigned __int8 *v0;
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

  OUTLINED_FUNCTION_2();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D1F0);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_47_1(v4, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D1F8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_26_2(v6, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D200);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_15_0(v8, v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D208);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D210);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_64();
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D218);
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_24_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D220);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_62_1();
  v13 = *v0;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_21CC6DD4C();
  sub_21CC75528();
  __asm { BR              X9 }
}

void sub_21CC6AD8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 70) = 0;
  sub_21CC6DEB4();
  v5 = *(_QWORD *)(v4 - 96);
  OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v2, v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 104) + 8))(v1, v5);
  OUTLINED_FUNCTION_0();
}

void RRState.init(from:)()
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
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D260);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D268);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_46_1(v6, v26);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D270);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_44_1(v8, v27);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D278);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_48_1(v10, v28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D280);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_26_2(v12, v29);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D288);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_14();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D290);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_5();
  v31 = (uint64_t)v3;
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_21CC6DD4C();
  sub_21CC75510();
  if (!v0)
  {
    v16 = v1;
    v17 = sub_21CC753D8();
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
    {
      v30 = *(unsigned __int8 *)(v17 + 32);
      sub_21CC5D87C(1, v18, v17, v17 + 32, 0, (2 * v18) | 1);
      v20 = v19;
      v22 = v21;
      OUTLINED_FUNCTION_37_1();
      if (v20 == v22 >> 1)
        __asm { BR              X9 }
      v16 = v1;
    }
    v23 = sub_21CC75318();
    OUTLINED_FUNCTION_11();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531CE68);
    *v25 = &type metadata for RRState;
    sub_21CC7536C();
    OUTLINED_FUNCTION_38_2();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    OUTLINED_FUNCTION_4_0();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v14);
  }
  __swift_destroy_boxed_opaque_existential_0Tm(v31);
  OUTLINED_FUNCTION_0();
}

void sub_21CC6B330()
{
  RRState.init(from:)();
}

void sub_21CC6B344()
{
  RRState.encode(to:)();
}

void RRDisplayRepresentation.title.getter()
{
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

void RRDisplayRepresentation.subtitle.getter()
{
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_55();
}

SiriReferenceResolutionDataModel::RRDisplayRepresentation __swiftcall RRDisplayRepresentation.init(title:subtitle:)(Swift::String title, Swift::String_optional subtitle)
{
  Swift::String_optional *v2;
  SiriReferenceResolutionDataModel::RRDisplayRepresentation result;

  v2->value = title;
  v2[1] = subtitle;
  result.subtitle = subtitle;
  result.title = title;
  return result;
}

void RRDisplayRepresentation.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_100_1();
  swift_bridgeObjectRelease();
  sub_21CC754D4();
  if (v1)
  {
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_40_1();
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_71_1();
  }
}

uint64_t sub_21CC6B42C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974627573 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_21CC75450();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21CC6B510(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656C746974627573;
  else
    return 0x656C746974;
}

void sub_21CC6B544()
{
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

uint64_t sub_21CC6B56C()
{
  char *v0;

  return sub_21CC6B510(*v0);
}

uint64_t sub_21CC6B574@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC6B42C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC6B598()
{
  sub_21CC6DEF0();
  return sub_21CC75534();
}

uint64_t sub_21CC6B5C0()
{
  sub_21CC6DEF0();
  return sub_21CC75540();
}

void RRDisplayRepresentation.encode(to:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2();
  v2 = v1;
  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25531D298) - 8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_5();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_21CC6DEF0();
  sub_21CC75528();
  OUTLINED_FUNCTION_70_0();
  if (!v0)
    sub_21CC753F0();
  OUTLINED_FUNCTION_29_2(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_0();
}

uint64_t RRDisplayRepresentation.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_91();
  sub_21CC751E0();
  OUTLINED_FUNCTION_90();
  sub_21CC754D4();
  if (v1)
  {
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_71();
  }
  return OUTLINED_FUNCTION_14_1();
}

void RRDisplayRepresentation.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  uint64_t v38;

  OUTLINED_FUNCTION_2();
  a22 = v26;
  a23 = v27;
  OUTLINED_FUNCTION_65_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D2A8);
  OUTLINED_FUNCTION_46_0();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&a9 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_12_2();
  sub_21CC6DEF0();
  OUTLINED_FUNCTION_18_2();
  if (v23)
  {
    OUTLINED_FUNCTION_33_0();
  }
  else
  {
    a13 = 0;
    v31 = OUTLINED_FUNCTION_68_1();
    v33 = v32;
    a12 = 1;
    swift_bridgeObjectRetain();
    v34 = sub_21CC75378();
    v36 = v35;
    v37 = *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8);
    v38 = v34;
    OUTLINED_FUNCTION_8_0((uint64_t)v30, v37);
    *v24 = v31;
    v24[1] = v33;
    v24[2] = v38;
    v24[3] = v36;
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_33_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37_1();
  }
  OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_0();
}

#error "21CC6B874: call analysis failed (funcsize=5)"

void sub_21CC6B880()
{
  RRDisplayRepresentation.encode(to:)();
}

uint64_t sub_21CC6B8A0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_21CC754BC();
  swift_bridgeObjectRetain();
  sub_21CC751E0();
  swift_bridgeObjectRelease();
  sub_21CC754D4();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21CC751E0();
    swift_bridgeObjectRelease();
  }
  return sub_21CC754EC();
}

void RRDataSourceMetadataValue.hash(into:)()
{
  OUTLINED_FUNCTION_69_1();
  OUTLINED_FUNCTION_55();
}

uint64_t sub_21CC6B95C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  char v13;

  v2 = a1 == 0x61737265766E6F63 && a2 == 0xEE006C616E6F6974;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x756F726765726F66 && a2 == 0xEC0000006465646ELL;
    if (v6 || (sub_21CC75450() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6E65657263536E6FLL && a2 == 0xE800000000000000;
      if (v7 || (sub_21CC75450() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6163696669746F6ELL && a2 == 0xEC0000006E6F6974;
        if (v8 || (sub_21CC75450() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x65636E756F6E6E61 && a2 == 0xEC000000746E656DLL;
          if (v9 || (sub_21CC75450() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else
          {
            v10 = a1 == 0x657551616964656DLL && a2 == 0xEF65746174536575;
            if (v10 || (sub_21CC75450() & 1) != 0)
            {
              swift_bridgeObjectRelease();
              return 5;
            }
            else
            {
              v11 = a1 == 0x6C6175736976 && a2 == 0xE600000000000000;
              if (v11 || (sub_21CC75450() & 1) != 0)
              {
                swift_bridgeObjectRelease();
                return 6;
              }
              else if (a1 == 0x79627261656ELL && a2 == 0xE600000000000000)
              {
                swift_bridgeObjectRelease();
                return 7;
              }
              else
              {
                v13 = sub_21CC75450();
                swift_bridgeObjectRelease();
                if ((v13 & 1) != 0)
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
}

uint64_t sub_21CC6BD10()
{
  return 8;
}

void sub_21CC6BD18()
{
  OUTLINED_FUNCTION_9_1();
  sub_21CC754C8();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

uint64_t sub_21CC6BD48(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21CC6BD88 + 4 * byte_21CC778DC[a1]))(0x61737265766E6F63, 0xEE006C616E6F6974);
}

uint64_t sub_21CC6BD88()
{
  return 0x756F726765726F66;
}

uint64_t sub_21CC6BDA8()
{
  return 0x6E65657263536E6FLL;
}

uint64_t sub_21CC6BDC0()
{
  return 0x6163696669746F6ELL;
}

uint64_t sub_21CC6BDE0()
{
  return 0x65636E756F6E6E61;
}

uint64_t sub_21CC6BE00()
{
  return 0x657551616964656DLL;
}

uint64_t sub_21CC6BE24()
{
  return 0x6C6175736976;
}

uint64_t sub_21CC6BE38()
{
  return 0x79627261656ELL;
}

uint64_t sub_21CC6BE4C()
{
  sub_21CC6E01C();
  return sub_21CC75534();
}

uint64_t sub_21CC6BE74()
{
  sub_21CC6E01C();
  return sub_21CC75540();
}

void sub_21CC6BE9C()
{
  sub_21CC6BD18();
}

uint64_t sub_21CC6BEB4()
{
  unsigned __int8 *v0;

  return sub_21CC6BD48(*v0);
}

uint64_t sub_21CC6BEBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC6B95C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC6BEE0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_21CC6BD10();
  *a1 = result;
  return result;
}

uint64_t sub_21CC6BF04()
{
  sub_21CC6DF2C();
  return sub_21CC75534();
}

uint64_t sub_21CC6BF2C()
{
  sub_21CC6DF2C();
  return sub_21CC75540();
}

uint64_t sub_21CC6BF54()
{
  sub_21CC6E10C();
  return sub_21CC75534();
}

uint64_t sub_21CC6BF7C()
{
  sub_21CC6E10C();
  return sub_21CC75540();
}

uint64_t sub_21CC6BFA4()
{
  sub_21CC6E0D0();
  return sub_21CC75534();
}

uint64_t sub_21CC6BFCC()
{
  sub_21CC6E0D0();
  return sub_21CC75540();
}

uint64_t sub_21CC6BFF4()
{
  sub_21CC6DFE0();
  return sub_21CC75534();
}

uint64_t sub_21CC6C01C()
{
  sub_21CC6DFE0();
  return sub_21CC75540();
}

uint64_t sub_21CC6C044()
{
  sub_21CC6DF68();
  return sub_21CC75534();
}

uint64_t sub_21CC6C06C()
{
  sub_21CC6DF68();
  return sub_21CC75540();
}

uint64_t sub_21CC6C094()
{
  sub_21CC6E058();
  return sub_21CC75534();
}

uint64_t sub_21CC6C0BC()
{
  sub_21CC6E058();
  return sub_21CC75540();
}

uint64_t sub_21CC6C0E4()
{
  sub_21CC6E094();
  return sub_21CC75534();
}

uint64_t sub_21CC6C10C()
{
  sub_21CC6E094();
  return sub_21CC75540();
}

uint64_t sub_21CC6C134()
{
  sub_21CC6DFA4();
  return sub_21CC75534();
}

uint64_t sub_21CC6C15C()
{
  sub_21CC6DFA4();
  return sub_21CC75540();
}

void RRDataSourceMetadataValue.encode(to:)()
{
  unsigned __int8 *v0;
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

  OUTLINED_FUNCTION_2();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C40);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_44_1(v4, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C48);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_49_1(v6, v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C70);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C58);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C60);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C50);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072A18);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v11);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072C68);
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C38);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_62_1();
  v14 = *v0;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_21CC6DF2C();
  OUTLINED_FUNCTION_61_1();
  __asm { BR              X9 }
}

void sub_21CC6C398()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 72) = 0;
  sub_21CC6E10C();
  v5 = *(_QWORD *)(v4 - 104);
  OUTLINED_FUNCTION_2_2();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 112) + 8))(v1, v5);
  OUTLINED_FUNCTION_0();
}

void _s32SiriReferenceResolutionDataModel7RRStateO9hashValueSivg_0()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_39_2();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_30_0();
}

void RRDataSourceMetadataValue.init(from:)()
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  OUTLINED_FUNCTION_2();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072BF8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_46_1(v5, v31);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C00);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_47_1(v7, v32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C28);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_48_1(v9, v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C10);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_26_2(v11, v34);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C18);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_49_1(v13, v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C08);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_1_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540728F8);
  OUTLINED_FUNCTION_0_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_15_0(v16, v36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254072C20);
  OUTLINED_FUNCTION_27_2();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_64();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254072BF0);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_24_0();
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_21CC6DF2C();
  sub_21CC75510();
  if (v0)
  {
    v20 = (uint64_t)v3;
  }
  else
  {
    v21 = sub_21CC753D8();
    v22 = *(_QWORD *)(v21 + 16);
    v38 = v18;
    v37 = v1;
    if (v22)
    {
      v23 = *(unsigned __int8 *)(v21 + 32);
      sub_21CC5D87C(1, v22, v21, v21 + 32, 0, (2 * v22) | 1);
      v25 = v24;
      v27 = v26;
      swift_bridgeObjectRelease();
      if (v25 == v27 >> 1)
        __asm { BR              X9 }
    }
    v20 = (uint64_t)v3;
    v28 = sub_21CC75318();
    OUTLINED_FUNCTION_11();
    v30 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531CE68);
    *v30 = &type metadata for RRDataSourceMetadataValue;
    sub_21CC7536C();
    OUTLINED_FUNCTION_38_2();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v30, *MEMORY[0x24BEE26D0], v28);
    swift_willThrow();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v37, v38);
  }
  __swift_destroy_boxed_opaque_existential_0Tm(v20);
  OUTLINED_FUNCTION_75_0();
  OUTLINED_FUNCTION_0();
}

void sub_21CC6C938()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD);

  OUTLINED_FUNCTION_107_0();
  OUTLINED_FUNCTION_10_2();
  if (!v1)
  {
    v4 = OUTLINED_FUNCTION_41_1();
    v5(v4, *(_QWORD *)(v3 - 256));
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_8_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8));
    **(_BYTE **)(v3 - 136) = v2;
    JUMPOUT(0x21CC6C928);
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_8_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8));
  JUMPOUT(0x21CC6C774);
}

void sub_21CC6C96C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_89_1();
  v4 = *(_QWORD *)(v3 - 168);
  OUTLINED_FUNCTION_10_2();
  if (!v1)
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 - 248) + 8))(v4, *(_QWORD *)(v3 - 240));
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_8_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8));
    **(_BYTE **)(v3 - 136) = v2;
    JUMPOUT(0x21CC6C928);
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_8_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 96) + 8));
  JUMPOUT(0x21CC6C774);
}

void sub_21CC6CA24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_78_1();
  OUTLINED_FUNCTION_10_2();
  if (!v1)
  {
    OUTLINED_FUNCTION_41_1();
    JUMPOUT(0x21CC6CA50);
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_8_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8));
  JUMPOUT(0x21CC6C774);
}

void sub_21CC6CA58()
{
  uint64_t v0;

  OUTLINED_FUNCTION_76_0();
  sub_21CC75360();
  if (v0)
    JUMPOUT(0x21CC6CA90);
  JUMPOUT(0x21CC6CABCLL);
}

void sub_21CC6CAE8()
{
  RRDataSourceMetadataValue.init(from:)();
}

void sub_21CC6CAFC()
{
  RRDataSourceMetadataValue.encode(to:)();
}

uint64_t sub_21CC6CB10(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_21CC6CB2C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  BOOL v24;
  BOOL v25;
  char isUniquelyReferenced_nonNull_native;
  __int128 v28;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;

  v3 = v2;
  v6 = *v2;
  OUTLINED_FUNCTION_35_2();
  OUTLINED_FUNCTION_91();
  RRSurroundingText.hash(into:)();
  v7 = OUTLINED_FUNCTION_14_1();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v10 = ~v8;
    v11 = *(_QWORD *)(v6 + 48);
    v12 = *(_QWORD *)a2;
    v13 = *(_QWORD *)(a2 + 8);
    v14 = *(double *)(a2 + 16);
    v15 = *(double *)(a2 + 24);
    v16 = *(double *)(a2 + 32);
    v17 = *(double *)(a2 + 40);
    while (1)
    {
      v18 = v11 + 48 * v9;
      v20 = *(double *)(v18 + 16);
      v19 = *(double *)(v18 + 24);
      v22 = *(double *)(v18 + 32);
      v21 = *(double *)(v18 + 40);
      v23 = *(_QWORD *)v18 == v12 && *(_QWORD *)(v18 + 8) == v13;
      if (v23 || (OUTLINED_FUNCTION_22() & 1) != 0)
      {
        v24 = v20 == v14 && v19 == v15;
        v25 = v24 && v22 == v16;
        if (v25 && v21 == v17)
          break;
      }
      v9 = (v9 + 1) & v10;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_19;
    }
    OUTLINED_FUNCTION_90();
    sub_21CC6FF1C(a2);
    v30 = *(_QWORD *)(*v3 + 48) + 48 * v9;
    v31 = *(_QWORD *)(v30 + 8);
    *(_QWORD *)a1 = *(_QWORD *)v30;
    *(_QWORD *)(a1 + 8) = v31;
    v32 = *(_OWORD *)(v30 + 32);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(v30 + 16);
    *(_OWORD *)(a1 + 32) = v32;
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_19:
    OUTLINED_FUNCTION_90();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v33 = *v3;
    *v3 = 0x8000000000000000;
    sub_21CC59124(a2);
    sub_21CC6D024(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v33;
    swift_bridgeObjectRelease();
    v28 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v28;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_21CC6CD08()
{
  uint64_t *v0;
  uint64_t *v1;
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
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D440);
  v3 = sub_21CC752DC();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v34 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v33 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v11 | (v10 << 6); ; i = __clz(__rbit64(v14)) + (v10 << 6))
    {
      v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 48 * i);
      v17 = *v16;
      v18 = v16[1];
      v19 = v16[2];
      v20 = v16[3];
      v21 = v16[4];
      v22 = v16[5];
      sub_21CC754BC();
      RRSurroundingText.hash(into:)();
      result = sub_21CC754EC();
      v23 = -1 << *(_BYTE *)(v4 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v8 + 8 * (v24 >> 6))) == 0)
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          v29 = v25 == v28;
          if (v25 == v28)
            v25 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v8 + 8 * v25);
          if (v30 != -1)
          {
            v26 = __clz(__rbit64(~v30)) + (v25 << 6);
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
      v26 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v8 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      v31 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 48 * v26);
      *v31 = v17;
      v31[1] = v18;
      v31[2] = v19;
      v31[3] = v20;
      v31[4] = v21;
      v31[5] = v22;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v13 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_38;
      if (v13 >= v33)
        goto LABEL_32;
      v14 = v34[v13];
      ++v10;
      if (!v14)
      {
        v10 = v13 + 1;
        if (v13 + 1 >= v33)
          goto LABEL_32;
        v14 = v34[v10];
        if (!v14)
        {
          v10 = v13 + 2;
          if (v13 + 2 >= v33)
            goto LABEL_32;
          v14 = v34[v10];
          if (!v14)
          {
            v15 = v13 + 3;
            if (v15 >= v33)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v32 = 1 << *(_BYTE *)(v2 + 32);
              if (v32 > 63)
                sub_21CC6CB10(0, (unint64_t)(v32 + 63) >> 6, v34);
              else
                *v34 = -1 << v32;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v14 = v34[v15];
            if (!v14)
            {
              while (1)
              {
                v10 = v15 + 1;
                if (__OFADD__(v15, 1))
                  goto LABEL_39;
                if (v10 >= v33)
                  goto LABEL_32;
                v14 = v34[v10];
                ++v15;
                if (v14)
                  goto LABEL_20;
              }
            }
            v10 = v15;
          }
        }
      }
LABEL_20:
      v7 = (v14 - 1) & v14;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_21CC6D024(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  BOOL v25;
  BOOL v26;
  BOOL v27;
  uint64_t v29;
  _OWORD *v30;
  __int128 v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_26;
  if ((a3 & 1) != 0)
  {
    sub_21CC6CD08();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_21CC6D1F0();
      goto LABEL_26;
    }
    sub_21CC6D3AC();
  }
  v9 = *v3;
  sub_21CC754BC();
  RRSurroundingText.hash(into:)();
  result = sub_21CC754EC();
  v10 = -1 << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  v11 = v9 + 56;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v12 = ~v10;
    v13 = *(_QWORD *)(v9 + 48);
    v14 = *(_QWORD *)v6;
    v15 = *(_QWORD *)(v6 + 8);
    v16 = *(double *)(v6 + 16);
    v17 = *(double *)(v6 + 24);
    v18 = *(double *)(v6 + 32);
    v19 = *(double *)(v6 + 40);
    do
    {
      v20 = v13 + 48 * a2;
      result = *(_QWORD *)v20;
      v22 = *(double *)(v20 + 16);
      v21 = *(double *)(v20 + 24);
      v24 = *(double *)(v20 + 32);
      v23 = *(double *)(v20 + 40);
      v25 = *(_QWORD *)v20 == v14 && *(_QWORD *)(v20 + 8) == v15;
      if (v25 || (result = sub_21CC75450(), (result & 1) != 0))
      {
        v26 = v22 == v16 && v21 == v17;
        v27 = v26 && v24 == v18;
        if (v27 && v23 == v19)
          goto LABEL_29;
      }
      a2 = (a2 + 1) & v12;
    }
    while (((*(_QWORD *)(v11 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_26:
  v29 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v30 = (_OWORD *)(*(_QWORD *)(v29 + 48) + 48 * a2);
  v31 = *(_OWORD *)(v6 + 16);
  *v30 = *(_OWORD *)v6;
  v30[1] = v31;
  v30[2] = *(_OWORD *)(v6 + 32);
  v32 = *(_QWORD *)(v29 + 16);
  v33 = __OFADD__(v32, 1);
  v34 = v32 + 1;
  if (!v33)
  {
    *(_QWORD *)(v29 + 16) = v34;
    return result;
  }
  __break(1u);
LABEL_29:
  result = sub_21CC75474();
  __break(1u);
  return result;
}

void *sub_21CC6D1F0()
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D440);
  v2 = *v0;
  v3 = sub_21CC752D0();
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
    v20 = 3 * i;
    v21 = *(_QWORD *)(v2 + 48) + 16 * v20;
    v22 = *(_QWORD *)(v21 + 8);
    v23 = *(_OWORD *)(v21 + 16);
    v24 = *(_OWORD *)(v21 + 32);
    v25 = *(_QWORD *)(v4 + 48) + 16 * v20;
    *(_QWORD *)v25 = *(_QWORD *)v21;
    *(_QWORD *)(v25 + 8) = v22;
    *(_OWORD *)(v25 + 16) = v23;
    *(_OWORD *)(v25 + 32) = v24;
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

unint64_t sub_21CC6D3AC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D440);
  v2 = sub_21CC752DC();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_24:
    result = swift_release();
    *v0 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v1 + 32);
  v24 = v1 + 56;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v1 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  v8 = v2 + 56;
  result = swift_retain();
  v10 = 0;
  if (!v6)
    goto LABEL_7;
LABEL_6:
  v11 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (i = v11 | (v10 << 6); ; i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 48 * i);
    v18 = *v16;
    v17 = v16[1];
    v19 = v16[2];
    v20 = v16[3];
    v21 = v16[4];
    v22 = v16[5];
    sub_21CC754BC();
    swift_bridgeObjectRetain();
    RRSurroundingText.hash(into:)();
    sub_21CC754EC();
    result = sub_21CC752C4();
    *(_QWORD *)(v8 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v23 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 48 * result);
    *v23 = v18;
    v23[1] = v17;
    v23[2] = v19;
    v23[3] = v20;
    v23[4] = v21;
    v23[5] = v22;
    ++*(_QWORD *)(v3 + 16);
    if (v6)
      goto LABEL_6;
LABEL_7:
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v7)
      goto LABEL_23;
    v14 = *(_QWORD *)(v24 + 8 * v13);
    ++v10;
    if (!v14)
    {
      v10 = v13 + 1;
      if (v13 + 1 >= v7)
        goto LABEL_23;
      v14 = *(_QWORD *)(v24 + 8 * v10);
      if (!v14)
      {
        v10 = v13 + 2;
        if (v13 + 2 >= v7)
          goto LABEL_23;
        v14 = *(_QWORD *)(v24 + 8 * v10);
        if (!v14)
          break;
      }
    }
LABEL_20:
    v6 = (v14 - 1) & v14;
  }
  v15 = v13 + 3;
  if (v15 >= v7)
  {
LABEL_23:
    swift_release();
    goto LABEL_24;
  }
  v14 = *(_QWORD *)(v24 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v7)
      goto LABEL_23;
    v14 = *(_QWORD *)(v24 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_21CC6D610(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 16);
  result = sub_21CC754C8();
  if (v3)
  {
    v5 = a2 + 72;
    do
    {
      swift_bridgeObjectRetain();
      sub_21CC751E0();
      sub_21CC754E0();
      sub_21CC754E0();
      sub_21CC754E0();
      sub_21CC754E0();
      result = swift_bridgeObjectRelease();
      v5 += 48;
      --v3;
    }
    while (v3);
  }
  return result;
}

unint64_t sub_21CC6D6CC()
{
  unint64_t result;

  result = qword_254072A70;
  if (!qword_254072A70)
  {
    result = MEMORY[0x220789FD0](&unk_21CC795D8, &type metadata for RRMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072A70);
  }
  return result;
}

unint64_t sub_21CC6D708()
{
  unint64_t result;

  result = qword_254072A98;
  if (!qword_254072A98)
  {
    result = MEMORY[0x220789FD0](&unk_21CC795B0, &type metadata for RRMetadata.Base);
    atomic_store(result, (unint64_t *)&qword_254072A98);
  }
  return result;
}

unint64_t sub_21CC6D744()
{
  unint64_t result;

  result = qword_25531D0E0;
  if (!qword_25531D0E0)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRDisplayRepresentation, &type metadata for RRDisplayRepresentation);
    atomic_store(result, (unint64_t *)&qword_25531D0E0);
  }
  return result;
}

unint64_t sub_21CC6D780()
{
  unint64_t result;

  result = qword_25531D0E8;
  if (!qword_25531D0E8)
  {
    result = MEMORY[0x220789FD0]("aYD1p(", &type metadata for RRViewState);
    atomic_store(result, (unint64_t *)&qword_25531D0E8);
  }
  return result;
}

unint64_t sub_21CC6D7BC()
{
  unint64_t result;

  result = qword_25531D0F0;
  if (!qword_25531D0F0)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRViewLocationMetadataValue, &type metadata for RRViewLocationMetadataValue);
    atomic_store(result, (unint64_t *)&qword_25531D0F0);
  }
  return result;
}

unint64_t sub_21CC6D7F8()
{
  unint64_t result;

  result = qword_254072BD0;
  if (!qword_254072BD0)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRDataSourceMetadataValue, &type metadata for RRDataSourceMetadataValue);
    atomic_store(result, (unint64_t *)&qword_254072BD0);
  }
  return result;
}

unint64_t sub_21CC6D834()
{
  unint64_t result;

  result = qword_25531D0F8;
  if (!qword_25531D0F8)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRSurroundingTextsMetadataValue, &type metadata for RRSurroundingTextsMetadataValue);
    atomic_store(result, (unint64_t *)&qword_25531D0F8);
  }
  return result;
}

unint64_t sub_21CC6D870()
{
  unint64_t result;

  result = qword_25531D100;
  if (!qword_25531D100)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRBoundingBoxMetadataValue, &type metadata for RRBoundingBoxMetadataValue);
    atomic_store(result, (unint64_t *)&qword_25531D100);
  }
  return result;
}

unint64_t sub_21CC6D8AC()
{
  unint64_t result;

  result = qword_254072A88;
  if (!qword_254072A88)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79588, &type metadata for RRMetadata.Base);
    atomic_store(result, (unint64_t *)&qword_254072A88);
  }
  return result;
}

unint64_t sub_21CC6D8E8()
{
  unint64_t result;

  result = qword_25531D108;
  if (!qword_25531D108)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRDisplayRepresentation, &type metadata for RRDisplayRepresentation);
    atomic_store(result, (unint64_t *)&qword_25531D108);
  }
  return result;
}

unint64_t sub_21CC6D924()
{
  unint64_t result;

  result = qword_25531D110;
  if (!qword_25531D110)
  {
    result = MEMORY[0x220789FD0]("IYD1H(", &type metadata for RRViewState);
    atomic_store(result, (unint64_t *)&qword_25531D110);
  }
  return result;
}

unint64_t sub_21CC6D960()
{
  unint64_t result;

  result = qword_25531D118;
  if (!qword_25531D118)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRViewLocationMetadataValue, &type metadata for RRViewLocationMetadataValue);
    atomic_store(result, (unint64_t *)&qword_25531D118);
  }
  return result;
}

unint64_t sub_21CC6D99C()
{
  unint64_t result;

  result = qword_254072BC8;
  if (!qword_254072BC8)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRDataSourceMetadataValue, &type metadata for RRDataSourceMetadataValue);
    atomic_store(result, (unint64_t *)&qword_254072BC8);
  }
  return result;
}

unint64_t sub_21CC6D9D8()
{
  unint64_t result;

  result = qword_25531D120;
  if (!qword_25531D120)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRSurroundingTextsMetadataValue, &type metadata for RRSurroundingTextsMetadataValue);
    atomic_store(result, (unint64_t *)&qword_25531D120);
  }
  return result;
}

unint64_t sub_21CC6DA14()
{
  unint64_t result;

  result = qword_25531D128;
  if (!qword_25531D128)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRBoundingBoxMetadataValue, &type metadata for RRBoundingBoxMetadataValue);
    atomic_store(result, (unint64_t *)&qword_25531D128);
  }
  return result;
}

unint64_t sub_21CC6DA50()
{
  unint64_t result;

  result = qword_25531D138;
  if (!qword_25531D138)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79538, &type metadata for RRBoundingBoxMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D138);
  }
  return result;
}

unint64_t sub_21CC6DA8C()
{
  unint64_t result;

  result = qword_25531D140;
  if (!qword_25531D140)
  {
    result = MEMORY[0x220789FD0](MEMORY[0x24BEE50C0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_25531D140);
  }
  return result;
}

unint64_t sub_21CC6DAC8()
{
  unint64_t result;

  result = qword_25531D150;
  if (!qword_25531D150)
  {
    result = MEMORY[0x220789FD0](MEMORY[0x24BEE50E8], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_25531D150);
  }
  return result;
}

unint64_t sub_21CC6DB04()
{
  unint64_t result;

  result = qword_25531D160;
  if (!qword_25531D160)
  {
    result = MEMORY[0x220789FD0](&unk_21CC794E8, &type metadata for RRSurroundingTextsMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D160);
  }
  return result;
}

unint64_t sub_21CC6DB40()
{
  unint64_t result;

  result = qword_25531D178;
  if (!qword_25531D178)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRSurroundingText, &type metadata for RRSurroundingText);
    atomic_store(result, (unint64_t *)&qword_25531D178);
  }
  return result;
}

uint64_t sub_21CC6DB7C(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531D168);
    v8 = a2();
    result = MEMORY[0x220789FD0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21CC6DBE4()
{
  unint64_t result;

  result = qword_25531D190;
  if (!qword_25531D190)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRSurroundingText, &type metadata for RRSurroundingText);
    atomic_store(result, (unint64_t *)&qword_25531D190);
  }
  return result;
}

unint64_t sub_21CC6DC20()
{
  unint64_t result;

  result = qword_25531D1A0;
  if (!qword_25531D1A0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79498, &type metadata for RRSurroundingText.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D1A0);
  }
  return result;
}

unint64_t sub_21CC6DC5C()
{
  unint64_t result;

  result = qword_25531D1B8;
  if (!qword_25531D1B8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79448, &type metadata for RRViewLocationMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D1B8);
  }
  return result;
}

unint64_t sub_21CC6DC98()
{
  unint64_t result;

  result = qword_25531D1D0;
  if (!qword_25531D1D0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC793F8, &type metadata for RRViewState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D1D0);
  }
  return result;
}

unint64_t sub_21CC6DCD4()
{
  unint64_t result;

  result = qword_25531D1D8;
  if (!qword_25531D1D8)
  {
    result = MEMORY[0x220789FD0]("QXD1l'", &type metadata for RRState);
    atomic_store(result, (unint64_t *)&qword_25531D1D8);
  }
  return result;
}

unint64_t sub_21CC6DD10()
{
  unint64_t result;

  result = qword_25531D1E8;
  if (!qword_25531D1E8)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRState, &type metadata for RRState);
    atomic_store(result, (unint64_t *)&qword_25531D1E8);
  }
  return result;
}

unint64_t sub_21CC6DD4C()
{
  unint64_t result;

  result = qword_25531D228;
  if (!qword_25531D228)
  {
    result = MEMORY[0x220789FD0](&unk_21CC793A8, &type metadata for RRState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D228);
  }
  return result;
}

unint64_t sub_21CC6DD88()
{
  unint64_t result;

  result = qword_25531D230;
  if (!qword_25531D230)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79358, &type metadata for RRState.PrimaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D230);
  }
  return result;
}

unint64_t sub_21CC6DDC4()
{
  unint64_t result;

  result = qword_25531D238;
  if (!qword_25531D238)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79308, &type metadata for RRState.EditingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D238);
  }
  return result;
}

unint64_t sub_21CC6DE00()
{
  unint64_t result;

  result = qword_25531D240;
  if (!qword_25531D240)
  {
    result = MEMORY[0x220789FD0](&unk_21CC792B8, &type metadata for RRState.DisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D240);
  }
  return result;
}

unint64_t sub_21CC6DE3C()
{
  unint64_t result;

  result = qword_25531D248;
  if (!qword_25531D248)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79268, &type metadata for RRState.FocusedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D248);
  }
  return result;
}

unint64_t sub_21CC6DE78()
{
  unint64_t result;

  result = qword_25531D250;
  if (!qword_25531D250)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79218, &type metadata for RRState.HighlightedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D250);
  }
  return result;
}

unint64_t sub_21CC6DEB4()
{
  unint64_t result;

  result = qword_25531D258;
  if (!qword_25531D258)
  {
    result = MEMORY[0x220789FD0](&unk_21CC791C8, &type metadata for RRState.SelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D258);
  }
  return result;
}

unint64_t sub_21CC6DEF0()
{
  unint64_t result;

  result = qword_25531D2A0;
  if (!qword_25531D2A0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79178, &type metadata for RRDisplayRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D2A0);
  }
  return result;
}

unint64_t sub_21CC6DF2C()
{
  unint64_t result;

  result = qword_254072B38;
  if (!qword_254072B38)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79128, &type metadata for RRDataSourceMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B38);
  }
  return result;
}

unint64_t sub_21CC6DF68()
{
  unint64_t result;

  result = qword_25531D2B0;
  if (!qword_25531D2B0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC790D8, &type metadata for RRDataSourceMetadataValue.NearbyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D2B0);
  }
  return result;
}

unint64_t sub_21CC6DFA4()
{
  unint64_t result;

  result = qword_25531D2B8;
  if (!qword_25531D2B8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79088, &type metadata for RRDataSourceMetadataValue.VisualCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D2B8);
  }
  return result;
}

unint64_t sub_21CC6DFE0()
{
  unint64_t result;

  result = qword_254072BB0;
  if (!qword_254072BB0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79038, &type metadata for RRDataSourceMetadataValue.MediaQueueStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072BB0);
  }
  return result;
}

unint64_t sub_21CC6E01C()
{
  unint64_t result;

  result = qword_25531D2C0;
  if (!qword_25531D2C0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78FE8, &type metadata for RRDataSourceMetadataValue.AnnouncementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D2C0);
  }
  return result;
}

unint64_t sub_21CC6E058()
{
  unint64_t result;

  result = qword_254072CA0;
  if (!qword_254072CA0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78F98, &type metadata for RRDataSourceMetadataValue.NotificationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072CA0);
  }
  return result;
}

unint64_t sub_21CC6E094()
{
  unint64_t result;

  result = qword_25531D2C8;
  if (!qword_25531D2C8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78F48, &type metadata for RRDataSourceMetadataValue.OnScreenCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D2C8);
  }
  return result;
}

unint64_t sub_21CC6E0D0()
{
  unint64_t result;

  result = qword_25531D2D0;
  if (!qword_25531D2D0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78EF8, &type metadata for RRDataSourceMetadataValue.ForegroundedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D2D0);
  }
  return result;
}

unint64_t sub_21CC6E10C()
{
  unint64_t result;

  result = qword_25531D2D8;
  if (!qword_25531D2D8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78EA8, &type metadata for RRDataSourceMetadataValue.ConversationalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D2D8);
  }
  return result;
}

unint64_t sub_21CC6E14C()
{
  unint64_t result;

  result = qword_254072AA0;
  if (!qword_254072AA0)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRMetadata, &type metadata for RRMetadata);
    atomic_store(result, (unint64_t *)&qword_254072AA0);
  }
  return result;
}

unint64_t sub_21CC6E18C()
{
  unint64_t result;

  result = qword_25531D2E0;
  if (!qword_25531D2E0)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRBoundingBoxMetadataValue, &type metadata for RRBoundingBoxMetadataValue);
    atomic_store(result, (unint64_t *)&qword_25531D2E0);
  }
  return result;
}

unint64_t sub_21CC6E1CC()
{
  unint64_t result;

  result = qword_25531D2E8;
  if (!qword_25531D2E8)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRSurroundingTextsMetadataValue, &type metadata for RRSurroundingTextsMetadataValue);
    atomic_store(result, (unint64_t *)&qword_25531D2E8);
  }
  return result;
}

unint64_t sub_21CC6E20C()
{
  unint64_t result;

  result = qword_25531D2F0;
  if (!qword_25531D2F0)
  {
    result = MEMORY[0x220789FD0]("IZD1X)", &type metadata for RRSurroundingText);
    atomic_store(result, (unint64_t *)&qword_25531D2F0);
  }
  return result;
}

unint64_t sub_21CC6E24C()
{
  unint64_t result;

  result = qword_25531D2F8;
  if (!qword_25531D2F8)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRViewLocationMetadataValue, &type metadata for RRViewLocationMetadataValue);
    atomic_store(result, (unint64_t *)&qword_25531D2F8);
  }
  return result;
}

unint64_t sub_21CC6E28C()
{
  unint64_t result;

  result = qword_25531D300;
  if (!qword_25531D300)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRViewState, &type metadata for RRViewState);
    atomic_store(result, (unint64_t *)&qword_25531D300);
  }
  return result;
}

unint64_t sub_21CC6E2CC()
{
  unint64_t result;

  result = qword_25531D308;
  if (!qword_25531D308)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRState, &type metadata for RRState);
    atomic_store(result, (unint64_t *)&qword_25531D308);
  }
  return result;
}

unint64_t sub_21CC6E30C()
{
  unint64_t result;

  result = qword_25531D310;
  if (!qword_25531D310)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRDisplayRepresentation, &type metadata for RRDisplayRepresentation);
    atomic_store(result, (unint64_t *)&qword_25531D310);
  }
  return result;
}

unint64_t sub_21CC6E34C()
{
  unint64_t result;

  result = qword_25531D318;
  if (!qword_25531D318)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRDataSourceMetadataValue, &type metadata for RRDataSourceMetadataValue);
    atomic_store(result, (unint64_t *)&qword_25531D318);
  }
  return result;
}

uint64_t destroy for RRMetadata(uint64_t a1)
{
  return sub_21CC5914C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for RRMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_21CC590A8(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for RRMetadata(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_BYTE *)(a2 + 48);
  sub_21CC590A8(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9);
  v10 = *(_QWORD *)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  v16 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_21CC5914C(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for RRMetadata(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_BYTE *)(a2 + 48);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v3;
  sub_21CC5914C(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for RRMetadata(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFB && *(_BYTE *)(a1 + 49))
    {
      v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 48);
      if (v3 <= 5)
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

uint64_t storeEnumTagSinglePayload for RRMetadata(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 49) = 0;
    if (a2)
      *(_BYTE *)(result + 48) = -(char)a2;
  }
  return result;
}

uint64_t sub_21CC6E5A8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t sub_21CC6E5B0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 48) = a2;
  return result;
}

void type metadata accessor for RRMetadata()
{
  OUTLINED_FUNCTION_2_1();
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

uint64_t getEnumTagSinglePayload for RRBoundingBoxMetadataValue(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RRBoundingBoxMetadataValue(uint64_t result, int a2, int a3)
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

void type metadata accessor for RRBoundingBoxMetadataValue()
{
  OUTLINED_FUNCTION_2_1();
}

void type metadata accessor for RRSurroundingTextsMetadataValue()
{
  OUTLINED_FUNCTION_2_1();
}

uint64_t initializeWithCopy for RRSurroundingText(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for RRSurroundingText(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
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

uint64_t assignWithTake for RRSurroundingText(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for RRSurroundingText(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
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

uint64_t storeEnumTagSinglePayload for RRSurroundingText(uint64_t result, int a2, int a3)
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

void type metadata accessor for RRSurroundingText()
{
  OUTLINED_FUNCTION_2_1();
}

uint64_t getEnumTagSinglePayload for RRViewLocationMetadataValue(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RRViewLocationMetadataValue(uint64_t result, int a2, int a3)
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

void type metadata accessor for RRViewLocationMetadataValue()
{
  OUTLINED_FUNCTION_2_1();
}

void type metadata accessor for RRViewState()
{
  OUTLINED_FUNCTION_2_1();
}

void type metadata accessor for RRState()
{
  OUTLINED_FUNCTION_2_1();
}

uint64_t destroy for RRDisplayRepresentation()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for RRDisplayRepresentation(_QWORD *a1, _QWORD *a2)
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
  return a1;
}

_QWORD *assignWithCopy for RRDisplayRepresentation(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for RRDisplayRepresentation(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RRDisplayRepresentation(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RRDisplayRepresentation(uint64_t result, int a2, int a3)
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

void type metadata accessor for RRDisplayRepresentation()
{
  OUTLINED_FUNCTION_2_1();
}

void type metadata accessor for RRDataSourceMetadataValue()
{
  OUTLINED_FUNCTION_2_1();
}

uint64_t _s32SiriReferenceResolutionDataModel25RRDataSourceMetadataValueOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_102_1(-1);
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
      return OUTLINED_FUNCTION_102_1((*a1 | (v4 << 8)) - 8);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_102_1((*a1 | (v4 << 8)) - 8);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_102_1((*a1 | (v4 << 8)) - 8);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_102_1(v8);
}

uint64_t _s32SiriReferenceResolutionDataModel25RRDataSourceMetadataValueOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC6EAC4 + 4 * byte_21CC778F9[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_99_1 + 4 * byte_21CC778F4[v4]))();
}

uint64_t sub_21CC6EAFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC6EB04);
  return result;
}

uint64_t sub_21CC6EB0C(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC6EB14);
  return OUTLINED_FUNCTION_97_0();
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.CodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.CodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.ConversationalCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.ConversationalCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.ForegroundedCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.ForegroundedCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.OnScreenCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.OnScreenCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.NotificationCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.NotificationCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.AnnouncementCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.AnnouncementCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.MediaQueueStateCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.MediaQueueStateCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.VisualCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.VisualCodingKeys;
}

ValueMetadata *type metadata accessor for RRDataSourceMetadataValue.NearbyCodingKeys()
{
  return &type metadata for RRDataSourceMetadataValue.NearbyCodingKeys;
}

ValueMetadata *type metadata accessor for RRDisplayRepresentation.CodingKeys()
{
  return &type metadata for RRDisplayRepresentation.CodingKeys;
}

ValueMetadata *type metadata accessor for RRState.CodingKeys()
{
  return &type metadata for RRState.CodingKeys;
}

ValueMetadata *type metadata accessor for RRState.SelectedCodingKeys()
{
  return &type metadata for RRState.SelectedCodingKeys;
}

ValueMetadata *type metadata accessor for RRState.HighlightedCodingKeys()
{
  return &type metadata for RRState.HighlightedCodingKeys;
}

ValueMetadata *type metadata accessor for RRState.FocusedCodingKeys()
{
  return &type metadata for RRState.FocusedCodingKeys;
}

ValueMetadata *type metadata accessor for RRState.DisabledCodingKeys()
{
  return &type metadata for RRState.DisabledCodingKeys;
}

ValueMetadata *type metadata accessor for RRState.EditingCodingKeys()
{
  return &type metadata for RRState.EditingCodingKeys;
}

ValueMetadata *type metadata accessor for RRState.PrimaryCodingKeys()
{
  return &type metadata for RRState.PrimaryCodingKeys;
}

ValueMetadata *type metadata accessor for RRViewState.CodingKeys()
{
  return &type metadata for RRViewState.CodingKeys;
}

ValueMetadata *type metadata accessor for RRViewLocationMetadataValue.CodingKeys()
{
  return &type metadata for RRViewLocationMetadataValue.CodingKeys;
}

ValueMetadata *type metadata accessor for RRSurroundingText.CodingKeys()
{
  return &type metadata for RRSurroundingText.CodingKeys;
}

uint64_t _s32SiriReferenceResolutionDataModel11RRViewStateV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21CC6ECB0 + 4 * byte_21CC778FE[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21CC6ECD0 + 4 * byte_21CC77903[v4]))();
}

_BYTE *sub_21CC6ECB0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21CC6ECD0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CC6ECD8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CC6ECE0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21CC6ECE8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21CC6ECF0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RRSurroundingTextsMetadataValue.CodingKeys()
{
  return &type metadata for RRSurroundingTextsMetadataValue.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RRBoundingBoxMetadataValue.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFD)
  {
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
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for RRBoundingBoxMetadataValue.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC6EDE0 + 4 * byte_21CC7790D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21CC6EE14 + 4 * byte_21CC77908[v4]))();
}

uint64_t sub_21CC6EE14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC6EE1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC6EE24);
  return result;
}

uint64_t sub_21CC6EE30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC6EE38);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21CC6EE3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC6EE44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RRBoundingBoxMetadataValue.CodingKeys()
{
  return &type metadata for RRBoundingBoxMetadataValue.CodingKeys;
}

uint64_t _s32SiriReferenceResolutionDataModel7RRStateOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_102_1(-1);
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
      return OUTLINED_FUNCTION_102_1((*a1 | (v4 << 8)) - 6);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_102_1((*a1 | (v4 << 8)) - 6);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_102_1((*a1 | (v4 << 8)) - 6);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_102_1(v8);
}

uint64_t _s32SiriReferenceResolutionDataModel7RRStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC6EF30 + 4 * byte_21CC77917[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_99_1_0 + 4 * byte_21CC77912[v4]))();
}

uint64_t sub_21CC6EF68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC6EF70);
  return result;
}

uint64_t sub_21CC6EF78(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC6EF80);
  return OUTLINED_FUNCTION_97_0();
}

ValueMetadata *type metadata accessor for RRMetadata.Base()
{
  return &type metadata for RRMetadata.Base;
}

uint64_t _s32SiriReferenceResolutionDataModel23RRDisplayRepresentationV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_102_1(-1);
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
      return OUTLINED_FUNCTION_102_1((*a1 | (v4 << 8)) - 2);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_102_1((*a1 | (v4 << 8)) - 2);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_102_1((*a1 | (v4 << 8)) - 2);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_102_1(v8);
}

uint64_t _s32SiriReferenceResolutionDataModel23RRDisplayRepresentationV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC6F070 + 4 * byte_21CC77921[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_99_1_1 + 4 * byte_21CC7791C[v4]))();
}

uint64_t sub_21CC6F0A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC6F0B0);
  return result;
}

uint64_t sub_21CC6F0B8(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC6F0C0);
  return OUTLINED_FUNCTION_97_0();
}

ValueMetadata *type metadata accessor for RRMetadata.CodingKeys()
{
  return &type metadata for RRMetadata.CodingKeys;
}

unint64_t sub_21CC6F0E4()
{
  unint64_t result;

  result = qword_25531D320;
  if (!qword_25531D320)
  {
    result = MEMORY[0x220789FD0](")RD1$%", &type metadata for RRMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D320);
  }
  return result;
}

unint64_t sub_21CC6F124()
{
  unint64_t result;

  result = qword_25531D328;
  if (!qword_25531D328)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78460, &type metadata for RRMetadata.Base);
    atomic_store(result, (unint64_t *)&qword_25531D328);
  }
  return result;
}

unint64_t sub_21CC6F164()
{
  unint64_t result;

  result = qword_25531D330;
  if (!qword_25531D330)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78518, &type metadata for RRBoundingBoxMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D330);
  }
  return result;
}

unint64_t sub_21CC6F1A4()
{
  unint64_t result;

  result = qword_25531D338;
  if (!qword_25531D338)
  {
    result = MEMORY[0x220789FD0](&unk_21CC785D0, &type metadata for RRSurroundingTextsMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D338);
  }
  return result;
}

unint64_t sub_21CC6F1E4()
{
  unint64_t result;

  result = qword_25531D340;
  if (!qword_25531D340)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78688, &type metadata for RRSurroundingText.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D340);
  }
  return result;
}

unint64_t sub_21CC6F224()
{
  unint64_t result;

  result = qword_25531D348;
  if (!qword_25531D348)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78740, &type metadata for RRViewLocationMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D348);
  }
  return result;
}

unint64_t sub_21CC6F264()
{
  unint64_t result;

  result = qword_25531D350;
  if (!qword_25531D350)
  {
    result = MEMORY[0x220789FD0](&unk_21CC787F8, &type metadata for RRViewState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D350);
  }
  return result;
}

unint64_t sub_21CC6F2A4()
{
  unint64_t result;

  result = qword_25531D358;
  if (!qword_25531D358)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78A90, &type metadata for RRState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D358);
  }
  return result;
}

unint64_t sub_21CC6F2E4()
{
  unint64_t result;

  result = qword_25531D360;
  if (!qword_25531D360)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78B48, &type metadata for RRDisplayRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D360);
  }
  return result;
}

unint64_t sub_21CC6F324()
{
  unint64_t result;

  result = qword_25531D368;
  if (!qword_25531D368)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78E80, &type metadata for RRDataSourceMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D368);
  }
  return result;
}

unint64_t sub_21CC6F364()
{
  unint64_t result;

  result = qword_254072BA8;
  if (!qword_254072BA8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78DA0, &type metadata for RRDataSourceMetadataValue.ConversationalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072BA8);
  }
  return result;
}

unint64_t sub_21CC6F3A4()
{
  unint64_t result;

  result = qword_254072BA0;
  if (!qword_254072BA0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78DC8, &type metadata for RRDataSourceMetadataValue.ConversationalCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072BA0);
  }
  return result;
}

unint64_t sub_21CC6F3E4()
{
  unint64_t result;

  result = qword_2540728E0;
  if (!qword_2540728E0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78D50, &type metadata for RRDataSourceMetadataValue.ForegroundedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2540728E0);
  }
  return result;
}

unint64_t sub_21CC6F424()
{
  unint64_t result;

  result = qword_254072998;
  if (!qword_254072998)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78D78, &type metadata for RRDataSourceMetadataValue.ForegroundedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072998);
  }
  return result;
}

unint64_t sub_21CC6F464()
{
  unint64_t result;

  result = qword_254072B78;
  if (!qword_254072B78)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78D00, &type metadata for RRDataSourceMetadataValue.OnScreenCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B78);
  }
  return result;
}

unint64_t sub_21CC6F4A4()
{
  unint64_t result;

  result = qword_254072B70;
  if (!qword_254072B70)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78D28, &type metadata for RRDataSourceMetadataValue.OnScreenCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B70);
  }
  return result;
}

unint64_t sub_21CC6F4E4()
{
  unint64_t result;

  result = qword_254072B98;
  if (!qword_254072B98)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78CB0, &type metadata for RRDataSourceMetadataValue.NotificationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B98);
  }
  return result;
}

unint64_t sub_21CC6F524()
{
  unint64_t result;

  result = qword_254072B90;
  if (!qword_254072B90)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78CD8, &type metadata for RRDataSourceMetadataValue.NotificationCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B90);
  }
  return result;
}

unint64_t sub_21CC6F564()
{
  unint64_t result;

  result = qword_254072B88;
  if (!qword_254072B88)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78C60, &type metadata for RRDataSourceMetadataValue.AnnouncementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B88);
  }
  return result;
}

unint64_t sub_21CC6F5A4()
{
  unint64_t result;

  result = qword_254072B80;
  if (!qword_254072B80)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78C88, &type metadata for RRDataSourceMetadataValue.AnnouncementCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B80);
  }
  return result;
}

unint64_t sub_21CC6F5E4()
{
  unint64_t result;

  result = qword_254072BC0;
  if (!qword_254072BC0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78C10, &type metadata for RRDataSourceMetadataValue.MediaQueueStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072BC0);
  }
  return result;
}

unint64_t sub_21CC6F624()
{
  unint64_t result;

  result = qword_254072BB8;
  if (!qword_254072BB8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78C38, &type metadata for RRDataSourceMetadataValue.MediaQueueStateCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072BB8);
  }
  return result;
}

unint64_t sub_21CC6F664()
{
  unint64_t result;

  result = qword_254072B68;
  if (!qword_254072B68)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78BC0, &type metadata for RRDataSourceMetadataValue.VisualCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B68);
  }
  return result;
}

unint64_t sub_21CC6F6A4()
{
  unint64_t result;

  result = qword_254072B60;
  if (!qword_254072B60)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78BE8, &type metadata for RRDataSourceMetadataValue.VisualCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B60);
  }
  return result;
}

unint64_t sub_21CC6F6E4()
{
  unint64_t result;

  result = qword_254072B58;
  if (!qword_254072B58)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78B70, &type metadata for RRDataSourceMetadataValue.NearbyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B58);
  }
  return result;
}

unint64_t sub_21CC6F724()
{
  unint64_t result;

  result = qword_254072B50;
  if (!qword_254072B50)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78B98, &type metadata for RRDataSourceMetadataValue.NearbyCodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B50);
  }
  return result;
}

unint64_t sub_21CC6F764()
{
  unint64_t result;

  result = qword_254072B48;
  if (!qword_254072B48)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78DF0, &type metadata for RRDataSourceMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B48);
  }
  return result;
}

unint64_t sub_21CC6F7A4()
{
  unint64_t result;

  result = qword_254072B40;
  if (!qword_254072B40)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78E18, &type metadata for RRDataSourceMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072B40);
  }
  return result;
}

unint64_t sub_21CC6F7E4()
{
  unint64_t result;

  result = qword_25531D370;
  if (!qword_25531D370)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78AB8, &type metadata for RRDisplayRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D370);
  }
  return result;
}

unint64_t sub_21CC6F824()
{
  unint64_t result;

  result = qword_25531D378;
  if (!qword_25531D378)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78AE0, &type metadata for RRDisplayRepresentation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D378);
  }
  return result;
}

unint64_t sub_21CC6F864()
{
  unint64_t result;

  result = qword_25531D380;
  if (!qword_25531D380)
  {
    result = MEMORY[0x220789FD0](&unk_21CC789B0, &type metadata for RRState.SelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D380);
  }
  return result;
}

unint64_t sub_21CC6F8A4()
{
  unint64_t result;

  result = qword_25531D388;
  if (!qword_25531D388)
  {
    result = MEMORY[0x220789FD0](&unk_21CC789D8, &type metadata for RRState.SelectedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D388);
  }
  return result;
}

unint64_t sub_21CC6F8E4()
{
  unint64_t result;

  result = qword_25531D390;
  if (!qword_25531D390)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78960, &type metadata for RRState.HighlightedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D390);
  }
  return result;
}

unint64_t sub_21CC6F924()
{
  unint64_t result;

  result = qword_25531D398;
  if (!qword_25531D398)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78988, &type metadata for RRState.HighlightedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D398);
  }
  return result;
}

unint64_t sub_21CC6F964()
{
  unint64_t result;

  result = qword_25531D3A0;
  if (!qword_25531D3A0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78910, &type metadata for RRState.FocusedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3A0);
  }
  return result;
}

unint64_t sub_21CC6F9A4()
{
  unint64_t result;

  result = qword_25531D3A8;
  if (!qword_25531D3A8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78938, &type metadata for RRState.FocusedCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3A8);
  }
  return result;
}

unint64_t sub_21CC6F9E4()
{
  unint64_t result;

  result = qword_25531D3B0;
  if (!qword_25531D3B0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC788C0, &type metadata for RRState.DisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3B0);
  }
  return result;
}

unint64_t sub_21CC6FA24()
{
  unint64_t result;

  result = qword_25531D3B8;
  if (!qword_25531D3B8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC788E8, &type metadata for RRState.DisabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3B8);
  }
  return result;
}

unint64_t sub_21CC6FA64()
{
  unint64_t result;

  result = qword_25531D3C0;
  if (!qword_25531D3C0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78870, &type metadata for RRState.EditingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3C0);
  }
  return result;
}

unint64_t sub_21CC6FAA4()
{
  unint64_t result;

  result = qword_25531D3C8;
  if (!qword_25531D3C8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78898, &type metadata for RRState.EditingCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3C8);
  }
  return result;
}

unint64_t sub_21CC6FAE4()
{
  unint64_t result;

  result = qword_25531D3D0;
  if (!qword_25531D3D0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78820, &type metadata for RRState.PrimaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3D0);
  }
  return result;
}

unint64_t sub_21CC6FB24()
{
  unint64_t result;

  result = qword_25531D3D8;
  if (!qword_25531D3D8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78848, &type metadata for RRState.PrimaryCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3D8);
  }
  return result;
}

unint64_t sub_21CC6FB64()
{
  unint64_t result;

  result = qword_25531D3E0;
  if (!qword_25531D3E0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78A00, &type metadata for RRState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3E0);
  }
  return result;
}

unint64_t sub_21CC6FBA4()
{
  unint64_t result;

  result = qword_25531D3E8;
  if (!qword_25531D3E8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78A28, &type metadata for RRState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3E8);
  }
  return result;
}

unint64_t sub_21CC6FBE4()
{
  unint64_t result;

  result = qword_25531D3F0;
  if (!qword_25531D3F0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78768, &type metadata for RRViewState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3F0);
  }
  return result;
}

unint64_t sub_21CC6FC24()
{
  unint64_t result;

  result = qword_25531D3F8;
  if (!qword_25531D3F8)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78790, &type metadata for RRViewState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D3F8);
  }
  return result;
}

unint64_t sub_21CC6FC64()
{
  unint64_t result;

  result = qword_25531D400;
  if (!qword_25531D400)
  {
    result = MEMORY[0x220789FD0](&unk_21CC786B0, &type metadata for RRViewLocationMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D400);
  }
  return result;
}

unint64_t sub_21CC6FCA4()
{
  unint64_t result;

  result = qword_25531D408;
  if (!qword_25531D408)
  {
    result = MEMORY[0x220789FD0]("yOD1X!", &type metadata for RRViewLocationMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D408);
  }
  return result;
}

unint64_t sub_21CC6FCE4()
{
  unint64_t result;

  result = qword_25531D410;
  if (!qword_25531D410)
  {
    result = MEMORY[0x220789FD0]("IPD1\\\"", &type metadata for RRSurroundingText.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D410);
  }
  return result;
}

unint64_t sub_21CC6FD24()
{
  unint64_t result;

  result = qword_25531D418;
  if (!qword_25531D418)
  {
    result = MEMORY[0x220789FD0]("1PD14\"", &type metadata for RRSurroundingText.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D418);
  }
  return result;
}

unint64_t sub_21CC6FD64()
{
  unint64_t result;

  result = qword_25531D420;
  if (!qword_25531D420)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78540, &type metadata for RRSurroundingTextsMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D420);
  }
  return result;
}

unint64_t sub_21CC6FDA4()
{
  unint64_t result;

  result = qword_25531D428;
  if (!qword_25531D428)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78568, &type metadata for RRSurroundingTextsMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D428);
  }
  return result;
}

unint64_t sub_21CC6FDE4()
{
  unint64_t result;

  result = qword_25531D430;
  if (!qword_25531D430)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78488, &type metadata for RRBoundingBoxMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D430);
  }
  return result;
}

unint64_t sub_21CC6FE24()
{
  unint64_t result;

  result = qword_25531D438;
  if (!qword_25531D438)
  {
    result = MEMORY[0x220789FD0](&unk_21CC784B0, &type metadata for RRBoundingBoxMetadataValue.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D438);
  }
  return result;
}

unint64_t sub_21CC6FE64()
{
  unint64_t result;

  result = qword_254072A80;
  if (!qword_254072A80)
  {
    result = MEMORY[0x220789FD0](&unk_21CC782F8, &type metadata for RRMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072A80);
  }
  return result;
}

unint64_t sub_21CC6FEA4()
{
  unint64_t result;

  result = qword_254072A78;
  if (!qword_254072A78)
  {
    result = MEMORY[0x220789FD0](&unk_21CC78320, &type metadata for RRMetadata.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254072A78);
  }
  return result;
}

unint64_t sub_21CC6FEE0()
{
  unint64_t result;

  result = qword_254072A90;
  if (!qword_254072A90)
  {
    result = MEMORY[0x220789FD0](&unk_21CC783E8, &type metadata for RRMetadata.Base);
    atomic_store(result, (unint64_t *)&qword_254072A90);
  }
  return result;
}

uint64_t sub_21CC6FF1C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return sub_21CC753CC();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_21CC753E4();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_21CC75438();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return sub_21CC753CC();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return sub_21CC75438();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return sub_21CC754BC();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_21CC75360();
}

_QWORD *OUTLINED_FUNCTION_12_2()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return sub_21CC753CC();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_21CC754EC();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_21CC75360();
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_21CC75510();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return sub_21CC75510();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return sub_21CC75528();
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return swift_bridgeObjectRelease();
}

unsigned __int16 OUTLINED_FUNCTION_25_1@<H0>(int32x4_t a1@<Q0>, int32x4_t a2@<Q1>)
{
  return vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32(a1, a2)), 0xFuLL)));
}

void OUTLINED_FUNCTION_26_2(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_29_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return sub_21CC754BC();
}

void OUTLINED_FUNCTION_36_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
}

unint64_t OUTLINED_FUNCTION_37_2@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 144) = a1;
  *(_BYTE *)(v1 - 65) = 0;
  return sub_21CC6D8AC();
}

uint64_t OUTLINED_FUNCTION_38_2()
{
  return sub_21CC75300();
}

uint64_t OUTLINED_FUNCTION_39_2()
{
  return sub_21CC754C8();
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return sub_21CC751E0();
}

uint64_t OUTLINED_FUNCTION_41_1()
{
  uint64_t v0;

  return v0;
}

_QWORD *OUTLINED_FUNCTION_43_0(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

void OUTLINED_FUNCTION_44_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 136) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_46_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_47_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_48_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 144) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void OUTLINED_FUNCTION_49_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 160) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return sub_21CC754C8();
}

uint64_t OUTLINED_FUNCTION_53_1()
{
  return sub_21CC754C8();
}

uint64_t OUTLINED_FUNCTION_55_1()
{
  return sub_21CC754E0();
}

uint64_t OUTLINED_FUNCTION_56_1()
{
  return sub_21CC754E0();
}

uint64_t OUTLINED_FUNCTION_57_1()
{
  return sub_21CC754E0();
}

uint64_t OUTLINED_FUNCTION_58_1()
{
  return sub_21CC754E0();
}

uint64_t OUTLINED_FUNCTION_60_1()
{
  return sub_21CC754E0();
}

uint64_t OUTLINED_FUNCTION_61_1()
{
  return sub_21CC75528();
}

uint64_t OUTLINED_FUNCTION_68_1()
{
  return sub_21CC7539C();
}

uint64_t OUTLINED_FUNCTION_69_1()
{
  return sub_21CC754C8();
}

uint64_t OUTLINED_FUNCTION_70_0()
{
  return sub_21CC75408();
}

unint64_t OUTLINED_FUNCTION_76_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 7;
  return sub_21CC6DF68();
}

unint64_t OUTLINED_FUNCTION_78_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 6;
  return sub_21CC6DFA4();
}

uint64_t OUTLINED_FUNCTION_79_1()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_81_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 5;
  return sub_21CC6DD88();
}

unint64_t OUTLINED_FUNCTION_82_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 5;
  return sub_21CC6DFE0();
}

unint64_t OUTLINED_FUNCTION_83_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 4;
  return sub_21CC6DDC4();
}

unint64_t OUTLINED_FUNCTION_84_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 4;
  return sub_21CC6E01C();
}

unint64_t OUTLINED_FUNCTION_87_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 3;
  return sub_21CC6DE00();
}

unint64_t OUTLINED_FUNCTION_88_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 3;
  return sub_21CC6E058();
}

unint64_t OUTLINED_FUNCTION_89_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 70) = 2;
  return sub_21CC6E094();
}

unint64_t OUTLINED_FUNCTION_90_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 2;
  return sub_21CC6DE3C();
}

uint64_t OUTLINED_FUNCTION_91_1()
{
  return sub_21CC75438();
}

uint64_t OUTLINED_FUNCTION_92_1()
{
  return sub_21CC753CC();
}

uint64_t OUTLINED_FUNCTION_93_1(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_94_1(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

_BYTE *OUTLINED_FUNCTION_97_0@<X0>(_BYTE *result@<X0>, char a2@<W8>)
{
  *result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_99_1(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_100_1()
{
  return sub_21CC751E0();
}

uint64_t OUTLINED_FUNCTION_101_1(uint64_t a1, ...)
{
  uint64_t (*v1)(char *, uint64_t);
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return v1(va, v2);
}

uint64_t OUTLINED_FUNCTION_102_1@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

unint64_t OUTLINED_FUNCTION_105_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return sub_21CC6D870();
}

unint64_t OUTLINED_FUNCTION_106_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return sub_21CC6DA14();
}

unint64_t OUTLINED_FUNCTION_107_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 71) = 1;
  return sub_21CC6E0D0();
}

unint64_t OUTLINED_FUNCTION_108_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 69) = 1;
  return sub_21CC6DE78();
}

uint64_t OUTLINED_FUNCTION_109_0()
{
  return sub_21CC754E0();
}

uint64_t RRHandoffURL.init(key:appBundleId:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (!String.isValidContinuityKey()())
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  v6 = sub_21CC70634();
  swift_bridgeObjectRelease();
  if (!v6)
  {
LABEL_7:
    result = OUTLINED_FUNCTION_59();
    *(_QWORD *)(a3 + 64) = 0;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }
  OUTLINED_FUNCTION_12_3(0x646970756F7267, 0xE700000000000000);
  if (v7)
  {
    if (v7[2])
    {
      v8 = v7[5];
      v21 = v7[4];
      OUTLINED_FUNCTION_91();
      OUTLINED_FUNCTION_75();
      goto LABEL_10;
    }
    OUTLINED_FUNCTION_75();
  }
  v21 = 0;
  v8 = 0;
LABEL_10:
  OUTLINED_FUNCTION_12_3(0x6E79616C70736964, 0xEB00000000656D61);
  if (v10)
  {
    if (v10[2])
    {
      v12 = v10[4];
      v11 = v10[5];
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_39_3();
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_39_3();
  }
  v12 = 0;
  v11 = 0;
LABEL_15:
  OUTLINED_FUNCTION_12_3(0x65636976726573, 0xE700000000000000);
  if (!v13)
  {
LABEL_19:
    v15 = 0;
    v14 = 0;
    goto LABEL_20;
  }
  if (!v13[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  v15 = v13[4];
  v14 = v13[5];
  OUTLINED_FUNCTION_14_2();
  swift_bridgeObjectRelease();
LABEL_20:
  v16 = OUTLINED_FUNCTION_30_2();
  OUTLINED_FUNCTION_12_3(v16, 0xE900000000000074);
  v18 = v17;
  if (!v17)
  {
    v19 = OUTLINED_FUNCTION_30_2();
    OUTLINED_FUNCTION_12_3(v19, 0xEA00000000007374);
    v18 = v20;
  }
  result = OUTLINED_FUNCTION_79_1();
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = v15;
  *(_QWORD *)(a3 + 24) = v14;
  *(_QWORD *)(a3 + 32) = v21;
  *(_QWORD *)(a3 + 40) = v8;
  *(_QWORD *)(a3 + 48) = v12;
  *(_QWORD *)(a3 + 56) = v11;
  *(_QWORD *)(a3 + 64) = v18;
  return result;
}

Swift::Bool __swiftcall String.isValidContinuityKey()()
{
  uint64_t v0;
  uint64_t v1;

  return OUTLINED_FUNCTION_5_4(v0, v1, 39, 0x800000021CC75EF0);
}

uint64_t sub_21CC70634()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_21CC71454();
  v0 = OUTLINED_FUNCTION_9_2();
  sub_21CC70A14(v0);
  v2 = v1;
  OUTLINED_FUNCTION_44_0();
  if (!v2)
    return 0;
  v3 = OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_79_1();
  v30 = *(_QWORD *)(v3 + 16);
  if (!v30)
  {
    OUTLINED_FUNCTION_71();
    return MEMORY[0x24BEE4B00];
  }
  v4 = 0;
  v5 = (_QWORD *)MEMORY[0x24BEE4B00];
  v29 = v3;
  while (v4 < *(_QWORD *)(v3 + 16))
  {
    v6 = (_QWORD *)OUTLINED_FUNCTION_7_1();
    if (!v6[2])
    {
      OUTLINED_FUNCTION_75();
      OUTLINED_FUNCTION_71();
      OUTLINED_FUNCTION_59();
      return 0;
    }
    v31 = v6[4];
    v32 = v6[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_59();
    v7 = OUTLINED_FUNCTION_7_1();
    OUTLINED_FUNCTION_44_0();
    v8 = *(_QWORD *)(v7 + 16);
    if (v8)
    {
      v9 = (uint64_t *)(v7 + 40);
      v10 = MEMORY[0x24BEE4AF8];
      do
      {
        v12 = *(v9 - 1);
        v11 = *v9;
        v13 = HIBYTE(*v9) & 0xF;
        if ((*v9 & 0x2000000000000000) == 0)
          v13 = v12 & 0xFFFFFFFFFFFFLL;
        if (v13)
        {
          OUTLINED_FUNCTION_91();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            sub_21CC71608(0, *(_QWORD *)(v10 + 16) + 1, 1);
          v15 = *(_QWORD *)(v10 + 16);
          v14 = *(_QWORD *)(v10 + 24);
          if (v15 >= v14 >> 1)
            sub_21CC71608(v14 > 1, v15 + 1, 1);
          *(_QWORD *)(v10 + 16) = v15 + 1;
          v16 = v10 + 16 * v15;
          *(_QWORD *)(v16 + 32) = v12;
          *(_QWORD *)(v16 + 40) = v11;
        }
        v9 += 2;
        --v8;
      }
      while (v8);
    }
    else
    {
      v10 = MEMORY[0x24BEE4AF8];
    }
    swift_bridgeObjectRelease();
    swift_isUniquelyReferenced_nonNull_native();
    v17 = sub_21CC64E84(v31, v32);
    if (__OFADD__(v5[2], (v18 & 1) == 0))
      goto LABEL_34;
    v19 = v17;
    v20 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531D470);
    if ((sub_21CC75330() & 1) != 0)
    {
      v21 = sub_21CC64E84(v31, v32);
      if ((v20 & 1) != (v22 & 1))
        goto LABEL_36;
      v19 = v21;
    }
    if ((v20 & 1) != 0)
    {
      v23 = v5[7];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v23 + 8 * v19) = v10;
    }
    else
    {
      v5[(v19 >> 6) + 8] |= 1 << v19;
      v24 = (uint64_t *)(v5[6] + 16 * v19);
      *v24 = v31;
      v24[1] = v32;
      *(_QWORD *)(v5[7] + 8 * v19) = v10;
      v25 = v5[2];
      v26 = __OFADD__(v25, 1);
      v27 = v25 + 1;
      if (v26)
        goto LABEL_35;
      v5[2] = v27;
      OUTLINED_FUNCTION_14_2();
    }
    ++v4;
    OUTLINED_FUNCTION_39_3();
    swift_bridgeObjectRelease();
    v3 = v29;
    if (v4 == v30)
    {
      OUTLINED_FUNCTION_71();
      return (uint64_t)v5;
    }
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  result = sub_21CC75480();
  __break(1u);
  return result;
}

unint64_t sub_21CC7099C()
{
  unint64_t result;

  result = qword_25531D448;
  if (!qword_25531D448)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25531D448);
  }
  return result;
}

unint64_t sub_21CC709D8()
{
  unint64_t result;

  result = qword_25531D458;
  if (!qword_25531D458)
  {
    result = MEMORY[0x220789FD0](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25531D458);
  }
  return result;
}

uint64_t sub_21CC70A14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = *(_QWORD *)(a1 + 16 * v1 + 16);
  swift_bridgeObjectRetain();
  return v2;
}

void RRHandoffURL.toAnnotatedEntity()()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v1 = type metadata accessor for RREntity();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_62();
  v4 = v3 - v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D460);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v22 - v9;
  v11 = *(_QWORD *)(v0 + 8);
  v12 = *(_QWORD *)(v0 + 32);
  v13 = *(_QWORD *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 64);
  *(_QWORD *)&v23 = *(_QWORD *)v0;
  *((_QWORD *)&v23 + 1) = v11;
  v24 = *(_OWORD *)(v0 + 16);
  v25 = v12;
  v22 = *(_OWORD *)(v0 + 40);
  v26 = v22;
  v27 = v13;
  v28 = v14;
  sub_21CC70C4C();
  if (!v15)
    goto LABEL_13;
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v1);
  if ((_QWORD)v22)
  {
    v16 = OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_3_4(v16);
    OUTLINED_FUNCTION_36_2(v17, (__n128)xmmword_21CC79630);
    OUTLINED_FUNCTION_8_2(v18);
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_14_2();
    OUTLINED_FUNCTION_11_1();
LABEL_8:
    sub_21CC71224((uint64_t)v8, (uint64_t)v10);
    goto LABEL_9;
  }
  if (v14 && *(_QWORD *)(v14 + 16))
  {
    v19 = OUTLINED_FUNCTION_16_1();
    OUTLINED_FUNCTION_3_4(v19);
    OUTLINED_FUNCTION_36_2(v20, (__n128)xmmword_21CC79630);
    OUTLINED_FUNCTION_8_2(v21);
    OUTLINED_FUNCTION_11_1();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_14_2();
    goto LABEL_8;
  }
LABEL_9:
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v1))
  {
    OUTLINED_FUNCTION_25_2();
  }
  else
  {
    sub_21CC57E1C((uint64_t)v10, v4);
    v23 = xmmword_21CC79640;
    LOBYTE(v24) = 0;
    RREntity.toAnnotatedEntity(addUsoIdentifierIfNotPresent:configuration:)(0, (uint64_t *)&v23);
    OUTLINED_FUNCTION_25_2();
    sub_21CC57E60(v4);
  }
  sub_21CC711E4((uint64_t)v10);
LABEL_13:
  OUTLINED_FUNCTION_45_0();
}

void sub_21CC70C4C()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;

  v30 = sub_21CC75030();
  v1 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_62();
  v4 = v3 - v2;
  v5 = v0[8];
  if (v0[5])
  {
    v26 = v0[8];
    v6 = v0[7];
    sub_21CC750A8();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_91();
    v7 = sub_21CC7509C();
    swift_bridgeObjectRetain();
    v8 = v7;
    OUTLINED_FUNCTION_1_4();
    sub_21CC75018();
    v29 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
    v29(v4, v30);
    if (v6)
      sub_21CC75090();
    if (v26)
    {
      v9 = *(_QWORD *)(v26 + 16);
      if (v9)
      {
        sub_21CC7099C();
        OUTLINED_FUNCTION_32_2();
        OUTLINED_FUNCTION_18_1();
        v10 = v26 + 40;
        v11 = MEMORY[0x24BEE0D00];
        v28 = v4;
        v27 = v8;
        while (1)
        {
          v31 = v9;
          OUTLINED_FUNCTION_6();
          swift_bridgeObjectRetain();
          sub_21CC750C0();
          OUTLINED_FUNCTION_21_2();
          sub_21CC752AC();
          v12 = v11;
          __swift_instantiateConcreteTypeFromMangledName(&qword_25531D450);
          v13 = OUTLINED_FUNCTION_13_2();
          *(_OWORD *)(v13 + 16) = xmmword_21CC79650;
          *(_QWORD *)(v13 + 56) = v12;
          v14 = sub_21CC709D8();
          *(_QWORD *)(v13 + 64) = v14;
          *(_QWORD *)(v13 + 32) = 0xD00000000000001ALL;
          *(_QWORD *)(v13 + 40) = 0x800000021CC75F20;
          v15 = (void *)sub_21CC7527C();
          v16 = (void *)sub_21CC751BC();
          v17 = objc_msgSend(v15, sel_evaluateWithObject_, v16);
          OUTLINED_FUNCTION_44_0();

          if (v17)
            break;
          v19 = OUTLINED_FUNCTION_13_2();
          *(_OWORD *)(v19 + 16) = xmmword_21CC79650;
          v11 = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v19 + 56) = MEMORY[0x24BEE0D00];
          *(_QWORD *)(v19 + 64) = v14;
          *(_QWORD *)(v19 + 32) = 0xD00000000000002BLL;
          *(_QWORD *)(v19 + 40) = 0x800000021CC75F40;
          v20 = (void *)sub_21CC7527C();
          v21 = (void *)sub_21CC751BC();
          v22 = objc_msgSend(v20, sel_evaluateWithObject_, v21);

          v18 = v28;
          if ((v22 & 1) != 0)
          {
            OUTLINED_FUNCTION_33_2();
            OUTLINED_FUNCTION_6();
            OUTLINED_FUNCTION_37_3();
            OUTLINED_FUNCTION_15_3();
            sub_21CC750D8();
            OUTLINED_FUNCTION_11_1();
            sub_21CC750B4();
            goto LABEL_11;
          }
LABEL_12:
          v10 += 16;
          OUTLINED_FUNCTION_23();
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_1_4();
          sub_21CC75018();
          v29(v18, v30);
          OUTLINED_FUNCTION_79_1();
          swift_retain();
          v8 = v27;
          sub_21CC75084();
          OUTLINED_FUNCTION_19_2();
          v9 = v31 - 1;
          if (v31 == 1)
          {
            swift_bridgeObjectRelease();
            goto LABEL_14;
          }
        }
        OUTLINED_FUNCTION_31_2();
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_38_3();
        OUTLINED_FUNCTION_15_3();
        sub_21CC750D8();
        OUTLINED_FUNCTION_11_1();
        sub_21CC750B4();
        v18 = v28;
        v11 = MEMORY[0x24BEE0D00];
LABEL_11:
        OUTLINED_FUNCTION_19_2();
        goto LABEL_12;
      }
    }
LABEL_14:
    MEMORY[0x22078988C](v8);
    goto LABEL_15;
  }
  if (v5 && *(_QWORD *)(v5 + 16))
  {
    OUTLINED_FUNCTION_32_2();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_18_1();
    v23 = sub_21CC750C0();
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_21_2();
    OUTLINED_FUNCTION_2_3();
    v24 = OUTLINED_FUNCTION_28_3();
    OUTLINED_FUNCTION_59();
    if (v24)
    {
      OUTLINED_FUNCTION_31_2();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_38_3();
      OUTLINED_FUNCTION_20_3();
      sub_21CC750D8();
      OUTLINED_FUNCTION_11_1();
      v25 = v23;
      sub_21CC750B4();
    }
    else
    {
      if (!String.isValidEmailAddress()())
      {
LABEL_24:
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_18_1();
        OUTLINED_FUNCTION_1_4();
        sub_21CC75018();
        (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v30);
        MEMORY[0x22078988C](v23);
        OUTLINED_FUNCTION_71();
LABEL_15:
        OUTLINED_FUNCTION_25_2();
        goto LABEL_20;
      }
      OUTLINED_FUNCTION_33_2();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_37_3();
      OUTLINED_FUNCTION_20_3();
      sub_21CC750D8();
      OUTLINED_FUNCTION_11_1();
      v25 = v23;
      sub_21CC750B4();
    }
    OUTLINED_FUNCTION_19_2();
    v23 = v25;
    goto LABEL_24;
  }
LABEL_20:
  OUTLINED_FUNCTION_45_0();
}

uint64_t sub_21CC711E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D460);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21CC71224(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void static RRHandoffURL.messageRecipientToUSOEntityBuilder(recipient:appBundleId:uniqueId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v7 = sub_21CC75030();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_62();
  v11 = v10 - v9;
  OUTLINED_FUNCTION_32_2();
  OUTLINED_FUNCTION_6();
  sub_21CC750C0();
  OUTLINED_FUNCTION_24_1();
  sub_21CC71454();
  OUTLINED_FUNCTION_2_3();
  v12 = OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_59();
  if (v12)
  {
    OUTLINED_FUNCTION_31_2();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_38_3();
    OUTLINED_FUNCTION_29_3();
    sub_21CC750D8();
    swift_retain();
  }
  else
  {
    if (!String.isValidEmailAddress()())
      goto LABEL_6;
    OUTLINED_FUNCTION_33_2();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_37_3();
    OUTLINED_FUNCTION_29_3();
    sub_21CC750D8();
    swift_retain();
  }
  sub_21CC750B4();
  OUTLINED_FUNCTION_19_2();
LABEL_6:
  if (!a6)
    swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_14_2();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_1_4();
  sub_21CC75018();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v7);
  OUTLINED_FUNCTION_45_0();
}

uint64_t String.cleanPhoneNumber.getter()
{
  OUTLINED_FUNCTION_6_2();
  return OUTLINED_FUNCTION_2_3();
}

unint64_t sub_21CC71454()
{
  unint64_t result;

  result = qword_25531D468;
  if (!qword_25531D468)
  {
    result = MEMORY[0x220789FD0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25531D468);
  }
  return result;
}

Swift::Bool __swiftcall String.isValidPhoneNumber()()
{
  uint64_t v0;
  uint64_t v1;

  return OUTLINED_FUNCTION_5_4(v0, v1, 26, 0x800000021CC75F20);
}

Swift::Bool __swiftcall String.isValidEmailAddress()()
{
  uint64_t v0;
  uint64_t v1;

  return OUTLINED_FUNCTION_5_4(v0, v1, 43, 0x800000021CC75F40);
}

id sub_21CC714C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  sub_21CC7099C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D450);
  v6 = OUTLINED_FUNCTION_13_2();
  *(_OWORD *)(v6 + 16) = xmmword_21CC79650;
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 64) = sub_21CC709D8();
  *(_QWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 40) = a4;
  v7 = (void *)sub_21CC7527C();
  v8 = (void *)sub_21CC751BC();
  v9 = objc_msgSend(v7, sel_evaluateWithObject_, v8);

  return v9;
}

Swift::Bool __swiftcall String.isValidContact()()
{
  BOOL v0;

  if (String.isValidEmailAddress()())
  {
    return 1;
  }
  else
  {
    OUTLINED_FUNCTION_6_2();
    OUTLINED_FUNCTION_2_3();
    v0 = OUTLINED_FUNCTION_28_3();
    OUTLINED_FUNCTION_59();
  }
  return v0;
}

uint64_t sub_21CC71608(uint64_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21CC71624(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_21CC71624(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;

  v5 = result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531D478);
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    sub_21CC73E58((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t destroy for RRHandoffURL()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for RRHandoffURL(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for RRHandoffURL(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy72_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x48uLL);
}

uint64_t assignWithTake for RRHandoffURL(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RRHandoffURL(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 72))
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

uint64_t storeEnumTagSinglePayload for RRHandoffURL(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RRHandoffURL()
{
  return &type metadata for RRHandoffURL;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_21CC75024();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return sub_21CC752AC();
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  _QWORD *v10;

  result = __swift_storeEnumTagSinglePayload(v6, 1, 1, a1);
  *v4 = v8;
  v4[1] = v1;
  v4[2] = v7;
  v4[3] = v5;
  v4[4] = v3;
  v10 = (_QWORD *)((char *)v4 + *(int *)(v2 + 32));
  *v10 = 0;
  v10[1] = 0;
  return result;
}

id OUTLINED_FUNCTION_5_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_21CC714C0(a1, a2, a3 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a4);
}

unint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_21CC71454();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_21CC752A0();
}

uint64_t OUTLINED_FUNCTION_8_2@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + a1) = v2;
  *v1 = 0;
  v1[1] = 0;
  return __swift_storeEnumTagSinglePayload(v4, 0, 1, v3);
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return sub_21CC752A0();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_12_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_21CC5F524(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return sub_21CC75180();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_21_2()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 136) = 0;
  *(_QWORD *)(v0 - 128) = 0xE000000000000000;
  return sub_21CC71454();
}

uint64_t OUTLINED_FUNCTION_25_2()
{
  return swift_release();
}

BOOL OUTLINED_FUNCTION_28_3()
{
  return String.isValidPhoneNumber()();
}

uint64_t OUTLINED_FUNCTION_29_3()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_30_2()
{
  return 0x6E65697069636572;
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return sub_21CC750F0();
}

uint64_t OUTLINED_FUNCTION_32_2()
{
  return sub_21CC750CC();
}

uint64_t OUTLINED_FUNCTION_33_2()
{
  return sub_21CC75114();
}

void OUTLINED_FUNCTION_36_2(_QWORD *a1@<X8>, __n128 a2@<Q0>)
{
  uint64_t v2;
  uint64_t v3;

  *(__n128 *)(v3 + v2) = a2;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

uint64_t OUTLINED_FUNCTION_37_3()
{
  return sub_21CC75108();
}

uint64_t OUTLINED_FUNCTION_38_3()
{
  return sub_21CC750E4();
}

uint64_t OUTLINED_FUNCTION_39_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t RRVisualGroup.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(result + 24) = 0;
  return result;
}

uint64_t RRVisualGroup.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + 24) = 0;
  return result;
}

uint64_t sub_21CC71BE8(void *a1, double a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  id v10;
  double v11;
  BOOL v12;
  BOOL v13;
  char v14;

  v3 = v2;
  v7 = sub_21CC7512C();
  v8 = v6;
  if (v7 == 0xD000000000000014 && v6 == 0x800000021CC75F70
    || (OUTLINED_FUNCTION_0_4() & 1) != 0
    || v7 == 0xD000000000000012 && v8 == 0x800000021CC75F90
    || (OUTLINED_FUNCTION_0_4() & 1) != 0
    || v7 == 0xD000000000000013 && v8 == 0x800000021CC75FB0
    || (OUTLINED_FUNCTION_0_4() & 1) != 0
    || (v7 == 0x505F6E6F6D6D6F63 ? (v12 = v8 == 0xED00006E6F737265) : (v12 = 0),
        v12
     || (OUTLINED_FUNCTION_0_4() & 1) != 0
     || v7 == 0xD000000000000014 && v8 == 0x800000021CC75FD0
     || (OUTLINED_FUNCTION_0_4() & 1) != 0
     || (v7 == 0x555F6E6F6D6D6F63 ? (v13 = v8 == 0xEA00000000006972) : (v13 = 0), v13)))
  {
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v14 = OUTLINED_FUNCTION_0_4();
    result = swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
      return result;
  }
  if (a2 > 0.0)
  {
    OUTLINED_FUNCTION_1_1();
    v10 = a1;
    MEMORY[0x220789A54]();
    sub_21CC720DC(*(_QWORD *)((*(_QWORD *)(v3 + 16) & 0xFFFFFFFFFFFFF8) + 0x10));
    sub_21CC75258();
    sub_21CC75240();
    result = swift_endAccess();
    v11 = *(double *)(v3 + 24);
    if (v11 <= a2)
      v11 = a2;
    *(double *)(v3 + 24) = v11;
  }
  return result;
}

uint64_t sub_21CC71E64()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  double v12;
  char v13;
  double v14;
  BOOL v15;
  double *v16;
  double v17;
  _BYTE *v18;
  double v19;

  v2 = v0;
  v3 = (uint64_t *)(v0 + 16);
  result = OUTLINED_FUNCTION_1_1();
  v5 = *(_QWORD *)(v2 + 16);
  if (v5 >> 62)
  {
    OUTLINED_FUNCTION_55_0();
    v6 = sub_21CC75348();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v6 >= 2)
  {
    v7 = *v3;
    if ((unint64_t)*v3 >> 62)
    {
      OUTLINED_FUNCTION_55_0();
      result = sub_21CC75348();
      v8 = result;
      if (result)
        goto LABEL_6;
    }
    else
    {
      v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = OUTLINED_FUNCTION_55_0();
      if (v8)
      {
LABEL_6:
        if (v8 < 1)
        {
          __break(1u);
          return result;
        }
        v9 = 0;
        OUTLINED_FUNCTION_3_5();
        do
        {
          if ((v7 & 0xC000000000000001) != 0)
            v10 = (char *)MEMORY[0x220789B20](v9, v7);
          else
            v10 = (char *)*(id *)(v7 + 8 * v9 + 32);
          v11 = v10;
          sub_21CC6289C();
          if ((v13 & 1) == 0)
          {
            v14 = v12;
            v15 = *(_QWORD *)&v11[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId] == 0x6C7070612E6D6F63
               && *(_QWORD *)&v11[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_appBundleId + 8] == (_QWORD)v1;
            if (v15 || (sub_21CC75450() & 1) != 0)
            {
              v16 = (double *)&v11[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
              v17 = v14 / *(double *)(v2 + 24);
              OUTLINED_FUNCTION_1_1();
              *v16 = v17;
              v18 = v16 + 1;
            }
            else
            {
              v1 = &v11[OBJC_IVAR____TtC32SiriReferenceResolutionDataModel17RRAnnotatedEntity_onScreenSaliencyAdjustment];
              OUTLINED_FUNCTION_1_1();
              v19 = *(double *)v1;
              v18 = v1 + 8;
              if (v1[8])
                v19 = 1.0;
              *(double *)v1 = v19 * (v14 / *(double *)(v2 + 24) + 999.0) / 1000.0;
              OUTLINED_FUNCTION_3_5();
            }
            *v18 = 0;
          }
          ++v9;

        }
        while (v8 != v9);
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t RRVisualGroup.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RRVisualGroup.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_21CC720DC(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_21CC7524C();
  return result;
}

uint64_t type metadata accessor for RRVisualGroup()
{
  return objc_opt_self();
}

uint64_t method lookup function for RRVisualGroup()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RRVisualGroup.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of RRVisualGroup.addAnnotatedEntity(annotatedEntity:entityValue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of RRVisualGroup.setEntitiesSaliencyAdjustments()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return sub_21CC75450();
}

uint64_t ResolveQuery.referenceEntity.getter()
{
  return swift_retain();
}

uint64_t ResolveQuery.alternativeEntityTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ResolveQuery.restrictedEntitiesKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

void ResolveQuery.matchedResultsSetting.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 48);
}

void ResolveQuery.__allocating_init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_1_5();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_QWORD *)(v8 + 32) = a3;
  *(_QWORD *)(v8 + 40) = a4;
  *(_BYTE *)(v8 + 48) = 0;
  OUTLINED_FUNCTION_71_1();
}

uint64_t ResolveQuery.init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = a3;
  *(_QWORD *)(v4 + 40) = a4;
  *(_BYTE *)(v4 + 48) = 0;
  return v4;
}

void ResolveQuery.__allocating_init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:matchedResultsSetting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v10;
  char v11;

  v10 = OUTLINED_FUNCTION_1_5();
  v11 = *a5;
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  *(_QWORD *)(v10 + 32) = a3;
  *(_QWORD *)(v10 + 40) = a4;
  *(_BYTE *)(v10 + 48) = v11;
  OUTLINED_FUNCTION_71_1();
}

uint64_t ResolveQuery.init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:matchedResultsSetting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v5;
  char v6;

  v6 = *a5;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v5 + 32) = a3;
  *(_QWORD *)(v5 + 40) = a4;
  *(_BYTE *)(v5 + 48) = v6;
  return v5;
}

uint64_t sub_21CC7226C()
{
  uint64_t v0;
  __int128 v2;

  BYTE8(v2) = 0;
  sub_21CC752E8();
  OUTLINED_FUNCTION_3_6();
  sub_21CC75078();
  OUTLINED_FUNCTION_4_3();
  swift_release();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_3_6();
  sub_21CC723B8();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_5();
  swift_bridgeObjectRetain();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_5();
  *(_QWORD *)&v2 = *(unsigned __int8 *)(v0 + 48);
  sub_21CC75324();
  return *(_QWORD *)((char *)&v2 + 1);
}

uint64_t sub_21CC723B8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 24);
  if (!v1)
    return 7104878;
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_4;
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  result = sub_21CC75348();
  v2 = result;
  if (!result)
    goto LABEL_13;
LABEL_4:
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    v4 = 0;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
        MEMORY[0x220789B20](v4, v1);
      else
        swift_retain();
      ++v4;
      sub_21CC75078();
      OUTLINED_FUNCTION_4_3();
      swift_release();
      swift_bridgeObjectRetain();
      sub_21CC751EC();
      swift_bridgeObjectRelease();
      sub_21CC751EC();
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v2 != v4);
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t ResolveQuery.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ResolveQuery.__deallocating_deinit()
{
  ResolveQuery.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_21CC72560()
{
  return sub_21CC7226C();
}

BOOL static MatchedResultsSetting.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t MatchedResultsSetting.hash(into:)()
{
  return sub_21CC754C8();
}

uint64_t MatchedResultsSetting.hashValue.getter()
{
  sub_21CC754BC();
  sub_21CC754C8();
  return sub_21CC754EC();
}

unint64_t sub_21CC72610()
{
  unint64_t result;

  result = qword_25531D480;
  if (!qword_25531D480)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for MatchedResultsSetting, &type metadata for MatchedResultsSetting);
    atomic_store(result, (unint64_t *)&qword_25531D480);
  }
  return result;
}

uint64_t type metadata accessor for ResolveQuery()
{
  return objc_opt_self();
}

uint64_t method lookup function for ResolveQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ResolveQuery.__allocating_init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of ResolveQuery.__allocating_init(referenceEntity:alternativeEntityTypes:restrictedEntitiesKey:matchedResultsSetting:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of ResolveQuery.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t getEnumTagSinglePayload for MatchedResultsSetting(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFE)
  {
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
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MatchedResultsSetting(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC72768 + 4 * byte_21CC796D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21CC7279C + 4 * byte_21CC796D0[v4]))();
}

uint64_t sub_21CC7279C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC727A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC727ACLL);
  return result;
}

uint64_t sub_21CC727B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC727C0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21CC727C4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC727CC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MatchedResultsSetting()
{
  return &type metadata for MatchedResultsSetting;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_21CC751EC();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return sub_21CC751EC();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_21CC7503C();
}

uint64_t static RRSiriReader.getReaderContent()()
{
  uint64_t v0;

  return sub_21CC72840(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8), v0, 0, 0);
}

uint64_t sub_21CC72840(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t RRSiriReader.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t RRSiriReader.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RRSiriReader()
{
  return objc_opt_self();
}

uint64_t method lookup function for RRSiriReader()
{
  return swift_lookUpClassMethod();
}

SiriReferenceResolutionDataModel::RREntityKey __swiftcall RREntityKey.init(appBundleId:entityId:)(Swift::String appBundleId, Swift::String entityId)
{
  Swift::String *v2;
  SiriReferenceResolutionDataModel::RREntityKey result;

  *v2 = appBundleId;
  v2[1] = entityId;
  result.entityId = entityId;
  result.appBundleId = appBundleId;
  return result;
}

uint64_t RREntityKey.appBundleId.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  OUTLINED_FUNCTION_23();
  return v1;
}

uint64_t RREntityKey.entityId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  OUTLINED_FUNCTION_23();
  return v1;
}

uint64_t RREntityKey.description.getter()
{
  sub_21CC752E8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  sub_21CC751EC();
  swift_bridgeObjectRetain();
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  return 0x6449797469746E65;
}

uint64_t static RREntityKey.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t result;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a2[2];
  v5 = a2[3];
  v6 = *a1 == *a2 && a1[1] == a2[1];
  if (v6 || (v7 = sub_21CC75450(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
      return 1;
    else
      return sub_21CC75450();
  }
  return result;
}

uint64_t RREntityKey.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_21CC751E0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23();
  sub_21CC751E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21CC72ACC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x6C646E7542707061 && a2 == 0xEB00000000644965;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6449797469746E65 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_21CC75450();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21CC72BD0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6449797469746E65;
  else
    return 0x6C646E7542707061;
}

uint64_t sub_21CC72C10()
{
  char *v0;

  return sub_21CC72BD0(*v0);
}

uint64_t sub_21CC72C18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC72ACC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC72C3C()
{
  sub_21CC72D94();
  return sub_21CC75534();
}

uint64_t sub_21CC72C64()
{
  sub_21CC72D94();
  return sub_21CC75540();
}

void RREntityKey.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  char v10;
  char v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D528);
  v9 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + 16);
  v8[1] = *(_QWORD *)(v1 + 24);
  v8[2] = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC72D94();
  sub_21CC75528();
  v11 = 0;
  OUTLINED_FUNCTION_70_0();
  if (!v2)
  {
    v10 = 1;
    OUTLINED_FUNCTION_70_0();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v4);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_21CC72D94()
{
  unint64_t result;

  result = qword_25531D530;
  if (!qword_25531D530)
  {
    result = MEMORY[0x220789FD0](&unk_21CC799E0, &type metadata for RREntityKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D530);
  }
  return result;
}

uint64_t RREntityKey.hashValue.getter()
{
  sub_21CC754BC();
  swift_bridgeObjectRetain();
  sub_21CC751E0();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_23();
  sub_21CC751E0();
  swift_bridgeObjectRelease();
  return sub_21CC754EC();
}

void RREntityKey.init(from:)(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D538);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC72D94();
  sub_21CC75510();
  if (v2)
  {
    OUTLINED_FUNCTION_33_0();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_68_1();
    v9 = v8;
    swift_bridgeObjectRetain();
    v10 = OUTLINED_FUNCTION_68_1();
    v12 = v11;
    v13 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    v14 = v10;
    OUTLINED_FUNCTION_2_4(v13);
    *a2 = v7;
    a2[1] = v9;
    a2[2] = v14;
    a2[3] = v12;
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_33_0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_0();
}

void sub_21CC72F9C(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  RREntityKey.init(from:)(a1, a2);
}

void sub_21CC72FB0(_QWORD *a1)
{
  RREntityKey.encode(to:)(a1);
}

uint64_t sub_21CC72FD0()
{
  sub_21CC754BC();
  swift_bridgeObjectRetain();
  sub_21CC751E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21CC751E0();
  swift_bridgeObjectRelease();
  return sub_21CC754EC();
}

unint64_t sub_21CC73054()
{
  unint64_t result;

  result = qword_254072990;
  if (!qword_254072990)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RREntityKey, &type metadata for RREntityKey);
    atomic_store(result, (unint64_t *)&qword_254072990);
  }
  return result;
}

ValueMetadata *type metadata accessor for RREntityKey()
{
  return &type metadata for RREntityKey;
}

uint64_t storeEnumTagSinglePayload for RREntityKey.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC730F0 + 4 * byte_21CC79815[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21CC73124 + 4 * byte_21CC79810[v4]))();
}

uint64_t sub_21CC73124(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC7312C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC73134);
  return result;
}

uint64_t sub_21CC73140(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC73148);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21CC7314C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC73154(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RREntityKey.CodingKeys()
{
  return &type metadata for RREntityKey.CodingKeys;
}

unint64_t sub_21CC73174()
{
  unint64_t result;

  result = qword_25531D540;
  if (!qword_25531D540)
  {
    result = MEMORY[0x220789FD0](&unk_21CC799B8, &type metadata for RREntityKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D540);
  }
  return result;
}

unint64_t sub_21CC731B4()
{
  unint64_t result;

  result = qword_25531D548;
  if (!qword_25531D548)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79928, &type metadata for RREntityKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D548);
  }
  return result;
}

unint64_t sub_21CC731F4()
{
  unint64_t result;

  result = qword_25531D550;
  if (!qword_25531D550)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79950, &type metadata for RREntityKey.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D550);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

SiriReferenceResolutionDataModel::RRMentionAuthor_optional __swiftcall RRMentionAuthor.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  SiriReferenceResolutionDataModel::RRMentionAuthor_optional result;
  char v5;

  v2 = v1;
  v3 = sub_21CC75354();
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

uint64_t RRMentionAuthor.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 1769105779;
  else
    return 1919251317;
}

uint64_t sub_21CC732C0(char *a1, char *a2)
{
  return sub_21CC673C8(*a1, *a2);
}

void sub_21CC732CC()
{
  sub_21CC67584();
}

uint64_t sub_21CC732D4()
{
  return sub_21CC67854();
}

void sub_21CC732DC()
{
  sub_21CC679D4();
}

SiriReferenceResolutionDataModel::RRMentionAuthor_optional sub_21CC732E4(Swift::String *a1)
{
  return RRMentionAuthor.init(rawValue:)(*a1);
}

uint64_t sub_21CC732F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = RRMentionAuthor.rawValue.getter();
  *a1 = result;
  a1[1] = 0xE400000000000000;
  return result;
}

uint64_t sub_21CC73318()
{
  sub_21CC74488();
  return sub_21CC75210();
}

uint64_t sub_21CC73374()
{
  sub_21CC74488();
  return sub_21CC751F8();
}

void RRMentionedEvent.mentionedAuthor.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t RRMentionedEvent.entities.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_21CC733D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v4;

  BYTE8(v4) = 0;
  sub_21CC752E8();
  sub_21CC751EC();
  *(_QWORD *)&v4 = *(unsigned __int8 *)(v0 + 16);
  sub_21CC75324();
  sub_21CC751EC();
  v1 = type metadata accessor for RREntity();
  v2 = swift_bridgeObjectRetain();
  MEMORY[0x220789A60](v2, v1);
  sub_21CC751EC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return *(_QWORD *)((char *)&v4 + 1);
}

void RRMentionedEvent.__allocating_init(entities:mentionedBy:)()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = OUTLINED_FUNCTION_0_6();
  v3 = *v0;
  *(_QWORD *)(v2 + 24) = v1;
  *(_BYTE *)(v2 + 16) = v3;
  OUTLINED_FUNCTION_44();
}

uint64_t RRMentionedEvent.init(entities:mentionedBy:)(uint64_t a1, char *a2)
{
  uint64_t v2;
  char v3;

  v3 = *a2;
  *(_QWORD *)(v2 + 24) = a1;
  *(_BYTE *)(v2 + 16) = v3;
  return v2;
}

void RRMentionedEvent.__allocating_init(entitiesInGroup:mentionedBy:)()
{
  unsigned __int8 *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_6();
  RRMentionedEvent.init(entitiesInGroup:mentionedBy:)(v1, v0);
  OUTLINED_FUNCTION_44();
}

uint64_t RRMentionedEvent.init(entitiesInGroup:mentionedBy:)(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _BYTE v46[12];
  int v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  uint64_t v51;
  unint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  size_t v62;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;

  v3 = v2;
  v54 = type metadata accessor for RREntity();
  v6 = *(_QWORD *)(v54 - 8);
  v7 = MEMORY[0x24BDAC7A8](v54);
  v9 = &v46[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = &v46[-v11];
  MEMORY[0x24BDAC7A8](v10);
  v14 = (uint64_t *)&v46[-v13];
  v15 = *a2;
  type metadata accessor for GroupIdentifierGenerator();
  swift_initStackObject();
  v16 = GroupIdentifierGenerator.init()();
  v17 = *(_QWORD *)(a1 + 16);
  if (v17)
  {
    v47 = v15;
    v49 = v3;
    v18 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v48 = a1;
    v52 = v18;
    v19 = a1 + v18;
    v51 = *(_QWORD *)(v6 + 72);
    v20 = MEMORY[0x24BEE4AF8];
    v53 = v16;
    v50 = v9;
    do
    {
      v62 = v20;
      v63 = v19;
      v64 = v17;
      sub_21CC57E1C(v19, (uint64_t)v14);
      v21 = *v14;
      v22 = v14[1];
      v60 = v14[2];
      v61 = v21;
      v23 = v14[4];
      v58 = v14[3];
      v59 = v23;
      v24 = (int *)v54;
      v25 = *(int *)(v54 + 36);
      v26 = (uint64_t *)((char *)v14 + *(int *)(v54 + 32));
      v27 = v26[1];
      v57 = *v26;
      v28 = *(uint64_t *)((char *)v14 + v25);
      v29 = *(uint64_t *)((char *)v14 + v25 + 8);
      sub_21CC5E174(&v65);
      v56 = v65;
      v55 = v66;
      v30 = *(uint64_t *)((char *)v14 + v24[11]);
      v31 = (uint64_t)v12 + v24[7];
      v32 = sub_21CC75180();
      __swift_storeEnumTagSinglePayload(v31, 1, 1, v32);
      v33 = (char *)v12 + v24[10];
      v34 = (_QWORD *)((char *)v12 + v24[12]);
      *v12 = v61;
      v12[1] = v22;
      v35 = v59;
      v36 = v57;
      v37 = v58;
      v12[2] = v60;
      v12[3] = v37;
      v12[4] = v35;
      v38 = (_QWORD *)((char *)v12 + v24[8]);
      *v38 = v36;
      v38[1] = v27;
      v39 = (_QWORD *)((char *)v12 + v24[9]);
      *v39 = v28;
      v39[1] = v29;
      *(_OWORD *)v33 = v56;
      *((_QWORD *)v33 + 2) = v55;
      *(_QWORD *)((char *)v12 + v24[11]) = v30;
      *v34 = 0;
      v34[1] = 0;
      v40 = (uint64_t)v50;
      sub_21CC57E1C((uint64_t)v12, (uint64_t)v50);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_21CC5484C(v28, v29);
      swift_bridgeObjectRetain();
      v20 = v62;
      v41 = v40;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v20 = OUTLINED_FUNCTION_4_4(0, *(_QWORD *)(v20 + 16) + 1);
      v43 = *(_QWORD *)(v20 + 16);
      v42 = *(_QWORD *)(v20 + 24);
      if (v43 >= v42 >> 1)
        v20 = OUTLINED_FUNCTION_4_4(v42 > 1, v43 + 1);
      *(_QWORD *)(v20 + 16) = v43 + 1;
      v44 = v51;
      sub_21CC74074(v41, v20 + v52 + v43 * v51);
      sub_21CC57E60((uint64_t)v12);
      sub_21CC57E60((uint64_t)v14);
      v19 = v63 + v44;
      v17 = v64 - 1;
    }
    while (v64 != 1);
    swift_release();
    swift_bridgeObjectRelease();
    v3 = v49;
    LOBYTE(v15) = v47;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    v20 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)(v3 + 24) = v20;
  *(_BYTE *)(v3 + 16) = v15;
  return v3;
}

uint64_t sub_21CC73894(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x656E6F69746E656DLL && a2 == 0xEF726F6874754164;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7365697469746E65 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_21CC75450();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21CC739A4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7365697469746E65;
  else
    return 0x656E6F69746E656DLL;
}

uint64_t sub_21CC739E8()
{
  char *v0;

  return sub_21CC739A4(*v0);
}

uint64_t sub_21CC739F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC73894(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC73A14()
{
  sub_21CC740B8();
  return sub_21CC75534();
}

uint64_t sub_21CC73A3C()
{
  sub_21CC740B8();
  return sub_21CC75540();
}

uint64_t RRMentionedEvent.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RRMentionedEvent.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_21CC73AA4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  uint64_t v11;
  char v12;
  char v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D558);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC740B8();
  sub_21CC75528();
  v13 = *(_BYTE *)(v3 + 16);
  v12 = 0;
  sub_21CC740F4();
  OUTLINED_FUNCTION_5_5();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + 24);
    v10[15] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531D570);
    sub_21CC7418C(&qword_25531D578, &qword_25531CE98, (uint64_t)&protocol conformance descriptor for RREntity, MEMORY[0x24BEE12A0]);
    OUTLINED_FUNCTION_5_5();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t RRMentionedEvent.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  RRMentionedEvent.init(from:)(a1);
  return v2;
}

uint64_t RRMentionedEvent.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  char v7;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D580);
  MEMORY[0x24BDAC7A8](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC740B8();
  sub_21CC75510();
  if (v2)
  {
    type metadata accessor for RRMentionedEvent();
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_21CC74150();
    OUTLINED_FUNCTION_2_5();
    *(_BYTE *)(v1 + 16) = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25531D570);
    sub_21CC7418C(&qword_25531D590, &qword_25531CEA8, (uint64_t)&protocol conformance descriptor for RREntity, MEMORY[0x24BEE12D0]);
    OUTLINED_FUNCTION_2_5();
    OUTLINED_FUNCTION_0_1();
    *(_QWORD *)(v1 + 24) = v6;
  }
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  return v1;
}

uint64_t sub_21CC73DF0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = RRMentionedEvent.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_21CC73E18(_QWORD *a1)
{
  return sub_21CC73AA4(a1);
}

uint64_t sub_21CC73E38()
{
  return sub_21CC733D4();
}

char *sub_21CC73E58(char *__src, uint64_t a2, char *__dst)
{
  if (__dst != __src || &__src[16 * a2] <= __dst)
    return (char *)memmove(__dst, __src, 16 * a2);
  return __src;
}

uint64_t sub_21CC73E84(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 < a1
    || (result = type metadata accessor for RREntity(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    type metadata accessor for RREntity();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

size_t sub_21CC73F24(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25531D688);
  v10 = *(_QWORD *)(type metadata accessor for RREntity() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for RREntity() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  if ((v5 & 1) != 0)
  {
    sub_21CC73E84(a4 + v16, v8, (unint64_t)v13 + v16);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_21CC74074(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RREntity();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21CC740B8()
{
  unint64_t result;

  result = qword_25531D560;
  if (!qword_25531D560)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79CCC, &type metadata for RRMentionedEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D560);
  }
  return result;
}

unint64_t sub_21CC740F4()
{
  unint64_t result;

  result = qword_25531D568;
  if (!qword_25531D568)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRMentionAuthor, &type metadata for RRMentionAuthor);
    atomic_store(result, (unint64_t *)&qword_25531D568);
  }
  return result;
}

uint64_t type metadata accessor for RRMentionedEvent()
{
  return objc_opt_self();
}

unint64_t sub_21CC74150()
{
  unint64_t result;

  result = qword_25531D588;
  if (!qword_25531D588)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRMentionAuthor, &type metadata for RRMentionAuthor);
    atomic_store(result, (unint64_t *)&qword_25531D588);
  }
  return result;
}

uint64_t sub_21CC7418C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25531D570);
    v10 = sub_21CC74208(a2, a3);
    result = MEMORY[0x220789FD0](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21CC74208(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for RREntity();
    result = MEMORY[0x220789FD0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21CC7424C()
{
  unint64_t result;

  result = qword_25531D598;
  if (!qword_25531D598)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRMentionAuthor, &type metadata for RRMentionAuthor);
    atomic_store(result, (unint64_t *)&qword_25531D598);
  }
  return result;
}

ValueMetadata *type metadata accessor for RRMentionAuthor()
{
  return &type metadata for RRMentionAuthor;
}

uint64_t method lookup function for RRMentionedEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RRMentionedEvent.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of RRMentionedEvent.__allocating_init(entities:mentionedBy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of RRMentionedEvent.__allocating_init(entitiesInGroup:mentionedBy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of RRMentionedEvent.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of RRMentionedEvent.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t _s32SiriReferenceResolutionDataModel15RRMentionAuthorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC74348 + 4 * byte_21CC79A35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21CC7437C + 4 * byte_21CC79A30[v4]))();
}

uint64_t sub_21CC7437C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC74384(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC7438CLL);
  return result;
}

uint64_t sub_21CC74398(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC743A0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21CC743A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC743AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RRMentionedEvent.CodingKeys()
{
  return &type metadata for RRMentionedEvent.CodingKeys;
}

unint64_t sub_21CC743CC()
{
  unint64_t result;

  result = qword_25531D668;
  if (!qword_25531D668)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79CA4, &type metadata for RRMentionedEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D668);
  }
  return result;
}

unint64_t sub_21CC7440C()
{
  unint64_t result;

  result = qword_25531D670;
  if (!qword_25531D670)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79C14, &type metadata for RRMentionedEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D670);
  }
  return result;
}

unint64_t sub_21CC7444C()
{
  unint64_t result;

  result = qword_25531D678;
  if (!qword_25531D678)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79C3C, &type metadata for RRMentionedEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D678);
  }
  return result;
}

unint64_t sub_21CC74488()
{
  unint64_t result;

  result = qword_25531D680;
  if (!qword_25531D680)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRMentionAuthor, &type metadata for RRMentionAuthor);
    atomic_store(result, (unint64_t *)&qword_25531D680);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return sub_21CC753CC();
}

size_t OUTLINED_FUNCTION_4_4(size_t a1, int64_t a2)
{
  uint64_t v2;

  return sub_21CC73F24(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return sub_21CC75438();
}

uint64_t RRFilter.userId.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RRFilter.isFollowUpTurn.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

SiriReferenceResolutionDataModel::RRFilter __swiftcall RRFilter.init(userId:)(Swift::String userId)
{
  uint64_t v1;
  SiriReferenceResolutionDataModel::RRFilter result;

  *(Swift::String *)v1 = userId;
  *(_BYTE *)(v1 + 16) = 0;
  result.userId.value = userId;
  return result;
}

uint64_t static RRFilter.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  char v8;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(unsigned __int8 *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(unsigned __int8 *)(a2 + 16);
  if (!v3)
  {
    if (!v5)
      return v4 ^ v6 ^ 1u;
    return 0;
  }
  if (!v5)
    return 0;
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && v3 == v5)
    return v4 ^ v6 ^ 1u;
  v8 = sub_21CC75450();
  result = 0;
  if ((v8 & 1) != 0)
    return v4 ^ v6 ^ 1u;
  return result;
}

uint64_t RRFilter.hash(into:)()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8))
  {
    sub_21CC754D4();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_2_6();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21CC754D4();
  }
  return sub_21CC754D4();
}

uint64_t sub_21CC74620(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x644972657375 && a2 == 0xE600000000000000;
  if (v2 || (sub_21CC75450() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x776F6C6C6F467369 && a2 == 0xEE006E7275547055)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_21CC75450();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_21CC74728(char a1)
{
  if ((a1 & 1) != 0)
    return 0x776F6C6C6F467369;
  else
    return 0x644972657375;
}

uint64_t sub_21CC74768()
{
  char *v0;

  return sub_21CC74728(*v0);
}

uint64_t sub_21CC74770@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_21CC74620(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_21CC74794()
{
  sub_21CC74900();
  return sub_21CC75534();
}

uint64_t sub_21CC747BC()
{
  sub_21CC74900();
  return sub_21CC75540();
}

void RRFilter.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char v10;
  char v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D690);
  v8 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC74900();
  sub_21CC75528();
  v11 = 0;
  sub_21CC753F0();
  if (!v2)
  {
    v10 = 1;
    sub_21CC75414();
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v4);
  OUTLINED_FUNCTION_0();
}

unint64_t sub_21CC74900()
{
  unint64_t result;

  result = qword_25531D698;
  if (!qword_25531D698)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79EC0, &type metadata for RRFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D698);
  }
  return result;
}

uint64_t RRFilter.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_21CC754BC();
  sub_21CC754D4();
  if (v1)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_2_6();
    swift_bridgeObjectRelease();
  }
  sub_21CC754D4();
  return sub_21CC754EC();
}

void RRFilter.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25531D6A0);
  MEMORY[0x24BDAC7A8](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21CC74900();
  sub_21CC75510();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
  }
  else
  {
    v6 = sub_21CC75378();
    v8 = v7;
    swift_bridgeObjectRetain();
    v9 = sub_21CC753A8();
    OUTLINED_FUNCTION_0_1();
    *(_QWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v8;
    *(_BYTE *)(a2 + 16) = v9 & 1;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_0();
}

void sub_21CC74B0C(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  RRFilter.init(from:)(a1, a2);
}

void sub_21CC74B20(_QWORD *a1)
{
  RRFilter.encode(to:)(a1);
}

uint64_t sub_21CC74B40()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_21CC754BC();
  sub_21CC754D4();
  if (v1)
  {
    swift_bridgeObjectRetain();
    sub_21CC751E0();
    swift_bridgeObjectRelease();
  }
  sub_21CC754D4();
  return sub_21CC754EC();
}

unint64_t sub_21CC74BCC()
{
  unint64_t result;

  result = qword_25531D6A8;
  if (!qword_25531D6A8)
  {
    result = MEMORY[0x220789FD0](&protocol conformance descriptor for RRFilter, &type metadata for RRFilter);
    atomic_store(result, (unint64_t *)&qword_25531D6A8);
  }
  return result;
}

uint64_t sub_21CC74C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RRFilter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RRFilter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for RRFilter(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for RRFilter(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for RRFilter()
{
  return &type metadata for RRFilter;
}

uint64_t storeEnumTagSinglePayload for RRFilter.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21CC74DE8 + 4 * byte_21CC79D25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21CC74E1C + 4 * byte_21CC79D20[v4]))();
}

uint64_t sub_21CC74E1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC74E24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21CC74E2CLL);
  return result;
}

uint64_t sub_21CC74E38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21CC74E40);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21CC74E44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21CC74E4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RRFilter.CodingKeys()
{
  return &type metadata for RRFilter.CodingKeys;
}

unint64_t sub_21CC74E6C()
{
  unint64_t result;

  result = qword_25531D6B0;
  if (!qword_25531D6B0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79E98, &type metadata for RRFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D6B0);
  }
  return result;
}

unint64_t sub_21CC74EAC()
{
  unint64_t result;

  result = qword_25531D6B8;
  if (!qword_25531D6B8)
  {
    result = MEMORY[0x220789FD0]("1?D1<\r", &type metadata for RRFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D6B8);
  }
  return result;
}

unint64_t sub_21CC74EEC()
{
  unint64_t result;

  result = qword_25531D6C0;
  if (!qword_25531D6C0)
  {
    result = MEMORY[0x220789FD0](&unk_21CC79E30, &type metadata for RRFilter.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25531D6C0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return sub_21CC751E0();
}

uint64_t sub_21CC74F34()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_21CC74F40()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_21CC74F4C()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_21CC74F58()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_21CC74F64()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_21CC74F70()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_21CC74F7C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21CC74F88()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21CC74F94()
{
  return MEMORY[0x24BDCDCC8]();
}

uint64_t sub_21CC74FA0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21CC74FAC()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_21CC74FB8()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_21CC74FC4()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21CC74FD0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21CC74FDC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21CC74FE8()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21CC74FF4()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21CC75000()
{
  return MEMORY[0x24BE9EBC0]();
}

uint64_t sub_21CC7500C()
{
  return MEMORY[0x24BE9EBC8]();
}

uint64_t sub_21CC75018()
{
  return MEMORY[0x24BE9F730]();
}

uint64_t sub_21CC75024()
{
  return MEMORY[0x24BE9F988]();
}

uint64_t sub_21CC75030()
{
  return MEMORY[0x24BE9F9A0]();
}

uint64_t sub_21CC7503C()
{
  return MEMORY[0x24BE9F9B8]();
}

uint64_t sub_21CC75048()
{
  return MEMORY[0x24BE9FEC8]();
}

uint64_t sub_21CC75054()
{
  return MEMORY[0x24BE9FED8]();
}

uint64_t sub_21CC75060()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_21CC7506C()
{
  return MEMORY[0x24BEA06C0]();
}

uint64_t sub_21CC75078()
{
  return MEMORY[0x24BEA06C8]();
}

uint64_t sub_21CC75084()
{
  return MEMORY[0x24BEA1038]();
}

uint64_t sub_21CC75090()
{
  return MEMORY[0x24BEA1048]();
}

uint64_t sub_21CC7509C()
{
  return MEMORY[0x24BEA1058]();
}

uint64_t sub_21CC750A8()
{
  return MEMORY[0x24BEA1060]();
}

uint64_t sub_21CC750B4()
{
  return MEMORY[0x24BEA14D0]();
}

uint64_t sub_21CC750C0()
{
  return MEMORY[0x24BEA1508]();
}

uint64_t sub_21CC750CC()
{
  return MEMORY[0x24BEA1510]();
}

uint64_t sub_21CC750D8()
{
  return MEMORY[0x24BEA25E0]();
}

uint64_t sub_21CC750E4()
{
  return MEMORY[0x24BEA25F8]();
}

uint64_t sub_21CC750F0()
{
  return MEMORY[0x24BEA2600]();
}

uint64_t sub_21CC750FC()
{
  return MEMORY[0x24BEA27C0]();
}

uint64_t sub_21CC75108()
{
  return MEMORY[0x24BEA27D8]();
}

uint64_t sub_21CC75114()
{
  return MEMORY[0x24BEA27E0]();
}

uint64_t sub_21CC75120()
{
  return MEMORY[0x24BEA3810]();
}

uint64_t sub_21CC7512C()
{
  return MEMORY[0x24BEA3818]();
}

uint64_t sub_21CC75138()
{
  return MEMORY[0x24BEA3820]();
}

uint64_t sub_21CC75144()
{
  return MEMORY[0x24BEA8BE8]();
}

uint64_t sub_21CC75150()
{
  return MEMORY[0x24BEA8BF8]();
}

uint64_t sub_21CC7515C()
{
  return MEMORY[0x24BEA8C00]();
}

uint64_t sub_21CC75168()
{
  return MEMORY[0x24BEA8C10]();
}

uint64_t sub_21CC75174()
{
  return MEMORY[0x24BEB99A8]();
}

uint64_t sub_21CC75180()
{
  return MEMORY[0x24BEB9A18]();
}

uint64_t sub_21CC7518C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_21CC75198()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21CC751A4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21CC751B0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21CC751BC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21CC751C8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21CC751D4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21CC751E0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21CC751EC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21CC751F8()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_21CC75204()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_21CC75210()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_21CC7521C()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_21CC75228()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21CC75234()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21CC75240()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21CC7524C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21CC75258()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21CC75264()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_21CC75270()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21CC7527C()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_21CC75288()
{
  return MEMORY[0x24BDCFFD8]();
}

uint64_t sub_21CC75294()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21CC752A0()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_21CC752AC()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_21CC752B8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21CC752C4()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_21CC752D0()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21CC752DC()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21CC752E8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21CC752F4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21CC75300()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_21CC7530C()
{
  return MEMORY[0x24BEE2700]();
}

uint64_t sub_21CC75318()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_21CC75324()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21CC75330()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_21CC7533C()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_21CC75348()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21CC75354()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21CC75360()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_21CC7536C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_21CC75378()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_21CC75384()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_21CC75390()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_21CC7539C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_21CC753A8()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_21CC753B4()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_21CC753C0()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_21CC753CC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_21CC753D8()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_21CC753E4()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_21CC753F0()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_21CC753FC()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_21CC75408()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_21CC75414()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_21CC75420()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_21CC7542C()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_21CC75438()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_21CC75444()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21CC75450()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21CC7545C()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_21CC75468()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_21CC75474()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21CC75480()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21CC7548C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21CC75498()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21CC754A4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21CC754B0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21CC754BC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21CC754C8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21CC754D4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_21CC754E0()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_21CC754EC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21CC754F8()
{
  return MEMORY[0x24BEE45E8]();
}

uint64_t sub_21CC75504()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_21CC75510()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_21CC7551C()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_21CC75528()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_21CC75534()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_21CC75540()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

