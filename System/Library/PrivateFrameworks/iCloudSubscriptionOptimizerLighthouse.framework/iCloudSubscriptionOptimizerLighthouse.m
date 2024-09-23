uint64_t variable initialization expression of EvaluationDataSearch.notificationsFromNotifStream()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t EvaluationDataSearch.notificationsFromNotifStream.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t EvaluationDataSearch.notificationsFromNotifStream.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*EvaluationDataSearch.notificationsFromNotifStream.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of EvaluationDataSearch.notificationsFromSubStream()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t EvaluationDataSearch.notificationsFromSubStream.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t EvaluationDataSearch.notificationsFromSubStream.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*EvaluationDataSearch.notificationsFromSubStream.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *EvaluationDataSearch.__allocating_init(numOffsets:notifStartDaysUntilNow:notifEndDaysUntilNow:labelDurationInDays:offsetTimeInterval:withBiomeManager:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int128 *a6)
{
  _QWORD *v12;
  uint64_t v13;

  v12 = (_QWORD *)swift_allocObject();
  v13 = MEMORY[0x24BEE4AF8];
  v12[2] = MEMORY[0x24BEE4AF8];
  v12[3] = v13;
  v12[4] = a1;
  v12[5] = a2;
  v12[6] = a3;
  v12[7] = a4;
  v12[8] = a5;
  sub_24B63CE58(a6, (uint64_t)(v12 + 9));
  return v12;
}

_QWORD *EvaluationDataSearch.init(numOffsets:notifStartDaysUntilNow:notifEndDaysUntilNow:labelDurationInDays:offsetTimeInterval:withBiomeManager:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int128 *a6)
{
  _QWORD *v6;
  uint64_t v7;

  v7 = MEMORY[0x24BEE4AF8];
  v6[2] = MEMORY[0x24BEE4AF8];
  v6[3] = v7;
  v6[4] = a1;
  v6[5] = a2;
  v6[6] = a3;
  v6[7] = a4;
  v6[8] = a5;
  sub_24B63CE58(a6, (uint64_t)(v6 + 9));
  return v6;
}

uint64_t sub_24B63CE58(__int128 *a1, uint64_t a2)
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

Swift::Bool __swiftcall EvaluationDataSearch.hasiCloudNotifsFromNotifStream()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0;
  sub_24B640AF4();
  v2 = sub_24B640AE8();
  swift_beginAccess();
  *(_QWORD *)(v1 + 16) = v2;
  swift_bridgeObjectRelease();
  return *(_QWORD *)(*(_QWORD *)(v1 + 16) + 16) != 0;
}

Swift::Bool __swiftcall EvaluationDataSearch.hasiCloudNotifsFromSubStream()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0;
  sub_24B640AF4();
  v2 = sub_24B640ADC();
  swift_beginAccess();
  *(_QWORD *)(v1 + 24) = v2;
  swift_bridgeObjectRelease();
  return *(_QWORD *)(*(_QWORD *)(v1 + 24) + 16) != 0;
}

uint64_t EvaluationDataSearch.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  return v0;
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

uint64_t EvaluationDataSearch.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 72);
  return swift_deallocClassInstance();
}

uint64_t variable initialization expression of RecipeParser.recipeJson()
{
  return 0;
}

uint64_t type metadata accessor for EvaluationDataSearch()
{
  return objc_opt_self();
}

uint64_t static LighthouseFilter.checkOptinStatus()()
{
  char v0;

  v0 = MEMORY[0x24BD23A98]();
  return MEMORY[0x24BD23A2C]() & 1 | ((v0 & 1) == 0);
}

ValueMetadata *type metadata accessor for LighthouseFilter()
{
  return &type metadata for LighthouseFilter;
}

uint64_t sub_24B63D040()
{
  return 1;
}

uint64_t sub_24B63D048()
{
  sub_24B640BFC();
  sub_24B640C08();
  return sub_24B640C14();
}

uint64_t sub_24B63D088()
{
  return sub_24B640C08();
}

uint64_t sub_24B63D0AC()
{
  sub_24B640BFC();
  sub_24B640C08();
  return sub_24B640C14();
}

uint64_t sub_24B63D0F8()
{
  uint64_t v0;

  v0 = sub_24B640A64();
  __swift_allocate_value_buffer(v0, qword_2579AA3D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2579AA3D0);
  type metadata accessor for RecipeParser();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AA548);
  return sub_24B640A70();
}

_QWORD *RecipeParser.__allocating_init(recipePath:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)swift_allocObject();
  v4[3] = a2;
  v4[4] = 0;
  v4[2] = a1;
  RecipeParser.parsing()();
  if (v5)
    swift_release();
  return v4;
}

_QWORD *RecipeParser.init(recipePath:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[3] = a2;
  v2[4] = 0;
  v2[2] = a1;
  RecipeParser.parsing()();
  if (v3)
    swift_release();
  return v2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> RecipeParser.parsing()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  int v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35[5];

  v35[4] = *(id *)MEMORY[0x24BDAC8D0];
  v30 = sub_24B640A64();
  MEMORY[0x24BDAC7A8]();
  v31 = (uint64_t)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_24B6409E0();
  v2 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AA3E8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24B640A10();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v0 + 16);
  v29 = v0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDCD7A0], v32);
  swift_bridgeObjectRetain();
  v32 = v11;
  sub_24B6409F8();
  v12 = v33;
  v13 = sub_24B640A1C();
  if (v12)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v15 = v12;
LABEL_3:
    if (qword_2579AA290 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v30, (uint64_t)qword_2579AA3D0);
    v17 = v31;
    sub_24B63D6A0(v16, v31);
    v35[0] = 0;
    v35[1] = (id)0xE000000000000000;
    sub_24B640B9C();
    sub_24B640B60();
    swift_bridgeObjectRetain();
    sub_24B640B60();
    swift_bridgeObjectRelease();
    sub_24B640B60();
    v34 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579AA3F0);
    sub_24B640BA8();
    sub_24B640B60();
    sub_24B640A58();
    swift_bridgeObjectRelease();
    sub_24B63D6E4(v17);
    sub_24B63D720();
    swift_allocError();
    swift_willThrow();
    MEMORY[0x24BD23CC0](v15);
    return;
  }
  v18 = v13;
  v19 = v14;
  v20 = v29;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v21 = (void *)objc_opt_self();
  v22 = (void *)sub_24B640A28();
  v35[0] = 0;
  v23 = objc_msgSend(v21, sel_JSONObjectWithData_options_error_, v22, 0, v35);

  if (!v23)
  {
    v27 = v35[0];
    v15 = sub_24B6409C8();

    swift_willThrow();
    sub_24B63D764(v18, v19);
    goto LABEL_3;
  }
  v24 = v35[0];
  sub_24B640B90();
  sub_24B63D764(v18, v19);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AA400);
  v25 = swift_dynamicCast();
  v26 = v34;
  if (!v25)
    v26 = 0;
  *(_QWORD *)(v20 + 32) = v26;
  swift_bridgeObjectRelease();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD23CD8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_24B63D6A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24B640A64();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B63D6E4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24B640A64();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24B63D720()
{
  unint64_t result;

  result = qword_2579AA3F8;
  if (!qword_2579AA3F8)
  {
    result = MEMORY[0x24BD23CE4](&unk_24B640FDC, &type metadata for PluginAssetError);
    atomic_store(result, (unint64_t *)&qword_2579AA3F8);
  }
  return result;
}

uint64_t sub_24B63D764(uint64_t a1, unint64_t a2)
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

uint64_t sub_24B63D7A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v7 = sub_24B640A64();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v3 + 32);
  if (v10 && *(_QWORD *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = sub_24B63E750(a1, a2);
    if ((v12 & 1) != 0)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v19 = v13;
      swift_unknownObjectRetain();
      if ((swift_dynamicCast() & 1) != 0)
      {
        a3 = v18;
        if (qword_2579AA290 != -1)
          swift_once();
        v14 = __swift_project_value_buffer(v7, (uint64_t)qword_2579AA3D0);
        sub_24B63D6A0(v14, (uint64_t)v9);
        v19 = 0;
        v20 = 0xE000000000000000;
        sub_24B640B9C();
        swift_bridgeObjectRelease();
        v19 = 0x2074636172747845;
        v20 = 0xE800000000000000;
        sub_24B640B60();
        sub_24B640B60();
        v18 = a3;
        sub_24B640BB4();
        sub_24B640B60();
        swift_bridgeObjectRelease();
        sub_24B640B60();
        sub_24B640A4C();
        swift_unknownObjectRelease();
        goto LABEL_13;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  if (qword_2579AA290 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v7, (uint64_t)qword_2579AA3D0);
  sub_24B63D6A0(v15, (uint64_t)v9);
  v19 = 0;
  v20 = 0xE000000000000000;
  sub_24B640B9C();
  swift_bridgeObjectRelease();
  v19 = 0xD000000000000016;
  v20 = 0x800000024B641290;
  sub_24B640B60();
  sub_24B640B60();
  v18 = a3;
  sub_24B640BB4();
  sub_24B640B60();
  swift_bridgeObjectRelease();
  sub_24B640B60();
  sub_24B640A4C();
LABEL_13:
  swift_bridgeObjectRelease();
  sub_24B63D6E4((uint64_t)v9);
  return a3;
}

unint64_t sub_24B63DAB0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  unint64_t v18;
  unint64_t v19;

  v7 = sub_24B640A64();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v3 + 32);
  if (v10 && *(_QWORD *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = sub_24B63E750(a1, a2);
    if ((v12 & 1) != 0)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v17[1] = v13;
      swift_unknownObjectRetain();
      if ((swift_dynamicCast() & 1) != 0)
      {
        a3 = v18;
        if (qword_2579AA290 != -1)
          swift_once();
        v14 = __swift_project_value_buffer(v7, (uint64_t)qword_2579AA3D0);
        sub_24B63D6A0(v14, (uint64_t)v9);
        v18 = 0;
        v19 = 0xE000000000000000;
        sub_24B640B9C();
        swift_bridgeObjectRelease();
        v18 = 0x2074636172747845;
        v19 = 0xE800000000000000;
        sub_24B640B60();
        sub_24B640B60();
        sub_24B640B60();
        sub_24B640B60();
        sub_24B640A4C();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        sub_24B63D6E4((uint64_t)v9);
        return a3;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  if (qword_2579AA290 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v7, (uint64_t)qword_2579AA3D0);
  sub_24B63D6A0(v15, (uint64_t)v9);
  v18 = 0;
  v19 = 0xE000000000000000;
  sub_24B640B9C();
  swift_bridgeObjectRelease();
  v18 = 0xD000000000000016;
  v19 = 0x800000024B641290;
  sub_24B640B60();
  sub_24B640B60();
  sub_24B640B60();
  sub_24B640B60();
  sub_24B640A4C();
  swift_bridgeObjectRelease();
  sub_24B63D6E4((uint64_t)v9);
  swift_bridgeObjectRetain();
  return a3;
}

uint64_t sub_24B63DD90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  unint64_t v18;
  unint64_t v19;

  v7 = sub_24B640A64();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v3 + 32);
  if (v10 && *(_QWORD *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = sub_24B63E750(a1, a2);
    if ((v12 & 1) != 0)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v11);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v18 = v13;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2579AA540);
      if ((swift_dynamicCast() & 1) != 0)
      {
        a3 = v17[1];
        if (qword_2579AA290 != -1)
          swift_once();
        v14 = __swift_project_value_buffer(v7, (uint64_t)qword_2579AA3D0);
        sub_24B63D6A0(v14, (uint64_t)v9);
        v18 = 0;
        v19 = 0xE000000000000000;
        sub_24B640B9C();
        swift_bridgeObjectRelease();
        v18 = 0x2074636172747845;
        v19 = 0xE800000000000000;
        sub_24B640B60();
        sub_24B640B60();
        MEMORY[0x24BD23AE0](a3, MEMORY[0x24BEE1768]);
        sub_24B640B60();
        swift_bridgeObjectRelease();
        sub_24B640B60();
        sub_24B640A4C();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        sub_24B63D6E4((uint64_t)v9);
        return a3;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  if (qword_2579AA290 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v7, (uint64_t)qword_2579AA3D0);
  sub_24B63D6A0(v15, (uint64_t)v9);
  v18 = 0;
  v19 = 0xE000000000000000;
  sub_24B640B9C();
  swift_bridgeObjectRelease();
  v18 = 0xD000000000000016;
  v19 = 0x800000024B641290;
  sub_24B640B60();
  sub_24B640B60();
  MEMORY[0x24BD23AE0](a3, MEMORY[0x24BEE1768]);
  sub_24B640B60();
  swift_bridgeObjectRelease();
  sub_24B640B60();
  sub_24B640A4C();
  swift_bridgeObjectRelease();
  sub_24B63D6E4((uint64_t)v9);
  swift_bridgeObjectRetain();
  return a3;
}

uint64_t sub_24B63E098(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[16];
  unint64_t v21;
  unint64_t v22;

  v7 = sub_24B640A64();
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v12 = &v20[-v11];
  v13 = *(_QWORD *)(v3 + 32);
  if (v13 && *(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = sub_24B63E750(a1, a2);
    if ((v15 & 1) != 0)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v14);
      swift_unknownObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v21 = v16;
      swift_unknownObjectRetain();
      if ((swift_dynamicCast() & 1) != 0)
      {
        a3 = v20[15];
        if (qword_2579AA290 != -1)
          swift_once();
        v17 = __swift_project_value_buffer(v7, (uint64_t)qword_2579AA3D0);
        sub_24B63D6A0(v17, (uint64_t)v12);
        v21 = 0;
        v22 = 0xE000000000000000;
        sub_24B640B9C();
        swift_bridgeObjectRelease();
        v21 = 0x2074636172747845;
        v22 = 0xE800000000000000;
        sub_24B640B60();
        sub_24B640B60();
        sub_24B640B60();
        swift_bridgeObjectRelease();
        sub_24B640B60();
        sub_24B640A4C();
        swift_unknownObjectRelease();
        goto LABEL_13;
      }
      swift_unknownObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  if (qword_2579AA290 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v7, (uint64_t)qword_2579AA3D0);
  sub_24B63D6A0(v18, (uint64_t)v10);
  v21 = 0;
  v22 = 0xE000000000000000;
  sub_24B640B9C();
  swift_bridgeObjectRelease();
  v21 = 0xD000000000000016;
  v22 = 0x800000024B641290;
  sub_24B640B60();
  sub_24B640B60();
  sub_24B640B60();
  swift_bridgeObjectRelease();
  sub_24B640B60();
  sub_24B640A4C();
  v12 = v10;
LABEL_13:
  swift_bridgeObjectRelease();
  sub_24B63D6E4((uint64_t)v12);
  return a3 & 1;
}

Swift::Int64 __swiftcall RecipeParser.getNumOffsets()()
{
  return sub_24B63D7A8(0x657366664F6D756ELL, 0xEA00000000007374, 23);
}

Swift::Int64 __swiftcall RecipeParser.getNotifStartDaysUntilNow()()
{
  return sub_24B63D7A8(0xD000000000000016, 0x800000024B641190, 10);
}

Swift::Int64 __swiftcall RecipeParser.getNotifEndDaysUntilNow()()
{
  return sub_24B63D7A8(0xD000000000000014, 0x800000024B6411B0, 3);
}

Swift::Int64 __swiftcall RecipeParser.getLabelDurationInDays()()
{
  return sub_24B63D7A8(0xD000000000000013, 0x800000024B6411D0, 3);
}

Swift::Int64 __swiftcall RecipeParser.getOffsetTimeInterval()()
{
  uint64_t v0;

  sub_24B640AA0();
  v0 = sub_24B640A88();
  return sub_24B63D7A8(0xD000000000000012, 0x800000024B6411F0, v0);
}

Swift::String __swiftcall RecipeParser.getLabelingSource()()
{
  unint64_t v0;
  unint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  Swift::String result;

  v0 = *(_QWORD *)sub_24B640B18();
  swift_bridgeObjectRetain();
  v1 = sub_24B63DAB0(0x676E696C6562616CLL, 0xEE00656372756F53, v0);
  v3 = v2;
  swift_bridgeObjectRelease();
  v4 = v1;
  v5 = v3;
  result._object = v5;
  result._countAndFlagsBits = v4;
  return result;
}

uint64_t RecipeParser.getPercentileToChooseOffset()()
{
  uint64_t v0;
  uint64_t v1;

  v0 = *(_QWORD *)sub_24B640B00();
  swift_bridgeObjectRetain();
  v1 = sub_24B63DD90(0x69746E6563726570, 0xEB0000000073656CLL, v0);
  swift_bridgeObjectRelease();
  return v1;
}

Swift::Bool __swiftcall RecipeParser.getDummyData()()
{
  return sub_24B63E098(0x746144796D6D7564, 0xE900000000000061, 0);
}

Swift::Int64 __swiftcall RecipeParser.getMinsUntilOpen()()
{
  return sub_24B63D7A8(0x69746E55736E696DLL, 0xED00006E65704F6CLL, 4320);
}

uint64_t RecipeParser.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RecipeParser.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RecipeParser()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for PluginAssetError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PluginAssetError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24B63E6A0 + 4 * asc_24B640F20[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24B63E6C0 + 4 * byte_24B640F25[v4]))();
}

_BYTE *sub_24B63E6A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24B63E6C0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B63E6C8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B63E6D0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B63E6D8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B63E6E0(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_24B63E6EC()
{
  return 0;
}

ValueMetadata *type metadata accessor for PluginAssetError()
{
  return &type metadata for PluginAssetError;
}

unint64_t sub_24B63E70C()
{
  unint64_t result;

  result = qword_2579AA538;
  if (!qword_2579AA538)
  {
    result = MEMORY[0x24BD23CE4](&unk_24B640FB4, &type metadata for PluginAssetError);
    atomic_store(result, (unint64_t *)&qword_2579AA538);
  }
  return result;
}

unint64_t sub_24B63E750(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24B640BFC();
  sub_24B640B54();
  v4 = sub_24B640C14();
  return sub_24B63E7B4(a1, a2, v4);
}

unint64_t sub_24B63E7B4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24B640BC0() & 1) == 0)
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
      while (!v14 && (sub_24B640BC0() & 1) == 0);
    }
  }
  return v6;
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

uint64_t ShadowMetrics.modelMetrics.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for ShadowMetrics()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s37iCloudSubscriptionOptimizerLighthouse13ShadowMetricsVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ShadowMetrics(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for ShadowMetrics(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShadowMetrics(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ShadowMetrics(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ShadowMetrics()
{
  return &type metadata for ShadowMetrics;
}

uint64_t sub_24B63EA7C()
{
  uint64_t v0;

  v0 = sub_24B640A64();
  __swift_allocate_value_buffer(v0, qword_2579AA550);
  __swift_project_value_buffer(v0, (uint64_t)qword_2579AA550);
  type metadata accessor for ShadowModelProvider();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AA630);
  return sub_24B640A70();
}

uint64_t ShadowModelProvider.modelPaths.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *ShadowModelProvider.__allocating_init(modelPaths:withFileManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

_QWORD *ShadowModelProvider.init(modelPaths:withFileManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

_QWORD *ShadowModelProvider.getModels()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void);
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  void **v30;
  uint64_t v31;
  void **v32;
  void *v33;
  void *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(void);
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(void);
  uint64_t (*v51)(void);
  _QWORD v53[2];
  unsigned int v54;
  char *v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  void **v70;
  uint64_t v71;
  unint64_t v72;
  id v73[4];

  v1 = v0;
  v73[2] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_24B640AB8();
  v62 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v67 = (uint64_t)v53 - v6;
  v7 = sub_24B6409E0();
  v60 = *(_QWORD *)(v7 - 8);
  v61 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v59 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24B640A64();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_24B640A10();
  v63 = *(_QWORD *)(v68 - 8);
  v12 = MEMORY[0x24BDAC7A8](v68);
  v58 = (char *)v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v66 = (char *)v53 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v53 - v16;
  v18 = v1[3];
  v19 = HIBYTE(v18) & 0xF;
  if ((v18 & 0x2000000000000000) == 0)
    v19 = v1[2] & 0xFFFFFFFFFFFFLL;
  if (!v19)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v57 = v5;
  sub_24B6409EC();
  if (qword_2579AA298 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v9, (uint64_t)qword_2579AA550);
  v21 = MEMORY[0x24BEC8230];
  sub_24B63F46C(v20, (uint64_t)v11, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
  v73[0] = 0;
  v73[1] = (id)0xE000000000000000;
  sub_24B640B9C();
  swift_bridgeObjectRelease();
  v73[0] = (id)0xD000000000000010;
  v73[1] = (id)0x800000024B6412B0;
  sub_24B6409D4();
  sub_24B640B60();
  swift_bridgeObjectRelease();
  sub_24B640B60();
  sub_24B640A4C();
  swift_bridgeObjectRelease();
  sub_24B63F6B8((uint64_t)v11, (uint64_t (*)(_QWORD))v21);
  v22 = (void *)v1[4];
  v23 = (void *)sub_24B640B48();
  v73[0] = 0;
  v24 = objc_msgSend(v22, sel_contentsOfDirectoryAtPath_error_, v23, v73);

  v25 = v73[0];
  if (!v24)
  {
    v46 = v73[0];
    v47 = v20;
    v48 = (uint64_t)v11;
    v49 = sub_24B6409C8();

    swift_willThrow();
    v50 = MEMORY[0x24BEC8230];
    sub_24B63F46C(v47, v48, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
    v73[0] = 0;
    v73[1] = (id)0xE000000000000000;
    sub_24B640B9C();
    sub_24B640B60();
    swift_bridgeObjectRetain();
    sub_24B640B60();
    swift_bridgeObjectRelease();
    sub_24B640B60();
    v71 = v49;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579AA3F0);
    sub_24B640BA8();
    sub_24B640A58();
    swift_bridgeObjectRelease();
    MEMORY[0x24BD23CC0](v49);
    sub_24B63F6B8(v48, (uint64_t (*)(_QWORD))v50);
    (*(void (**)(char *, uint64_t))(v63 + 8))(v17, v68);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v26 = sub_24B640B6C();
  v27 = v25;

  v28 = *(_QWORD *)(v26 + 16);
  if (v28)
  {
    v56 = v11;
    v54 = *MEMORY[0x24BDCD7A0];
    swift_bridgeObjectRetain();
    v29 = sub_24B63F3E0();
    v69 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v53[0] = v26;
    v30 = (void **)(v26 + 40);
    v31 = v63;
    v55 = v17;
    v65 = v20;
    v53[1] = v29;
    do
    {
      v33 = *(v30 - 1);
      v34 = *v30;
      v70 = v30;
      v71 = 0x6C65646F6D6C6D2ELL;
      v73[0] = v33;
      v73[1] = v34;
      v72 = 0xE900000000000063;
      swift_bridgeObjectRetain();
      if ((sub_24B640B84() & 1) != 0)
      {
        v64 = v28;
        v73[0] = v33;
        v73[1] = v34;
        v35 = v59;
        v36 = v60;
        v37 = v61;
        (*(void (**)(char *, _QWORD, uint64_t))(v60 + 104))(v59, v54, v61);
        v38 = v66;
        sub_24B640A04();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
        (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v58, v38, v68);
        v39 = v67;
        sub_24B640AAC();
        v40 = (uint64_t)v56;
        v41 = MEMORY[0x24BEC8230];
        sub_24B63F46C(v65, (uint64_t)v56, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
        v73[0] = 0;
        v73[1] = (id)0xE000000000000000;
        swift_bridgeObjectRetain();
        sub_24B640B9C();
        swift_bridgeObjectRelease();
        strcpy((char *)v73, "Load model ");
        HIDWORD(v73[1]) = -352321536;
        sub_24B640B60();
        swift_bridgeObjectRelease();
        sub_24B640B60();
        sub_24B63F424();
        sub_24B640BB4();
        sub_24B640B60();
        swift_bridgeObjectRelease();
        sub_24B640B60();
        sub_24B640A4C();
        swift_bridgeObjectRelease();
        sub_24B63F6B8(v40, (uint64_t (*)(_QWORD))v41);
        v42 = (uint64_t)v57;
        sub_24B63F46C(v39, (uint64_t)v57, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8430]);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v69 = (_QWORD *)sub_24B63F500(0, v69[2] + 1, 1, v69);
        v32 = v70;
        v44 = v69[2];
        v43 = v69[3];
        v31 = v63;
        v28 = v64;
        v20 = v65;
        if (v44 >= v43 >> 1)
          v69 = (_QWORD *)sub_24B63F500(v43 > 1, v44 + 1, 1, v69);
        v17 = v55;
        v45 = v69;
        v69[2] = v44 + 1;
        sub_24B63F674(v42, (uint64_t)v45+ ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80))+ *(_QWORD *)(v62 + 72) * v44);
        sub_24B63F6B8(v67, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8430]);
        (*(void (**)(char *, uint64_t))(v31 + 8))(v66, v68);
      }
      else
      {
        swift_bridgeObjectRelease();
        v32 = v70;
      }
      v30 = v32 + 2;
      --v28;
    }
    while (v28);
    v26 = v53[0];
    swift_bridgeObjectRelease();
    v11 = v56;
  }
  else
  {
    v69 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v31 = v63;
  }
  v51 = MEMORY[0x24BEC8230];
  sub_24B63F46C(v20, (uint64_t)v11, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
  v73[0] = 0;
  v73[1] = (id)0xE000000000000000;
  sub_24B640B9C();
  swift_bridgeObjectRelease();
  strcpy((char *)v73, "Found files: ");
  HIWORD(v73[1]) = -4864;
  MEMORY[0x24BD23AE0](v26, MEMORY[0x24BEE0D00]);
  sub_24B640B60();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24B640B60();
  sub_24B640A4C();
  swift_bridgeObjectRelease();
  sub_24B63F6B8((uint64_t)v11, (uint64_t (*)(_QWORD))v51);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v17, v68);
  return v69;
}

unint64_t sub_24B63F3E0()
{
  unint64_t result;

  result = qword_2579AA568;
  if (!qword_2579AA568)
  {
    result = MEMORY[0x24BD23CE4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2579AA568);
  }
  return result;
}

unint64_t sub_24B63F424()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2579AA570;
  if (!qword_2579AA570)
  {
    v1 = sub_24B640A10();
    result = MEMORY[0x24BD23CE4](MEMORY[0x24BDCDB28], v1);
    atomic_store(result, (unint64_t *)&qword_2579AA570);
  }
  return result;
}

uint64_t sub_24B63F46C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t ShadowModelProvider.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return v0;
}

uint64_t ShadowModelProvider.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

size_t sub_24B63F500(size_t result, int64_t a2, char a3, _QWORD *a4)
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579AA628);
  v10 = *(_QWORD *)(sub_24B640AB8() - 8);
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
  v15 = *(_QWORD *)(sub_24B640AB8() - 8);
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

uint64_t sub_24B63F674(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24B640AB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B63F6B8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for ShadowModelProvider()
{
  return objc_opt_self();
}

uint64_t ShadowModeMain.trialSet.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B63F46C(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet, a1, (uint64_t (*)(_QWORD))MEMORY[0x24BEC82C0]);
}

uint64_t ShadowModeMain.recipePath.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_recipePath);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ShadowModeMain.modelPaths.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_modelPaths);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24B63F7B4()
{
  uint64_t v0;

  v0 = sub_24B640A64();
  __swift_allocate_value_buffer(v0, qword_2579AA638);
  __swift_project_value_buffer(v0, (uint64_t)qword_2579AA638);
  type metadata accessor for ShadowModeMain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2579AA7E0);
  return sub_24B640A70();
}

uint64_t ShadowModeMain.__allocating_init(recipePath:modelPaths:trialSet:withBiomeManager:withFileManager:withSkipPublishMetrics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8)
{
  uint64_t v16;

  v16 = swift_allocObject();
  ShadowModeMain.init(recipePath:modelPaths:trialSet:withBiomeManager:withFileManager:withSkipPublishMetrics:)(a1, a2, a3, a4, a5, a6, a7, a8);
  return v16;
}

uint64_t ShadowModeMain.init(recipePath:modelPaths:trialSet:withBiomeManager:withFileManager:withSkipPublishMetrics:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *inited;
  id v19;
  uint64_t v20;
  uint64_t (*v21)(void);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t *v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 *v34;
  _QWORD v38[5];

  v9 = v8;
  v14 = (_QWORD *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_recipePath);
  *v14 = a1;
  v14[1] = a2;
  v15 = (_QWORD *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_modelPaths);
  *v15 = a3;
  v15[1] = a4;
  v16 = v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet;
  sub_24B63F46C(a5, v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet, (uint64_t (*)(_QWORD))MEMORY[0x24BEC82C0]);
  v17 = OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_fileManager;
  *(_QWORD *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_fileManager) = a7;
  *(_BYTE *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_skipPublishMetrics) = a8;
  type metadata accessor for RecipeParser();
  inited = (_QWORD *)swift_initStackObject();
  inited[3] = a2;
  inited[4] = 0;
  inited[2] = a1;
  swift_bridgeObjectRetain();
  v19 = a7;
  RecipeParser.parsing()();
  if (v20)
  {
    swift_bridgeObjectRelease();
    swift_setDeallocating();
    swift_bridgeObjectRelease();

    __swift_destroy_boxed_opaque_existential_1(a6);
    v21 = MEMORY[0x24BEC82C0];
    sub_24B63F6B8(a5, (uint64_t (*)(_QWORD))MEMORY[0x24BEC82C0]);
    sub_24B63F6B8(v16, (uint64_t (*)(_QWORD))v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    type metadata accessor for ShadowModeMain();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_numOffsets) = sub_24B63D7A8(0x657366664F6D756ELL, 0xEA00000000007374, 23);
    *(_QWORD *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_notifStartDaysUntilNow) = sub_24B63D7A8(0xD000000000000016, 0x800000024B641190, 10);
    *(_QWORD *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_notifEndDaysUntilNow) = sub_24B63D7A8(0xD000000000000014, 0x800000024B6411B0, 3);
    *(_QWORD *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_labelDurationInDays) = sub_24B63D7A8(0xD000000000000013, 0x800000024B6411D0, 3);
    sub_24B640AA0();
    v22 = sub_24B640A88();
    sub_24B63D7A8(0xD000000000000012, 0x800000024B6411F0, v22);
    *(_QWORD *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_offsetTimeInterval) = sub_24B640A94();
    v23 = *(_QWORD *)sub_24B640B00();
    swift_bridgeObjectRetain();
    v24 = sub_24B63DD90(0x69746E6563726570, 0xEB0000000073656CLL, v23);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_percentiles) = v24;
    v25 = *(_QWORD *)sub_24B640B18();
    swift_bridgeObjectRetain();
    v26 = sub_24B63DAB0(0x676E696C6562616CLL, 0xEE00656372756F53, v25);
    v28 = v27;
    swift_bridgeObjectRelease();
    v29 = (unint64_t *)(v9
                             + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_labelingSource);
    *v29 = v26;
    v29[1] = v28;
    *(_QWORD *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_minsUntilOpen) = sub_24B63D7A8(0x69746E55736E696DLL, 0xED00006E65704F6CLL, 4320);
    v30 = sub_24B63E098(0x746144796D6D7564, 0xE900000000000061, 0);
    *(_BYTE *)(v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_dummyData) = v30 & 1;
    if ((v30 & 1) != 0)
    {
      v31 = sub_24B640AD0();
      v32 = swift_allocObject();
      v38[3] = v31;
      v38[4] = MEMORY[0x24BEC8450];

      swift_release();
      v38[0] = v32;
      __swift_destroy_boxed_opaque_existential_1(a6);
      sub_24B63F6B8(a5, (uint64_t (*)(_QWORD))MEMORY[0x24BEC82C0]);
      v33 = v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager;
      v34 = (__int128 *)v38;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      swift_bridgeObjectRelease();

      sub_24B63F6B8(a5, (uint64_t (*)(_QWORD))MEMORY[0x24BEC82C0]);
      v33 = v9 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager;
      v34 = (__int128 *)a6;
    }
    sub_24B63CE58(v34, v33);
  }
  return v9;
}

uint64_t type metadata accessor for ShadowModeMain()
{
  uint64_t result;

  result = qword_2579AA6D8;
  if (!qword_2579AA6D8)
    return swift_getSingletonMetadata();
  return result;
}

_QWORD *sub_24B63FD40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  __int128 v11[2];

  v1 = v0;
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_dummyData) == 1)
  {
    if (qword_2579AA2A0 == -1)
      goto LABEL_5;
    goto LABEL_6;
  }
  if (qword_2579AA2A0 != -1)
LABEL_6:
    swift_once();
LABEL_5:
  v2 = sub_24B640A64();
  __swift_project_value_buffer(v2, (uint64_t)qword_2579AA638);
  sub_24B640A4C();
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_numOffsets);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_notifStartDaysUntilNow);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_notifEndDaysUntilNow);
  v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_labelDurationInDays);
  v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_offsetTimeInterval);
  sub_24B640780(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager, (uint64_t)v11);
  type metadata accessor for EvaluationDataSearch();
  v8 = (_QWORD *)swift_allocObject();
  v9 = MEMORY[0x24BEE4AF8];
  v8[2] = MEMORY[0x24BEE4AF8];
  v8[3] = v9;
  v8[4] = v3;
  v8[5] = v4;
  v8[6] = v5;
  v8[7] = v6;
  v8[8] = v7;
  sub_24B63CE58(v11, (uint64_t)(v8 + 9));
  return v8;
}

uint64_t ShadowModeMain.run()()
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
  char *v10;
  char v11;
  char v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD *inited;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(void);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(void);
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;

  v1 = v0;
  v57 = sub_24B640A40();
  v2 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8](v57);
  v58 = (char *)v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = sub_24B640A34();
  v4 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v6 = (char *)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24B640A7C();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v51 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BD23A98](v8);
  v12 = MEMORY[0x24BD23A2C]();
  if ((v11 & 1) != 0 && (v12 & 1) == 0)
  {
    if (qword_2579AA2A0 != -1)
      swift_once();
    v13 = sub_24B640A64();
    __swift_project_value_buffer(v13, (uint64_t)qword_2579AA638);
    sub_24B640A4C();
    return 0;
  }
  v55 = v10;
  v53 = v4;
  v14 = sub_24B63FD40();
  v15 = *(_QWORD *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_labelingSource);
  v16 = *(_QWORD *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_labelingSource + 8);
  v17 = (_QWORD *)sub_24B640B18();
  if (v15 == *v17 && v16 == v17[1])
    v19 = 1;
  else
    v19 = sub_24B640BC0();
  sub_24B640AF4();
  v20 = sub_24B640AE8();
  swift_beginAccess();
  v14[2] = v20;
  swift_bridgeObjectRelease();
  v21 = *(_QWORD *)(v14[2] + 16);
  v22 = sub_24B640ADC();
  swift_beginAccess();
  v14[3] = v22;
  swift_bridgeObjectRelease();
  v23 = v14[3];
  if ((v19 & 1) != 0)
  {
    if (v21)
      goto LABEL_14;
LABEL_22:
    if (qword_2579AA2A0 != -1)
      swift_once();
    v34 = sub_24B640A64();
    __swift_project_value_buffer(v34, (uint64_t)qword_2579AA638);
    sub_24B640A4C();
    goto LABEL_28;
  }
  if (!*(_QWORD *)(v23 + 16))
    goto LABEL_22;
LABEL_14:
  v51[0] = v2;
  v24 = v14[2];
  v26 = *(_QWORD *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_modelPaths);
  v25 = *(_QWORD *)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_modelPaths + 8);
  v27 = *(void **)(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_fileManager);
  type metadata accessor for ShadowModelProvider();
  inited = (_QWORD *)swift_initStackObject();
  inited[2] = v26;
  inited[3] = v25;
  inited[4] = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v29 = v27;
  v54 = inited;
  if (!ShadowModelProvider.getModels()()[2])
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_2579AA2A0 != -1)
      swift_once();
    v35 = sub_24B640A64();
    __swift_project_value_buffer(v35, (uint64_t)qword_2579AA638);
    sub_24B640A4C();
    v36 = v54;
    swift_setDeallocating();
    swift_bridgeObjectRelease();

LABEL_28:
    swift_release();
    return 0;
  }
  v30 = MEMORY[0x24BEE4AF8];
  if ((v19 & 1) != 0)
    v31 = MEMORY[0x24BEE4AF8];
  else
    v31 = v23;
  v52 = v31;
  if ((v19 & 1) != 0)
    v30 = v24;
  v51[1] = v30;
  swift_bridgeObjectRelease();
  sub_24B640780(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager, (uint64_t)&v59);
  sub_24B63F46C(v1 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet, (uint64_t)v55, (uint64_t (*)(_QWORD))MEMORY[0x24BEC82C0]);
  sub_24B640B3C();
  swift_allocObject();
  sub_24B640B24();
  swift_allocObject();
  swift_bridgeObjectRetain();
  v32 = sub_24B640B0C();
  v33 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v32 + 336))(v32);
  v38 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v32 + 376))(v33);
  v39 = *(_QWORD *)(v38 + 16);
  v55 = (char *)v38;
  v52 = v32;
  if (v39)
  {
    v40 = v38 + ((*(unsigned __int8 *)(v53 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v53 + 80));
    v41 = *(_QWORD *)(v53 + 72);
    swift_bridgeObjectRetain();
    v42 = MEMORY[0x24BEC7F50];
    do
    {
      sub_24B63F46C(v40, (uint64_t)v6, (uint64_t (*)(_QWORD))v42);
      if (qword_2579AA2A0 != -1)
        swift_once();
      v43 = sub_24B640A64();
      __swift_project_value_buffer(v43, (uint64_t)qword_2579AA638);
      v59 = 0;
      v60 = 0xE000000000000000;
      sub_24B640B9C();
      sub_24B640B60();
      sub_24B640BA8();
      sub_24B640B60();
      sub_24B640A4C();
      swift_bridgeObjectRelease();
      sub_24B63F6B8((uint64_t)v6, (uint64_t (*)(_QWORD))v42);
      v40 += v41;
      --v39;
    }
    while (v39);
    swift_bridgeObjectRelease();
    v32 = v52;
  }
  v44 = (*(uint64_t (**)(void))(*(_QWORD *)v32 + 368))();
  v45 = *(_QWORD *)(v44 + 16);
  if (v45)
  {
    v46 = v44 + ((*(unsigned __int8 *)(v51[0] + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v51[0] + 80));
    v47 = *(_QWORD *)(v51[0] + 72);
    swift_bridgeObjectRetain();
    v48 = MEMORY[0x24BEC8028];
    v49 = (uint64_t)v58;
    do
    {
      sub_24B63F46C(v46, v49, (uint64_t (*)(_QWORD))v48);
      if (qword_2579AA2A0 != -1)
        swift_once();
      v50 = sub_24B640A64();
      __swift_project_value_buffer(v50, (uint64_t)qword_2579AA638);
      v59 = 0;
      v60 = 0xE000000000000000;
      sub_24B640B9C();
      sub_24B640B60();
      sub_24B640BA8();
      sub_24B640B60();
      sub_24B640A4C();
      v49 = (uint64_t)v58;
      swift_bridgeObjectRelease();
      sub_24B63F6B8(v49, (uint64_t (*)(_QWORD))v48);
      v46 += v47;
      --v45;
    }
    while (v45);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return (uint64_t)v55;
}

uint64_t sub_24B640780(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t ShadowModeMain.deinit()
{
  uint64_t v0;

  sub_24B63F6B8(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet, (uint64_t (*)(_QWORD))MEMORY[0x24BEC82C0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ShadowModeMain.__deallocating_deinit()
{
  uint64_t v0;

  sub_24B63F6B8(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_trialSet, (uint64_t (*)(_QWORD))MEMORY[0x24BEC82C0]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC37iCloudSubscriptionOptimizerLighthouse14ShadowModeMain_biomeManager);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_24B640900()
{
  return type metadata accessor for ShadowModeMain();
}

uint64_t sub_24B640908()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24B640A7C();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t sub_24B6409C8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24B6409D4()
{
  return MEMORY[0x24BDCD760]();
}

uint64_t sub_24B6409E0()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_24B6409EC()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_24B6409F8()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_24B640A04()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_24B640A10()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24B640A1C()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_24B640A28()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_24B640A34()
{
  return MEMORY[0x24BEC7F50]();
}

uint64_t sub_24B640A40()
{
  return MEMORY[0x24BEC8028]();
}

uint64_t sub_24B640A4C()
{
  return MEMORY[0x24BEC8208]();
}

uint64_t sub_24B640A58()
{
  return MEMORY[0x24BEC8228]();
}

uint64_t sub_24B640A64()
{
  return MEMORY[0x24BEC8230]();
}

uint64_t sub_24B640A70()
{
  return MEMORY[0x24BEC8238]();
}

uint64_t sub_24B640A7C()
{
  return MEMORY[0x24BEC82C0]();
}

uint64_t sub_24B640A88()
{
  return MEMORY[0x24BEC8330]();
}

uint64_t sub_24B640A94()
{
  return MEMORY[0x24BEC8338]();
}

uint64_t sub_24B640AA0()
{
  return MEMORY[0x24BEC8420]();
}

uint64_t sub_24B640AAC()
{
  return MEMORY[0x24BEC8428]();
}

uint64_t sub_24B640AB8()
{
  return MEMORY[0x24BEC8430]();
}

uint64_t sub_24B640AC4()
{
  return MEMORY[0x24BEC8448]();
}

uint64_t sub_24B640AD0()
{
  return MEMORY[0x24BEC8458]();
}

uint64_t sub_24B640ADC()
{
  return MEMORY[0x24BEC8460]();
}

uint64_t sub_24B640AE8()
{
  return MEMORY[0x24BEC8468]();
}

uint64_t sub_24B640AF4()
{
  return MEMORY[0x24BEC8470]();
}

uint64_t sub_24B640B00()
{
  return MEMORY[0x24BEC8478]();
}

uint64_t sub_24B640B0C()
{
  return MEMORY[0x24BEC8488]();
}

uint64_t sub_24B640B18()
{
  return MEMORY[0x24BEC8490]();
}

uint64_t sub_24B640B24()
{
  return MEMORY[0x24BEC8498]();
}

uint64_t sub_24B640B30()
{
  return MEMORY[0x24BEC84A0]();
}

uint64_t sub_24B640B3C()
{
  return MEMORY[0x24BEC84A8]();
}

uint64_t sub_24B640B48()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24B640B54()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24B640B60()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24B640B6C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24B640B78()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24B640B84()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_24B640B90()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24B640B9C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24B640BA8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24B640BB4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24B640BC0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24B640BCC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24B640BD8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24B640BE4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24B640BF0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24B640BFC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24B640C08()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24B640C14()
{
  return MEMORY[0x24BEE4328]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
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

