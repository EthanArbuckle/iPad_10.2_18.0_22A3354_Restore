void sub_245463FAC(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

_DWORD *sub_245463FB8@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void type metadata accessor for BMMLSEShareSheetFeedbackTimeoutOccurrence(uint64_t a1)
{
  sub_245463FF0(a1, &qword_257473480);
}

void type metadata accessor for BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelType(uint64_t a1)
{
  sub_245463FF0(a1, &qword_257473488);
}

void sub_245463FF0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_245464038()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Analytics()
{
  return objc_opt_self();
}

uint64_t AppSuggestionInferenceEventTimestamped.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245499FB8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

id AppSuggestionInferenceEventTimestamped.event.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for AppSuggestionInferenceEventTimestamped(0) + 20));
}

uint64_t type metadata accessor for AppSuggestionInferenceEventTimestamped(uint64_t a1)
{
  return sub_245468948(a1, qword_257473710);
}

uint64_t sub_2454640D4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x746E657665;
  else
    return 1702125924;
}

BOOL sub_245464100(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_245464118()
{
  sub_24549A51C();
  sub_24549A528();
  return sub_24549A54C();
}

uint64_t sub_24546415C()
{
  return sub_24549A528();
}

uint64_t sub_245464184()
{
  sub_24549A51C();
  sub_24549A528();
  return sub_24549A54C();
}

uint64_t sub_2454641C4()
{
  char *v0;

  return sub_2454640D4(*v0);
}

uint64_t sub_2454641CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245469F08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2454641F0()
{
  return 0;
}

void sub_2454641FC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_245464208()
{
  sub_245464444();
  return sub_24549A570();
}

uint64_t sub_245464230()
{
  sub_245464444();
  return sub_24549A57C();
}

uint64_t AppSuggestionInferenceEventTimestamped.encode(to:)(_QWORD *a1)
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

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473648);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245464444();
  sub_24549A564();
  v12 = 0;
  sub_245499FB8();
  sub_245464488(&qword_257473658, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  sub_24549A474();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for AppSuggestionInferenceEventTimestamped(0) + 20));
    v10[15] = 1;
    type metadata accessor for AppSuggestions();
    sub_245464488(&qword_257473660, (uint64_t (*)(uint64_t))type metadata accessor for AppSuggestions, (uint64_t)&protocol conformance descriptor for AppSuggestions);
    sub_24549A474();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249535000]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_245464444()
{
  unint64_t result;

  result = qword_257473650;
  if (!qword_257473650)
  {
    result = MEMORY[0x249535018](&unk_24549B4D0, &type metadata for AppSuggestionInferenceEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473650);
  }
  return result;
}

uint64_t sub_245464488(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x249535018](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2454644C8(_QWORD *a1)
{
  return AppSuggestionInferenceEventTimestamped.encode(to:)(a1);
}

uint64_t _s15ReportingPlugin41PeopleSuggestionInferenceEventTimestampedV4date10Foundation4DateVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_245499FB8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

BOOL sub_245464514()
{
  double v0;
  double v1;
  double v2;

  sub_245499F94();
  v1 = v0;
  sub_245499F94();
  return v1 < v2;
}

BOOL sub_245464554()
{
  double v0;
  double v1;
  double v2;

  sub_245499F94();
  v1 = v0;
  sub_245499F94();
  return v1 >= v2;
}

BOOL sub_245464594()
{
  double v0;
  double v1;
  double v2;

  sub_245499F94();
  v1 = v0;
  sub_245499F94();
  return v1 >= v2;
}

BOOL sub_2454645D4()
{
  double v0;
  double v1;
  double v2;

  sub_245499F94();
  v1 = v0;
  sub_245499F94();
  return v1 < v2;
}

BOOL sub_245464614()
{
  double v0;
  double v1;
  double v2;

  sub_245499F94();
  v1 = v0;
  sub_245499F94();
  return v1 == v2;
}

uint64_t AppSuggestionsJoiningResult.unmatchedInferenceEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AppSuggestionsJoiningResult.unmatchedFeedbackEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AppSuggestionsJoiningResult.errors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t collectAppSuggestionEvents()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD **v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t result;
  char *v40;
  uint64_t *v41;
  _QWORD *v42;
  uint64_t v43;
  id v44;
  unint64_t v45;
  uint64_t v46[2];
  _QWORD *v47;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473668);
  v43 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v40 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v40 - v9;
  v11 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v12 = objc_msgSend(v11, sel_ShareSheet);
  swift_unknownObjectRelease();
  v13 = objc_msgSend(v12, sel_Inference);
  swift_unknownObjectRelease();
  v14 = objc_msgSend(v13, sel_AppSuggestions);
  swift_unknownObjectRelease();
  v15 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v16 = objc_msgSend(v15, sel_ShareSheet);
  swift_unknownObjectRelease();
  v17 = objc_msgSend(v16, sel_Feedback);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473670);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = MEMORY[0x24BEE4B08];
  v19 = MEMORY[0x24BEE4AF8];
  v18[3] = sub_245467690(MEMORY[0x24BEE4AF8]);
  v18[4] = sub_245467690(v19);
  v18[5] = sub_245464B74;
  v18[6] = 0;
  v18[7] = sub_245464D28;
  v18[8] = 0;
  v47 = v18;
  v44 = v14;
  sub_245464D54(v14, v17, &v47, (uint64_t)v8);
  v20 = v43;
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v10, v8, v2);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v19;
  v41 = (uint64_t *)(v21 + 16);
  v22 = swift_allocObject();
  v42 = a1;
  v23 = v2;
  *(_QWORD *)(v22 + 16) = v19;
  v24 = (_QWORD **)(v22 + 16);
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v5, v10, v23);
  sub_24546A048(&qword_257473680, &qword_257473668, MEMORY[0x24BE0C968]);
  v40 = v10;
  swift_retain();
  swift_retain();

  swift_release();
  swift_release();
  v25 = *(void (**)(char *, uint64_t))(v20 + 8);
  v25(v5, v23);
  v46[0] = v19;
  swift_beginAccess();
  v26 = swift_bridgeObjectRetain();
  sub_245465980(v26, v24, (unint64_t *)v46);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v27 = swift_bridgeObjectRetain();
  v28 = sub_245469318(v27);
  swift_bridgeObjectRelease();
  v29 = sub_245465B20((unint64_t)v28);
  v31 = v30;
  swift_release();
  v45 = v29;
  swift_beginAccess();
  sub_245465F4C(v31);
  swift_endAccess();
  sub_245467E6C(v46, type metadata accessor for AppSuggestionInferenceEventTimestamped, (uint64_t (*)(uint64_t))sub_245496180, (void (*)(unint64_t *, unint64_t *, unint64_t *))sub_2454858D8);
  sub_245467E6C((uint64_t *)&v45, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped, (uint64_t (*)(uint64_t))sub_24549616C, (void (*)(unint64_t *, unint64_t *, unint64_t *))sub_2454858CC);

  v32 = v23;
  v33 = v42;
  v25(v40, v32);
  swift_release();
  v34 = v41;
  swift_beginAccess();
  v35 = *v34;
  v36 = v46[0];
  v37 = v45;
  v38 = *v24;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  result = swift_release();
  *v33 = v35;
  v33[1] = v36;
  v33[2] = v37;
  v33[3] = v38;
  return result;
}

uint64_t sub_245464B74@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_245464BA0(a1, "missing app suggestions identifier");
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_245464BA0(void *a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = sub_245499FDC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, sel_identifier);
  if (v8)
  {
    v9 = v8;
    v10 = sub_24549A0B4();

    return v10;
  }
  else
  {
    if (qword_254413850 != -1)
      swift_once();
    v12 = sub_24549A078();
    __swift_project_value_buffer(v12, (uint64_t)qword_254413928);
    v13 = sub_24549A060();
    v14 = sub_24549A1E0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_245461000, v13, v14, a2, v15, 2u);
      MEMORY[0x2495350C0](v15, -1, -1);
    }

    sub_245499FD0();
    v16 = sub_245499FC4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v16;
  }
}

uint64_t sub_245464D28@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_245464BA0(a1, "missing feedback identifier");
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_245464D54@<X0>(void *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v28 = a2;
  v32 = a4;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574738E0);
  v31 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473868);
  v30 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v27 - v12;
  type metadata accessor for AppSuggestionEventsHandler();
  v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInitialContext_, *a3);
  v15 = (void *)objc_opt_self();
  v16 = objc_msgSend(v15, sel_reversed);
  v17 = objc_msgSend(a1, sel_publisherWithOptions_, v16);

  v18 = objc_msgSend(v17, sel_withBookmark_, 0);
  sub_24549A00C();
  v19 = objc_msgSend(v15, sel_reversed);
  v20 = objc_msgSend(v28, sel_publisherWithOptions_, v19);

  v21 = objc_msgSend(v20, sel_withBookmark_, 0);
  sub_24549A00C();
  v22 = objc_msgSend(v14, sel_context);
  v23 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473670);
  type metadata accessor for AppSuggestionsJointEvent(0);
  sub_24546A048(&qword_257473878, &qword_257473868, MEMORY[0x24BE0C940]);
  sub_24549A000();
  swift_release();

  v24 = v29;
  sub_245499FE8();
  sub_24549A018();

  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v24);
  v25 = *(void (**)(char *, uint64_t))(v30 + 8);
  v25(v11, v8);
  return ((uint64_t (*)(char *, uint64_t))v25)(v13, v8);
}

uint64_t sub_245465060@<X0>(void *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v28 = a2;
  v32 = a4;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473860);
  v31 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473868);
  v30 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v27 - v12;
  type metadata accessor for PeopleSuggestionEventsHandler();
  v14 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInitialContext_, *a3);
  v15 = (void *)objc_opt_self();
  v16 = objc_msgSend(v15, sel_reversed);
  v17 = objc_msgSend(a1, sel_publisherWithOptions_, v16);

  v18 = objc_msgSend(v17, sel_withBookmark_, 0);
  sub_24549A00C();
  v19 = objc_msgSend(v15, sel_reversed);
  v20 = objc_msgSend(v28, sel_publisherWithOptions_, v19);

  v21 = objc_msgSend(v20, sel_withBookmark_, 0);
  sub_24549A00C();
  v22 = objc_msgSend(v14, sel_context);
  v23 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473870);
  type metadata accessor for PeopleSuggestionsJointEvent(0);
  sub_24546A048(&qword_257473878, &qword_257473868, MEMORY[0x24BE0C940]);
  sub_24549A000();
  swift_release();

  v24 = v29;
  sub_245499FE8();
  sub_24549A018();

  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v24);
  v25 = *(void (**)(char *, uint64_t))(v30 + 8);
  v25(v11, v8);
  return ((uint64_t (*)(char *, uint64_t))v25)(v13, v8);
}

void sub_24546536C(void *a1, uint64_t a2)
{
  _QWORD **v4;
  id v5;
  void *v6;
  _QWORD *v7;
  id v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  unint64_t v17;

  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    v4 = (_QWORD **)(a2 + 16);
    v5 = objc_msgSend(a1, sel_error);
    if (v5)
    {
      v6 = v5;
      swift_beginAccess();
      v7 = *v4;
      v8 = v6;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v4 = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v7 = sub_24547186C(0, v7[2] + 1, 1, v7);
        *v4 = v7;
      }
      v11 = v7[2];
      v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        v7 = sub_24547186C((_QWORD *)(v10 > 1), v11 + 1, 1, v7);
        *v4 = v7;
      }
      v7[2] = v11 + 1;
      v7[v11 + 4] = v8;
      swift_endAccess();

    }
    else
    {
      sub_24546A66C();
      v12 = swift_allocError();
      *(_QWORD *)v13 = 0xD00000000000003BLL;
      *(_QWORD *)(v13 + 8) = 0x800000024549DD20;
      *(_BYTE *)(v13 + 16) = 1;
      swift_beginAccess();
      v14 = *v4;
      v15 = swift_isUniquelyReferenced_nonNull_native();
      *v4 = v14;
      if ((v15 & 1) == 0)
      {
        v14 = sub_24547186C(0, v14[2] + 1, 1, v14);
        *v4 = v14;
      }
      v17 = v14[2];
      v16 = v14[3];
      if (v17 >= v16 >> 1)
      {
        v14 = sub_24547186C((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
        *v4 = v14;
      }
      v14[2] = v17 + 1;
      v14[v17 + 4] = v12;
      swift_endAccess();
    }
  }
}

uint64_t sub_245465558(void *a1, uint64_t a2)
{
  id v4;

  swift_beginAccess();
  v4 = a1;
  MEMORY[0x249534724]();
  if (*(_QWORD *)((*(_QWORD *)(a2 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(a2 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_24549A150();
  sub_24549A168();
  sub_24549A144();
  return swift_endAccess();
}

void sub_2454655F0(id *a1, _QWORD **a2, unint64_t *a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD *v15;
  id v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  id v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v7 = type metadata accessor for AppSuggestionInferenceEventTimestamped(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v12 = objc_msgSend(*a1, sel_eventBody);
  if (v12)
  {
    v13 = v12;
    v14 = sub_245486A28(v12);
    if (v3)
    {
      swift_beginAccess();
      v15 = *a2;
      v16 = v3;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v15 = sub_24547186C(0, v15[2] + 1, 1, v15);
        *a2 = v15;
      }
      v19 = v15[2];
      v18 = v15[3];
      if (v19 >= v18 >> 1)
      {
        v15 = sub_24547186C((_QWORD *)(v18 > 1), v19 + 1, 1, v15);
        *a2 = v15;
      }
      v15[2] = v19 + 1;
      v15[v19 + 4] = v3;
      swift_endAccess();

    }
    else
    {
      v28 = v14;
      objc_msgSend(v11, sel_timestamp);
      sub_245499F64();
      *(_QWORD *)&v10[*(int *)(v7 + 20)] = v28;
      v29 = *a3;
      v30 = v28;
      v31 = swift_isUniquelyReferenced_nonNull_native();
      *a3 = v29;
      if ((v31 & 1) == 0)
      {
        v29 = sub_245471978(0, *(_QWORD *)(v29 + 16) + 1, 1, v29);
        *a3 = v29;
      }
      v33 = *(_QWORD *)(v29 + 16);
      v32 = *(_QWORD *)(v29 + 24);
      if (v33 >= v32 >> 1)
      {
        v29 = sub_245471978(v32 > 1, v33 + 1, 1, v29);
        *a3 = v29;
      }
      *(_QWORD *)(v29 + 16) = v33 + 1;
      sub_24546A628((uint64_t)v10, v29+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v33, type metadata accessor for AppSuggestionInferenceEventTimestamped);

    }
  }
  else
  {
    v35 = 0;
    v36 = 0xE000000000000000;
    sub_24549A354();
    sub_24549A0E4();
    swift_getObjectType();
    sub_24549A588();
    sub_24549A0E4();
    swift_bridgeObjectRelease();
    sub_24549A0E4();
    objc_msgSend(v11, sel_timestamp);
    sub_24549A180();
    v20 = v35;
    v21 = v36;
    sub_24546A66C();
    v22 = swift_allocError();
    *(_QWORD *)v23 = v20;
    *(_QWORD *)(v23 + 8) = v21;
    *(_BYTE *)(v23 + 16) = 0;
    swift_beginAccess();
    v24 = *a2;
    v25 = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v24;
    if ((v25 & 1) == 0)
    {
      v24 = sub_24547186C(0, v24[2] + 1, 1, v24);
      *a2 = v24;
    }
    v27 = v24[2];
    v26 = v24[3];
    if (v27 >= v26 >> 1)
    {
      v24 = sub_24547186C((_QWORD *)(v26 > 1), v27 + 1, 1, v24);
      *a2 = v24;
    }
    v24[2] = v27 + 1;
    v24[v27 + 4] = v22;
    swift_endAccess();
  }
}

void sub_245465980(uint64_t a1, _QWORD **a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  unint64_t v16;
  int64_t v17;
  id v18;
  int64_t v19;
  id v20;

  v7 = a1 + 64;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a1 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  swift_bridgeObjectRetain();
  v12 = 0;
  if (!v10)
    goto LABEL_5;
LABEL_4:
  v13 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    v20 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * i);
    v18 = v20;
    sub_2454655F0(&v20, a2, a3);
    if (v3)
    {
      swift_release();

      return;
    }

    if (v10)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v12++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v12 >= v11)
      goto LABEL_26;
    v16 = *(_QWORD *)(v7 + 8 * v12);
    if (!v16)
    {
      v17 = v12 + 1;
      if (v12 + 1 >= v11)
        goto LABEL_26;
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (v16)
        goto LABEL_14;
      v17 = v12 + 2;
      if (v12 + 2 >= v11)
        goto LABEL_26;
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (v16)
        goto LABEL_14;
      v17 = v12 + 3;
      if (v12 + 3 >= v11)
        goto LABEL_26;
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (v16)
      {
LABEL_14:
        v12 = v17;
        goto LABEL_15;
      }
      v19 = v12 + 4;
      if (v12 + 4 >= v11)
      {
LABEL_26:
        swift_release();
        return;
      }
      v16 = *(_QWORD *)(v7 + 8 * v19);
      v12 += 4;
      if (!v16)
        break;
    }
LABEL_15:
    v10 = (v16 - 1) & v16;
  }
  while (1)
  {
    v12 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v12 >= v11)
      goto LABEL_26;
    v16 = *(_QWORD *)(v7 + 8 * v12);
    ++v19;
    if (v16)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
}

unint64_t sub_245465B20(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD v27[2];
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;

  v2 = type metadata accessor for PeopleSuggesterFeedbackEventTimestamped(0);
  v29 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_23;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_24549A3FC())
  {
    v6 = 0;
    v32 = a1 & 0xC000000000000001;
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v27[1] = 0x800000024549DD00;
    v8 = MEMORY[0x24BEE4AF8];
    v31 = v5;
LABEL_4:
    v28 = v7;
    v9 = v6;
    while (1)
    {
      v10 = v32 ? (id)MEMORY[0x249534988](v9, a1) : *(id *)(a1 + 8 * v9 + 32);
      v11 = v10;
      v6 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v12 = objc_msgSend(v10, sel_eventBody);
      if (!v12)
      {
        v33 = 0;
        v34 = 0xE000000000000000;
        sub_24549A354();
        sub_24549A0E4();
        swift_getObjectType();
        sub_24549A588();
        sub_24549A0E4();
        swift_bridgeObjectRelease();
        sub_24549A0E4();
        objc_msgSend(v11, sel_timestamp);
        sub_24549A180();
        v18 = v33;
        v19 = v34;
        sub_24546A66C();
        v20 = swift_allocError();
        *(_QWORD *)v21 = v18;
        *(_QWORD *)(v21 + 8) = v19;
        *(_BYTE *)(v21 + 16) = 0;
        v22 = v28;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v22 = sub_24547186C(0, v22[2] + 1, 1, v22);
        v24 = v22[2];
        v23 = v22[3];
        v25 = v22;
        if (v24 >= v23 >> 1)
          v25 = sub_24547186C((_QWORD *)(v23 > 1), v24 + 1, 1, v22);
        v7 = v25;
        v25[2] = v24 + 1;
        v25[v24 + 4] = v20;

        if (v6 == v31)
        {
LABEL_15:
          swift_bridgeObjectRelease();
          return v8;
        }
        goto LABEL_4;
      }
      v13 = v12;
      v14 = a1;
      v15 = sub_245486E60(v12);
      objc_msgSend(v11, sel_timestamp);
      sub_245499F64();
      *(_QWORD *)&v4[*(int *)(v30 + 20)] = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_245471858(0, *(_QWORD *)(v8 + 16) + 1, 1, v8);
      v17 = *(_QWORD *)(v8 + 16);
      v16 = *(_QWORD *)(v8 + 24);
      if (v17 >= v16 >> 1)
        v8 = sub_245471858(v16 > 1, v17 + 1, 1, v8);
      *(_QWORD *)(v8 + 16) = v17 + 1;
      sub_24546A628((uint64_t)v4, v8+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v29 + 72) * v17, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped);

      ++v9;
      a1 = v14;
      if (v6 == v31)
        goto LABEL_15;
    }
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_245465F4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_24547186C(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[v8 + 4];
  if (a1 + 32 < v9 + 8 * v2 && v9 < a1 + 32 + 8 * v2)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738D0);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_2454660AC(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_245471DB0(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = sub_245499FB8();
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_245466220(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_245471DC4(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[v8 + 4];
  if (a1 + 32 < v9 + 8 * v2 && v9 < a1 + 32 + 8 * v2)
    goto LABEL_24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473898);
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_245466380(uint64_t a1)
{
  char **v1;
  int64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  char *v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_245471EF0(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = &v3[v8 + 32];
  if (a1 + 32 < (unint64_t)&v9[v2] && (unint64_t)v9 < a1 + 32 + v2)
    goto LABEL_24;
  memcpy(v9, (const void *)(a1 + 32), v2);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v11 = *((_QWORD *)v3 + 2);
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    *((_QWORD *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_2454664C4(unint64_t a1)
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
    v3 = sub_24549A3FC();
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
    v5 = sub_24549A3FC();
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
    v4 = MEMORY[0x249534994](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_245469B04(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_24549A3FC();
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
    return sub_24549A144();
  }
  __break(1u);
  return result;
}

id sub_24546667C(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  objc_class *v43;
  objc_super v45;
  id v46;
  uint64_t v47;
  uint64_t v48;

  v5 = sub_245499FB8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v2;
  v10 = objc_msgSend(a1, sel_eventBody);
  if (v10)
  {
    v11 = v10;
    v12 = objc_msgSend(v10, sel_appSuggestions);

    sub_245469FF0();
    v13 = sub_24549A12C();

    v14 = objc_msgSend(a2, sel_eventBody);
    if (v14)
    {
      v15 = v14;
      objc_msgSend(a1, sel_timestamp);
      sub_245499F64();
      v16 = (uint64_t)&v9[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_timestamp];
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v9[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_timestamp], v8, v5);
      v17 = objc_msgSend(v15, sel_engagementType);
      v18 = 0;
      switch(v17)
      {
        case 0u:
          swift_bridgeObjectRelease();
          if (qword_254413850 != -1)
            goto LABEL_49;
          goto LABEL_5;
        case 1u:
          goto LABEL_32;
        case 2u:
          v18 = 1;
          goto LABEL_32;
        case 3u:
          v18 = 2;
          goto LABEL_32;
        case 4u:
          v18 = 4;
          goto LABEL_32;
        case 5u:
          v18 = 3;
          goto LABEL_32;
        case 6u:
          v18 = 5;
          goto LABEL_32;
        case 7u:
          v18 = 6;
LABEL_32:
          *(_QWORD *)&v9[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_engagement] = v18;
          v48 = MEMORY[0x24BEE4B08];
          v47 = MEMORY[0x24BEE4B00];
          if ((unint64_t)v13 >> 62)
          {
            if (v13 < 0)
              v5 = v13;
            else
              v5 = v13 & 0xFFFFFFFFFFFFFF8;
            swift_bridgeObjectRetain();
            v16 = sub_24549A3FC();
            if (v16)
              goto LABEL_34;
          }
          else
          {
            v16 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (v16)
            {
LABEL_34:
              if (v16 >= 1)
              {
                v38 = 0;
                do
                {
                  if ((v13 & 0xC000000000000001) != 0)
                    v39 = (id)MEMORY[0x249534988](v38, v13);
                  else
                    v39 = *(id *)(v13 + 8 * v38 + 32);
                  v40 = v39;
                  ++v38;
                  v46 = v39;
                  sub_245466D5C(&v46, (uint64_t)&v48, v15, &v47);

                }
                while (v16 != v38);

                swift_bridgeObjectRelease();
                v42 = v47;
                v41 = v48;
                goto LABEL_46;
              }
              __break(1u);
LABEL_49:
              swift_once();
LABEL_5:
              v19 = sub_24549A078();
              __swift_project_value_buffer(v19, (uint64_t)qword_254413928);
              v20 = sub_24549A060();
              v21 = sub_24549A1D4();
              if (os_log_type_enabled(v20, v21))
              {
                v22 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v22 = 0;
                v23 = "unexpected unknown engagement type";
LABEL_24:
                _os_log_impl(&dword_245461000, v20, v21, v23, v22, 2u);
                MEMORY[0x2495350C0](v22, -1, -1);
              }
LABEL_25:

              (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v16, v5);
              goto LABEL_17;
            }
          }

          swift_bridgeObjectRelease();
          v41 = MEMORY[0x24BEE4B08];
          v42 = MEMORY[0x24BEE4B00];
LABEL_46:
          swift_bridgeObjectRelease();
          *(_QWORD *)&v9[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_inferenceModels] = v41;
          *(_QWORD *)&v9[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_engagedModelRanks] = v42;

          v43 = (objc_class *)type metadata accessor for AppSuggestionsJointEvent(0);
          v45.receiver = v9;
          v45.super_class = v43;
          v36 = objc_msgSendSuper2(&v45, sel_init);

          return v36;
        default:
          swift_bridgeObjectRelease();
          if (qword_254413850 != -1)
            swift_once();
          v37 = sub_24549A078();
          __swift_project_value_buffer(v37, (uint64_t)qword_254413928);
          v20 = sub_24549A060();
          v21 = sub_24549A1D4();
          if (!os_log_type_enabled(v20, v21))
            goto LABEL_25;
          v22 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v22 = 0;
          v23 = "unexpected engagement type";
          goto LABEL_24;
      }
    }
    swift_bridgeObjectRelease();
    if (qword_254413850 != -1)
      swift_once();
    v30 = sub_24549A078();
    __swift_project_value_buffer(v30, (uint64_t)qword_254413928);
    v31 = a2;
    v32 = sub_24549A060();
    v33 = sub_24549A1E0();
    if (!os_log_type_enabled(v32, v33))
    {

      goto LABEL_18;
    }
    v34 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v34 = 134217984;
    objc_msgSend(v31, sel_timestamp);
    v48 = v35;
    sub_24549A258();

    _os_log_impl(&dword_245461000, v32, v33, "no feedback in %f", v34, 0xCu);
    MEMORY[0x2495350C0](v34, -1, -1);

  }
  else
  {
    if (qword_254413850 != -1)
      swift_once();
    v24 = sub_24549A078();
    __swift_project_value_buffer(v24, (uint64_t)qword_254413928);
    v25 = a1;
    v26 = sub_24549A060();
    v27 = sub_24549A1E0();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v28 = 134217984;
      objc_msgSend(v25, sel_timestamp);
      v48 = v29;
      sub_24549A258();

      _os_log_impl(&dword_245461000, v26, v27, "no app suggestions at %f", v28, 0xCu);
      MEMORY[0x2495350C0](v28, -1, -1);

    }
    else
    {

    }
  }
LABEL_17:

LABEL_18:
  type metadata accessor for AppSuggestionsJointEvent(0);
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_245466D5C(id *a1, uint64_t a2, void *a3, uint64_t *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  const char *v30;
  char v31;
  unsigned int v32;
  char v33;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v35;
  id v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v6 = *a1;
  v7 = objc_msgSend(*a1, sel_transportBundleId);
  if (!v7)
    goto LABEL_10;
  v8 = v7;
  v9 = sub_24549A0B4();
  v11 = v10;

  v12 = objc_msgSend(v6, sel_model);
  if (!v12)
  {
    swift_bridgeObjectRelease();
LABEL_10:
    if (qword_254413850 != -1)
      swift_once();
    v22 = sub_24549A078();
    __swift_project_value_buffer(v22, (uint64_t)qword_254413928);
    v23 = v6;
    v24 = sub_24549A060();
    v25 = sub_24549A1D4();
    if (!os_log_type_enabled(v24, v25))
    {

      return;
    }
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v39 = v27;
    *(_DWORD *)v26 = 136315138;
    v28 = sub_245467230();
    v40 = sub_2454720F4(v28, v29, &v39);
    sub_24549A258();

    swift_bridgeObjectRelease();
    v30 = "AppSuggestion missing required fields: %s";
    goto LABEL_14;
  }
  v13 = v12;
  v14 = sub_24549A0B4();
  v16 = v15;

  swift_bridgeObjectRetain();
  sub_245492E08(&v39, v14, v16);
  swift_bridgeObjectRelease();
  if (objc_msgSend(a3, sel_engagementType) != 2
    || (v17 = objc_msgSend(a3, sel_engagementIdentifier)) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v18 = v17;
  v19 = sub_24549A0B4();
  v21 = v20;

  if (v9 == v19 && v11 == v21)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v31 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  if (!objc_msgSend(v6, sel_rank))
  {
    swift_bridgeObjectRelease();
    if (qword_254413850 != -1)
      swift_once();
    v35 = sub_24549A078();
    __swift_project_value_buffer(v35, (uint64_t)qword_254413928);
    v36 = v6;
    v24 = sub_24549A060();
    v25 = sub_24549A1D4();
    if (!os_log_type_enabled(v24, v25))
    {

      return;
    }
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v39 = v27;
    *(_DWORD *)v26 = 136315138;
    v37 = sub_245467230();
    v40 = sub_2454720F4(v37, v38, &v39);
    sub_24549A258();

    swift_bridgeObjectRelease();
    v30 = "Missing or negative rank: %s";
LABEL_14:
    _os_log_impl(&dword_245461000, v24, v25, v30, v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495350C0](v27, -1, -1);
    MEMORY[0x2495350C0](v26, -1, -1);

    return;
  }
  v32 = objc_msgSend(v6, sel_rank);
  if (v32 >= 0x100)
  {
    sub_24549A3E4();
    __break(1u);
  }
  else
  {
    v33 = v32;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v39 = *a4;
    *a4 = 0x8000000000000000;
    sub_245495B94(v33, v14, v16, isUniquelyReferenced_nonNull_native);
    *a4 = v39;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_245467230()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0;
  sub_24549A354();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_transportBundleId);
  if (v2)
  {
    v3 = v2;
    v4 = sub_24549A0B4();
    v6 = v5;

  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473848);
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v7 = objc_msgSend(v1, sel_model, v4, v6);
  if (v7)
  {
    v8 = v7;
    v9 = sub_24549A0B4();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  objc_msgSend(v1, sel_rank, v9, v11);
  sub_24549A498();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  return 0xD000000000000014;
}

id AppSuggestionsJointEvent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AppSuggestionsJointEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AppSuggestionsJointEvent.__deallocating_deinit()
{
  return sub_245467658(type metadata accessor for AppSuggestionsJointEvent);
}

uint64_t sub_2454674F8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  id v7;
  id v8;

  swift_unknownObjectRetain();
  v7 = a1;
  v8 = objc_msgSend(v7, sel_context);
  a4(a3);
  swift_unknownObjectRelease();

  return swift_release();
}

id sub_2454675D8(uint64_t a1)
{
  return sub_2454675F0(a1, (SEL *)&selRef_initWithInitalContext_);
}

id sub_2454675E4(uint64_t a1)
{
  return sub_2454675F0(a1, (SEL *)&selRef_initWithInitialContext_);
}

id sub_2454675F0(uint64_t a1, SEL *a2)
{
  objc_class *v2;
  id v5;
  objc_super v7;

  v7.receiver = objc_allocWithZone(v2);
  v7.super_class = v2;
  v5 = objc_msgSendSuper2(&v7, *a2, a1);
  swift_release();
  return v5;
}

id sub_24546764C()
{
  return sub_245467658((uint64_t (*)(_QWORD))type metadata accessor for AppSuggestionEventsHandler);
}

id sub_245467658(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_245467690(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738E8);
  v2 = (_QWORD *)sub_24549A420();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_245472734(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
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

uint64_t sub_2454677A8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2454677CC(void *a1)
{
  uint64_t v1;

  sub_24546536C(a1, v1);
}

uint64_t sub_2454677D4(void *a1)
{
  uint64_t v1;

  return sub_245465558(a1, v1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24953500C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_245467824(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473880);
  v2 = (_QWORD *)sub_24549A420();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 56);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 3);
    v6 = (uint64_t)*(v4 - 2);
    v7 = *((unsigned __int8 *)v4 - 8);
    v8 = *v4;
    swift_bridgeObjectRetain();
    v9 = v8;
    result = sub_245472798(v5, v6, v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = v2[6] + 24 * result;
    *(_QWORD *)v12 = v5;
    *(_QWORD *)(v12 + 8) = v6;
    *(_BYTE *)(v12 + 16) = v7;
    *(_QWORD *)(v2[7] + 8 * result) = v9;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v2[2] = v15;
    v4 += 4;
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

unint64_t sub_24546795C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738B8);
  v2 = (_QWORD *)sub_24549A420();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_QWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_BYTE *)v4 - 8);
    v6 = *v4;
    v7 = (id)*(v4 - 2);
    swift_bridgeObjectRetain();
    result = sub_245472894((uint64_t)v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v7;
    v10 = v2[7] + 16 * result;
    *(_BYTE *)v10 = v5;
    *(_QWORD *)(v10 + 8) = v6;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 3;
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

unint64_t sub_245467A78(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738B0);
  v2 = (_QWORD *)sub_24549A420();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_QWORD *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v7 = *((_BYTE *)v4 - 8);
    v8 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_245472734(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = v2[7] + 16 * result;
    *(_BYTE *)v12 = v7;
    *(_QWORD *)(v12 + 8) = v8;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v2[2] = v15;
    v4 += 4;
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

unint64_t sub_245467BA0(uint64_t a1)
{
  return sub_245467BD8(a1, &qword_257473888, &qword_257473890, sub_245472828);
}

unint64_t sub_245467BBC(uint64_t a1)
{
  return sub_245467BD8(a1, &qword_2574738C0, &qword_2574738C8, sub_24547291C);
}

unint64_t sub_245467BD8(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  _BYTE v18[8];
  __int128 v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_24549A420();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_24546A564(v11, (uint64_t)v18, a3);
    v12 = v18[0];
    result = a4(v18[0]);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v8[6] + result) = v12;
    result = sub_24546A54C(&v19, v8[7] + 40 * result);
    v15 = v8[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v8[2] = v17;
    v11 += 48;
    if (!--v9)
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

unint64_t sub_245467D0C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473850);
  v2 = sub_24549A420();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_24546A564(v6, (uint64_t)&v15, &qword_257473858);
    v7 = v15;
    v8 = v16;
    result = sub_245472734(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_24546A02C(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_245467E40(uint64_t *a1)
{
  return sub_245467E6C(a1, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped, (uint64_t (*)(uint64_t))sub_24549616C, (void (*)(unint64_t *, unint64_t *, unint64_t *))sub_2454858CC);
}

uint64_t sub_245467E6C(uint64_t *a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(uint64_t), void (*a4)(unint64_t *, unint64_t *, unint64_t *))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12[2];

  v8 = *(_QWORD *)(a2(0) - 8);
  v9 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v9 = a3(v9);
  v10 = *(_QWORD *)(v9 + 16);
  v12[0] = v9 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  v12[1] = v10;
  result = sub_245467F14(v12, a2, a4);
  *a1 = v9;
  return result;
}

uint64_t sub_245467F14(uint64_t *a1, uint64_t (*a2)(_QWORD), void (*a3)(unint64_t *, unint64_t *, unint64_t *))
{
  uint64_t (*v4)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
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
  uint64_t (*v64)(_QWORD);
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v74;
  unint64_t v75;
  char *v76;
  char *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  unint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
  uint64_t v101;
  char v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  BOOL v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  void (*v139)(unint64_t *, unint64_t *, unint64_t *);
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t (*v155)(_QWORD);

  v4 = a2;
  v146 = a2(0);
  v144 = *(_QWORD *)(v146 - 8);
  v6 = MEMORY[0x24BDAC7A8](v146);
  v141 = (uint64_t)&v135 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v153 = (uint64_t)&v135 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v150 = (uint64_t)&v135 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v149 = (uint64_t)&v135 - v12;
  v13 = a1[1];
  result = sub_24549A48C();
  if (result >= v13)
  {
    if (v13 < 0)
      goto LABEL_139;
    if (v13)
      return sub_245469400(0, v13, 1, a1, v4);
    return result;
  }
  if (v13 >= 0)
    v15 = v13;
  else
    v15 = v13 + 1;
  if (v13 < -1)
    goto LABEL_147;
  v139 = a3;
  v137 = result;
  if (v13 < 2)
  {
    v19 = (char *)MEMORY[0x24BEE4AF8];
    v143 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v144 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80));
    v136 = MEMORY[0x24BEE4AF8];
    if (v13 != 1)
    {
      v21 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_106:
      if (v21 >= 2)
      {
        v127 = *a1;
        v128 = v145;
        do
        {
          v129 = v21 - 2;
          if (v21 < 2)
            goto LABEL_134;
          if (!v127)
            goto LABEL_146;
          v130 = v19;
          v131 = *(_QWORD *)&v19[16 * v129 + 32];
          v132 = *(_QWORD *)&v19[16 * v21 + 24];
          sub_245469644(v127 + *(_QWORD *)(v144 + 72) * v131, v127 + *(_QWORD *)(v144 + 72) * *(_QWORD *)&v19[16 * v21 + 16], v127 + *(_QWORD *)(v144 + 72) * v132, v143, v4, v139);
          if (v128)
            break;
          if (v132 < v131)
            goto LABEL_135;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v130 = sub_245485A8C((uint64_t)v19);
          if (v129 >= *((_QWORD *)v130 + 2))
            goto LABEL_136;
          v133 = &v130[16 * v129 + 32];
          *(_QWORD *)v133 = v131;
          *((_QWORD *)v133 + 1) = v132;
          v134 = *((_QWORD *)v130 + 2);
          if (v21 > v134)
            goto LABEL_137;
          memmove(&v130[16 * v21 + 16], &v130[16 * v21 + 32], 16 * (v134 - v21));
          *((_QWORD *)v130 + 2) = v134 - 1;
          v21 = v134 - 1;
          v19 = v130;
        }
        while (v134 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v136 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v16 = v15 >> 1;
    v17 = sub_24549A15C();
    *(_QWORD *)(v17 + 16) = v16;
    v18 = *(unsigned __int8 *)(v144 + 80);
    v136 = v17;
    v143 = v17 + ((v18 + 32) & ~v18);
  }
  v20 = 0;
  v19 = (char *)MEMORY[0x24BEE4AF8];
  v155 = v4;
  v151 = a1;
  while (1)
  {
    v22 = v20;
    v23 = v20 + 1;
    v142 = v20;
    if (v20 + 1 >= v13)
    {
      v33 = v20 + 1;
    }
    else
    {
      v147 = *a1;
      v24 = v147;
      v25 = *(_QWORD *)(v144 + 72);
      v26 = v149;
      sub_24546A5A8(v147 + v25 * v23, v149, v4);
      v148 = v13;
      v27 = v150;
      sub_24546A5A8(v24 + v25 * v22, v150, v4);
      sub_245499F94();
      v29 = v28;
      sub_245499F94();
      v31 = v30;
      v32 = v27;
      v13 = v148;
      sub_24546A5EC(v32, v4);
      sub_24546A5EC(v26, v4);
      v33 = v22 + 2;
      v154 = v25;
      if (v22 + 2 >= v13)
      {
LABEL_21:
        a3 = v139;
      }
      else
      {
        v138 = v19;
        v34 = v25 * v23;
        v35 = v147;
        v36 = v25 * v33;
        while (1)
        {
          v37 = v33;
          v38 = v149;
          sub_24546A5A8(v35 + v36, v149, v4);
          v39 = v150;
          sub_24546A5A8(v35 + v34, v150, v4);
          sub_245499F94();
          v41 = v40;
          sub_245499F94();
          v43 = v41 >= v42;
          sub_24546A5EC(v39, v4);
          sub_24546A5EC(v38, v4);
          if (v29 < v31 == v43)
            break;
          v33 = v37 + 1;
          v25 = v154;
          v35 += v154;
          if (v148 == v37 + 1)
          {
            v13 = v148;
            v33 = v148;
            a1 = v151;
            v19 = v138;
            goto LABEL_21;
          }
        }
        a1 = v151;
        v33 = v37;
        v19 = v138;
        a3 = v139;
        v13 = v148;
        v25 = v154;
      }
      v22 = v142;
      if (v29 < v31)
      {
        if (v33 < v142)
          goto LABEL_140;
        if (v142 < v33)
        {
          v138 = v19;
          v44 = 0;
          v45 = v25 * (v33 - 1);
          v46 = v33 * v25;
          v47 = v142;
          v48 = v142 * v25;
          v152 = v33;
          do
          {
            if (v47 != v33 + v44 - 1)
            {
              v49 = v147;
              if (!v147)
                goto LABEL_145;
              v50 = v147 + v48;
              v51 = v147 + v45;
              sub_24546A628(v147 + v48, v141, v155);
              if (v48 < v45 || v50 >= v49 + v46)
              {
                swift_arrayInitWithTakeFrontToBack();
                v25 = v154;
              }
              else
              {
                v25 = v154;
                if (v48 != v45)
                  swift_arrayInitWithTakeBackToFront();
              }
              v4 = v155;
              sub_24546A628(v141, v51, v155);
              v33 = v152;
            }
            ++v47;
            --v44;
            v45 -= v25;
            v46 -= v25;
            v48 += v25;
          }
          while (v47 < v33 + v44);
          v19 = v138;
          a3 = v139;
          v22 = v142;
          v13 = v148;
        }
      }
    }
    if (v33 < v13)
    {
      if (__OFSUB__(v33, v22))
        goto LABEL_138;
      if (v33 - v22 < v137)
        break;
    }
LABEL_56:
    if (v33 < v22)
      goto LABEL_133;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v152 = v33;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v19 = sub_2454857D4(0, *((_QWORD *)v19 + 2) + 1, 1, v19);
    v75 = *((_QWORD *)v19 + 2);
    v74 = *((_QWORD *)v19 + 3);
    v21 = v75 + 1;
    if (v75 >= v74 >> 1)
      v19 = sub_2454857D4((char *)(v74 > 1), v75 + 1, 1, v19);
    *((_QWORD *)v19 + 2) = v21;
    v76 = v19 + 32;
    v77 = &v19[16 * v75 + 32];
    v78 = v152;
    *(_QWORD *)v77 = v142;
    *((_QWORD *)v77 + 1) = v78;
    if (v75)
    {
      while (1)
      {
        v79 = v21 - 1;
        if (v21 >= 4)
        {
          v84 = &v76[16 * v21];
          v85 = *((_QWORD *)v84 - 8);
          v86 = *((_QWORD *)v84 - 7);
          v90 = __OFSUB__(v86, v85);
          v87 = v86 - v85;
          if (v90)
            goto LABEL_122;
          v89 = *((_QWORD *)v84 - 6);
          v88 = *((_QWORD *)v84 - 5);
          v90 = __OFSUB__(v88, v89);
          v82 = v88 - v89;
          v83 = v90;
          if (v90)
            goto LABEL_123;
          v91 = v21 - 2;
          v92 = &v76[16 * v21 - 32];
          v94 = *(_QWORD *)v92;
          v93 = *((_QWORD *)v92 + 1);
          v90 = __OFSUB__(v93, v94);
          v95 = v93 - v94;
          if (v90)
            goto LABEL_125;
          v90 = __OFADD__(v82, v95);
          v96 = v82 + v95;
          if (v90)
            goto LABEL_128;
          if (v96 >= v87)
          {
            v114 = &v76[16 * v79];
            v116 = *(_QWORD *)v114;
            v115 = *((_QWORD *)v114 + 1);
            v90 = __OFSUB__(v115, v116);
            v117 = v115 - v116;
            if (v90)
              goto LABEL_132;
            v107 = v82 < v117;
            goto LABEL_93;
          }
        }
        else
        {
          if (v21 != 3)
          {
            v108 = *((_QWORD *)v19 + 4);
            v109 = *((_QWORD *)v19 + 5);
            v90 = __OFSUB__(v109, v108);
            v101 = v109 - v108;
            v102 = v90;
            goto LABEL_87;
          }
          v81 = *((_QWORD *)v19 + 4);
          v80 = *((_QWORD *)v19 + 5);
          v90 = __OFSUB__(v80, v81);
          v82 = v80 - v81;
          v83 = v90;
        }
        if ((v83 & 1) != 0)
          goto LABEL_124;
        v91 = v21 - 2;
        v97 = &v76[16 * v21 - 32];
        v99 = *(_QWORD *)v97;
        v98 = *((_QWORD *)v97 + 1);
        v100 = __OFSUB__(v98, v99);
        v101 = v98 - v99;
        v102 = v100;
        if (v100)
          goto LABEL_127;
        v103 = &v76[16 * v79];
        v105 = *(_QWORD *)v103;
        v104 = *((_QWORD *)v103 + 1);
        v90 = __OFSUB__(v104, v105);
        v106 = v104 - v105;
        if (v90)
          goto LABEL_130;
        if (__OFADD__(v101, v106))
          goto LABEL_131;
        if (v101 + v106 >= v82)
        {
          v107 = v82 < v106;
LABEL_93:
          if (v107)
            v79 = v91;
          goto LABEL_95;
        }
LABEL_87:
        if ((v102 & 1) != 0)
          goto LABEL_126;
        v110 = &v76[16 * v79];
        v112 = *(_QWORD *)v110;
        v111 = *((_QWORD *)v110 + 1);
        v90 = __OFSUB__(v111, v112);
        v113 = v111 - v112;
        if (v90)
          goto LABEL_129;
        if (v113 < v101)
          goto LABEL_14;
LABEL_95:
        v118 = v79 - 1;
        if (v79 - 1 >= v21)
        {
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
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
          goto LABEL_142;
        }
        v119 = *a1;
        if (!*a1)
          goto LABEL_144;
        v120 = v19;
        v121 = &v76[16 * v118];
        v122 = *(_QWORD *)v121;
        v123 = &v76[16 * v79];
        v124 = *((_QWORD *)v123 + 1);
        v125 = v145;
        sub_245469644(v119 + *(_QWORD *)(v144 + 72) * *(_QWORD *)v121, v119 + *(_QWORD *)(v144 + 72) * *(_QWORD *)v123, v119 + *(_QWORD *)(v144 + 72) * v124, v143, v155, a3);
        v145 = v125;
        if (v125)
          goto LABEL_117;
        if (v124 < v122)
          goto LABEL_119;
        if (v79 > *((_QWORD *)v120 + 2))
          goto LABEL_120;
        *(_QWORD *)v121 = v122;
        *(_QWORD *)&v76[16 * v118 + 8] = v124;
        v126 = *((_QWORD *)v120 + 2);
        if (v79 >= v126)
          goto LABEL_121;
        v19 = v120;
        v21 = v126 - 1;
        memmove(&v76[16 * v79], v123 + 16, 16 * (v126 - 1 - v79));
        *((_QWORD *)v120 + 2) = v126 - 1;
        v4 = v155;
        a1 = v151;
        if (v126 <= 2)
          goto LABEL_14;
      }
    }
    v21 = 1;
LABEL_14:
    v13 = a1[1];
    v20 = v152;
    if (v152 >= v13)
      goto LABEL_106;
  }
  if (__OFADD__(v22, v137))
    goto LABEL_141;
  if (v22 + v137 >= v13)
    v52 = v13;
  else
    v52 = v22 + v137;
  if (v52 >= v22)
  {
    if (v33 != v52)
    {
      v138 = v19;
      v53 = *(_QWORD *)(v144 + 72);
      v54 = v53 * (v33 - 1);
      v147 = v53;
      v55 = v33 * v53;
      v140 = v52;
      do
      {
        v57 = 0;
        v58 = v142;
        v152 = v33;
        v148 = v55;
        while (1)
        {
          v154 = v58;
          v59 = *a1;
          v60 = v55 + v57 + *a1;
          v61 = v149;
          sub_24546A5A8(v60, v149, v4);
          v62 = v54;
          v63 = v54 + v57 + v59;
          v64 = v4;
          v65 = v150;
          sub_24546A5A8(v63, v150, v64);
          sub_245499F94();
          v67 = v66;
          sub_245499F94();
          v69 = v68;
          v70 = v65;
          v4 = v64;
          sub_24546A5EC(v70, v64);
          sub_24546A5EC(v61, v64);
          if (v67 >= v69)
            break;
          v71 = *a1;
          if (!*a1)
            goto LABEL_143;
          v55 = v148;
          v54 = v62;
          v72 = v71 + v62 + v57;
          sub_24546A628(v71 + v148 + v57, v153, v155);
          swift_arrayInitWithTakeFrontToBack();
          v4 = v155;
          sub_24546A628(v153, v72, v155);
          v57 -= v147;
          v58 = v154 + 1;
          a1 = v151;
          v56 = v152;
          if (v152 == v154 + 1)
            goto LABEL_49;
        }
        v56 = v152;
        v54 = v62;
        v55 = v148;
LABEL_49:
        v33 = v56 + 1;
        v54 += v147;
        v55 += v147;
      }
      while (v33 != v140);
      v33 = v140;
      v19 = v138;
      a3 = v139;
      v22 = v142;
    }
    goto LABEL_56;
  }
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  result = sub_24549A3E4();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AppSuggestionsJointEvent(uint64_t a1)
{
  return sub_245468948(a1, (uint64_t *)&unk_257473770);
}

uint64_t sub_245468948(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24546897C(uint64_t a1)
{
  uint64_t result;

  result = sub_245464488(&qword_257473688, type metadata accessor for AppSuggestionInferenceEventTimestamped, (uint64_t)&protocol conformance descriptor for AppSuggestionInferenceEventTimestamped);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2454689B8()
{
  return sub_245464488(qword_257473690, type metadata accessor for AppSuggestionInferenceEventTimestamped, (uint64_t)&protocol conformance descriptor for AppSuggestionInferenceEventTimestamped);
}

uint64_t *initializeBufferWithCopyOfBuffer for AppSuggestionInferenceEventTimestamped(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
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
    v7 = sub_245499FB8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = v9;
  }
  return a1;
}

void destroy for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245499FB8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t initializeWithCopy for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = sub_245499FB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = v8;
  return a1;
}

uint64_t assignWithCopy for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_245499FB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  return a1;
}

uint64_t initializeWithTake for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_245499FB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for AppSuggestionInferenceEventTimestamped(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = sub_245499FB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppSuggestionInferenceEventTimestamped()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_245468C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_245499FB8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSuggestionInferenceEventTimestamped()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_245468CD0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_245499FB8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_245468D48()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245499FB8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppSuggestionsJoiningResult(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AppSuggestionsJoiningResult()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AppSuggestionsJoiningResult(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AppSuggestionsJoiningResult(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for AppSuggestionsJoiningResult(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppSuggestionsJoiningResult(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSuggestionsJoiningResult(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppSuggestionsJoiningResult()
{
  return &type metadata for AppSuggestionsJoiningResult;
}

uint64_t sub_245468FFC()
{
  return type metadata accessor for AppSuggestionsJointEvent(0);
}

uint64_t sub_245469004()
{
  uint64_t result;
  unint64_t v1;

  result = sub_245499FB8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AppSuggestionsJointEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for AppSuggestionEventsHandler()
{
  return objc_opt_self();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppSuggestionInferenceEventTimestamped.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppSuggestionInferenceEventTimestamped.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2454691A4 + 4 * byte_24549B285[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2454691D8 + 4 * byte_24549B280[v4]))();
}

uint64_t sub_2454691D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2454691E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2454691E8);
  return result;
}

uint64_t sub_2454691F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2454691FCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_245469200(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245469208(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245469214(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_245469220(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AppSuggestionInferenceEventTimestamped.CodingKeys()
{
  return &type metadata for AppSuggestionInferenceEventTimestamped.CodingKeys;
}

unint64_t sub_245469240()
{
  unint64_t result;

  result = qword_257473820;
  if (!qword_257473820)
  {
    result = MEMORY[0x249535018](&unk_24549B4A8, &type metadata for AppSuggestionInferenceEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473820);
  }
  return result;
}

unint64_t sub_245469288()
{
  unint64_t result;

  result = qword_257473828;
  if (!qword_257473828)
  {
    result = MEMORY[0x249535018](&unk_24549B418, &type metadata for AppSuggestionInferenceEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473828);
  }
  return result;
}

unint64_t sub_2454692D0()
{
  unint64_t result;

  result = qword_257473830;
  if (!qword_257473830)
  {
    result = MEMORY[0x249535018](&unk_24549B440, &type metadata for AppSuggestionInferenceEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473830);
  }
  return result;
}

_QWORD *sub_245469318(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254413820);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  v6 = sub_245469D10(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24546A03C();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_245469400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
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

  v30 = a1;
  v31 = a5(0);
  v9 = MEMORY[0x24BDAC7A8](v31);
  v35 = (uint64_t)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v32 = (uint64_t)&v28 - v12;
  result = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v28 - v15;
  v34 = a3;
  v29 = a2;
  if (a3 != a2)
  {
    v17 = *(_QWORD *)(v14 + 72);
    v37 = v17 * (v34 - 1);
    v33 = v17;
    v36 = v17 * v34;
LABEL_5:
    v18 = 0;
    v19 = v30;
    while (1)
    {
      v20 = *a4;
      sub_24546A5A8(v36 + v18 + *a4, (uint64_t)v16, a5);
      v21 = v32;
      sub_24546A5A8(v37 + v18 + v20, v32, a5);
      sub_245499F94();
      v23 = v22;
      sub_245499F94();
      v25 = v24;
      sub_24546A5EC(v21, a5);
      result = sub_24546A5EC((uint64_t)v16, a5);
      if (v23 >= v25)
      {
LABEL_4:
        v37 += v33;
        v36 += v33;
        if (++v34 == v29)
          return result;
        goto LABEL_5;
      }
      v26 = *a4;
      if (!*a4)
        break;
      v27 = v26 + v37 + v18;
      sub_24546A628(v26 + v36 + v18, v35, a5);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_24546A628(v35, v27, a5);
      v18 -= v33;
      if (v34 == ++v19)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_245469644(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t (*a5)(_QWORD), void (*a6)(unint64_t *, unint64_t *, unint64_t *))
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t (*v24)(_QWORD);
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v36;
  unint64_t v37;
  uint64_t (*v38)(_QWORD);
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  BOOL v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t result;
  uint64_t v53;
  void (*v54)(unint64_t *, unint64_t *, unint64_t *);
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(_QWORD);
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;

  v58 = a5;
  v57 = a5(0);
  v11 = MEMORY[0x24BDAC7A8](v57);
  v59 = (uint64_t)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v53 - v13;
  v16 = *(_QWORD *)(v15 + 72);
  if (!v16)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v16 == -1)
    goto LABEL_62;
  v17 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v16 == -1)
    goto LABEL_63;
  v18 = (uint64_t)(a2 - a1) / v16;
  v62 = a1;
  v61 = a4;
  v19 = v17 / v16;
  v54 = a6;
  if (v18 >= v17 / v16)
  {
    if ((v19 & 0x8000000000000000) == 0)
    {
      v21 = v19 * v16;
      if (a4 < a2 || a2 + v21 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v34 = a4 + v21;
      v60 = a4 + v21;
      v62 = a2;
      if (v21 >= 1 && a1 < a2)
      {
        v36 = -v16;
        v55 = a1;
        v56 = a4;
        do
        {
          v37 = a3 + v36;
          v38 = v58;
          sub_24546A5A8(v34 + v36, (uint64_t)v14, v58);
          v39 = a2 + v36;
          v40 = a3;
          v41 = (uint64_t)v14;
          v42 = v59;
          sub_24546A5A8(a2 + v36, v59, v38);
          sub_245499F94();
          v44 = v43;
          sub_245499F94();
          v46 = v45;
          v47 = v42;
          v14 = (char *)v41;
          sub_24546A5EC(v47, v38);
          sub_24546A5EC(v41, v38);
          if (v44 >= v46)
          {
            v51 = v60;
            v60 += v36;
            if (v40 < v51 || v37 >= v51)
            {
              swift_arrayInitWithTakeFrontToBack();
              v39 = a2;
              v50 = v55;
              v49 = v56;
            }
            else
            {
              v49 = v56;
              if (v40 != v51)
                swift_arrayInitWithTakeBackToFront();
              v39 = a2;
              v50 = v55;
            }
          }
          else
          {
            if (v40 < a2 || v37 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
              v50 = v55;
              v49 = v56;
            }
            else
            {
              v48 = v40 == a2;
              v50 = v55;
              v49 = v56;
              if (!v48)
                swift_arrayInitWithTakeBackToFront();
            }
            v62 += v36;
          }
          v34 = v60;
          if (v60 <= v49)
            break;
          a2 = v39;
          a3 = v37;
        }
        while (v39 > v50);
      }
      goto LABEL_60;
    }
  }
  else if ((v18 & 0x8000000000000000) == 0)
  {
    v20 = v18 * v16;
    if (a4 < a1 || a1 + v20 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v22 = a4 + v20;
    v60 = a4 + v20;
    if (v20 >= 1 && a2 < a3)
    {
      v24 = v58;
      do
      {
        sub_24546A5A8(a2, (uint64_t)v14, v24);
        v25 = a4;
        v26 = v59;
        sub_24546A5A8(v25, v59, v24);
        sub_245499F94();
        v28 = v27;
        sub_245499F94();
        v30 = v29;
        sub_24546A5EC(v26, v24);
        sub_24546A5EC((uint64_t)v14, v24);
        v31 = v62;
        if (v28 >= v30)
        {
          v33 = v61 + v16;
          if (v62 < v61 || v62 >= v33)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v62 != v61)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v61 = v33;
          v32 = a2;
        }
        else
        {
          v32 = a2 + v16;
          if (v62 < a2 || v62 >= v32)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v62 == a2)
          {
            v31 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v62 = v31 + v16;
        a4 = v61;
        if (v61 >= v22)
          break;
        a2 = v32;
      }
      while (v32 < a3);
    }
LABEL_60:
    v54(&v62, &v61, &v60);
    return 1;
  }
LABEL_64:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_245469B04(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_24549A3FC();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_24549A3FC();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_24546A048(&qword_257473840, &qword_257473838, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_257473838);
          v12 = sub_245496310(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

_QWORD *sub_245469D10(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  void *v20;
  id v21;

  v5 = result;
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
    return (_QWORD *)v10;
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
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    result = v20;
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

uint64_t sub_245469F08(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1702125924 && a2 == 0xE400000000000000;
  if (v3 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x746E657665 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_245469FF0()
{
  unint64_t result;

  result = qword_254413768;
  if (!qword_254413768)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254413768);
  }
  return result;
}

_OWORD *sub_24546A02C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24546A03C()
{
  return swift_release();
}

uint64_t sub_24546A048(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x249535018](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24546A088(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  char v17;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738A8);
  v3 = (_QWORD *)sub_24549A420();
  v4 = *(_BYTE *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  result = sub_2454728C4(v4);
  if ((v9 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v10 = (_QWORD *)(a1 + 88);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v3[6] + result) = v4;
    v11 = (_QWORD *)(v3[7] + 24 * result);
    *v11 = v5;
    v11[1] = v7;
    v11[2] = v6;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      break;
    v3[2] = v14;
    if (!--v1)
      goto LABEL_8;
    v15 = v10 + 4;
    v4 = *((_BYTE *)v10 - 24);
    v5 = *(v10 - 2);
    v7 = *(v10 - 1);
    v16 = *v10;
    swift_bridgeObjectRetain();
    result = sub_2454728C4(v4);
    v10 = v15;
    v6 = v16;
    if ((v17 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_24546A1AC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t *i;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574738A0);
    v3 = (_QWORD *)sub_24549A420();
    for (i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      v5 = *(i - 1);
      v6 = *i;
      result = sub_24547283C(v5);
      if ((v8 & 1) != 0)
        break;
      *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      v9 = 8 * result;
      *(_QWORD *)(v3[6] + v9) = v5;
      *(_QWORD *)(v3[7] + v9) = v6;
      v10 = v3[2];
      v11 = __OFADD__(v10, 1);
      v12 = v10 + 1;
      if (v11)
        goto LABEL_10;
      v3[2] = v12;
      if (!--v1)
        return (unint64_t)v3;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B00];
  }
  return result;
}

uint64_t sub_24546A280()
{
  void *v0;
  uint64_t v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;

  swift_unknownObjectRetain();
  objc_opt_self();
  v0 = (void *)swift_dynamicCastObjCClass();
  if (v0)
  {
    swift_unknownObjectRetain();
    objc_opt_self();
    v1 = swift_dynamicCastObjCClass();
    if (v1)
    {
      v2 = (void *)v1;
      objc_msgSend(v0, sel_timestamp);
      v4 = v3;
      objc_msgSend(v2, sel_timestamp);
      v6 = v5;
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      if (v4 <= v6)
        return 1;
      else
        return -1;
    }
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRelease();
  if (qword_254413850 != -1)
    swift_once();
  v8 = sub_24549A078();
  __swift_project_value_buffer(v8, (uint64_t)qword_254413928);
  swift_unknownObjectRetain_n();
  swift_unknownObjectRetain_n();
  v9 = sub_24549A060();
  v10 = sub_24549A1D4();
  if (os_log_type_enabled(v9, v10))
  {
    v7 = -1;
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v18 = v12;
    *(_DWORD *)v11 = 136315394;
    swift_getObjectType();
    v13 = sub_24549A588();
    sub_2454720F4(v13, v14, &v18);
    sub_24549A258();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    swift_getObjectType();
    v15 = sub_24549A588();
    sub_2454720F4(v15, v16, &v18);
    sub_24549A258();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245461000, v9, v10, "unexpected types: a: %s; b: %s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2495350C0](v12, -1, -1);
    MEMORY[0x2495350C0](v11, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
    swift_unknownObjectRelease_n();
    return -1;
  }
  return v7;
}

uint64_t sub_24546A54C(__int128 *a1, uint64_t a2)
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

uint64_t sub_24546A564(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24546A5A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24546A5EC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24546A628(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_24546A66C()
{
  unint64_t result;

  result = qword_2574738D8;
  if (!qword_2574738D8)
  {
    result = MEMORY[0x249535018](&unk_24549D290, &type metadata for ReportingError);
    atomic_store(result, (unint64_t *)&qword_2574738D8);
  }
  return result;
}

uint64_t sub_24546A6C0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24546A718()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_24546A754()
{
  sub_24546A718();
  return swift_deallocClassInstance();
}

void type metadata accessor for GreedyKeyedEventCombiner()
{
  JUMPOUT(0x249534FC4);
}

uint64_t sub_24546A780()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_24549A0A8();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    v3 = (void *)sub_24549A0A8();
    v4 = (uint64_t)objc_msgSend(v2, sel_BOOLForKey_, v3);

  }
  else
  {
    if (qword_254413850 != -1)
      swift_once();
    v5 = sub_24549A078();
    __swift_project_value_buffer(v5, (uint64_t)qword_254413928);
    v6 = sub_24549A060();
    v7 = sub_24549A1D4();
    if (os_log_type_enabled(v6, v7))
    {
      v4 = 2;
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_245461000, v6, v7, "unable to read sharing user defaults", v8, 2u);
      MEMORY[0x2495350C0](v8, -1, -1);

    }
    else
    {

      return 2;
    }
  }
  return v4;
}

BOOL sub_24546A8F8()
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
  void *v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  void *v20;
  _OWORD v21[2];
  _BYTE v22[24];
  uint64_t v23;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574739D0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_245499FB8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v21 - v8;
  if (objc_msgSend((id)objc_opt_self(), sel_getUserDataDisposition) == 2)
    return 0;
  v11 = (void *)objc_opt_self();
  v12 = objc_msgSend(v11, sel_standardUserDefaults);
  v13 = (void *)sub_24549A0A8();
  v14 = objc_msgSend(v12, sel_objectForKey_, v13);

  if (v14)
  {
    sub_24549A270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_24546ABE8((uint64_t)v21, (uint64_t)v22);
  if (v23)
  {
    v15 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, v15 ^ 1u, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
      sub_245499F88();
      v17 = v16;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
      return v17 > -1209600.0;
    }
  }
  else
  {
    sub_24546AC30((uint64_t)v22, &qword_254413788);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  }
  sub_24546AC30((uint64_t)v2, &qword_2574739D0);
  v18 = objc_msgSend(v11, sel_standardUserDefaults);
  sub_245499FA0();
  v19 = (void *)sub_245499F7C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  v20 = (void *)sub_24549A0A8();
  objc_msgSend(v18, sel_setValue_forKey_, v19, v20);

  return 1;
}

uint64_t sub_24546ABE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254413788);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24546AC30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t static Logging.subsystem.getter()
{
  return 0xD000000000000022;
}

uint64_t sub_24546AC88(uint64_t a1)
{
  return sub_24546ACC8(a1, qword_254413928);
}

uint64_t sub_24546ACA8(uint64_t a1)
{
  return sub_24546ACC8(a1, qword_2574739D8);
}

uint64_t sub_24546ACC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_24549A078();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_24549A06C();
}

uint64_t static Logging.signpost.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257473388 != -1)
    swift_once();
  v2 = sub_24549A078();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2574739D8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

ValueMetadata *type metadata accessor for Logging()
{
  return &type metadata for Logging;
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

uint64_t sub_24546ADFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)a3 + 8);
  result = MEMORY[0x249535018](MEMORY[0x24BEE4AA8], a2, &v5);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of static MetricsManager.record(inference:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of static MetricsManager.record(feedback:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

BOOL static TimestampedEvent.< infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(uint64_t, uint64_t);
  double v14;
  double v15;
  void (*v16)(char *, uint64_t);
  double v17;
  double v18;
  uint64_t v20;

  v6 = sub_245499FB8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v20 - v11;
  v13 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
  v13(a3, a4);
  sub_245499F94();
  v15 = v14;
  v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v12, v6);
  v13(a3, a4);
  sub_245499F94();
  v18 = v17;
  v16(v10, v6);
  return v15 < v18;
}

BOOL static TimestampedEvent.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void (*v13)(uint64_t, uint64_t);
  double v14;
  double v15;
  void (*v16)(char *, uint64_t);
  double v17;
  double v18;
  uint64_t v20;

  v6 = sub_245499FB8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v20 - v11;
  v13 = *(void (**)(uint64_t, uint64_t))(a4 + 16);
  v13(a3, a4);
  sub_245499F94();
  v15 = v14;
  v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v12, v6);
  v13(a3, a4);
  sub_245499F94();
  v18 = v17;
  v16(v10, v6);
  return v15 == v18;
}

uint64_t sub_24546B068(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;
  uint64_t v15;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_24546A54C((__int128 *)a1, (uint64_t)v13);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v2;
    *v2 = 0x8000000000000000;
    v5 = v14;
    v6 = v15;
    v7 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v13, v14);
    MEMORY[0x24BDAC7A8](v7);
    v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
    (*(void (**)(_BYTE *))(v10 + 16))(v9);
    sub_2454791FC((uint64_t)v9, a2, isUniquelyReferenced_nonNull_native, &v12, v5, v6);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
    *v2 = v12;
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24546AC30(a1, &qword_257473A60);
    sub_245495240(a2, (uint64_t)v13);
    return sub_24546AC30((uint64_t)v13, &qword_257473A60);
  }
}

uint64_t static PeopleSuggesterMetricsCollector.sendMetrics()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = sub_24546B3C0();
  if (qword_254413850 != -1)
    swift_once();
  v2 = sub_24549A078();
  __swift_project_value_buffer(v2, (uint64_t)qword_254413928);
  swift_bridgeObjectRetain();
  v3 = sub_24549A060();
  v4 = sub_24549A1C8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 134217984;
    sub_24549A258();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245461000, v3, v4, "sending %ld events", v5, 0xCu);
    MEMORY[0x2495350C0](v5, -1, -1);

    v6 = *(_QWORD *)(v1 + 16);
    if (!v6)
      return swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    v6 = *(_QWORD *)(v1 + 16);
    if (!v6)
      return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    swift_bridgeObjectRetain();
    v8 = sub_24549A174();
    if (v0)
      break;
    ++v7;
    v9 = (void *)MEMORY[0x249534BF8](v8);
    v10 = (void *)sub_24549A0A8();
    sub_24547D17C(0, &qword_2574739F0);
    v11 = (void *)sub_24549A084();
    AnalyticsSendEvent();

    objc_autoreleasePoolPop(v9);
    swift_bridgeObjectRelease();
    if (v6 == v7)
      return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease_n();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24546B3C0()
{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t result;
  int64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  int64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  static PeopleSuggesterMetricsCollector.getMetrics()(&v47);
  v0 = v47;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v46 = MEMORY[0x24BEE4AF8];
    sub_245477E58(0, v1, 0);
    v2 = 0;
    v38 = v46;
    v35 = v1;
    while (1)
    {
      v37 = v2;
      v36 = swift_bridgeObjectRetain();
      v3 = sub_24546C3AC(v36);
      v4 = *(_QWORD *)(v3 + 16);
      if (v4)
        break;
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
        goto LABEL_26;
LABEL_28:
      v28 = MEMORY[0x24BEE4B00];
LABEL_29:
      v45 = v28;
      v29 = (_QWORD *)swift_bridgeObjectRetain();
      sub_245477A10(v29, 1, &v45);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v30 = v45;
      v31 = v38;
      v46 = v38;
      v33 = *(_QWORD *)(v38 + 16);
      v32 = *(_QWORD *)(v38 + 24);
      if (v33 >= v32 >> 1)
      {
        sub_245477E58(v32 > 1, v33 + 1, 1);
        v31 = v46;
      }
      v2 = v37 + 1;
      *(_QWORD *)(v31 + 16) = v33 + 1;
      v38 = v31;
      *(_QWORD *)(v31 + 8 * v33 + 32) = v30;
      if (v37 + 1 == v1)
      {
        swift_bridgeObjectRelease();
        return v38;
      }
    }
    v45 = MEMORY[0x24BEE4AF8];
    sub_245477E84(0, v4, 0);
    v5 = v45;
    v6 = sub_245496404(v3);
    v8 = v7;
    v9 = 0;
    v10 = v3 + 64;
    v11 = *(_BYTE *)(v3 + 32);
    v39 = v7;
    v40 = v4;
    v41 = v3 + 64;
    while (1)
    {
      if (v6 < 0 || v6 >= 1 << v11)
      {
        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        result = swift_unexpectedError();
        __break(1u);
        return result;
      }
      v15 = (unint64_t)v6 >> 6;
      if ((*(_QWORD *)(v10 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
        goto LABEL_35;
      if (*(_DWORD *)(v3 + 36) != v8)
        goto LABEL_36;
      v42 = v9;
      v16 = *(void **)(*(_QWORD *)(v3 + 56) + 8 * v6);
      v17 = PeopleSuggesterMetricsField.rawValue.getter();
      v43 = v18;
      v44 = v17;
      v45 = v5;
      v20 = *(_QWORD *)(v5 + 16);
      v19 = *(_QWORD *)(v5 + 24);
      v21 = v16;
      if (v20 >= v19 >> 1)
      {
        sub_245477E84(v19 > 1, v20 + 1, 1);
        v5 = v45;
      }
      *(_QWORD *)(v5 + 16) = v20 + 1;
      v22 = (_QWORD *)(v5 + 24 * v20);
      v22[4] = v44;
      v22[5] = v43;
      v22[6] = v21;
      v11 = *(_BYTE *)(v3 + 32);
      v12 = 1 << v11;
      if (v6 >= 1 << v11)
        goto LABEL_37;
      v10 = v3 + 64;
      v23 = *(_QWORD *)(v41 + 8 * v15);
      if ((v23 & (1 << v6)) == 0)
        goto LABEL_38;
      if (*(_DWORD *)(v3 + 36) != v8)
        goto LABEL_39;
      v24 = v23 & (-2 << (v6 & 0x3F));
      if (v24)
      {
        v12 = __clz(__rbit64(v24)) | v6 & 0xFFFFFFFFFFFFFFC0;
        v13 = v40;
        v14 = v42;
      }
      else
      {
        v25 = v15 + 1;
        v26 = (v12 + 63) >> 6;
        v13 = v40;
        v14 = v42;
        if (v15 + 1 < v26)
        {
          v27 = *(_QWORD *)(v41 + 8 * v25);
          if (!v27)
          {
            v25 = v15 + 2;
            if (v15 + 2 >= v26)
              goto LABEL_6;
            v27 = *(_QWORD *)(v41 + 8 * v25);
            if (!v27)
            {
              while (v26 - 3 != v15)
              {
                v27 = *(_QWORD *)(v3 + 88 + 8 * v15++);
                if (v27)
                {
                  v25 = v15 + 2;
                  goto LABEL_19;
                }
              }
              goto LABEL_6;
            }
          }
LABEL_19:
          v12 = __clz(__rbit64(v27)) + (v25 << 6);
        }
      }
LABEL_6:
      v9 = v14 + 1;
      v8 = v39;
      v6 = v12;
      if (v9 == v13)
      {
        swift_bridgeObjectRelease();
        v1 = v35;
        if (!*(_QWORD *)(v5 + 16))
          goto LABEL_28;
LABEL_26:
        __swift_instantiateConcreteTypeFromMangledName(&qword_257473A98);
        v28 = sub_24549A420();
        goto LABEL_29;
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t static PeopleSuggesterMetricsCollector.sendShadowEvaluationMetrics(_:)(unint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = _s15ReportingPlugin31PeopleSuggesterMetricsCollectorV019getShadowEvaluationE0ySaySDySSSo8NSObjectCGGSayAA0C21SuggestionsJointEventCGFZ_0(a1);
  if (qword_254413850 != -1)
    swift_once();
  v1 = sub_24549A078();
  __swift_project_value_buffer(v1, (uint64_t)qword_254413928);
  swift_bridgeObjectRetain();
  v2 = sub_24549A060();
  v3 = sub_24549A1C8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 134217984;
    v23 = *(_QWORD *)(v21 + 16);
    sub_24549A258();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245461000, v2, v3, "sending (%ld events", v4, 0xCu);
    MEMORY[0x2495350C0](v4, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  v20 = *(_QWORD *)(v21 + 16);
  if (v20)
  {
    swift_bridgeObjectRetain();
    v5 = 0;
    v6 = MEMORY[0x24BEE0D00];
    while (1)
    {
      swift_bridgeObjectRetain();
      sub_24549A174();
      if (v22)
        break;
      swift_bridgeObjectRetain_n();
      v12 = sub_24549A060();
      v13 = sub_24549A1C8();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = swift_slowAlloc();
        v19 = swift_slowAlloc();
        v23 = v19;
        *(_DWORD *)v14 = 136315138;
        sub_24547D17C(0, &qword_2574739F0);
        swift_bridgeObjectRetain();
        v8 = v6;
        v15 = sub_24549A090();
        v17 = v16;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v14 + 4) = sub_2454720F4(v15, v17, &v23);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_245461000, v12, v13, "In production I'd be sending:\n %s", (uint8_t *)v14, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2495350C0](v19, -1, -1);
        MEMORY[0x2495350C0](v14, -1, -1);

      }
      else
      {

        v7 = swift_bridgeObjectRelease_n();
        v8 = v6;
      }
      ++v5;
      v9 = (void *)MEMORY[0x249534BF8](v7);
      v10 = (void *)sub_24549A0A8();
      sub_24547D17C(0, &qword_2574739F0);
      v11 = (void *)sub_24549A084();
      AnalyticsSendEvent();

      objc_autoreleasePoolPop(v9);
      swift_bridgeObjectRelease();
      v6 = v8;
      if (v20 == v5)
        goto LABEL_14;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();
  }
  return v21;
}

uint64_t sub_24546BBA0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  _QWORD *v26;
  char v27;
  unint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  _QWORD *v36;
  char v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  _QWORD *v43;
  unint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  _QWORD *v53;
  uint64_t v54;
  BOOL v55;
  uint64_t v56;
  _QWORD *v57;

  v5 = v3;
  if (result > 2u)
  {
    *(_BYTE *)v3 = 1;
    return result;
  }
  v7 = a2;
  LOBYTE(v8) = result;
  if (a2 == 5 || !a2)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *(_QWORD **)(v3 + 8);
    v57 = *(_QWORD **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = 0x8000000000000000;
    v12 = sub_2454728C4(v8);
    v13 = v10[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
      goto LABEL_48;
    v16 = v11;
    if (v10[3] >= v15)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_245476C94();
        v10 = v57;
      }
    }
    else
    {
      sub_245473BD8(v15, isUniquelyReferenced_nonNull_native);
      v10 = v57;
      v17 = sub_2454728C4(v8);
      if ((v16 & 1) != (v18 & 1))
        goto LABEL_54;
      v12 = v17;
    }
    *(_QWORD *)(v5 + 8) = v10;
    swift_bridgeObjectRelease();
    v19 = *(_QWORD **)(v5 + 8);
    swift_bridgeObjectRetain();
    if ((v16 & 1) == 0)
    {
      v20 = sub_24546A1AC(MEMORY[0x24BEE4AF8]);
      sub_245496038(v12, v8, 0, v20, v19, 0.0);
    }
    v4 = v19[7];
    swift_bridgeObjectRelease();
    v21 = v4 + 24 * v12;
    v23 = *(_QWORD *)(v21 + 8);
    v22 = (_QWORD *)(v21 + 8);
    v24 = v23 + 1;
    if (v23 == -1)
      goto LABEL_49;
    *v22 = v24;
    if ((a3 & 0x100) != 0)
      goto LABEL_27;
    v25 = swift_isUniquelyReferenced_nonNull_native();
    v26 = *(_QWORD **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = 0x8000000000000000;
    v28 = sub_2454728C4(v8);
    v29 = v26[2];
    v30 = (v27 & 1) == 0;
    v31 = v29 + v30;
    if (__OFADD__(v29, v30))
    {
      __break(1u);
    }
    else
    {
      LOBYTE(v4) = v27;
      if (v26[3] < v31)
      {
        sub_245473BD8(v31, v25);
        v32 = sub_2454728C4(v8);
        if ((v4 & 1) != (v33 & 1))
          goto LABEL_54;
        v28 = v32;
        if ((v4 & 1) == 0)
          goto LABEL_53;
        goto LABEL_23;
      }
      if ((v25 & 1) != 0)
      {
        if ((v27 & 1) != 0)
        {
LABEL_23:
          v34 = v26[7];
          if (*(_QWORD *)(v34 + 24 * v28 + 16))
            *(double *)(v34 + 24 * v28) = 1.0 / (double)a3 + *(double *)(v34 + 24 * v28);
          else
            sub_2454957BC(v28, (uint64_t)v26);
          *(_QWORD *)(v5 + 8) = v26;
LABEL_27:
          a3 = (uint64_t)sub_245471464;
          goto LABEL_28;
        }
LABEL_53:
        __break(1u);
        goto LABEL_54;
      }
    }
    sub_245476C94();
    if ((v4 & 1) != 0)
      goto LABEL_23;
    goto LABEL_53;
  }
  a3 = 0;
LABEL_28:
  v35 = swift_isUniquelyReferenced_nonNull_native();
  v36 = *(_QWORD **)(v5 + 8);
  v57 = v36;
  *(_QWORD *)(v5 + 8) = 0x8000000000000000;
  v12 = sub_2454728C4(v8);
  v38 = v36[2];
  v39 = (v37 & 1) == 0;
  v40 = v38 + v39;
  if (__OFADD__(v38, v39))
  {
    __break(1u);
    goto LABEL_46;
  }
  LOBYTE(v4) = v37;
  if (v36[3] >= v40)
  {
    if ((v35 & 1) == 0)
      goto LABEL_50;
    while (1)
    {
LABEL_33:
      *(_QWORD *)(v5 + 8) = v36;
      swift_bridgeObjectRelease();
      v43 = *(_QWORD **)(v5 + 8);
      swift_bridgeObjectRetain();
      if ((v4 & 1) == 0)
      {
        v44 = sub_24546A1AC(MEMORY[0x24BEE4AF8]);
        sub_245496038(v12, v8, 0, v44, v43, 0.0);
      }
      v45 = v43[7];
      swift_bridgeObjectRelease();
      v4 = v45 + 24 * v12 + 16;
      v12 = swift_isUniquelyReferenced_nonNull_native();
      v46 = *(_QWORD **)v4;
      v57 = *(_QWORD **)v4;
      *(_QWORD *)v4 = 0x8000000000000000;
      v8 = sub_24547283C(v7);
      v48 = v46[2];
      v49 = (v47 & 1) == 0;
      v50 = v48 + v49;
      if (__OFADD__(v48, v49))
      {
LABEL_46:
        __break(1u);
      }
      else
      {
        v5 = v47;
        if (v46[3] >= v50)
        {
          if ((v12 & 1) == 0)
          {
            sub_245476B08();
            v46 = v57;
          }
        }
        else
        {
          sub_24547390C(v50, v12);
          v46 = v57;
          v51 = sub_24547283C(v7);
          if ((v5 & 1) != (v52 & 1))
            goto LABEL_55;
          v8 = v51;
        }
        *(_QWORD *)v4 = v46;
        swift_bridgeObjectRelease();
        v53 = *(_QWORD **)v4;
        swift_bridgeObjectRetain();
        if ((v5 & 1) == 0)
          sub_245495FF0(v8, v7, 0, v53);
        v7 = v53[7];
        swift_bridgeObjectRelease();
        v54 = *(_QWORD *)(v7 + 8 * v8);
        v55 = __CFADD__(v54, 1);
        v56 = v54 + 1;
        if (!v55)
        {
          *(_QWORD *)(v7 + 8 * v8) = v56;
          return sub_24547D02C(a3);
        }
      }
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      sub_245476C94();
      v36 = v57;
    }
  }
  sub_245473BD8(v40, v35);
  v41 = sub_2454728C4(v8);
  if ((v4 & 1) == (v42 & 1))
  {
    v12 = v41;
    goto LABEL_33;
  }
LABEL_54:
  sub_24549A4E0();
  __break(1u);
LABEL_55:
  result = sub_24549A4E0();
  __break(1u);
  return result;
}

uint64_t sub_24546C01C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[40];
  uint64_t v23;

  v3 = a1;
  v4 = *(_QWORD *)(a2 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v19[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v19[-1] - v8;
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v10((char *)&v19[-1] - v8, v11, a2);
  if (swift_dynamicCast())
  {
    sub_24547D17C(0, &qword_257473AC0);
    v3 = sub_24549A210();
  }
  else
  {
    if (swift_dynamicCast())
      goto LABEL_4;
    if (swift_dynamicCast())
    {
      sub_24547D17C(0, &qword_257473AC0);
      v3 = sub_24549A204();
      goto LABEL_9;
    }
    if (swift_dynamicCast())
    {
      v12 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
      v13 = (void *)sub_24549A0A8();
      swift_bridgeObjectRelease();
      v3 = (uint64_t)objc_msgSend(v12, sel_initWithString_, v13);

      goto LABEL_9;
    }
    if (swift_dynamicCast())
    {
LABEL_4:
      sub_24547D17C(0, &qword_257473AC0);
      v3 = sub_24549A21C();
    }
    else
    {
      v10(v7, (uint64_t)v9, a2);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257473A60);
      swift_dynamicCast();
      sub_24547D0EC((uint64_t)&v23, (uint64_t)v22);
      if ((v3 & 1) != 0)
      {
        sub_24547D134((uint64_t)v22, (uint64_t)v19);
        v15 = v20;
        if (v20)
        {
          v16 = v21;
          __swift_project_boxed_opaque_existential_1(v19, v20);
          v3 = sub_24546C01C(0, v15, v16);
          sub_24546AC30((uint64_t)v22, &qword_257473A60);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
        }
        else
        {
          sub_24546AC30((uint64_t)v22, &qword_257473A60);
          sub_24546AC30((uint64_t)v19, &qword_257473A60);
          v3 = 0;
        }
      }
      else
      {
        sub_24546A66C();
        swift_allocError();
        *(_QWORD *)v17 = 0xD000000000000021;
        *(_QWORD *)(v17 + 8) = 0x800000024549E2B0;
        *(_BYTE *)(v17 + 16) = 1;
        swift_willThrow();
        sub_24546AC30((uint64_t)v22, &qword_257473A60);
      }
    }
  }
LABEL_9:
  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, a2);
  return v3;
}

uint64_t sub_24546C3AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  __int128 *v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  unint64_t i;
  unint64_t v11;
  int64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  __int128 *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v32[9];
  char v33;
  uint64_t v34;
  _OWORD v35[3];
  _OWORD v36[3];
  uint64_t v37;
  uint64_t *v38;

  v37 = MEMORY[0x24BEE4B00];
  v29 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  if (v2 < 64)
    v3 = ~(-1 << v2);
  else
    v3 = -1;
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v30 = (unint64_t)(v2 + 63) >> 6;
  v5 = (_OWORD *)((char *)v35 + 8);
  v38 = &v34;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  if (v4)
    goto LABEL_7;
LABEL_8:
  if (__OFADD__(v7++, 1))
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    return result;
  }
  if (v7 >= v30)
    goto LABEL_40;
  v11 = *(_QWORD *)(v29 + 8 * v7);
  if (v11)
    goto LABEL_16;
  v12 = v7 + 1;
  if (v7 + 1 >= v30)
    goto LABEL_40;
  v11 = *(_QWORD *)(v29 + 8 * v12);
  if (v11)
  {
LABEL_15:
    v7 = v12;
    goto LABEL_16;
  }
  v12 = v7 + 2;
  if (v7 + 2 >= v30)
    goto LABEL_40;
  v11 = *(_QWORD *)(v29 + 8 * v12);
  if (v11)
    goto LABEL_15;
  v28 = v7 + 3;
  if (v7 + 3 >= v30)
  {
LABEL_40:
    swift_release();
    return v37;
  }
  v11 = *(_QWORD *)(v29 + 8 * v28);
  for (v7 += 3; !v11; ++v28)
  {
    v7 = v28 + 1;
    if (__OFADD__(v28, 1))
      goto LABEL_42;
    if (v7 >= v30)
      goto LABEL_40;
    v11 = *(_QWORD *)(v29 + 8 * v7);
  }
LABEL_16:
  v4 = (v11 - 1) & v11;
  for (i = __clz(__rbit64(v11)) + (v7 << 6); ; i = v8 | (v7 << 6))
  {
    v13 = *(_BYTE *)(*(_QWORD *)(a1 + 48) + i);
    sub_24547C388(*(_QWORD *)(a1 + 56) + 40 * i, (uint64_t)v36 + 8);
    LOBYTE(v36[0]) = v13;
    v35[0] = v36[0];
    v35[1] = v36[1];
    v35[2] = v36[2];
    sub_24546DE54(v5, v32);
    if (v1)
      break;
    v14 = v32[0];
    if (v32[0])
    {
      v15 = v35[0];
      v33 = v35[0];
      v16 = v5;
      sub_24546A54C(v5, (uint64_t)v38);
      v17 = v37;
      v18 = *(_QWORD *)(v37 + 16);
      if (*(_QWORD *)(v37 + 24) <= v18)
      {
        sub_245473600(v18 + 1, 1);
        v17 = v37;
      }
      sub_24549A51C();
      PeopleSuggesterMetricsField.rawValue.getter();
      sub_24549A0D8();
      swift_bridgeObjectRelease();
      result = sub_24549A54C();
      v19 = v17 + 64;
      v20 = -1 << *(_BYTE *)(v17 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v17 + 64 + 8 * (v21 >> 6))) != 0)
      {
        v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v17 + 64 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v19 + 8 * v22);
        }
        while (v27 == -1);
        v23 = __clz(__rbit64(~v27)) + (v22 << 6);
      }
      *(_QWORD *)(v19 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      *(_BYTE *)(*(_QWORD *)(v17 + 48) + v23) = v15;
      *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v23) = v14;
      ++*(_QWORD *)(v17 + 16);
      result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
      v5 = v16;
      if (!v4)
        goto LABEL_8;
    }
    else
    {
      result = sub_24546AC30((uint64_t)v35, &qword_257473AF0);
      if (!v4)
        goto LABEL_8;
    }
LABEL_7:
    v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
  }
  sub_24546AC30((uint64_t)v35, &qword_257473AF0);
  swift_release();
  return swift_release();
}

uint64_t sub_24546C734(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t i;
  unint64_t v11;
  int64_t v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v18;
  int64_t v19;
  uint64_t v20[9];
  char v21;
  uint64_t v22;
  _OWORD v23[3];
  _OWORD v24[3];
  uint64_t v25;
  uint64_t *v26;

  v3 = MEMORY[0x24BEE4B00];
  v25 = MEMORY[0x24BEE4B00];
  v18 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v19 = (unint64_t)(v4 + 63) >> 6;
  v26 = &v22;
  swift_bridgeObjectRetain();
  v7 = 0;
  if (v6)
    goto LABEL_7;
LABEL_8:
  if (__OFADD__(v7++, 1))
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v7 >= v19)
    goto LABEL_29;
  v11 = *(_QWORD *)(v18 + 8 * v7);
  if (!v11)
  {
    v12 = v7 + 1;
    if (v7 + 1 >= v19)
      goto LABEL_29;
    v11 = *(_QWORD *)(v18 + 8 * v12);
    if (v11)
      goto LABEL_15;
    v12 = v7 + 2;
    if (v7 + 2 >= v19)
      goto LABEL_29;
    v11 = *(_QWORD *)(v18 + 8 * v12);
    if (v11)
    {
LABEL_15:
      v7 = v12;
      goto LABEL_16;
    }
    v16 = v7 + 3;
    if (v7 + 3 >= v19)
      goto LABEL_29;
    v11 = *(_QWORD *)(v18 + 8 * v16);
    v7 += 3;
    if (v11)
      goto LABEL_16;
    while (1)
    {
      v7 = v16 + 1;
      if (__OFADD__(v16, 1))
        break;
      if (v7 >= v19)
        goto LABEL_29;
      v11 = *(_QWORD *)(v18 + 8 * v7);
      ++v16;
      if (v11)
        goto LABEL_16;
    }
LABEL_31:
    __break(1u);
    JUMPOUT(0x24546CD28);
  }
LABEL_16:
  v6 = (v11 - 1) & v11;
  for (i = __clz(__rbit64(v11)) + (v7 << 6); ; i = v8 | (v7 << 6))
  {
    v13 = *(_BYTE *)(*(_QWORD *)(a1 + 48) + i);
    sub_24547C388(*(_QWORD *)(a1 + 56) + 40 * i, (uint64_t)v24 + 8);
    LOBYTE(v24[0]) = v13;
    v23[0] = v24[0];
    v23[1] = v24[1];
    v23[2] = v24[2];
    sub_24546DE54((_QWORD *)v23 + 1, v20);
    if (v1)
      break;
    if (v20[0])
    {
      v14 = LOBYTE(v23[0]);
      v21 = v23[0];
      sub_24546A54C((_OWORD *)((char *)v23 + 8), (uint64_t)v26);
      v15 = *(_QWORD *)(v3 + 16);
      if (*(_QWORD *)(v3 + 24) <= v15)
        sub_2454747B4(v15 + 1, 1);
      sub_24549A51C();
      __asm { BR              X8 }
    }
    sub_24546AC30((uint64_t)v23, &qword_257473AB0);
    if (!v6)
      goto LABEL_8;
LABEL_7:
    v8 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
  }
  sub_24546AC30((uint64_t)v23, &qword_257473AB0);
  swift_release();
LABEL_29:
  swift_release();
  return v3;
}

uint64_t static PeopleSuggesterMetricsCollector.getMetrics()@<X0>(_QWORD *a1@<X8>)
{
  unint64_t v1;
  char *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  double v13;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  double v20;
  unint64_t v21;
  int v22;
  unsigned int v23;
  char *v24;
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
  char v39;
  uint64_t v40;
  char v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  char v58;
  uint64_t v59;
  char v60;
  char v61;
  int64_t v62;
  char v63;
  char isUniquelyReferenced_nonNull_native;
  char v65;
  unint64_t v66;
  uint64_t v67;
  _BOOL8 v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  char v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  char v78;
  uint64_t v79;
  BOOL v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  unint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  char v90;
  BOOL v91;
  int64_t v92;
  uint64_t v93;
  BOOL v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t *v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  unint64_t v116;
  unint64_t v117;
  _QWORD *v118;
  char *v119;
  uint64_t v120;
  void (*v121)(uint64_t, uint64_t);
  uint64_t result;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  __int128 v135;
  uint64_t v136;
  _UNKNOWN **v137;
  _QWORD *v138;
  uint64_t *v139;
  __int128 v140;
  uint64_t v141;
  __int128 v142;
  __int128 v143;
  _UNKNOWN **v144;
  uint64_t *v145;
  unint64_t v146;
  unint64_t v147;

  v126 = a1;
  v4 = sub_245499FB8();
  v125 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  inited = (uint64_t)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BEE4AF8];
  v147 = sub_24546795C(MEMORY[0x24BEE4AF8]);
  v146 = sub_245467A78(v7);
  v134 = inited;
  sub_245499FAC();
  collectPeopleSuggestionEvents()(&v142);
  v8 = v142;
  v129 = v143;
  v130 = *((_QWORD *)&v142 + 1);
  v128 = *((_QWORD *)&v143 + 1);
  if ((unint64_t)v142 >> 62)
    goto LABEL_51;
  v9 = *(_QWORD *)((v142 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  while (1)
  {
    v131 = (char *)v8;
    v127 = v4;
    if (v9)
    {
      if (v9 >= 1)
      {
        v10 = 0;
        v4 = 0;
        v11 = v8 & 0xC000000000000001;
        v1 = 0x43E0000000000000;
        while (1)
        {
          v12 = v11 ? (char *)MEMORY[0x249534988](v10, v8) : (char *)*(id *)(v8 + 8 * v10 + 32);
          v2 = v12;
          inited = v134;
          sub_245499F70();
          if ((~*(_QWORD *)&v13 & 0x7FF0000000000000) == 0)
            break;
          if (v13 <= -9.22337204e18)
            goto LABEL_46;
          if (v13 >= 9.22337204e18)
            goto LABEL_47;
          v14 = (uint64_t)v13;
          if (((uint64_t)v13 & 0x8000000000000000) == 0)
          {
            if (v14 < 0x24EA00)
              v15 = 2;
            else
              v15 = 3;
            if (v14 < 0x93A80)
              v15 = 1;
            if (v14 >= 0x15180)
              inited = v15;
            else
              inited = 0;
            v3 = v2;
            v16 = swift_bridgeObjectRetain();
            sub_245479C84(v16, &v147, inited, (uint64_t)v3);
            v8 = (uint64_t)v131;
            swift_bridgeObjectRelease();

          }
          if (v9 == ++v10)
            goto LABEL_24;
        }
        __break(1u);
LABEL_46:
        __break(1u);
LABEL_47:
        __break(1u);
        goto LABEL_48;
      }
LABEL_151:
      __break(1u);
      goto LABEL_152;
    }
    v4 = 0;
LABEL_24:
    swift_bridgeObjectRelease_n();
    collectAppSuggestionEvents()(&v142);
    v123 = v143;
    v124 = v142;
    v17 = v142;
    if ((unint64_t)v142 >> 62)
      break;
    v18 = *(_QWORD *)((v142 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
    if (!v18)
      goto LABEL_59;
LABEL_26:
    if (v18 < 1)
    {
      __break(1u);
      goto LABEL_154;
    }
    v8 = 0;
    v1 = v17 & 0xC000000000000001;
    while (1)
    {
      v19 = v1 ? (char *)MEMORY[0x249534988](v8, v17) : (char *)*(id *)(v17 + 8 * v8 + 32);
      v2 = v19;
      sub_245499F70();
      if ((~*(_QWORD *)&v20 & 0x7FF0000000000000) == 0)
        break;
      if (v20 <= -9.22337204e18)
        goto LABEL_49;
      if (v20 >= 9.22337204e18)
        goto LABEL_50;
      v21 = (uint64_t)v20;
      if (((uint64_t)v20 & 0x8000000000000000) == 0)
      {
        if (v21 < 0x24EA00)
          v22 = 2;
        else
          v22 = 3;
        if (v21 < 0x93A80)
          v22 = 1;
        if (v21 >= 0x15180)
          v23 = v22;
        else
          v23 = 0;
        v3 = *(uint64_t **)&v2[OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_inferenceModels];
        v24 = v2;
        v25 = swift_bridgeObjectRetain();
        sub_245479F68(v25, &v146, v23, (uint64_t)v24);
        swift_bridgeObjectRelease();

      }
      if (v18 == ++v8)
        goto LABEL_59;
    }
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    if (v8 < 0)
      inited = v8;
    else
      inited = v8 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n();
    v9 = sub_24549A3FC();
  }
  if ((uint64_t)v142 < 0)
    inited = v142;
  else
    inited = v142 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain_n();
  v18 = sub_24549A3FC();
  if (v18)
    goto LABEL_26;
LABEL_59:
  v26 = swift_bridgeObjectRelease_n();
  v27 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v142 = MEMORY[0x24BEE4AF8];
  MEMORY[0x24BDAC7A8](v26);
  *((_QWORD *)&v123 - 2) = &v142;
  v28 = swift_bridgeObjectRetain();
  sub_245479ABC(v28, (void (*)(void **, _BYTE *))sub_24547C2E8);
  v29 = swift_bridgeObjectRelease();
  v30 = v142;
  *(_QWORD *)&v142 = v27;
  MEMORY[0x24BDAC7A8](v29);
  *((_QWORD *)&v123 - 2) = &v142;
  v31 = swift_bridgeObjectRetain();
  sub_2454798E8(v31, (void (*)(_QWORD *, _BYTE *))sub_24547C300);
  v132 = 0;
  swift_bridgeObjectRelease();
  v32 = v142;
  *(_QWORD *)&v142 = v30;
  sub_245466220(v32);
  v33 = v142;
  v145 = (uint64_t *)v142;
  v133 = sub_24546E514(v134);
  swift_bridgeObjectRelease();
  v34 = *(_QWORD *)(v33 + 16);
  v1 = (unint64_t)&unk_257473000;
  v3 = &qword_257477C40;
  if (!v34)
  {
LABEL_80:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574739F8);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24549B250;
    *(_BYTE *)(inited + 32) = 36;
    if (qword_257473398 == -1)
    {
LABEL_81:
      v44 = *v3;
      v43 = v3[1];
      *(_QWORD *)(inited + 64) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(inited + 72) = &protocol witness table for String;
      *(_QWORD *)(inited + 40) = v44;
      *(_QWORD *)(inited + 48) = v43;
      swift_bridgeObjectRetain();
      v45 = sub_245467BA0(inited);
      v46 = v145;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v46 = sub_245471DD8(0, v46[2] + 1, 1, v46, &qword_257473A68, &qword_257473898);
      v2 = v131;
      v48 = v46[2];
      v47 = v46[3];
      if (v48 >= v47 >> 1)
        v46 = sub_245471DD8((_QWORD *)(v47 > 1), v48 + 1, 1, v46, &qword_257473A68, &qword_257473898);
      v46[2] = v48 + 1;
      v46[v48 + 4] = v45;
      v145 = v46;
      goto LABEL_88;
    }
LABEL_152:
    swift_once();
    goto LABEL_81;
  }
  swift_bridgeObjectRetain_n();
  v35 = 0;
  while (2)
  {
    v36 = *(_QWORD *)(v33 + 8 * v35 + 32);
    v37 = *(_QWORD *)(v36 + 16);
    swift_bridgeObjectRetain();
    if (v37)
    {
      v38 = sub_245472930(36, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
      if ((v39 & 1) != 0
        && (sub_24547C388(*(_QWORD *)(v36 + 56) + 40 * v38, (uint64_t)&v142),
            __swift_instantiateConcreteTypeFromMangledName(&qword_257473A08),
            swift_dynamicCast()))
      {
        v37 = *((_QWORD *)&v140 + 1);
        v40 = v140;
      }
      else
      {
        v40 = 0;
        v37 = 0;
      }
    }
    else
    {
      v40 = 0;
    }
    if (qword_257473398 == -1)
    {
      if (v37)
        goto LABEL_71;
LABEL_61:
      swift_bridgeObjectRelease();
LABEL_62:
      if (v34 == ++v35)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_80;
      }
      continue;
    }
    break;
  }
  swift_once();
  if (!v37)
    goto LABEL_61;
LABEL_71:
  if (v40 != qword_257477C40 || v37 != *(_QWORD *)algn_257477C48)
  {
    v42 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v42 & 1) != 0)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_87;
    }
    goto LABEL_62;
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_87:
  v2 = v131;
LABEL_88:
  v49 = v145;
  v50 = v145[2];
  if (!v50)
  {
    swift_bridgeObjectRelease();
    goto LABEL_113;
  }
  swift_bridgeObjectRetain();
  v51 = 0;
  while (2)
  {
    v52 = v49[v51 + 4];
    v53 = *(_QWORD *)(v52 + 16);
    swift_bridgeObjectRetain();
    if (v53)
    {
      v54 = sub_245472930(36, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
      if ((v55 & 1) != 0)
      {
        sub_24547C388(*(_QWORD *)(v52 + 56) + 40 * v54, (uint64_t)&v142);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257473A08);
        if (swift_dynamicCast())
        {
          v56 = *((_QWORD *)&v140 + 1);
          v53 = v140;
          goto LABEL_98;
        }
      }
      v53 = 0;
    }
    v56 = 0;
LABEL_98:
    if (*(_QWORD *)(v1 + 920) == -1)
    {
      if (v56)
        goto LABEL_100;
LABEL_90:
      swift_bridgeObjectRelease();
LABEL_91:
      if (v50 == ++v51)
      {
        swift_bridgeObjectRelease();
        goto LABEL_112;
      }
      continue;
    }
    break;
  }
  swift_once();
  if (!v56)
    goto LABEL_90;
LABEL_100:
  if (v53 != *v3 || v56 != v3[1])
  {
    v58 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v58 & 1) != 0)
      goto LABEL_111;
    goto LABEL_91;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_111:
  swift_bridgeObjectRelease();
  *(_QWORD *)&v142 = v51;
  *(_QWORD *)&v140 = 0;
  LOBYTE(v135) = 0;
  v59 = v133;
  sub_24546E8B8((unsigned __int8 *)&v135, v133, &v140);
  LOBYTE(v135) = 1;
  sub_24546E8B8((unsigned __int8 *)&v135, v59, &v140);
  LOBYTE(v135) = 2;
  sub_24546E8B8((unsigned __int8 *)&v135, v59, &v140);
  LOBYTE(v135) = 3;
  sub_24546E8B8((unsigned __int8 *)&v135, v59, &v140);
LABEL_112:
  swift_bridgeObjectRelease();
  v2 = v131;
LABEL_113:
  v60 = sub_24546A780();
  v3 = v145;
  if (v60 != 2)
  {
    v61 = v60 & 1;
    v62 = v145[2];
    if (!v62)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574739F8);
      v86 = swift_initStackObject();
      *(_OWORD *)(v86 + 16) = xmmword_24549B250;
      *(_BYTE *)(v86 + 32) = 35;
      *(_QWORD *)(v86 + 64) = MEMORY[0x24BEE1328];
      *(_QWORD *)(v86 + 72) = &protocol witness table for Bool;
      *(_BYTE *)(v86 + 40) = v61 ^ 1;
      inited = sub_245467BA0(v86);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      {
LABEL_134:
        v88 = v3[2];
        v87 = v3[3];
        if (v88 >= v87 >> 1)
          v3 = sub_245471DD8((_QWORD *)(v87 > 1), v88 + 1, 1, v3, &qword_257473A68, &qword_257473898);
        v3[2] = v88 + 1;
        v3[v88 + 4] = inited;
        v145 = v3;
        goto LABEL_137;
      }
LABEL_154:
      v3 = sub_245471DD8(0, v3[2] + 1, 1, v3, &qword_257473A68, &qword_257473898);
      goto LABEL_134;
    }
    v139 = (uint64_t *)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_245477E2C(0, v62, 0);
    v1 = 0;
    v63 = v61 ^ 1;
    while (2)
    {
      inited = v3[v1 + 4];
      *((_QWORD *)&v143 + 1) = MEMORY[0x24BEE1328];
      v144 = &protocol witness table for Bool;
      LOBYTE(v142) = v63;
      sub_24546A54C(&v142, (uint64_t)&v140);
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v138 = (_QWORD *)inited;
      v66 = sub_245472930(35, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
      v67 = *(_QWORD *)(inited + 16);
      v68 = (v65 & 1) == 0;
      v69 = v67 + v68;
      if (__OFADD__(v67, v68))
      {
        __break(1u);
LABEL_150:
        __break(1u);
        goto LABEL_151;
      }
      v70 = v65;
      if (*(_QWORD *)(inited + 24) >= v69)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v73 = v138;
          if ((v65 & 1) == 0)
            goto LABEL_120;
        }
        else
        {
          sub_245476E48(&qword_257473888);
          v73 = v138;
          if ((v70 & 1) == 0)
            goto LABEL_120;
        }
      }
      else
      {
        sub_245472FDC(v69, isUniquelyReferenced_nonNull_native);
        v71 = sub_245472930(35, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
        if ((v70 & 1) != (v72 & 1))
        {
          result = sub_24549A4E0();
          __break(1u);
          return result;
        }
        v66 = v71;
        v73 = v138;
        if ((v70 & 1) == 0)
        {
LABEL_120:
          inited = v141;
          v74 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v140, v141);
          MEMORY[0x24BDAC7A8](v74);
          v76 = (char *)&v123 - ((v75 + 15) & 0xFFFFFFFFFFFFFFF0);
          (*(void (**)(char *))(v77 + 16))(v76);
          v78 = *v76;
          v136 = MEMORY[0x24BEE1328];
          v137 = &protocol witness table for Bool;
          LOBYTE(v135) = v78;
          v73[(v66 >> 6) + 8] |= 1 << v66;
          *(_BYTE *)(v73[6] + v66) = 35;
          sub_24546A54C(&v135, v73[7] + 40 * v66);
          v79 = v73[2];
          v80 = __OFADD__(v79, 1);
          v81 = v79 + 1;
          if (v80)
            goto LABEL_150;
          v73[2] = v81;
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v140);
          goto LABEL_125;
        }
      }
      v82 = v73[7] + 40 * v66;
      __swift_destroy_boxed_opaque_existential_1Tm(v82);
      sub_24546A54C(&v140, v82);
LABEL_125:
      swift_bridgeObjectRelease();
      v83 = v139;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_245477E2C(0, v83[2] + 1, 1);
        v83 = v139;
      }
      v85 = v83[2];
      v84 = v83[3];
      if (v85 >= v84 >> 1)
      {
        sub_245477E2C(v84 > 1, v85 + 1, 1);
        v83 = v139;
      }
      ++v1;
      v83[2] = v85 + 1;
      v83[v85 + 4] = (uint64_t)v73;
      if (v62 == v1)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v145 = v83;
        v2 = v131;
        goto LABEL_138;
      }
      continue;
    }
  }
LABEL_137:
  v83 = v3;
LABEL_138:
  *(_QWORD *)&v142 = v2;
  *((_QWORD *)&v142 + 1) = v130;
  *(_QWORD *)&v143 = v129;
  *((_QWORD *)&v143 + 1) = v128;
  v89 = sub_24548D32C();
  v90 = sub_24547A488(v89, v134);
  swift_bridgeObjectRelease();
  v91 = sub_24546A8F8();
  v92 = v83[2];
  v93 = MEMORY[0x24BEE4AF8];
  if (v92)
  {
    v94 = v91;
    *(_QWORD *)&v135 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_245477E2C(0, v92, 0);
    v95 = 0;
    LODWORD(v132) = v94;
    v133 = v92;
    do
    {
      v96 = v83[v95 + 4];
      *((_QWORD *)&v143 + 1) = MEMORY[0x24BEE1328];
      v144 = &protocol witness table for Bool;
      LOBYTE(v142) = v132;
      sub_24546A54C(&v142, (uint64_t)&v140);
      swift_bridgeObjectRetain_n();
      v97 = swift_isUniquelyReferenced_nonNull_native();
      v139 = (uint64_t *)v96;
      v98 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v140, v141);
      MEMORY[0x24BDAC7A8](v98);
      v100 = (char *)&v123 - ((v99 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v101 + 16))(v100);
      sub_245478CD8(*v100, 3, v97, &v139);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v140);
      v102 = v139;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v142 = 5;
      v103 = sub_24549A498();
      *((_QWORD *)&v143 + 1) = MEMORY[0x24BEE0D00];
      v144 = &protocol witness table for String;
      *(_QWORD *)&v142 = v103;
      *((_QWORD *)&v142 + 1) = v104;
      sub_24546A54C(&v142, (uint64_t)&v140);
      v105 = swift_isUniquelyReferenced_nonNull_native();
      v139 = v102;
      v106 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v140, v141);
      MEMORY[0x24BDAC7A8](v106);
      v108 = (uint64_t *)((char *)&v123 - ((v107 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v109 + 16))(v108);
      sub_245478E8C(*v108, v108[1], 4, v105, &v139);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v140);
      v110 = v139;
      swift_bridgeObjectRelease();
      if (v90 != 4)
      {
        *((_QWORD *)&v143 + 1) = &type metadata for UsageFrequency;
        v144 = (_UNKNOWN **)sub_24547C344();
        LOBYTE(v142) = v90;
        sub_24546A54C(&v142, (uint64_t)&v140);
        v111 = swift_isUniquelyReferenced_nonNull_native();
        v139 = v110;
        v112 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v140, v141);
        MEMORY[0x24BDAC7A8](v112);
        v114 = (char *)&v123 - ((v113 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v115 + 16))(v114);
        sub_245479044(*v114, 40, v111, &v139);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v140);
        v110 = v139;
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      v93 = v135;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_245477E2C(0, *(_QWORD *)(v93 + 16) + 1, 1);
        v93 = v135;
      }
      v117 = *(_QWORD *)(v93 + 16);
      v116 = *(_QWORD *)(v93 + 24);
      if (v117 >= v116 >> 1)
      {
        sub_245477E2C(v116 > 1, v117 + 1, 1);
        v93 = v135;
      }
      ++v95;
      *(_QWORD *)(v93 + 16) = v117 + 1;
      *(_QWORD *)(v93 + 8 * v117 + 32) = v110;
    }
    while (v133 != v95);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v145 = (uint64_t *)v93;
  v118 = v126;
  v119 = v131;
  *v126 = v93;
  v118[1] = v119;
  v120 = v129;
  v118[2] = v130;
  v118[3] = v120;
  v118[4] = v128;
  *(_OWORD *)(v118 + 5) = v124;
  *(_OWORD *)(v118 + 7) = v123;
  v121 = *(void (**)(uint64_t, uint64_t))(v125 + 8);
  swift_bridgeObjectRetain();
  v121(v134, v127);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24546DE54@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  void *v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18[5];
  _BYTE v19[40];
  uint64_t v20;

  v5 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  result = sub_24546C01C(1, v5);
  if (v2)
  {
    if (qword_254413850 != -1)
      swift_once();
    v7 = sub_24549A078();
    __swift_project_value_buffer(v7, (uint64_t)qword_254413928);
    sub_24547C388((uint64_t)a1, (uint64_t)v19);
    v8 = v2;
    v9 = v2;
    v10 = sub_24549A060();
    v11 = sub_24549A1E0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v13 = (_QWORD *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v20 = v14;
      *(_DWORD *)v12 = 138412546;
      v15 = v2;
      v18[0] = _swift_stdlib_bridgeErrorToNSError();
      sub_24549A258();
      *v13 = v18[0];

      *(_WORD *)(v12 + 12) = 2080;
      sub_24547C388((uint64_t)v19, (uint64_t)v18);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257473A08);
      v16 = sub_24549A0C0();
      v18[0] = sub_2454720F4(v16, v17, &v20);
      sub_24549A258();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
      _os_log_impl(&dword_245461000, v10, v11, "%@: %s", (uint8_t *)v12, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254413840);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v13, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v14, -1, -1);
      MEMORY[0x2495350C0](v12, -1, -1);

    }
    else
    {

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
    }
    result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t PeopleSuggesterMetricsCollector.Result.metrics.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PeopleSuggesterMetricsCollector.Result.peopleSuggestionsJoiningResult.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[1];
  v3 = v1[2];
  v5 = v1[3];
  v4 = v1[4];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t PeopleSuggesterMetricsCollector.Result.appSuggestionsJoiningResult.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1[5];
  v3 = v1[6];
  v5 = v1[7];
  v4 = v1[8];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v5;
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

void sub_24546E1A0(id *a1, _QWORD *a2, unsigned int a3, uint64_t a4)
{
  char v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  char v13;
  int v14;
  int v15;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  unsigned int v29;
  _QWORD *v30;

  v7 = *(_QWORD *)(a4 + OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagement);
  v8 = *(_QWORD *)(a4 + OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagedModelRanks);
  v9 = *(_QWORD *)(v8 + 16);
  v10 = *a1;
  v11 = v10;
  v29 = a3;
  v28 = v7;
  if (v9 && (v12 = sub_245472894((uint64_t)v10), (v13 & 1) != 0))
  {
    v14 = 0;
    v15 = *(unsigned __int8 *)(*(_QWORD *)(v8 + 56) + v12);
  }
  else
  {
    v15 = 0;
    v14 = 1;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v17 = (_QWORD *)*a2;
  v30 = (_QWORD *)*a2;
  *a2 = 0x8000000000000000;
  v19 = sub_245472894((uint64_t)v11);
  v20 = v17[2];
  v21 = (v18 & 1) == 0;
  v22 = v20 + v21;
  if (__OFADD__(v20, v21))
  {
    __break(1u);
    goto LABEL_14;
  }
  v4 = v18;
  if (v17[3] >= v22)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_10;
LABEL_14:
    sub_245477000();
    v17 = v30;
    goto LABEL_10;
  }
  sub_2454744C8(v22, isUniquelyReferenced_nonNull_native);
  v17 = v30;
  v23 = sub_245472894((uint64_t)v11);
  if ((v4 & 1) != (v24 & 1))
  {
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    sub_24549A4E0();
    __break(1u);
    return;
  }
  v19 = v23;
LABEL_10:
  *a2 = v17;
  swift_bridgeObjectRelease();
  v25 = (_QWORD *)*a2;
  if ((v4 & 1) == 0)
  {
    v26 = sub_24546A088(MEMORY[0x24BEE4AF8]);
    sub_245496088(v19, (uint64_t)v11, 0, v26, v25);
    v27 = v11;
  }
  sub_24546BBA0(v29, v28, v15 | (v14 << 8));

}

uint64_t sub_24546E34C(uint64_t *a1, _QWORD *a2, unsigned int a3, uint64_t a4)
{
  char v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v14;
  int v15;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL8 v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t result;
  uint64_t v28;
  unsigned int v29;
  _QWORD *v30;

  v8 = *a1;
  v7 = a1[1];
  v9 = *(_QWORD *)(a4 + OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_engagement);
  v10 = *(_QWORD *)(a4 + OBJC_IVAR____TtC15ReportingPlugin24AppSuggestionsJointEvent_engagedModelRanks);
  v11 = *(_QWORD *)(v10 + 16);
  swift_bridgeObjectRetain();
  v29 = a3;
  v28 = v9;
  if (v11 && (v12 = sub_245472734(v8, v7), (v13 & 1) != 0))
  {
    v14 = 0;
    v15 = *(unsigned __int8 *)(*(_QWORD *)(v10 + 56) + v12);
  }
  else
  {
    v15 = 0;
    v14 = 1;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v17 = (_QWORD *)*a2;
  v30 = (_QWORD *)*a2;
  *a2 = 0x8000000000000000;
  v19 = sub_245472734(v8, v7);
  v20 = v17[2];
  v21 = (v18 & 1) == 0;
  v22 = v20 + v21;
  if (__OFADD__(v20, v21))
  {
    __break(1u);
    goto LABEL_14;
  }
  v4 = v18;
  if (v17[3] >= v22)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      goto LABEL_10;
LABEL_14:
    sub_2454771BC();
    v17 = v30;
    goto LABEL_10;
  }
  sub_245474D8C(v22, isUniquelyReferenced_nonNull_native);
  v17 = v30;
  v23 = sub_245472734(v8, v7);
  if ((v4 & 1) != (v24 & 1))
  {
    result = sub_24549A4E0();
    __break(1u);
    return result;
  }
  v19 = v23;
LABEL_10:
  *a2 = v17;
  swift_bridgeObjectRelease();
  v25 = (_QWORD *)*a2;
  if ((v4 & 1) == 0)
  {
    v26 = sub_24546A088(MEMORY[0x24BEE4AF8]);
    sub_2454960D4(v19, v8, v7, 0, v26, v25);
    swift_bridgeObjectRetain();
  }
  sub_24546BBA0(v29, v28, v15 | (v14 << 8));
  return swift_bridgeObjectRelease();
}

uint64_t sub_24546E514(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t aBlock;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;

  v2 = sub_245499FB8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = swift_allocObject();
  v26 = v5;
  *(_QWORD *)(v5 + 16) = MEMORY[0x24BEE4B00];
  v28 = (uint64_t *)(v5 + 16);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = MEMORY[0x24BEE4AF8];
  v27 = v6 + 16;
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = MEMORY[0x24BEE4B08];
  v7 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v8 = objc_msgSend(v7, sel_ShareSheet);
  swift_unknownObjectRelease();
  v9 = objc_msgSend(v8, sel_Feedback);
  swift_unknownObjectRelease();
  v10 = objc_msgSend((id)objc_opt_self(), sel_reversed);
  v24 = objc_msgSend(v9, sel_publisherWithOptions_, v10);

  v33 = sub_24547CEF0;
  v34 = v6;
  aBlock = MEMORY[0x24BDAC760];
  v30 = 1107296256;
  v31 = sub_24546F4BC;
  v32 = &block_descriptor;
  v11 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  v12 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v12, a1, v2);
  v13 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v14 = (v4 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = (v14 + 15) & 0xFFFFFFFFFFFFFFF8;
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v16 + v13, v12, v2);
  *(_QWORD *)(v16 + v14) = v6;
  v17 = v26;
  *(_QWORD *)(v16 + v15) = v25;
  *(_QWORD *)(v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8)) = v17;
  v33 = sub_24547CFAC;
  v34 = v16;
  aBlock = MEMORY[0x24BDAC760];
  v30 = 1107296256;
  v31 = sub_24546FBCC;
  v32 = &block_descriptor_12;
  v18 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  v19 = v24;
  v20 = objc_msgSend(v24, sel_sinkWithCompletion_shouldContinue_, v11, v18);
  _Block_release(v18);
  _Block_release(v11);

  v21 = v28;
  swift_beginAccess();
  v22 = *v21;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  swift_release();
  swift_release();
  return v22;
}

void sub_24546E8B8(unsigned __int8 *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  unint64_t v6;
  char v7;
  uint64_t v8;

  v4 = *a1;
  if (*(_QWORD *)(a2 + 16) && (v6 = sub_2454728C4(*a1), (v7 & 1) != 0))
    v8 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v6);
  else
    v8 = 0;
  if (!__CFADD__(*a3, v8))
  {
    *a3 += v8;
    __asm { BR              X10 }
  }
  __break(1u);
  JUMPOUT(0x24546F174);
}

void sub_24546F2BC(void *a1, uint64_t a2)
{
  _QWORD **v4;
  id v5;
  void *v6;
  _QWORD *v7;
  id v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  unint64_t v20;
  unint64_t v21;

  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    v4 = (_QWORD **)(a2 + 16);
    v5 = objc_msgSend(a1, sel_error);
    if (v5)
    {
      v6 = v5;
      swift_beginAccess();
      v7 = *v4;
      v8 = v6;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v4 = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v7 = sub_24547186C(0, v7[2] + 1, 1, v7);
        *v4 = v7;
      }
      v11 = v7[2];
      v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        v7 = sub_24547186C((_QWORD *)(v10 > 1), v11 + 1, 1, v7);
        *v4 = v7;
      }
      v7[2] = v11 + 1;
      v7[v11 + 4] = v8;
      swift_endAccess();

    }
    else
    {
      v12 = objc_msgSend(a1, sel_description);
      v13 = sub_24549A0B4();
      v15 = v14;

      sub_24546A66C();
      v16 = swift_allocError();
      *(_QWORD *)v17 = v13;
      *(_QWORD *)(v17 + 8) = v15;
      *(_BYTE *)(v17 + 16) = 2;
      swift_beginAccess();
      v18 = *v4;
      v19 = swift_isUniquelyReferenced_nonNull_native();
      *v4 = v18;
      if ((v19 & 1) == 0)
      {
        v18 = sub_24547186C(0, v18[2] + 1, 1, v18);
        *v4 = v18;
      }
      v21 = v18[2];
      v20 = v18[3];
      if (v21 >= v20 >> 1)
      {
        v18 = sub_24547186C((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
        *v4 = v18;
      }
      v18[2] = v21 + 1;
      v18[v21 + 4] = v16;
      swift_endAccess();
    }
  }
}

void sub_24546F4BC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_24546F50C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  __objc2_ivar *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t result;
  char v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char v37;
  id v38;
  unsigned int v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  uint64_t v49;
  _BOOL8 v50;
  uint64_t v51;
  unint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  unint64_t v60;

  v8 = sub_245499FB8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (uint64_t *)(a3 + 16);
  v13 = &stru_25165E000;
  objc_msgSend(a1, sel_timestamp);
  sub_245499F64();
  v24 = sub_24547CC28();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (v24 == 3)
    return 0;
  if (v24 == 4)
  {
    v59 = 0;
    v60 = 0xE000000000000000;
    sub_24549A354();
LABEL_3:
    sub_24549A0E4();
    objc_msgSend(a1, (SEL)v13[43].offs);
    sub_24549A180();
    v14 = v59;
    v15 = v60;
    sub_24546A66C();
    v16 = swift_allocError();
    *(_QWORD *)v17 = v14;
    *(_QWORD *)(v17 + 8) = v15;
    *(_BYTE *)(v17 + 16) = 2;
    swift_beginAccess();
    v18 = (uint64_t *)*v12;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v12 = (uint64_t)v18;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v18 = sub_24547186C(0, v18[2] + 1, 1, v18);
      *v12 = (uint64_t)v18;
    }
    v21 = v18[2];
    v20 = v18[3];
    if (v21 >= v20 >> 1)
    {
      v18 = sub_24547186C((_QWORD *)(v20 > 1), v21 + 1, 1, v18);
      *v12 = (uint64_t)v18;
    }
    v18[2] = v21 + 1;
    v18[v21 + 4] = v16;
    swift_endAccess();
    return 1;
  }
  v25 = (uint64_t)&stru_25165E000;
  v26 = objc_msgSend(a1, sel_eventBody);
  if (!v26)
    return 1;
  v27 = v26;
  v28 = objc_msgSend(v26, sel_timeouts);

  sub_24547D17C(0, &qword_2544137E0);
  v29 = sub_24549A12C();

  if (v29 >> 62)
  {
LABEL_44:
    swift_bridgeObjectRetain();
    v30 = sub_24549A3FC();
    swift_bridgeObjectRelease();
    if (v30)
      goto LABEL_15;
LABEL_45:
    swift_bridgeObjectRelease();
    return 1;
  }
  v30 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v30)
    goto LABEL_45;
LABEL_15:
  v31 = objc_msgSend(a1, *(SEL *)(v25 + 1368));
  if (!v31
    || (v32 = v31, v33 = objc_msgSend(v31, sel_identifier), v32, !v33))
  {
    swift_bridgeObjectRelease();
    v59 = 0;
    v60 = 0xE000000000000000;
    sub_24549A354();
    goto LABEL_3;
  }
  v34 = sub_24549A0B4();
  v36 = v35;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v37 = sub_245492E08((uint64_t *)&v58, v34, v36);
  swift_endAccess();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    if (qword_254413850 != -1)
      swift_once();
    v40 = sub_24549A078();
    __swift_project_value_buffer(v40, (uint64_t)qword_254413928);
    swift_bridgeObjectRetain();
    v41 = sub_24549A060();
    v42 = sub_24549A1C8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = swift_slowAlloc();
      v59 = v44;
      *(_DWORD *)v43 = 136315138;
      swift_bridgeObjectRetain();
      v58 = (_QWORD *)sub_2454720F4(v34, v36, &v59);
      sub_24549A258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_245461000, v41, v42, "ignoring duplicate timeout session %s", v43, 0xCu);
      v22 = 1;
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v44, -1, -1);
      MEMORY[0x2495350C0](v43, -1, -1);

      return v22;
    }

LABEL_37:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  v12 = (uint64_t *)(a5 + 16);
  swift_bridgeObjectRelease();
  a5 = v29 & 0xC000000000000001;
  swift_bridgeObjectRetain();
  v25 = 4;
  while (1)
  {
    if (a5)
      v38 = (id)MEMORY[0x249534988](v25 - 4, v29);
    else
      v38 = *(id *)(v29 + 8 * v25);
    a1 = v38;
    v13 = (__objc2_ivar *)(v25 - 3);
    if (__OFADD__(v25 - 4, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    v39 = objc_msgSend(v38, sel_occurrence);

    if (v39 == 1)
      break;
    ++v25;
    if (v13 == (__objc2_ivar *)v30)
      goto LABEL_37;
  }
  swift_bridgeObjectRelease_n();
  swift_beginAccess();
  v45 = swift_isUniquelyReferenced_nonNull_native();
  v58 = (_QWORD *)*v12;
  v46 = (uint64_t)v58;
  *v12 = 0x8000000000000000;
  v48 = sub_2454728C4(v24);
  v49 = *(_QWORD *)(v46 + 16);
  v50 = (v47 & 1) == 0;
  v51 = v49 + v50;
  if (__OFADD__(v49, v50))
  {
    __break(1u);
    goto LABEL_47;
  }
  LOBYTE(a1) = v47;
  if (*(_QWORD *)(v46 + 24) >= v51)
  {
    if ((v45 & 1) == 0)
      goto LABEL_48;
    goto LABEL_39;
  }
  sub_2454750B8(v51, v45);
  v46 = (uint64_t)v58;
  v52 = sub_2454728C4(v24);
  if ((a1 & 1) == (v53 & 1))
  {
    v48 = v52;
    while (1)
    {
LABEL_39:
      *v12 = v46;
      swift_bridgeObjectRelease();
      v12 = (uint64_t *)*v12;
      swift_bridgeObjectRetain();
      if ((a1 & 1) == 0)
        sub_245496128(v48, v24, 0, v12);
      v54 = v12[7];
      v55 = *(_QWORD *)(v54 + 8 * v48);
      v56 = __CFADD__(v55, 1);
      v57 = v55 + 1;
      if (!v56)
        break;
LABEL_47:
      __break(1u);
LABEL_48:
      sub_24547737C();
      v46 = (uint64_t)v58;
    }
    *(_QWORD *)(v54 + 8 * v48) = v57;
    swift_endAccess();
    goto LABEL_45;
  }
  result = sub_24549A4E0();
  __break(1u);
  return result;
}

uint64_t sub_24546FBCC(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_24546FC1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD **a5)
{
  uint64_t inited;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v15;
  unint64_t v16;
  unsigned __int8 v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574739F8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24549B7A0;
  *(_BYTE *)(inited + 32) = 36;
  *(_QWORD *)(inited + 64) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = &protocol witness table for String;
  *(_QWORD *)(inited + 40) = a1;
  *(_QWORD *)(inited + 48) = a2;
  *(_BYTE *)(inited + 80) = 2;
  v11 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 112) = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 120) = &protocol witness table for Bool;
  *(_BYTE *)(inited + 88) = a3;
  *(_BYTE *)(inited + 128) = 1;
  *(_QWORD *)(inited + 160) = v11;
  *(_QWORD *)(inited + 168) = &protocol witness table for Bool;
  *(_BYTE *)(inited + 136) = a3;
  *(_BYTE *)(inited + 176) = 0;
  *(_QWORD *)(inited + 208) = v11;
  *(_QWORD *)(inited + 216) = &protocol witness table for Bool;
  *(_BYTE *)(inited + 184) = a3;
  swift_bridgeObjectRetain();
  v22 = sub_245467BA0(inited);
  v20 = 0;
  v21 = 0;
  v19 = sub_24546A1AC(MEMORY[0x24BEE4AF8]);
  v18 = 0;
  sub_2454702F4(&v18, (double *)&v21, a3, a4, &v20, (uint64_t *)&v19);
  v18 = 1;
  sub_2454702F4(&v18, (double *)&v21, a3, a4, &v20, (uint64_t *)&v19);
  v18 = 2;
  sub_2454702F4(&v18, (double *)&v21, a3, a4, &v20, (uint64_t *)&v19);
  v12 = v22;
  v13 = *a5;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a5 = v13;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v13 = sub_245471DD8(0, v13[2] + 1, 1, v13, &qword_257473A68, &qword_257473898);
    *a5 = v13;
  }
  v16 = v13[2];
  v15 = v13[3];
  if (v16 >= v15 >> 1)
  {
    v13 = sub_245471DD8((_QWORD *)(v15 > 1), v16 + 1, 1, v13, &qword_257473A68, &qword_257473898);
    *a5 = v13;
  }
  v13[2] = v16 + 1;
  v13[v16 + 4] = v12;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24546FE4C(uint64_t a1, char a2, uint64_t a3, _QWORD **a4)
{
  uint64_t inited;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v42;
  unint64_t v43;
  _QWORD **v45;
  _QWORD v46[3];
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  _UNKNOWN **v50;
  unsigned __int8 v51;
  uint64_t v52[29];
  uint64_t v53;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574739F8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24549B7A0;
  *(_BYTE *)(inited + 32) = 36;
  v9 = sub_24547154C();
  v10 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 64) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = &protocol witness table for String;
  *(_QWORD *)(inited + 40) = v9;
  *(_QWORD *)(inited + 48) = v11;
  *(_BYTE *)(inited + 80) = 2;
  v12 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 112) = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 120) = &protocol witness table for Bool;
  *(_BYTE *)(inited + 88) = a2;
  *(_BYTE *)(inited + 128) = 1;
  *(_QWORD *)(inited + 160) = v12;
  *(_QWORD *)(inited + 168) = &protocol witness table for Bool;
  *(_BYTE *)(inited + 136) = a2;
  *(_BYTE *)(inited + 176) = 0;
  *(_QWORD *)(inited + 208) = v12;
  *(_QWORD *)(inited + 216) = &protocol witness table for Bool;
  *(_BYTE *)(inited + 184) = a2;
  v13 = sub_245467BA0(inited);
  v53 = v13;
  v14 = *(char **)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  if (v14)
  {
    v15 = v13;
    v45 = a4;
    v16 = *(_QWORD *)&v14[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment];
    v17 = *(_QWORD *)&v14[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment + 8];
    v49 = v10;
    v50 = &protocol witness table for String;
    *(_QWORD *)&v48 = v16;
    *((_QWORD *)&v48 + 1) = v17;
    sub_24546A54C(&v48, (uint64_t)v46);
    v18 = v14;
    swift_bridgeObjectRetain();
    LOBYTE(v17) = swift_isUniquelyReferenced_nonNull_native();
    v52[0] = v15;
    v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v46, v47);
    MEMORY[0x24BDAC7A8](v19);
    v21 = (_QWORD *)((char *)&v46[-1] - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v22 + 16))(v21);
    sub_245478E8C(*v21, v21[1], 38, v17, v52);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
    v23 = v52[0];
    swift_bridgeObjectRelease();
    v24 = *(_QWORD *)&v18[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment];
    v25 = *(_QWORD *)&v18[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment + 8];
    v49 = v10;
    v50 = &protocol witness table for String;
    *(_QWORD *)&v48 = v24;
    *((_QWORD *)&v48 + 1) = v25;
    sub_24546A54C(&v48, (uint64_t)v46);
    swift_bridgeObjectRetain();
    LOBYTE(v25) = swift_isUniquelyReferenced_nonNull_native();
    v52[0] = v23;
    v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v46, v47);
    MEMORY[0x24BDAC7A8](v26);
    v28 = (_QWORD *)((char *)&v46[-1] - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v29 + 16))(v28);
    sub_245478E8C(*v28, v28[1], 39, v25, v52);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
    v30 = v52[0];
    swift_bridgeObjectRelease();
    v31 = *(_QWORD *)&v18[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment];
    v32 = *(_QWORD *)&v18[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment + 8];
    v49 = v10;
    v50 = &protocol witness table for String;
    *(_QWORD *)&v48 = v31;
    *((_QWORD *)&v48 + 1) = v32;
    sub_24546A54C(&v48, (uint64_t)v46);
    swift_bridgeObjectRetain();
    LOBYTE(v32) = swift_isUniquelyReferenced_nonNull_native();
    v52[0] = v30;
    v33 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v46, v47);
    MEMORY[0x24BDAC7A8](v33);
    v35 = (_QWORD *)((char *)&v46[-1] - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v36 + 16))(v35);
    v37 = v32;
    a4 = v45;
    sub_245478E8C(*v35, v35[1], 37, v37, v52);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
    v53 = v52[0];

    swift_bridgeObjectRelease();
  }
  *(_QWORD *)&v48 = 0;
  v46[0] = 0;
  v52[0] = sub_24546A1AC(MEMORY[0x24BEE4AF8]);
  v51 = 0;
  v38 = a2 & 1;
  sub_2454702F4(&v51, (double *)&v48, v38, a3, v46, v52);
  v51 = 1;
  sub_2454702F4(&v51, (double *)&v48, v38, a3, v46, v52);
  v51 = 2;
  sub_2454702F4(&v51, (double *)&v48, v38, a3, v46, v52);
  v39 = v53;
  v40 = *a4;
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a4 = v40;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v40 = sub_245471DD8(0, v40[2] + 1, 1, v40, &qword_257473A68, &qword_257473898);
    *a4 = v40;
  }
  v43 = v40[2];
  v42 = v40[3];
  if (v43 >= v42 >> 1)
  {
    v40 = sub_245471DD8((_QWORD *)(v42 > 1), v43 + 1, 1, v40, &qword_257473A68, &qword_257473898);
    *a4 = v40;
  }
  v40[2] = v43 + 1;
  v40[v43 + 4] = v39;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_2454702F4(unsigned __int8 *a1, double *a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t *a6)
{
  uint64_t v10;
  double v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  BOOL v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  int64_t v61;
  unint64_t v62;

  v10 = *a1;
  v11 = 0.0;
  if (*(_QWORD *)(a4 + 16))
  {
    v12 = sub_2454728C4(*a1);
    if ((v13 & 1) != 0)
      v11 = *(double *)(*(_QWORD *)(a4 + 56) + 24 * v12);
  }
  *a2 = v11 + *a2;
  v14 = *(_QWORD *)(a4 + 16);
  if (v14)
  {
    v15 = sub_2454728C4(v10);
    if ((v16 & 1) != 0)
      v14 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 24 * v15 + 8);
    else
      v14 = 0;
  }
  v17 = __CFADD__(*a5, v14);
  v18 = *a5 + v14;
  if (v17)
    goto LABEL_74;
  *a5 = v18;
  if (*(_QWORD *)(a4 + 16))
  {
    v19 = sub_2454728C4(v10);
    if ((v20 & 1) != 0)
    {
      MEMORY[0x24BDAC7A8](v19);
      v21 = swift_bridgeObjectRetain();
      sub_24547A140(v21, (uint64_t (*)(_QWORD, _QWORD))sub_24547D014);
      swift_bridgeObjectRelease();
    }
  }
  v22 = *a6;
  if (*(_QWORD *)(*a6 + 16))
  {
    v23 = sub_24547283C(0);
    if ((v24 & 1) != 0 && (*(_QWORD *)(*(_QWORD *)(v22 + 56) + 8 * v23) & 0x8000000000000000) != 0)
      __break(1u);
  }
  v25 = *a6;
  if (*(_QWORD *)(*a6 + 16))
  {
    v26 = sub_24547283C(2);
    if ((v27 & 1) != 0 && (*(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * v26) & 0x8000000000000000) != 0)
      __break(1u);
  }
  v28 = *a6;
  if (*(_QWORD *)(*a6 + 16))
  {
    v29 = sub_24547283C(4);
    if ((v30 & 1) != 0 && (*(_QWORD *)(*(_QWORD *)(v28 + 56) + 8 * v29) & 0x8000000000000000) != 0)
      __break(1u);
  }
  v31 = *a6;
  if (*(_QWORD *)(*a6 + 16))
  {
    v32 = sub_24547283C(3);
    if ((v33 & 1) != 0 && (*(_QWORD *)(*(_QWORD *)(v31 + 56) + 8 * v32) & 0x8000000000000000) != 0)
      __break(1u);
  }
  v34 = *a6;
  if (*(_QWORD *)(*a6 + 16))
  {
    v35 = sub_24547283C(5);
    if ((v36 & 1) != 0)
    {
      v37 = *(_QWORD *)(*(_QWORD *)(v34 + 56) + 8 * v35);
      if ((v37 & 0x8000000000000000) == 0)
      {
LABEL_33:
        v38 = *a6;
        if (*(_QWORD *)(*a6 + 16))
        {
          v39 = sub_24547283C(6);
          if ((v40 & 1) != 0)
          {
            v41 = *(_QWORD *)(*(_QWORD *)(v38 + 56) + 8 * v39);
            if ((v41 & 0x8000000000000000) == 0)
              goto LABEL_38;
            __break(1u);
          }
        }
        v41 = 0;
LABEL_38:
        v42 = *a6;
        v43 = *(_QWORD *)(*a6 + 16);
        if (v43)
        {
          v44 = sub_24547283C(1);
          if ((v45 & 1) == 0)
          {
LABEL_42:
            v43 = 0;
            goto LABEL_43;
          }
          v43 = *(_QWORD *)(*(_QWORD *)(v42 + 56) + 8 * v44);
          if (v43 < 0)
          {
            __break(1u);
            goto LABEL_42;
          }
        }
LABEL_43:
        v46 = __OFADD__(v43, v37);
        v47 = v43 + v37;
        if (v46)
        {
LABEL_75:
          __break(1u);
          goto LABEL_76;
        }
        if (__OFADD__(v47, v41))
        {
LABEL_76:
          __break(1u);
LABEL_77:
          __break(1u);
          goto LABEL_78;
        }
        v48 = 0;
        v49 = 0;
        v50 = *a6;
        v51 = 1 << *(_BYTE *)(*a6 + 32);
        v52 = -1;
        if (v51 < 64)
          v52 = ~(-1 << v51);
        v54 = *(_QWORD *)(v50 + 64);
        v53 = v50 + 64;
        v55 = v52 & v54;
        v56 = (unint64_t)(v51 + 63) >> 6;
        do
        {
          if (v55)
          {
            v57 = __clz(__rbit64(v55));
            v55 &= v55 - 1;
            v58 = v57 | (v48 << 6);
          }
          else
          {
            v46 = __OFADD__(v48++, 1);
            if (v46)
              goto LABEL_73;
            if (v48 >= v56)
            {
LABEL_70:
              if ((v49 & 0x8000000000000000) == 0)
                __asm { BR              X9 }
              goto LABEL_77;
            }
            v60 = *(_QWORD *)(v53 + 8 * v48);
            if (!v60)
            {
              v61 = v48 + 1;
              if (v48 + 1 >= v56)
                goto LABEL_70;
              v60 = *(_QWORD *)(v53 + 8 * v61);
              if (!v60)
              {
                v61 = v48 + 2;
                if (v48 + 2 >= v56)
                  goto LABEL_70;
                v60 = *(_QWORD *)(v53 + 8 * v61);
                if (!v60)
                {
                  v61 = v48 + 3;
                  if (v48 + 3 >= v56)
                    goto LABEL_70;
                  v60 = *(_QWORD *)(v53 + 8 * v61);
                  if (!v60)
                  {
                    v61 = v48 + 4;
                    if (v48 + 4 >= v56)
                      goto LABEL_70;
                    v60 = *(_QWORD *)(v53 + 8 * v61);
                    if (!v60)
                    {
                      v61 = v48 + 5;
                      if (v48 + 5 >= v56)
                        goto LABEL_70;
                      v60 = *(_QWORD *)(v53 + 8 * v61);
                      if (!v60)
                      {
                        while (1)
                        {
                          v48 = v61 + 1;
                          if (__OFADD__(v61, 1))
                            break;
                          if (v48 >= v56)
                            goto LABEL_70;
                          v60 = *(_QWORD *)(v53 + 8 * v48);
                          ++v61;
                          if (v60)
                            goto LABEL_65;
                        }
LABEL_78:
                        __break(1u);
                        JUMPOUT(0x245470A98);
                      }
                    }
                  }
                }
              }
              v48 = v61;
            }
LABEL_65:
            v62 = __clz(__rbit64(v60));
            v55 = (v60 - 1) & v60;
            v58 = v62 + (v48 << 6);
          }
          v59 = *(_QWORD *)(*(_QWORD *)(*a6 + 56) + 8 * v58);
          v17 = __CFADD__(v49, v59);
          v49 += v59;
        }
        while (!v17);
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
        goto LABEL_75;
      }
      __break(1u);
    }
  }
  v37 = 0;
  goto LABEL_33;
}

uint64_t sub_245470AA8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v8;
  uint64_t result;
  double v10;
  double v11;
  char v12;
  char v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  int64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  BOOL v40;
  unint64_t v41;
  int64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t inited;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  char v81;
  _QWORD v82[4];
  uint64_t v83;
  _QWORD **v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  _BYTE v88[24];
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  _UNKNOWN **v92;
  _QWORD *v93;

  v8 = 0;
  result = sub_24546A1AC(MEMORY[0x24BEE4AF8]);
  v93 = (_QWORD *)result;
  if (!*(_QWORD *)(a3 + 16))
  {
    v10 = 0.0;
    goto LABEL_14;
  }
  result = sub_2454728C4(0);
  v10 = 0.0;
  v11 = 0.0;
  if ((v12 & 1) != 0)
    v11 = *(double *)(*(_QWORD *)(a3 + 56) + 24 * result);
  if (*(_QWORD *)(a3 + 16))
  {
    result = sub_2454728C4(0);
    if ((v13 & 1) != 0)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 24 * result + 8);
      if (!*(_QWORD *)(a3 + 16))
      {
LABEL_12:
        if (v14)
          v10 = (v11 + 0.0) / (double)v14;
        goto LABEL_14;
      }
    }
    else
    {
      v14 = 0;
      if (!*(_QWORD *)(a3 + 16))
        goto LABEL_12;
    }
    result = sub_2454728C4(0);
    if ((v15 & 1) != 0)
    {
      MEMORY[0x24BDAC7A8](result);
      v4 = (unint64_t)v82;
      v82[2] = &v93;
      v16 = swift_bridgeObjectRetain();
      sub_24547A140(v16, (uint64_t (*)(_QWORD, _QWORD))sub_24547D1B4);
      result = swift_bridgeObjectRelease();
    }
    goto LABEL_12;
  }
LABEL_14:
  v17 = v93;
  v18 = v93[2];
  if (!v18)
  {
LABEL_27:
    v26 = 0;
    v86 = 0;
    v4 = 0;
    v19 = 0;
LABEL_31:
    v23 = 0;
LABEL_32:
    v27 = 0;
    goto LABEL_33;
  }
  result = sub_24547283C(0);
  v19 = 0;
  if ((v20 & 1) != 0)
  {
    v19 = *(_QWORD *)(v17[7] + 8 * result);
    if (v19 < 0)
    {
LABEL_90:
      __break(1u);
LABEL_91:
      __break(1u);
      goto LABEL_92;
    }
  }
  v18 = v17[2];
  if (!v18)
  {
    v26 = 0;
    v86 = 0;
    v4 = 0;
    goto LABEL_31;
  }
  result = sub_24547283C(2);
  if ((v21 & 1) == 0)
  {
    v4 = 0;
    v18 = v17[2];
    if (v18)
      goto LABEL_21;
LABEL_30:
    v26 = 0;
    v86 = 0;
    goto LABEL_31;
  }
  v4 = *(_QWORD *)(v17[7] + 8 * result);
  if ((v4 & 0x8000000000000000) != 0)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  v18 = v17[2];
  if (!v18)
    goto LABEL_30;
LABEL_21:
  result = sub_24547283C(4);
  if ((v22 & 1) != 0)
  {
    v23 = *(_QWORD *)(v17[7] + 8 * result);
    if ((v23 & 0x8000000000000000) == 0)
    {
      v18 = v17[2];
      if (v18)
        goto LABEL_24;
LABEL_68:
      v26 = 0;
      v86 = 0;
      goto LABEL_32;
    }
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  v23 = 0;
  v18 = v17[2];
  if (!v18)
    goto LABEL_68;
LABEL_24:
  result = sub_24547283C(3);
  if ((v24 & 1) != 0)
  {
    v18 = v17[7];
    v25 = *(_QWORD *)(v18 + 8 * result);
    if (v25 < 0)
    {
      __break(1u);
      goto LABEL_27;
    }
  }
  else
  {
    v25 = 0;
  }
  v18 = v17[2];
  v86 = v25;
  if (!v18)
  {
LABEL_77:
    v26 = 0;
    goto LABEL_32;
  }
  result = sub_24547283C(5);
  if ((v79 & 1) != 0)
  {
    v27 = *(_QWORD *)(v17[7] + 8 * result);
    if ((v27 & 0x8000000000000000) == 0)
    {
      v18 = v17[2];
      if (v18)
        goto LABEL_74;
LABEL_79:
      v26 = 0;
      goto LABEL_33;
    }
LABEL_96:
    __break(1u);
    return result;
  }
  v27 = 0;
  v18 = v17[2];
  if (!v18)
    goto LABEL_79;
LABEL_74:
  result = sub_24547283C(6);
  if ((v80 & 1) != 0)
  {
    v18 = v17[7];
    v26 = *(_QWORD *)(v18 + 8 * result);
    if (v26 < 0)
    {
      __break(1u);
      goto LABEL_77;
    }
  }
  else
  {
    v26 = 0;
  }
  v18 = v17[2];
  if (v18)
  {
    result = sub_24547283C(1);
    if ((v81 & 1) != 0)
    {
      v18 = *(_QWORD *)(v17[7] + 8 * result);
      if ((v18 & 0x8000000000000000) == 0)
        goto LABEL_33;
      __break(1u);
LABEL_85:
      __break(1u);
    }
    v18 = 0;
  }
LABEL_33:
  v28 = __OFADD__(v18, v27);
  v29 = v18 + v27;
  if (v28)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  v30 = v29 + v26;
  if (__OFADD__(v29, v26))
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  v85 = v23;
  v31 = 0;
  v23 = 0;
  v32 = v17 + 8;
  v33 = 1 << *((_BYTE *)v17 + 32);
  v34 = -1;
  if (v33 < 64)
    v34 = ~(-1 << v33);
  v35 = v34 & v17[8];
  v36 = (unint64_t)(v33 + 63) >> 6;
  while (1)
  {
    if (v35)
    {
      v37 = __clz(__rbit64(v35));
      v35 &= v35 - 1;
      v38 = v37 | (v31 << 6);
      goto LABEL_39;
    }
    v28 = __OFADD__(v31++, 1);
    if (v28)
    {
      __break(1u);
      goto LABEL_88;
    }
    if (v31 >= v36)
      break;
    v41 = v32[v31];
    if (!v41)
    {
      v42 = v31 + 1;
      if (v31 + 1 >= v36)
        break;
      v41 = v32[v42];
      if (!v41)
      {
        v42 = v31 + 2;
        if (v31 + 2 >= v36)
          break;
        v41 = v32[v42];
        if (!v41)
        {
          v42 = v31 + 3;
          if (v31 + 3 >= v36)
            break;
          v41 = v32[v42];
          if (!v41)
          {
            v42 = v31 + 4;
            if (v31 + 4 >= v36)
              break;
            v41 = v32[v42];
            if (!v41)
            {
              v42 = v31 + 5;
              if (v31 + 5 >= v36)
                break;
              v41 = v32[v42];
              if (!v41)
              {
                while (1)
                {
                  v31 = v42 + 1;
                  if (__OFADD__(v42, 1))
                    break;
                  if (v31 >= v36)
                    goto LABEL_60;
                  v41 = v32[v31];
                  ++v42;
                  if (v41)
                    goto LABEL_55;
                }
                __break(1u);
                goto LABEL_94;
              }
            }
          }
        }
      }
      v31 = v42;
    }
LABEL_55:
    v43 = __clz(__rbit64(v41));
    v35 = (v41 - 1) & v41;
    v38 = v43 + (v31 << 6);
LABEL_39:
    v39 = *(_QWORD *)(v17[7] + 8 * v38);
    v40 = __CFADD__(v23, v39);
    v23 += v39;
    if (v40)
      goto LABEL_85;
  }
LABEL_60:
  if (v23 < 0)
    goto LABEL_91;
  v84 = a4;
  v44 = v26;
  v45 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473AD8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24549B7B0;
  *(_BYTE *)(inited + 32) = 13;
  v47 = sub_24547154C();
  v48 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 64) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = &protocol witness table for String;
  *(_QWORD *)(inited + 40) = v47;
  *(_QWORD *)(inited + 48) = v49;
  *(_BYTE *)(inited + 80) = 2;
  *(_QWORD *)(inited + 112) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(inited + 120) = &protocol witness table for Double;
  *(_BYTE *)(inited + 128) = 12;
  v50 = MEMORY[0x24BEE1768];
  *(double *)(inited + 88) = v10;
  *(_QWORD *)(inited + 160) = v50;
  *(_QWORD *)(inited + 168) = &protocol witness table for Int;
  *(_QWORD *)(inited + 136) = v19;
  *(_BYTE *)(inited + 176) = 5;
  *(_QWORD *)(inited + 208) = v50;
  *(_QWORD *)(inited + 216) = &protocol witness table for Int;
  *(_QWORD *)(inited + 184) = v45;
  *(_BYTE *)(inited + 224) = 8;
  *(_QWORD *)(inited + 256) = v50;
  *(_QWORD *)(inited + 264) = &protocol witness table for Int;
  *(_QWORD *)(inited + 232) = v4;
  *(_BYTE *)(inited + 272) = 7;
  *(_QWORD *)(inited + 304) = v50;
  *(_QWORD *)(inited + 312) = &protocol witness table for Int;
  *(_QWORD *)(inited + 280) = v85;
  *(_BYTE *)(inited + 320) = 3;
  *(_QWORD *)(inited + 352) = v50;
  *(_QWORD *)(inited + 360) = &protocol witness table for Int;
  *(_QWORD *)(inited + 328) = v86;
  *(_BYTE *)(inited + 368) = 10;
  *(_QWORD *)(inited + 400) = v50;
  *(_QWORD *)(inited + 408) = &protocol witness table for Int;
  *(_QWORD *)(inited + 376) = v27;
  *(_BYTE *)(inited + 416) = 6;
  *(_QWORD *)(inited + 448) = v50;
  *(_QWORD *)(inited + 456) = &protocol witness table for Int;
  *(_QWORD *)(inited + 424) = v44;
  v51 = v48;
  *(_BYTE *)(inited + 464) = 9;
  *(_QWORD *)(inited + 496) = v50;
  *(_QWORD *)(inited + 504) = &protocol witness table for Int;
  *(_QWORD *)(inited + 472) = v23;
  *(_BYTE *)(inited + 512) = 1;
  *(_QWORD *)&v90 = 5;
  v52 = sub_24549A498();
  *(_QWORD *)(inited + 544) = v51;
  *(_QWORD *)(inited + 552) = &protocol witness table for String;
  *(_QWORD *)(inited + 520) = v52;
  *(_QWORD *)(inited + 528) = v53;
  v8 = sub_245467BBC(inited);
  v54 = *(char **)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  if (v54)
  {
    v55 = *(_QWORD *)&v54[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment];
    v56 = *(_QWORD *)&v54[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment + 8];
    v91 = v51;
    v92 = &protocol witness table for String;
    *(_QWORD *)&v90 = v55;
    *((_QWORD *)&v90 + 1) = v56;
    sub_24546A54C(&v90, (uint64_t)v88);
    v57 = v54;
    swift_bridgeObjectRetain();
    LOBYTE(v56) = swift_isUniquelyReferenced_nonNull_native();
    v87 = v8;
    v58 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v88, v89);
    MEMORY[0x24BDAC7A8](v58);
    v60 = (uint64_t *)((char *)&v83 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v61 + 16))(v60);
    sub_2454793D0(*v60, v60[1], 15, v56, &v87);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v88);
    v62 = v87;
    swift_bridgeObjectRelease();
    v63 = *(_QWORD *)&v57[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment];
    v64 = *(_QWORD *)&v57[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment + 8];
    v91 = v51;
    v92 = &protocol witness table for String;
    *(_QWORD *)&v90 = v63;
    *((_QWORD *)&v90 + 1) = v64;
    sub_24546A54C(&v90, (uint64_t)v88);
    swift_bridgeObjectRetain();
    LOBYTE(v64) = swift_isUniquelyReferenced_nonNull_native();
    v87 = v62;
    v65 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v88, v89);
    MEMORY[0x24BDAC7A8](v65);
    v67 = (uint64_t *)((char *)&v83 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v68 + 16))(v67);
    sub_2454793D0(*v67, v67[1], 16, v64, &v87);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v88);
    v69 = v87;
    swift_bridgeObjectRelease();
    v70 = *(_QWORD *)&v57[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment];
    v71 = *(_QWORD *)&v57[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment + 8];
    v91 = v51;
    v92 = &protocol witness table for String;
    *(_QWORD *)&v90 = v70;
    *((_QWORD *)&v90 + 1) = v71;
    sub_24546A54C(&v90, (uint64_t)v88);
    swift_bridgeObjectRetain();
    LOBYTE(v71) = swift_isUniquelyReferenced_nonNull_native();
    v87 = v69;
    v72 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v88, v89);
    MEMORY[0x24BDAC7A8](v72);
    v74 = (uint64_t *)((char *)&v83 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v75 + 16))(v74);
    sub_2454793D0(*v74, v74[1], 14, v71, &v87);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v88);
    v8 = v87;

    swift_bridgeObjectRelease();
  }
  v4 = (unint64_t)v84;
  v17 = *v84;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)v4 = v17;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_92:
    v17 = sub_245471DD8(0, v17[2] + 1, 1, v17, &qword_257473AE0, &qword_257473AE8);
    *(_QWORD *)v4 = v17;
  }
  v78 = v17[2];
  v77 = v17[3];
  if (v78 >= v77 >> 1)
  {
    v17 = sub_245471DD8((_QWORD *)(v77 > 1), v78 + 1, 1, v17, &qword_257473AE0, &qword_257473AE8);
    *(_QWORD *)v4 = v17;
  }
  v17[2] = v78 + 1;
  v17[v78 + 4] = v8;
  return swift_bridgeObjectRelease();
}

unint64_t sub_245471328(uint64_t a1, uint64_t a2, _QWORD **a3)
{
  char v3;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t result;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD *v22;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = *a3;
  v22 = *a3;
  *a3 = (_QWORD *)0x8000000000000000;
  v10 = sub_24547283C(a1);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  v3 = v9;
  if (v8[3] >= v13)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      goto LABEL_12;
  }
  else
  {
    sub_24547390C(v13, isUniquelyReferenced_nonNull_native);
    v8 = v22;
    v14 = sub_24547283C(a1);
    if ((v3 & 1) != (v15 & 1))
    {
      result = sub_24549A4E0();
      __break(1u);
      return result;
    }
    v10 = v14;
  }
  while (1)
  {
    *a3 = v8;
    result = swift_bridgeObjectRelease();
    v17 = *a3;
    if ((v3 & 1) == 0)
      result = sub_245495FF0(v10, a1, 0, *a3);
    v18 = v17[7];
    v19 = *(_QWORD *)(v18 + 8 * v10);
    v20 = __CFADD__(v19, a2);
    v21 = v19 + a2;
    if (!v20)
      break;
LABEL_11:
    __break(1u);
LABEL_12:
    sub_245476B08();
    v8 = v22;
  }
  *(_QWORD *)(v18 + 8 * v10) = v21;
  return result;
}

BOOL sub_245471450(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_245471464@<X0>(_QWORD *a1@<X8>)
{
  unint64_t result;

  result = sub_24546A1AC(MEMORY[0x24BEE4AF8]);
  *a1 = 0;
  a1[1] = 0;
  a1[2] = result;
  return result;
}

uint64_t sub_245471494(char a1, size_t a2)
{
  uint64_t v4;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_24549A3E4();
    __break(1u);
  }
  else
  {
    if (!a2)
      return MEMORY[0x24BEE4AF8];
    v4 = sub_24549A15C();
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1 & 1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_24547154C()
{
  uint64_t v0;
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v19;

  v1 = (unint64_t *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier);
  if ((*(_BYTE *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8) & 1) != 0)
  {
    if (v1[1])
    {
      v2 = *v1;
      swift_bridgeObjectRetain();
    }
    else
    {
      if (qword_254413850 != -1)
        swift_once();
      v2 = 0xD000000000000010;
      v14 = sub_24549A078();
      __swift_project_value_buffer(v14, (uint64_t)qword_254413928);
      v15 = sub_24549A060();
      v16 = sub_24549A1E0();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_245461000, v15, v16, "no model identifier", v17, 2u);
        MEMORY[0x2495350C0](v17, -1, -1);
      }

    }
  }
  else
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType);
    v4 = v1[1];
    if (v4)
    {
      v5 = *v1;
      v6 = qword_254413850;
      swift_bridgeObjectRetain();
      if (v6 != -1)
        swift_once();
      v7 = sub_24549A078();
      __swift_project_value_buffer(v7, (uint64_t)qword_254413928);
      swift_bridgeObjectRetain();
      v8 = sub_24549A060();
      v9 = sub_24549A1E0();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = swift_slowAlloc();
        v11 = swift_slowAlloc();
        v19 = v11;
        *(_DWORD *)v10 = 136315394;
        v12 = PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(v3);
        sub_2454720F4(v12, v13, &v19);
        sub_24549A258();
        swift_bridgeObjectRelease();
        *(_WORD *)(v10 + 12) = 2080;
        swift_bridgeObjectRetain();
        sub_2454720F4(v5, v4, &v19);
        sub_24549A258();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_245461000, v8, v9, "both modelType: %s & otherModelTypeIdentifier: %s", (uint8_t *)v10, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x2495350C0](v11, -1, -1);
        MEMORY[0x2495350C0](v10, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    return PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(v3);
  }
  return v2;
}

uint64_t sub_245471858(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24547198C(a1, a2, a3, a4, &qword_257473A50, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped);
}

_QWORD *sub_24547186C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257473678);
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
    sub_245479614(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_245471978(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24547198C(a1, a2, a3, a4, &qword_257473B00, type metadata accessor for AppSuggestionInferenceEventTimestamped);
}

uint64_t sub_24547198C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_24549A3E4();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_24547A2A4(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

char *sub_245471B98(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254413780);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_24547971C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_245471C90(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2544137E8);
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
    sub_245479800(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_245471D9C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24547198C(a1, a2, a3, a4, &qword_257473A48, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
}

uint64_t sub_245471DB0(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_24547198C(a1, a2, a3, a4, &qword_257473A88, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
}

_QWORD *sub_245471DC4(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_245471DD8(a1, a2, a3, a4, &qword_257473A68, &qword_257473898);
}

_QWORD *sub_245471DD8(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    v10 = a2;
    goto LABEL_8;
  }
  v9 = a4[3];
  v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2)
    goto LABEL_8;
  if (v10 + 0x4000000000000000 >= 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v10 = a2;
LABEL_8:
    v11 = a4[2];
    if (v10 <= v11)
      v12 = a4[2];
    else
      v12 = v10;
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v13 = (_QWORD *)swift_allocObject();
      v14 = _swift_stdlib_malloc_size(v13);
      v15 = v14 - 32;
      if (v14 < 32)
        v15 = v14 - 25;
      v13[2] = v11;
      v13[3] = 2 * (v15 >> 3);
      v16 = v13 + 4;
      if ((v8 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v16 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v13 != a4 || v16 >= &a4[v11 + 4])
          memmove(v16, a4 + 4, 8 * v11);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_24547CCE0(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease();
    return v13;
  }
  __break(1u);
  return result;
}

char *sub_245471EF0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257473A70);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_24547971C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_245471FE8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257473A58);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_24547CDE4(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2454720F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2454721C4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24547D098((uint64_t)v12, *a3);
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
      sub_24547D098((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2454721C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24549A264();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24547237C(a5, a6);
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
  v8 = sub_24549A390();
  if (!v8)
  {
    sub_24549A3E4();
    __break(1u);
LABEL_17:
    result = sub_24549A42C();
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

uint64_t sub_24547237C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245472410(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2454725E8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2454725E8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245472410(uint64_t a1, unint64_t a2)
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
      v3 = sub_245472584(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24549A360();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24549A3E4();
      __break(1u);
LABEL_10:
      v2 = sub_24549A0F0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24549A42C();
    __break(1u);
LABEL_14:
    result = sub_24549A3E4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245472584(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254413780);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2454725E8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254413780);
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
  result = sub_24549A42C();
  __break(1u);
  return result;
}

unint64_t sub_245472734(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24549A51C();
  sub_24549A0D8();
  v4 = sub_24549A54C();
  return sub_245475C44(a1, a2, v4);
}

unint64_t sub_245472798(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;

  sub_24549A51C();
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  sub_24549A534();
  v6 = sub_24549A54C();
  return sub_245475D24(a1, a2, a3, v6);
}

uint64_t sub_245472828(uint64_t a1)
{
  return sub_245472930(a1, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
}

unint64_t sub_24547283C(uint64_t a1)
{
  uint64_t v2;

  sub_24549A51C();
  sub_24549A528();
  v2 = sub_24549A54C();
  return sub_245475F28(a1, v2);
}

unint64_t sub_245472894(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24549A228();
  return sub_245475FC4(a1, v2);
}

unint64_t sub_2454728C4(unsigned __int8 a1)
{
  uint64_t v2;

  sub_24549A51C();
  sub_24549A528();
  v2 = sub_24549A54C();
  return sub_2454760CC(a1, v2);
}

uint64_t sub_24547291C(uint64_t a1)
{
  return sub_245472930(a1, (void (*)(uint64_t))PeopleSuggesterShadowEvaluationField.rawValue.getter, sub_24547616C);
}

uint64_t sub_245472930(uint64_t a1, void (*a2)(uint64_t), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_24549A51C();
  a2(v5);
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  v6 = sub_24549A54C();
  return a3(a1, v6);
}

uint64_t sub_2454729B4(uint64_t a1, char a2)
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
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254413770);
  v36 = a2;
  v6 = sub_24549A414();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24549A51C();
    sub_24549A0D8();
    result = sub_24549A54C();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_245472CC8(uint64_t a1, char a2)
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
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473A28);
  v37 = a2;
  v6 = sub_24549A414();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
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
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_24549A51C();
    sub_24549A0D8();
    result = sub_24549A54C();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_245472FD0(uint64_t a1, char a2)
{
  return sub_2454732F8(a1, a2, &qword_2574738E8);
}

uint64_t sub_245472FDC(uint64_t a1, char a2)
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
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  char v21;
  __int128 *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  __int128 v33[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473888);
  v6 = sub_24549A414();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v32 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v31 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v31)
      break;
    v18 = (_QWORD *)(v5 + 64);
    v19 = *(_QWORD *)(v32 + 8 * v17);
    ++v13;
    if (!v19)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v31)
        goto LABEL_34;
      v19 = *(_QWORD *)(v32 + 8 * v13);
      if (!v19)
      {
        v20 = v17 + 2;
        if (v20 >= v31)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v19 = *(_QWORD *)(v32 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            v13 = v20 + 1;
            if (__OFADD__(v20, 1))
              goto LABEL_43;
            if (v13 >= v31)
              goto LABEL_34;
            v19 = *(_QWORD *)(v32 + 8 * v13);
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
    v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    v21 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16);
    v22 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v16);
    if ((a2 & 1) != 0)
      sub_24546A54C(v22, (uint64_t)v33);
    else
      sub_24547C388((uint64_t)v22, (uint64_t)v33);
    sub_24549A51C();
    PeopleSuggesterMetricsField.rawValue.getter();
    sub_24549A0D8();
    swift_bridgeObjectRelease();
    result = sub_24549A54C();
    v23 = -1 << *(_BYTE *)(v7 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v25);
      }
      while (v29 == -1);
      v14 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_BYTE *)(*(_QWORD *)(v7 + 48) + v14) = v21;
    result = sub_24546A54C(v33, *(_QWORD *)(v7 + 56) + 40 * v14);
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v18 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v30 = 1 << *(_BYTE *)(v5 + 32);
  if (v30 >= 64)
    bzero(v18, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v18 = -1 << v30;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2454732F8(uint64_t a1, char a2, uint64_t *a3)
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
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = a2;
  v7 = sub_24549A414();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
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
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
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
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_24549A51C();
    sub_24549A0D8();
    result = sub_24549A54C();
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
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_245473600(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char v6;
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
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  char v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  uint64_t v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473AF8);
  v6 = a2;
  v7 = sub_24549A414();
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v33 = v2;
  v34 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v19 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          v3 = v33;
          if ((v6 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v14 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v14 = v24;
      }
    }
LABEL_30:
    v11 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    v29 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v20);
    v30 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v6 & 1) == 0)
      v31 = v30;
    sub_24549A51C();
    PeopleSuggesterMetricsField.rawValue.getter();
    sub_24549A0D8();
    swift_bridgeObjectRelease();
    result = sub_24549A54C();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v17 == v26;
        if (v17 == v26)
          v17 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_BYTE *)(*(_QWORD *)(v8 + 48) + v18) = v29;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v30;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v3 = v33;
  v22 = (_QWORD *)(v5 + 64);
  if ((v6 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v8;
  return result;
}

uint64_t sub_24547390C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _QWORD *v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738A0);
  result = sub_24549A414();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v32 = a2;
    v8 = 0;
    v33 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v8 << 6);
      }
      else
      {
        v18 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v18 >= v12)
          goto LABEL_31;
        v19 = v33[v18];
        ++v8;
        if (!v19)
        {
          v8 = v18 + 1;
          if (v18 + 1 >= v12)
            goto LABEL_31;
          v19 = v33[v8];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v12)
            {
LABEL_31:
              if ((v32 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_38;
              }
              v31 = 1 << *(_BYTE *)(v5 + 32);
              if (v31 >= 64)
                bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v33 = -1 << v31;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v19 = v33[v20];
            if (!v19)
            {
              while (1)
              {
                v8 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_40;
                if (v8 >= v12)
                  goto LABEL_31;
                v19 = v33[v8];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v8 = v20;
          }
        }
LABEL_21:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v8 << 6);
      }
      v21 = 8 * v17;
      v22 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v21);
      v23 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v21);
      sub_24549A51C();
      sub_24549A528();
      result = sub_24549A54C();
      v24 = -1 << *(_BYTE *)(v7 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v13 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v13 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v13 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = 8 * v14;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v15) = v22;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v15) = v23;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_245473BD8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  char v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  char v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738A8);
  v35 = a2;
  result = sub_24549A414();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v34 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v33)
          goto LABEL_33;
        v21 = v34[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v33)
            goto LABEL_33;
          v21 = v34[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if ((v35 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 >= 64)
                bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v34 = -1 << v32;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v34[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v33)
                  goto LABEL_33;
                v21 = v34[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v19);
      v28 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 24 * v19);
      v29 = *v28;
      v31 = v28[1];
      v30 = v28[2];
      if ((v35 & 1) == 0)
        swift_bridgeObjectRetain();
      sub_24549A51C();
      sub_24549A528();
      result = sub_24549A54C();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v16) = v27;
      v17 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 24 * v16);
      *v17 = v29;
      v17[1] = v31;
      v17[2] = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_245473ED4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 *v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  char v20;
  _BYTE v21[48];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738C0);
  v20 = a2;
  v6 = sub_24549A414();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_29;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v19 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v10 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v19 <= 1)
  {
    swift_release();
    v11 = (_QWORD *)(v5 + 64);
    if ((v20 & 1) == 0)
      goto LABEL_29;
    goto LABEL_25;
  }
  v11 = (_QWORD *)(v5 + 64);
  v12 = *(_QWORD *)(v5 + 72);
  v13 = 1;
  if (v12)
    goto LABEL_17;
  v13 = 2;
  if (v19 <= 2)
    goto LABEL_22;
  v12 = *(_QWORD *)(v5 + 80);
  if (v12)
  {
LABEL_17:
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_18:
    v15 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v10);
    v16 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v10);
    if ((v20 & 1) != 0)
      sub_24546A54C(v16, (uint64_t)v21);
    else
      sub_24547C388((uint64_t)v16, (uint64_t)v21);
    sub_24549A51C();
    __asm { BR              X8 }
  }
  v14 = 3;
  if (v19 > 3)
  {
    v12 = *(_QWORD *)(v5 + 88);
    if (v12)
    {
      v13 = 3;
      goto LABEL_17;
    }
    while (1)
    {
      v13 = v14 + 1;
      if (__OFADD__(v14, 1))
      {
        __break(1u);
        JUMPOUT(0x245474480);
      }
      if (v13 >= v19)
        break;
      v12 = *(_QWORD *)(v5 + 64 + 8 * v13);
      ++v14;
      if (v12)
        goto LABEL_17;
    }
  }
LABEL_22:
  swift_release();
  if ((v20 & 1) == 0)
    goto LABEL_29;
LABEL_25:
  v17 = 1 << *(_BYTE *)(v5 + 32);
  if (v17 >= 64)
    bzero(v11, ((unint64_t)(v17 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v11 = -1 << v17;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_29:
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_2454744C8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
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
  void *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738B8);
  v38 = a2;
  v6 = sub_24549A414();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
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
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v21);
    v31 = *(_QWORD *)(v5 + 56) + 16 * v21;
    v32 = *(_BYTE *)v31;
    v33 = *(_QWORD *)(v31 + 8);
    if ((v38 & 1) == 0)
    {
      v34 = v30;
      swift_bridgeObjectRetain();
    }
    result = sub_24549A228();
    v15 = -1 << *(_BYTE *)(v7 + 32);
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
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v18) = v30;
    v19 = *(_QWORD *)(v7 + 56) + 16 * v18;
    *(_BYTE *)v19 = v32;
    *(_QWORD *)(v19 + 8) = v33;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2454747B4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t result;
  int64_t v19;
  char v20;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473AB8);
  v20 = a2;
  v6 = sub_24549A414();
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_28;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v19 = (unint64_t)(v7 + 63) >> 6;
  swift_retain();
  if (v9)
  {
    v10 = __clz(__rbit64(v9));
    goto LABEL_18;
  }
  if (v19 <= 1)
  {
    swift_release();
    v11 = (_QWORD *)(v5 + 64);
    if ((v20 & 1) == 0)
      goto LABEL_28;
    goto LABEL_24;
  }
  v11 = (_QWORD *)(v5 + 64);
  v12 = *(_QWORD *)(v5 + 72);
  v13 = 1;
  if (v12)
    goto LABEL_17;
  v13 = 2;
  if (v19 <= 2)
    goto LABEL_21;
  v12 = *(_QWORD *)(v5 + 80);
  if (v12)
  {
LABEL_17:
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_18:
    v15 = *(unsigned __int8 *)(*(_QWORD *)(v5 + 48) + v10);
    if ((v20 & 1) == 0)
      v16 = *(id *)(*(_QWORD *)(v5 + 56) + 8 * v10);
    sub_24549A51C();
    __asm { BR              X8 }
  }
  v14 = 3;
  if (v19 > 3)
  {
    v12 = *(_QWORD *)(v5 + 88);
    if (v12)
    {
      v13 = 3;
      goto LABEL_17;
    }
    while (1)
    {
      v13 = v14 + 1;
      if (__OFADD__(v14, 1))
      {
        __break(1u);
        JUMPOUT(0x245474D44);
      }
      if (v13 >= v19)
        break;
      v12 = *(_QWORD *)(v5 + 64 + 8 * v13);
      ++v14;
      if (v12)
        goto LABEL_17;
    }
  }
LABEL_21:
  swift_release();
  if ((v20 & 1) == 0)
    goto LABEL_28;
LABEL_24:
  v17 = 1 << *(_BYTE *)(v5 + 32);
  if (v17 >= 64)
    bzero(v11, ((unint64_t)(v17 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v11 = -1 << v17;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_28:
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_245474D8C(uint64_t a1, char a2)
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
  uint64_t v20;
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
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738B0);
  v42 = a2;
  v6 = sub_24549A414();
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
    v35 = *(_QWORD *)(v5 + 56) + v31;
    v36 = *(_BYTE *)v35;
    v37 = *(_QWORD *)(v35 + 8);
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_24549A51C();
    sub_24549A0D8();
    result = sub_24549A54C();
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
    v20 = *(_QWORD *)(v7 + 56) + v18;
    *(_BYTE *)v20 = v36;
    *(_QWORD *)(v20 + 8) = v37;
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

uint64_t sub_2454750B8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  _QWORD *v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473A90);
  result = sub_24549A414();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v30 = a2;
    v8 = 0;
    v31 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v16 = v15 | (v8 << 6);
      }
      else
      {
        v17 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v17 >= v12)
          goto LABEL_31;
        v18 = v31[v17];
        ++v8;
        if (!v18)
        {
          v8 = v17 + 1;
          if (v17 + 1 >= v12)
            goto LABEL_31;
          v18 = v31[v8];
          if (!v18)
          {
            v19 = v17 + 2;
            if (v19 >= v12)
            {
LABEL_31:
              if ((v30 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_38;
              }
              v29 = 1 << *(_BYTE *)(v5 + 32);
              if (v29 >= 64)
                bzero(v31, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v31 = -1 << v29;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v31[v19];
            if (!v18)
            {
              while (1)
              {
                v8 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_40;
                if (v8 >= v12)
                  goto LABEL_31;
                v18 = v31[v8];
                ++v19;
                if (v18)
                  goto LABEL_21;
              }
            }
            v8 = v19;
          }
        }
LABEL_21:
        v11 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      v20 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16);
      v21 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v16);
      sub_24549A51C();
      sub_24549A528();
      result = sub_24549A54C();
      v22 = -1 << *(_BYTE *)(v7 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_39;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v13 + 8 * v24);
        }
        while (v28 == -1);
        v14 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      *(_BYTE *)(*(_QWORD *)(v7 + 48) + v14) = v20;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v14) = v21;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v3 = v7;
  return result;
}

uint64_t sub_24547537C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
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
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254413858);
  v6 = sub_24549A414();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
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
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((a2 & 1) == 0)
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
            if (v14 >= v11)
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
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      swift_bridgeObjectRetain();
    }
    result = sub_24549A228();
    v15 = -1 << *(_BYTE *)(v7 + 32);
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
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_245475650(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473A20);
  v6 = sub_24549A414();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v33 = v2;
  v34 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v34 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_33;
      v23 = *(_QWORD *)(v34 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v33;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v34 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v23 = *(_QWORD *)(v34 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v14 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    v29 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v20);
    v30 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((a2 & 1) == 0)
      v31 = v29;
    result = sub_24549A228();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v17 == v26;
        if (v17 == v26)
          v17 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v18) = v29;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v18) = v30;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v33;
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_245475918(uint64_t a1, char a2)
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
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  void *v32;
  id v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473880);
  v37 = a2;
  v6 = sub_24549A414();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v19 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v20 = v19 | (v13 << 6);
      }
      else
      {
        v21 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v21 >= v35)
          goto LABEL_33;
        v22 = v36[v21];
        ++v13;
        if (!v22)
        {
          v13 = v21 + 1;
          if (v21 + 1 >= v35)
            goto LABEL_33;
          v22 = v36[v13];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v37 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v36[v23];
            if (!v22)
            {
              while (1)
              {
                v13 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_40;
                if (v13 >= v35)
                  goto LABEL_33;
                v22 = v36[v13];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v13 = v23;
          }
        }
LABEL_30:
        v10 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v13 << 6);
      }
      v28 = *(_QWORD *)(v5 + 48) + 24 * v20;
      v30 = *(_QWORD *)v28;
      v29 = *(_QWORD *)(v28 + 8);
      v31 = *(_BYTE *)(v28 + 16);
      v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
      if ((v37 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        v33 = v32;
      }
      sub_24549A51C();
      swift_bridgeObjectRetain();
      sub_24549A0D8();
      swift_bridgeObjectRelease();
      sub_24549A534();
      result = sub_24549A54C();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v11 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = *(_QWORD *)(v7 + 48) + 24 * v17;
      *(_QWORD *)v18 = v30;
      *(_QWORD *)(v18 + 8) = v29;
      *(_BYTE *)(v18 + 16) = v31;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_245475C44(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24549A4A4() & 1) == 0)
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
      while (!v14 && (sub_24549A4A4() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_245475D24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    v11 = ~v6;
    v12 = *(_QWORD *)(v4 + 48);
    do
    {
      v13 = v12 + 24 * v7;
      v14 = *(unsigned __int8 *)(v13 + 16);
      if (*(_QWORD *)v13 == a1 && *(_QWORD *)(v13 + 8) == a2)
      {
        if (v14 == (a3 & 1))
          return v7;
      }
      else if ((sub_24549A4A4() & 1) != 0 && ((v14 ^ a3) & 1) == 0)
      {
        return v7;
      }
      v7 = (v7 + 1) & v11;
    }
    while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  return v7;
}

unint64_t sub_245475E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = ~v4;
    while (1)
    {
      v7 = PeopleSuggesterMetricsField.rawValue.getter();
      v9 = v8;
      if (v7 == PeopleSuggesterMetricsField.rawValue.getter() && v9 == v10)
        break;
      v12 = sub_24549A4A4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
      {
        v5 = (v5 + 1) & v6;
        if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
          continue;
      }
      return v5;
    }
    swift_bridgeObjectRelease_n();
  }
  return v5;
}

unint64_t sub_245475F28(uint64_t a1, uint64_t a2)
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

unint64_t sub_245475FC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_24549A234();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_24549A234();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_2454760CC(unsigned __int8 a1, uint64_t a2)
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
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_24547616C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

void *sub_245476604()
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
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254413770);
  v2 = *v0;
  v3 = sub_24549A408();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_2454767A0()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473A28);
  v2 = *v0;
  v3 = sub_24549A408();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_245476948()
{
  return sub_245476960(&qword_2574738E8);
}

void *sub_245476954()
{
  return sub_245476E48(&qword_257473888);
}

id sub_245476960(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
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
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_24549A408();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
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
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
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

void *sub_245476B08()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738A0);
  v2 = *v0;
  v3 = sub_24549A408();
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

void *sub_245476C94()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738A8);
  v2 = *v0;
  v3 = sub_24549A408();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 24 * v15);
    v17 = *v16;
    v19 = v16[1];
    v18 = v16[2];
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 56) + 24 * v15);
    *v20 = v17;
    v20[1] = v19;
    v20[2] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_245476E48(uint64_t *a1)
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
  char v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  __int128 v21[2];

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_24549A408();
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
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v14)
        goto LABEL_26;
      v19 = *(_QWORD *)(v7 + 8 * v10);
      if (!v19)
        break;
    }
LABEL_25:
    v13 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_12:
    v17 = *(_BYTE *)(*(_QWORD *)(v3 + 48) + v16);
    sub_24547C388(*(_QWORD *)(v3 + 56) + 40 * v16, (uint64_t)v21);
    *(_BYTE *)(*(_QWORD *)(v5 + 48) + v16) = v17;
    result = (void *)sub_24546A54C(v21, *(_QWORD *)(v5 + 56) + 40 * v16);
  }
  v20 = v18 + 2;
  if (v20 >= v14)
    goto LABEL_26;
  v19 = *(_QWORD *)(v7 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v19 = *(_QWORD *)(v7 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_245477000()
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
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738B8);
  v2 = *v0;
  v3 = sub_24549A408();
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
    v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      v9 = v24 + 1;
      if (v24 + 1 >= v13)
        goto LABEL_26;
      v25 = *(_QWORD *)(v6 + 8 * v9);
      if (!v25)
        break;
    }
LABEL_25:
    v12 = (v25 - 1) & v25;
    v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_QWORD *)(v2 + 56) + v18;
    v20 = *(_BYTE *)v19;
    v21 = *(_QWORD *)(v19 + 8);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = *(_QWORD *)(v4 + 56) + v18;
    *(_BYTE *)v22 = v20;
    *(_QWORD *)(v22 + 8) = v21;
    v23 = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v13)
    goto LABEL_26;
  v25 = *(_QWORD *)(v6 + 8 * v26);
  if (v25)
  {
    v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v9);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_2454771BC()
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
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574738B0);
  v2 = *v0;
  v3 = sub_24549A408();
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
    v20 = *(_QWORD *)(v2 + 56) + v16;
    v21 = *(_BYTE *)v20;
    v22 = *(_QWORD *)(v20 + 8);
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = *(_QWORD *)(v4 + 56) + v16;
    *(_BYTE *)v24 = v21;
    *(_QWORD *)(v24 + 8) = v22;
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

void *sub_24547737C()
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
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473A90);
  v2 = *v0;
  v3 = sub_24549A408();
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
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v20 = __clz(__rbit64(v18));
    v12 = (v18 - 1) & v18;
    v15 = v20 + (v9 << 6);
LABEL_12:
    v16 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
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
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_245477508()
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
  void *v17;
  uint64_t v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254413858);
  v2 = *v0;
  v3 = sub_24549A408();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2454776B0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  char v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473A20);
  v2 = *v0;
  v3 = sub_24549A408();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v17 = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = v16;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = v17;
    result = v16;
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

id sub_245477854()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473880);
  v2 = *v0;
  v3 = sub_24549A408();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 24 * v15;
    v19 = *(_QWORD *)v17;
    v18 = *(_QWORD *)(v17 + 8);
    LOBYTE(v17) = *(_BYTE *)(v17 + 16);
    v20 = 8 * v15;
    v21 = *(void **)(*(_QWORD *)(v2 + 56) + v20);
    v22 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v22 = v19;
    *(_QWORD *)(v22 + 8) = v18;
    *(_BYTE *)(v22 + 16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_245477A10(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  void *v19;
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  void **v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  char v37;
  char v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;

  v3 = a1[2];
  if (!v3)
    goto LABEL_22;
  v7 = a1[4];
  v6 = a1[5];
  v8 = (void *)a1[6];
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain();
  v10 = v8;
  v12 = sub_245472734(v7, v6);
  v13 = v9[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v16 = v11;
  if (v9[3] >= v15)
  {
    if ((a2 & 1) != 0)
    {
      if ((v11 & 1) == 0)
        goto LABEL_13;
    }
    else
    {
      sub_245476960(&qword_257473A98);
      if ((v16 & 1) == 0)
        goto LABEL_13;
    }
    goto LABEL_10;
  }
  sub_2454732F8(v15, a2 & 1, &qword_257473A98);
  v17 = sub_245472734(v7, v6);
  if ((v16 & 1) == (v18 & 1))
  {
    v12 = v17;
    if ((v16 & 1) == 0)
    {
LABEL_13:
      v21 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
      v22 = (uint64_t *)(v21[6] + 16 * v12);
      *v22 = v7;
      v22[1] = v6;
      *(_QWORD *)(v21[7] + 8 * v12) = v10;
      v23 = v21[2];
      v24 = __OFADD__(v23, 1);
      v25 = v23 + 1;
      if (v24)
      {
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      v21[2] = v25;
      v26 = v3 - 1;
      if (v3 != 1)
      {
        v27 = (void **)(a1 + 9);
        do
        {
          v29 = (uint64_t)*(v27 - 2);
          v28 = (uint64_t)*(v27 - 1);
          v30 = *v27;
          v31 = (_QWORD *)*a3;
          swift_bridgeObjectRetain();
          v10 = v30;
          v32 = sub_245472734(v29, v28);
          v34 = v31[2];
          v35 = (v33 & 1) == 0;
          v24 = __OFADD__(v34, v35);
          v36 = v34 + v35;
          if (v24)
            goto LABEL_23;
          v37 = v33;
          if (v31[3] < v36)
          {
            sub_2454732F8(v36, 1, &qword_257473A98);
            v32 = sub_245472734(v29, v28);
            if ((v37 & 1) != (v38 & 1))
              goto LABEL_25;
          }
          if ((v37 & 1) != 0)
            goto LABEL_10;
          v39 = (_QWORD *)*a3;
          *(_QWORD *)(*a3 + 8 * (v32 >> 6) + 64) |= 1 << v32;
          v40 = (uint64_t *)(v39[6] + 16 * v32);
          *v40 = v29;
          v40[1] = v28;
          *(_QWORD *)(v39[7] + 8 * v32) = v10;
          v41 = v39[2];
          v24 = __OFADD__(v41, 1);
          v42 = v41 + 1;
          if (v24)
            goto LABEL_24;
          v39[2] = v42;
          v27 += 3;
        }
        while (--v26);
      }
LABEL_22:
      swift_bridgeObjectRelease();
      return;
    }
LABEL_10:
    v19 = (void *)swift_allocError();
    swift_willThrow();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2574738D0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_24549A4E0();
  __break(1u);
LABEL_26:
  sub_24549A354();
  sub_24549A0E4();
  sub_24549A3D8();
  sub_24549A0E4();
  sub_24549A3F0();
  __break(1u);
}

uint64_t sub_245477D9C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_245477ED8(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_245477DB8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_245478070(a1, a2, a3, (_QWORD *)*v3, &qword_257473A88, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
  *v3 = result;
  return result;
}

uint64_t sub_245477DE4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_24547839C(a1, a2, a3, (_QWORD *)*v3, &qword_257473A78, &qword_257473A80);
  *v3 = result;
  return result;
}

uint64_t sub_245477E10(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_245478250(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_245477E2C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_24547839C(a1, a2, a3, (_QWORD *)*v3, &qword_257473A68, &qword_257473898);
  *v3 = result;
  return result;
}

uint64_t sub_245477E58(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_24547839C(a1, a2, a3, (_QWORD *)*v3, &qword_257473AC8, &qword_257473AD0);
  *v3 = result;
  return result;
}

uint64_t sub_245477E84(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_245478528(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_245477EA0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2454786CC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_245477EBC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24547899C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_245477ED8(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;
  _QWORD *v13;
  size_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254413778);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 4;
  v13 = a4 + 4;
  v14 = 3 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v10 + 4, a4 + 4, v14 * 8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254413758);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_245478070(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_245478250(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257473A70);
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
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_24547839C(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v15 = v14 - 32;
    if (v14 < 32)
      v15 = v14 - 25;
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v16 = (unint64_t)(v13 + 4);
  v17 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v13 != a4 || v16 >= v17 + 8 * v11)
      memmove(v13 + 4, a4 + 4, 8 * v11);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 8 * v11 || v16 >= v17 + 8 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_245478528(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257473AA0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8)
      memmove(v10 + 4, a4 + 4, 24 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257473AA8);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_2454786CC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  size_t v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257473A38);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 4;
  v14 = a4 + 4;
  v15 = 2 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v10 + 4, a4 + 4, v15 * 8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257473A40);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_245478850(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254413780);
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
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_24547899C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257473A30);
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
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_245478B04(unint64_t a1, char a2, char a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  _UNKNOWN **v11;

  v10 = MEMORY[0x24BEE1328];
  v11 = &protocol witness table for Bool;
  LOBYTE(v9) = a3;
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a4[6] + a1) = a2;
  result = sub_24546A54C(&v9, a4[7] + 40 * a1);
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

uint64_t sub_245478B8C(unint64_t a1, char a2, char a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  __int128 v12;
  ValueMetadata *v13;
  unint64_t v14;

  v13 = &type metadata for UsageFrequency;
  v14 = sub_24547C344();
  LOBYTE(v12) = a3;
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a4[6] + a1) = a2;
  result = sub_24546A54C(&v12, a4[7] + 40 * a1);
  v9 = a4[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a4[2] = v11;
  return result;
}

uint64_t sub_245478C28(unint64_t a1, char a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v17 = a5;
  v18 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v16);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(boxed_opaque_existential_1, a3, a5);
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a4[6] + a1) = a2;
  result = sub_24546A54C(&v16, a4[7] + 40 * a1);
  v13 = a4[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a4[2] = v15;
  return result;
}

uint64_t sub_245478CD8(char a1, uint64_t a2, char a3, _QWORD *a4)
{
  uint64_t v7;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _UNKNOWN **v28;

  v7 = MEMORY[0x24BEE1328];
  v27 = MEMORY[0x24BEE1328];
  v28 = &protocol witness table for Bool;
  LOBYTE(v26) = a1;
  v8 = (_QWORD *)*a4;
  v10 = sub_245472930(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_14;
  }
  v14 = v9;
  v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    v16 = (_QWORD *)*a4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7] + 40 * v10;
      __swift_destroy_boxed_opaque_existential_1Tm(v17);
      return sub_24546A54C(&v26, v17);
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_245476E48(&qword_257473888);
    goto LABEL_7;
  }
  sub_245472FDC(v13, a3 & 1);
  v19 = sub_245472930(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_14:
    result = sub_24549A4E0();
    __break(1u);
    return result;
  }
  v10 = v19;
  v16 = (_QWORD *)*a4;
  if ((v14 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v26, v7);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v24 + 16))(v23);
  sub_245478B04(v10, a2, *v23, v16);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v26);
}

uint64_t sub_245478E8C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  _UNKNOWN **v29;

  *(_QWORD *)&v27 = a1;
  v8 = MEMORY[0x24BEE0D00];
  v28 = MEMORY[0x24BEE0D00];
  v29 = &protocol witness table for String;
  *((_QWORD *)&v27 + 1) = a2;
  v9 = (_QWORD *)*a5;
  v11 = sub_245472930(a3, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_14;
  }
  v15 = v10;
  v16 = v9[3];
  if (v16 >= v14 && (a4 & 1) != 0)
  {
LABEL_7:
    v17 = (_QWORD *)*a5;
    if ((v15 & 1) != 0)
    {
LABEL_8:
      v18 = v17[7] + 40 * v11;
      __swift_destroy_boxed_opaque_existential_1Tm(v18);
      return sub_24546A54C(&v27, v18);
    }
    goto LABEL_11;
  }
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_245476E48(&qword_257473888);
    goto LABEL_7;
  }
  sub_245472FDC(v14, a4 & 1);
  v20 = sub_245472930(a3, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
  if ((v15 & 1) != (v21 & 1))
  {
LABEL_14:
    result = sub_24549A4E0();
    __break(1u);
    return result;
  }
  v11 = v20;
  v17 = (_QWORD *)*a5;
  if ((v15 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v22 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v27, v8);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (uint64_t *)((char *)&v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v25 + 16))(v24);
  sub_245479588(v11, a3, *v24, v24[1], v17);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v27);
}

uint64_t sub_245479044(char a1, uint64_t a2, char a3, _QWORD *a4)
{
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  ValueMetadata *v27;
  unint64_t v28;

  v27 = &type metadata for UsageFrequency;
  v28 = sub_24547C344();
  LOBYTE(v26) = a1;
  v8 = (_QWORD *)*a4;
  v10 = sub_245472930(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_14;
  }
  v14 = v9;
  v15 = v8[3];
  if (v15 >= v13 && (a3 & 1) != 0)
  {
LABEL_7:
    v16 = (_QWORD *)*a4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7] + 40 * v10;
      __swift_destroy_boxed_opaque_existential_1Tm(v17);
      return sub_24546A54C(&v26, v17);
    }
    goto LABEL_11;
  }
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_245476E48(&qword_257473888);
    goto LABEL_7;
  }
  sub_245472FDC(v13, a3 & 1);
  v19 = sub_245472930(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
  if ((v14 & 1) != (v20 & 1))
  {
LABEL_14:
    result = sub_24549A4E0();
    __break(1u);
    return result;
  }
  v10 = v19;
  v16 = (_QWORD *)*a4;
  if ((v14 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v21 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v26, (uint64_t)&type metadata for UsageFrequency);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v25 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v24 + 16))(v23);
  sub_245478B8C(v10, a2, *v23, v16);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v26);
}

uint64_t sub_2454791FC(uint64_t a1, uint64_t a2, char a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v32 = a5;
  v33 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v31);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(boxed_opaque_existential_1, a1, a5);
  v13 = (_QWORD *)*a4;
  v15 = sub_245472930(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a3 & 1) != 0)
  {
LABEL_7:
    v21 = (_QWORD *)*a4;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = v21[7] + 40 * v15;
      __swift_destroy_boxed_opaque_existential_1Tm(v22);
      return sub_24546A54C(&v31, v22);
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_245476E48(&qword_257473888);
    goto LABEL_7;
  }
  sub_245472FDC(v18, a3 & 1);
  v24 = sub_245472930(a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter, (uint64_t (*)(uint64_t, uint64_t))sub_245475E0C);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    result = sub_24549A4E0();
    __break(1u);
    return result;
  }
  v15 = v24;
  v21 = (_QWORD *)*a4;
  if ((v19 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v31, v32);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v30 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v29 + 16))(v28);
  sub_245478C28(v15, a2, (uint64_t)v28, v21, a5, a6);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v31);
}

uint64_t sub_2454793D0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  _UNKNOWN **v29;

  *(_QWORD *)&v27 = a1;
  v8 = MEMORY[0x24BEE0D00];
  v28 = MEMORY[0x24BEE0D00];
  v29 = &protocol witness table for String;
  *((_QWORD *)&v27 + 1) = a2;
  v9 = (_QWORD *)*a5;
  v11 = sub_245472930(a3, (void (*)(uint64_t))PeopleSuggesterShadowEvaluationField.rawValue.getter, sub_24547616C);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_14;
  }
  v15 = v10;
  v16 = v9[3];
  if (v16 >= v14 && (a4 & 1) != 0)
  {
LABEL_7:
    v17 = (_QWORD *)*a5;
    if ((v15 & 1) != 0)
    {
LABEL_8:
      v18 = v17[7] + 40 * v11;
      __swift_destroy_boxed_opaque_existential_1Tm(v18);
      return sub_24546A54C(&v27, v18);
    }
    goto LABEL_11;
  }
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_245476E48(&qword_2574738C0);
    goto LABEL_7;
  }
  sub_245473ED4(v14, a4 & 1);
  v20 = sub_245472930(a3, (void (*)(uint64_t))PeopleSuggesterShadowEvaluationField.rawValue.getter, sub_24547616C);
  if ((v15 & 1) != (v21 & 1))
  {
LABEL_14:
    result = sub_24549A4E0();
    __break(1u);
    return result;
  }
  v11 = v20;
  v17 = (_QWORD *)*a5;
  if ((v15 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v22 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v27, v8);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (uint64_t *)((char *)&v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v25 + 16))(v24);
  sub_245479588(v11, a3, *v24, v24[1], v17);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v27);
}

uint64_t sub_245479588(unint64_t a1, char a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  _UNKNOWN **v12;

  *(_QWORD *)&v10 = a3;
  v11 = MEMORY[0x24BEE0D00];
  v12 = &protocol witness table for String;
  *((_QWORD *)&v10 + 1) = a4;
  a5[(a1 >> 6) + 8] |= 1 << a1;
  *(_BYTE *)(a5[6] + a1) = a2;
  result = sub_24546A54C(&v10, a5[7] + 40 * a1);
  v7 = a5[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a5[2] = v9;
  return result;
}

uint64_t sub_245479614(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2574738D0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_24549A42C();
  __break(1u);
  return result;
}

char *sub_24547971C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_24549A42C();
  __break(1u);
  return result;
}

char *sub_245479800(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  result = (char *)sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_2454798E8(uint64_t a1, void (*a2)(_QWORD *, _BYTE *))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  _QWORD v21[2];
  _BYTE v22[8];
  uint64_t v23;
  uint64_t v24;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v7)
      return swift_release();
    v19 = *(_QWORD *)(v24 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v7)
        return swift_release();
      v19 = *(_QWORD *)(v24 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v7)
          return swift_release();
        v19 = *(_QWORD *)(v24 + 8 * v9);
        if (!v19)
        {
          v9 = v18 + 3;
          if (v18 + 3 >= v7)
            return swift_release();
          v19 = *(_QWORD *)(v24 + 8 * v9);
          if (!v19)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v19 - 1) & v19;
    v11 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_5:
    v12 = 16 * v11;
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + v12);
    v14 = *v13;
    v15 = v13[1];
    v16 = *(_QWORD *)(a1 + 56) + v12;
    LOBYTE(v13) = *(_BYTE *)v16;
    v17 = *(_QWORD *)(v16 + 8);
    v21[0] = v14;
    v21[1] = v15;
    v22[0] = (_BYTE)v13;
    v23 = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v21, v22);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v20 = v18 + 4;
  if (v20 >= v7)
    return swift_release();
  v19 = *(_QWORD *)(v24 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v7)
      return swift_release();
    v19 = *(_QWORD *)(v24 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_245479ABC(uint64_t a1, void (*a2)(void **, _BYTE *))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  id v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  void *v19;
  _BYTE v20[8];
  uint64_t v21;
  uint64_t v22;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    v16 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v16 >= v7)
      goto LABEL_23;
    v17 = *(_QWORD *)(v22 + 8 * v16);
    ++v8;
    if (!v17)
    {
      v8 = v16 + 1;
      if (v16 + 1 >= v7)
        goto LABEL_23;
      v17 = *(_QWORD *)(v22 + 8 * v8);
      if (!v17)
      {
        v8 = v16 + 2;
        if (v16 + 2 >= v7)
          goto LABEL_23;
        v17 = *(_QWORD *)(v22 + 8 * v8);
        if (!v17)
        {
          v8 = v16 + 3;
          if (v16 + 3 >= v7)
            goto LABEL_23;
          v17 = *(_QWORD *)(v22 + 8 * v8);
          if (!v17)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v17 - 1) & v17;
    v10 = __clz(__rbit64(v17)) + (v8 << 6);
LABEL_5:
    v11 = *(void **)(*(_QWORD *)(a1 + 48) + 8 * v10);
    v12 = *(_QWORD *)(a1 + 56) + 16 * v10;
    v13 = *(_BYTE *)v12;
    v14 = *(_QWORD *)(v12 + 8);
    v19 = v11;
    v20[0] = v13;
    v21 = v14;
    v15 = v11;
    swift_bridgeObjectRetain();
    a2(&v19, v20);
    swift_bridgeObjectRelease();

  }
  v18 = v16 + 4;
  if (v18 >= v7)
  {
LABEL_23:
    swift_release();
    return;
  }
  v17 = *(_QWORD *)(v22 + 8 * v18);
  if (v17)
  {
    v8 = v18;
    goto LABEL_22;
  }
  while (1)
  {
    v8 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v8 >= v7)
      goto LABEL_23;
    v17 = *(_QWORD *)(v22 + 8 * v8);
    ++v18;
    if (v17)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
}

void sub_245479C84(uint64_t a1, _QWORD *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  id v31;

  v5 = v4;
  v7 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_24549A2A0();
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    sub_24547C3F0();
    sub_24549A1BC();
    v7 = v26;
    v23 = v27;
    v8 = v28;
    v9 = v29;
    v10 = v30;
  }
  else
  {
    v11 = -1 << *(_BYTE *)(a1 + 32);
    v23 = a1 + 56;
    v12 = ~v11;
    v13 = -v11;
    if (v13 < 64)
      v14 = ~(-1 << v13);
    else
      v14 = -1;
    v10 = v14 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v8 = v12;
    v9 = 0;
  }
  v22 = (unint64_t)(v8 + 64) >> 6;
  if ((v7 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_8:
  if (sub_24549A300())
  {
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = v31;
    swift_unknownObjectRelease();
    v16 = v9;
    v17 = v10;
    while (v15)
    {
      v31 = v15;
      sub_24546E1A0(&v31, a2, a3, a4);

      if (v5)
        break;
      v9 = v16;
      v10 = v17;
      if (v7 < 0)
        goto LABEL_8;
LABEL_11:
      if (v10)
      {
        v17 = (v10 - 1) & v10;
        v18 = __clz(__rbit64(v10)) | (v9 << 6);
        v16 = v9;
      }
      else
      {
        v16 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          return;
        }
        if (v16 >= v22)
          break;
        v19 = *(_QWORD *)(v23 + 8 * v16);
        if (!v19)
        {
          v20 = v9 + 2;
          if (v9 + 2 >= v22)
            break;
          v19 = *(_QWORD *)(v23 + 8 * v20);
          if (v19)
            goto LABEL_22;
          v20 = v9 + 3;
          if (v9 + 3 >= v22)
            break;
          v19 = *(_QWORD *)(v23 + 8 * v20);
          if (v19)
            goto LABEL_22;
          v20 = v9 + 4;
          if (v9 + 4 >= v22)
            break;
          v19 = *(_QWORD *)(v23 + 8 * v20);
          if (v19)
          {
LABEL_22:
            v16 = v20;
          }
          else
          {
            v16 = v9 + 5;
            if (v9 + 5 >= v22)
              break;
            v19 = *(_QWORD *)(v23 + 8 * v16);
            if (!v19)
            {
              v21 = v9 + 6;
              while (v22 != v21)
              {
                v19 = *(_QWORD *)(v23 + 8 * v21++);
                if (v19)
                {
                  v16 = v21 - 1;
                  goto LABEL_23;
                }
              }
              break;
            }
          }
        }
LABEL_23:
        v17 = (v19 - 1) & v19;
        v18 = __clz(__rbit64(v19)) + (v16 << 6);
      }
      v15 = *(id *)(*(_QWORD *)(v7 + 48) + 8 * v18);
    }
  }
  sub_24546A03C();
}

uint64_t sub_245479F68(uint64_t a1, _QWORD *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23[2];
  int64_t v24;

  v9 = a1 + 56;
  v10 = 1 << *(_BYTE *)(a1 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(a1 + 56);
  v24 = (unint64_t)(v10 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v14 = 0;
  if (!v12)
    goto LABEL_5;
LABEL_4:
  v15 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v18)) + (v14 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v21 = v20[1];
    v23[0] = *v20;
    v23[1] = v21;
    swift_bridgeObjectRetain();
    sub_24546E34C(v23, a2, a3, a4);
    if (v4)
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    result = swift_bridgeObjectRelease();
    if (v12)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v14++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v14 >= v24)
      return swift_release();
    v18 = *(_QWORD *)(v9 + 8 * v14);
    if (!v18)
    {
      v19 = v14 + 1;
      if (v14 + 1 >= v24)
        return swift_release();
      v18 = *(_QWORD *)(v9 + 8 * v19);
      if (v18)
        goto LABEL_14;
      v19 = v14 + 2;
      if (v14 + 2 >= v24)
        return swift_release();
      v18 = *(_QWORD *)(v9 + 8 * v19);
      if (v18)
        goto LABEL_14;
      v19 = v14 + 3;
      if (v14 + 3 >= v24)
        return swift_release();
      v18 = *(_QWORD *)(v9 + 8 * v19);
      if (v18)
      {
LABEL_14:
        v14 = v19;
        goto LABEL_15;
      }
      v22 = v14 + 4;
      if (v14 + 4 >= v24)
        return swift_release();
      v18 = *(_QWORD *)(v9 + 8 * v22);
      v14 += 4;
      if (!v18)
        break;
    }
LABEL_15:
    v12 = (v18 - 1) & v18;
  }
  while (1)
  {
    v14 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v14 >= v24)
      return swift_release();
    v18 = *(_QWORD *)(v9 + 8 * v14);
    ++v22;
    if (v18)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24547A140(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v8)
      return swift_release();
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v10;
    if (!v14)
    {
      v10 = v13 + 1;
      if (v13 + 1 >= v8)
        return swift_release();
      v14 = *(_QWORD *)(v4 + 8 * v10);
      if (!v14)
      {
        v10 = v13 + 2;
        if (v13 + 2 >= v8)
          return swift_release();
        v14 = *(_QWORD *)(v4 + 8 * v10);
        if (!v14)
        {
          v10 = v13 + 3;
          if (v13 + 3 >= v8)
            return swift_release();
          v14 = *(_QWORD *)(v4 + 8 * v10);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v10 << 6);
LABEL_5:
    result = a2(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v12), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v12));
  }
  v15 = v13 + 4;
  if (v15 >= v8)
    return swift_release();
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
    v10 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v8)
      return swift_release();
    v14 = *(_QWORD *)(v4 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_24547A2A4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_24549A42C();
  __break(1u);
  return result;
}

unint64_t sub_24547A3BC()
{
  unint64_t result;
  double v1;
  uint64_t v2;
  double v3;

  result = sub_245499F70();
  if (v1 < 0.0)
  {
    sub_24546A66C();
    swift_allocError();
    *(_QWORD *)v2 = 0xD00000000000001BLL;
    *(_QWORD *)(v2 + 8) = 0x800000024549DFC0;
    *(_BYTE *)(v2 + 16) = 1;
    return swift_willThrow();
  }
  v3 = v1 / 86400.0;
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v3 <= -1.0)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v3 < 1.84467441e19)
    return (unint64_t)v3;
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_24547A488(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  char *v24;
  uint64_t result;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  unint64_t v34;
  char *v35;
  char *v36;
  unint64_t v37;
  BOOL v38;
  unint64_t v39;
  size_t v40;
  uint64_t v41;
  void (*v42)(_QWORD, _QWORD, _QWORD);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  unint64_t v61;
  unint64_t v62;
  size_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  unint64_t v77;
  unint64_t v78;
  size_t v79;
  char *v80;
  int64_t v81;
  uint64_t v82;
  void (*v83)(char *, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  char v86;
  unint64_t v87;
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
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  unint64_t v110;
  unint64_t v111;
  size_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  unint64_t v128;
  unint64_t v129;
  size_t v130;
  size_t v131;
  char *v132;
  char *v133;
  int64_t v134;
  uint64_t v135;
  uint64_t v136;
  void (*v137)(char *, uint64_t, uint64_t);
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char v141;
  unint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  _QWORD v149[4];
  uint64_t v150;
  char *v151;
  unsigned int (*v152)(char *, uint64_t, uint64_t);
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  void (*v157)(char *, char *, uint64_t);
  void (*v158)(char *, uint64_t, uint64_t);
  void (*v159)(char *, uint64_t, uint64_t);
  uint64_t v160;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2574739D0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v149 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v149 - v8;
  v10 = sub_245499FB8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v149 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v18 = *(_QWORD *)(a1 + 16);
  if (!v18)
    return 4;
  v155 = (char *)v149 - v16;
  v150 = v18;
  v151 = v17;
  v19 = *(unsigned __int8 *)(v11 + 80);
  v149[2] = a1;
  v20 = a1 + ((v19 + 32) & ~v19);
  v156 = *(_QWORD *)(v11 + 72);
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v21(v9, v20 + v156 * (v18 - 1), v10);
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
  v22(v9, 0, 1, v10);
  v158 = v21;
  v21(v15, a2, v10);
  v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v23(v9, 1, v10) == 1)
  {
    v24 = v155;
    v157 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v157(v155, v15, v10);
    sub_24546AC30((uint64_t)v9, &qword_2574739D0);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
    v24 = v155;
    v157 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v157(v155, v9, v10);
  }
  v26 = sub_24547A3BC();
  v27 = v24;
  v28 = v151;
  v149[1] = 0;
  v155 = *(char **)(v11 + 8);
  ((void (*)(char *, uint64_t))v155)(v27, v10);
  if ((v26 & 0x8000000000000000) != 0)
    goto LABEL_256;
  v29 = v150;
  if (__OFADD__(v26, 1))
    goto LABEL_254;
  v160 = sub_245471494(0, v26 + 1);
  swift_bridgeObjectRetain();
  v30 = 0;
  v149[3] = a2;
  v153 = v10;
  v154 = (uint64_t)v22;
  v152 = v23;
  do
  {
    v158(v7, v20, v10);
    v31 = v30 + 1;
    if (__OFADD__(v30, 1))
    {
      __break(1u);
LABEL_227:
      __break(1u);
      goto LABEL_228;
    }
    v22(v7, 0, 1, v10);
    if (v23(v7, 1, v10) == 1)
      goto LABEL_30;
    v157(v28, v7, v10);
    sub_245499F70();
    if (v32 >= 0.0)
    {
      v33 = v32 / 86400.0;
      if ((~*(_QWORD *)&v33 & 0x7FF0000000000000) == 0)
        goto LABEL_229;
      if (v33 <= -1.0)
        goto LABEL_230;
      if (v33 >= 1.84467441e19)
        goto LABEL_231;
      v34 = (unint64_t)v33;
      if (((unint64_t)v33 & 0x8000000000000000) != 0)
        goto LABEL_232;
      v35 = v28;
      v36 = (char *)v160;
      v37 = *(_QWORD *)(v160 + 16);
      v38 = v34 >= v37;
      v39 = v34 - v37;
      if (v38)
      {
        v40 = v39 + 1;
        if (__OFADD__(v39, 1))
          goto LABEL_243;
        if ((v40 & 0x8000000000000000) != 0)
          goto LABEL_260;
        if (v39 == -1)
        {
          v41 = MEMORY[0x24BEE4AF8];
        }
        else
        {
          v41 = sub_24549A15C();
          *(_QWORD *)(v41 + 16) = v40;
          bzero((void *)(v41 + 32), v40);
        }
        v29 = v150;
        sub_245466380(v41);
        v36 = (char *)v160;
        v35 = v151;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v36 = sub_2454961BC((uint64_t)v36);
      if (*((_QWORD *)v36 + 2) <= v34)
        goto LABEL_233;
      v36[v34 + 32] = 1;
      v160 = (uint64_t)v36;
      v10 = v153;
      v22 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v154;
      v28 = v35;
      v23 = v152;
    }
    ((void (*)(char *, uint64_t))v155)(v28, v10);
    ++v30;
    v20 += v156;
  }
  while (v31 != v29);
  v22(v7, 1, 1, v10);
LABEL_30:
  swift_bridgeObjectRelease();
  v42 = (void (*)(_QWORD, _QWORD, _QWORD))v160;
  v43 = *(_QWORD *)(v160 + 16);
  if (!v43)
    goto LABEL_37;
  if ((*(_BYTE *)(v160 + 32) & 1) != 0)
  {
    if (v43 != 1)
    {
      v44 = 33;
      do
      {
        v45 = v44 - 31;
        if (__OFADD__(v44 - 32, 1))
          goto LABEL_253;
        if (*(_BYTE *)(v160 + v44) != 1)
          goto LABEL_38;
        ++v44;
      }
      while (v45 != v43);
    }
LABEL_37:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_38:
  v46 = 0;
  v47 = 0;
  do
  {
    v48 = v46 + 1;
    if (__OFADD__(v46, 1))
      goto LABEL_227;
    v49 = __OFADD__(v47, 7);
    v47 += 7;
    if (v49)
      v47 = 0x7FFFFFFFFFFFFFFFLL;
    ++v46;
  }
  while (v47 < v43);
  v155 = (char *)(v160 + 32);
  v159 = (void (*)(char *, uint64_t, uint64_t))MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  sub_245477DE4(0, v48 & ~(v48 >> 63), 0);
  if (v48 < 0)
    goto LABEL_257;
  v50 = v159;
  v156 = v43;
  v157 = (void (*)(char *, char *, uint64_t))v42;
  if (!v48)
    goto LABEL_74;
  v48 = 0;
  v51 = 7;
  v52 = 32;
  do
  {
    v158 = v50;
    if (v43 >= v51)
      v53 = v51;
    else
      v53 = v43;
    if (v48 >= (unint64_t)v43)
      goto LABEL_238;
    if (v48 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_239;
    if (v43 >= v48 + 7)
      v54 = v48 + 7;
    else
      v54 = v43;
    if (v54 < v48)
      goto LABEL_240;
    v55 = *((_QWORD *)v42 + 2);
    if (v55 < v48 || (uint64_t)v55 < v54)
      goto LABEL_241;
    sub_24549A4B0();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain_n();
    v56 = swift_dynamicCastClass();
    if (!v56)
    {
      swift_bridgeObjectRelease();
      v56 = MEMORY[0x24BEE4AF8];
    }
    v57 = v53 + v52;
    v58 = *(_QWORD *)(v56 + 16);
    swift_release();
    v59 = v57 - 32;
    if (v57 - 32 == v58)
    {
      v60 = (char *)swift_dynamicCastClass();
      if (!v60)
      {
        swift_bridgeObjectRelease();
        v60 = (char *)MEMORY[0x24BEE4AF8];
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v60 = (char *)MEMORY[0x24BEE4AF8];
      if (v48 != v54)
      {
        if (v59 < 1)
        {
          if (v59 < 0)
            goto LABEL_261;
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_257473A70);
          v60 = (char *)swift_allocObject();
          v63 = _swift_stdlib_malloc_size(v60);
          *((_QWORD *)v60 + 2) = v59;
          *((_QWORD *)v60 + 3) = 2 * v63 - 64;
        }
        v64 = v60 + 32;
        if (&v155[v48] < &v60[v57] && v64 < &v155[v54])
          goto LABEL_261;
        memcpy(v64, &v155[v48], v57 - 32);
      }
    }
    swift_bridgeObjectRelease();
    v50 = v158;
    v159 = v158;
    v62 = *((_QWORD *)v158 + 2);
    v61 = *((_QWORD *)v158 + 3);
    if (v62 >= v61 >> 1)
    {
      sub_245477DE4(v61 > 1, v62 + 1, 1);
      v50 = v159;
    }
    *((_QWORD *)v50 + 2) = v62 + 1;
    *((_QWORD *)v50 + v62 + 4) = v60;
    v51 += 7;
    v52 -= 7;
    v48 += 7;
    --v46;
    v43 = v156;
  }
  while (v46);
  if (v48 < v156)
  {
LABEL_74:
    v65 = v48 + 7;
    v66 = 32 - v48;
    v67 = v48;
    while (1)
    {
      v158 = v50;
      v68 = v43 >= v65 ? v65 : v43;
      v69 = v67 + 7;
      if (__OFADD__(v67, 7))
        break;
      if (v43 >= v69)
        v43 = v67 + 7;
      if (v43 < v67)
        goto LABEL_235;
      if (v48 < 0)
        goto LABEL_236;
      v70 = *((_QWORD *)v42 + 2);
      if (v70 < (unint64_t)v67 || v70 < v43)
        goto LABEL_237;
      sub_24549A4B0();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain_n();
      v72 = swift_dynamicCastClass();
      if (!v72)
      {
        swift_bridgeObjectRelease();
        v72 = MEMORY[0x24BEE4AF8];
      }
      v73 = v68 + v66;
      v74 = *(_QWORD *)(v72 + 16);
      swift_release();
      v75 = v73 - 32;
      if (v73 - 32 == v74)
      {
        v42 = (void (*)(_QWORD, _QWORD, _QWORD))v157;
        v76 = (char *)swift_dynamicCastClass();
        if (!v76)
        {
          swift_bridgeObjectRelease();
          v76 = (char *)MEMORY[0x24BEE4AF8];
        }
      }
      else
      {
        v42 = (void (*)(_QWORD, _QWORD, _QWORD))v157;
        swift_bridgeObjectRelease();
        v76 = (char *)MEMORY[0x24BEE4AF8];
        if (v67 != v43)
        {
          if (v75 < 1)
          {
            if (v75 < 0)
              goto LABEL_261;
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_257473A70);
            v76 = (char *)swift_allocObject();
            v79 = _swift_stdlib_malloc_size(v76);
            *((_QWORD *)v76 + 2) = v75;
            *((_QWORD *)v76 + 3) = 2 * v79 - 64;
          }
          v80 = v76 + 32;
          if (&v155[v67] < &v76[v73] && v80 < &v155[v43])
            goto LABEL_261;
          memcpy(v80, &v155[v67], v73 - 32);
        }
      }
      swift_bridgeObjectRelease();
      v50 = v158;
      v159 = v158;
      v78 = *((_QWORD *)v158 + 2);
      v77 = *((_QWORD *)v158 + 3);
      if (v78 >= v77 >> 1)
      {
        sub_245477DE4(v77 > 1, v78 + 1, 1);
        v50 = v159;
      }
      *((_QWORD *)v50 + 2) = v78 + 1;
      *((_QWORD *)v50 + v78 + 4) = v76;
      v67 += 7;
      v65 += 7;
      v66 -= 7;
      v43 = v156;
      if (v69 >= v156)
        goto LABEL_103;
    }
LABEL_234:
    __break(1u);
LABEL_235:
    __break(1u);
LABEL_236:
    __break(1u);
LABEL_237:
    __break(1u);
LABEL_238:
    __break(1u);
LABEL_239:
    __break(1u);
LABEL_240:
    __break(1u);
LABEL_241:
    __break(1u);
LABEL_242:
    __break(1u);
LABEL_243:
    __break(1u);
LABEL_244:
    __break(1u);
LABEL_245:
    __break(1u);
LABEL_246:
    __break(1u);
LABEL_247:
    __break(1u);
LABEL_248:
    __break(1u);
LABEL_249:
    __break(1u);
LABEL_250:
    __break(1u);
LABEL_251:
    __break(1u);
LABEL_252:
    __break(1u);
LABEL_253:
    __break(1u);
LABEL_254:
    __break(1u);
    goto LABEL_255;
  }
LABEL_103:
  swift_bridgeObjectRelease();
  v81 = *((_QWORD *)v50 + 2);
  if (!v81)
  {
    swift_release();
    v83 = (void (*)(char *, uint64_t, uint64_t))MEMORY[0x24BEE4AF8];
    v91 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v91)
      goto LABEL_124;
    goto LABEL_130;
  }
  v159 = (void (*)(char *, uint64_t, uint64_t))MEMORY[0x24BEE4AF8];
  sub_245477E10(0, v81, 0);
  v82 = 0;
  v83 = v159;
  while (2)
  {
    v84 = *((_QWORD *)v50 + v82 + 4);
    v85 = *(_QWORD *)(v84 + 16);
    if (v85)
    {
      if (*(_BYTE *)(v84 + 32) == 1)
        goto LABEL_107;
      if (v85 != 1)
      {
        if ((*(_BYTE *)(v84 + 33) & 1) != 0)
        {
LABEL_107:
          v86 = 1;
          goto LABEL_110;
        }
        if (v85 == 2)
          goto LABEL_109;
        v89 = 34;
        while (1)
        {
          v90 = v89 - 31;
          if (__OFADD__(v89 - 32, 1))
            break;
          v86 = *(_BYTE *)(v84 + v89);
          if ((v86 & 1) == 0)
          {
            ++v89;
            if (v90 != v85)
              continue;
          }
          goto LABEL_110;
        }
LABEL_228:
        __break(1u);
LABEL_229:
        __break(1u);
LABEL_230:
        __break(1u);
LABEL_231:
        __break(1u);
LABEL_232:
        __break(1u);
LABEL_233:
        __break(1u);
        goto LABEL_234;
      }
    }
LABEL_109:
    v86 = 0;
LABEL_110:
    v159 = v83;
    v88 = *((_QWORD *)v83 + 2);
    v87 = *((_QWORD *)v83 + 3);
    if (v88 >= v87 >> 1)
    {
      sub_245477E10(v87 > 1, v88 + 1, 1);
      v83 = v159;
    }
    ++v82;
    *((_QWORD *)v83 + 2) = v88 + 1;
    *((_BYTE *)v83 + v88 + 32) = v86;
    if (v82 != v81)
      continue;
    break;
  }
  swift_release();
  v91 = *((_QWORD *)v83 + 2);
  if (!v91)
    goto LABEL_130;
LABEL_124:
  if ((*((_BYTE *)v83 + 32) & 1) != 0)
  {
    if (v91 != 1)
    {
      v92 = 33;
      while (1)
      {
        v93 = v92 - 31;
        if (__OFADD__(v92 - 32, 1))
          break;
        if (*((_BYTE *)v83 + v92) != 1)
          goto LABEL_131;
        ++v92;
        if (v93 == v91)
          goto LABEL_130;
      }
LABEL_255:
      __break(1u);
LABEL_256:
      __break(1u);
LABEL_257:
      __break(1u);
LABEL_258:
      __break(1u);
LABEL_259:
      __break(1u);
LABEL_260:
      sub_24549A3E4();
      __break(1u);
LABEL_261:
      result = sub_24549A42C();
      __break(1u);
      return result;
    }
LABEL_130:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 1;
  }
LABEL_131:
  v94 = 0;
  v95 = 0;
  do
  {
    v96 = v94 + 1;
    if (__OFADD__(v94, 1))
      goto LABEL_242;
    v49 = __OFADD__(v95, 4);
    v95 += 4;
    if (v49)
      v95 = 0x7FFFFFFFFFFFFFFFLL;
    ++v94;
  }
  while (v95 < v91);
  v155 = (char *)v83 + 32;
  v159 = (void (*)(char *, uint64_t, uint64_t))MEMORY[0x24BEE4AF8];
  sub_245477DE4(0, v96 & ~(v96 >> 63), 0);
  if (v96 < 0)
    goto LABEL_259;
  v97 = (uint64_t)v159;
  v158 = (void (*)(char *, uint64_t, uint64_t))v91;
  v98 = 0;
  if (!v96)
    goto LABEL_167;
  v99 = 4;
  v100 = 32;
  do
  {
    v156 = v97;
    if (v91 >= v99)
      v101 = v99;
    else
      v101 = v91;
    if (v98 >= (unint64_t)v91)
      goto LABEL_249;
    if (v98 == 0x7FFFFFFFFFFFFFFCLL)
      goto LABEL_250;
    if (v91 >= v98 + 4)
      v102 = v98 + 4;
    else
      v102 = v91;
    if (v102 < v98)
      goto LABEL_251;
    v103 = *((_QWORD *)v83 + 2);
    if (v103 < (unint64_t)v98 || v103 < v102)
      goto LABEL_252;
    v104 = v98;
    sub_24549A4B0();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain_n();
    v105 = swift_dynamicCastClass();
    if (!v105)
    {
      swift_bridgeObjectRelease();
      v105 = MEMORY[0x24BEE4AF8];
    }
    v106 = v101 + v100;
    v107 = *(_QWORD *)(v105 + 16);
    swift_release();
    v108 = v106 - 32;
    if (v106 - 32 == v107)
    {
      v109 = (char *)swift_dynamicCastClass();
      if (!v109)
      {
        swift_bridgeObjectRelease();
        v109 = (char *)MEMORY[0x24BEE4AF8];
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v109 = (char *)MEMORY[0x24BEE4AF8];
      if (v104 != v102)
      {
        if (v108 < 1)
        {
          v113 = v155;
          if (v108 < 0)
            goto LABEL_261;
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_257473A70);
          v109 = (char *)swift_allocObject();
          v112 = _swift_stdlib_malloc_size(v109);
          *((_QWORD *)v109 + 2) = v108;
          *((_QWORD *)v109 + 3) = 2 * v112 - 64;
          v113 = v155;
        }
        v114 = v109 + 32;
        if (&v113[v104] < &v109[v106] && v114 < &v113[v102])
          goto LABEL_261;
        memcpy(v114, &v113[v104], v106 - 32);
      }
    }
    swift_bridgeObjectRelease();
    v97 = v156;
    v159 = (void (*)(char *, uint64_t, uint64_t))v156;
    v111 = *(_QWORD *)(v156 + 16);
    v110 = *(_QWORD *)(v156 + 24);
    if (v111 >= v110 >> 1)
    {
      sub_245477DE4(v110 > 1, v111 + 1, 1);
      v97 = (uint64_t)v159;
    }
    *(_QWORD *)(v97 + 16) = v111 + 1;
    *(_QWORD *)(v97 + 8 * v111 + 32) = v109;
    v99 += 4;
    v100 -= 4;
    v98 = v104 + 4;
    --v94;
    v91 = (uint64_t)v158;
  }
  while (v94);
  if (v98 < (uint64_t)v158)
  {
LABEL_167:
    v115 = v98 + 4;
    v116 = 32 - v98;
    v117 = v98;
    v156 = v98;
    do
    {
      v118 = v97;
      v119 = v91 >= v115 ? v115 : v91;
      v120 = v117 + 4;
      if (__OFADD__(v117, 4))
        goto LABEL_245;
      if (v91 >= v120)
        v121 = v117 + 4;
      else
        v121 = v91;
      if (v121 < (uint64_t)v117)
        goto LABEL_246;
      if (v98 < 0)
        goto LABEL_247;
      v122 = *((_QWORD *)v83 + 2);
      if (v122 < v117 || v122 < v121)
        goto LABEL_248;
      sub_24549A4B0();
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain_n();
      v124 = swift_dynamicCastClass();
      if (!v124)
      {
        swift_bridgeObjectRelease();
        v124 = MEMORY[0x24BEE4AF8];
      }
      v125 = v119 + v116;
      v126 = *(_QWORD *)(v124 + 16);
      swift_release();
      if (v125 - 32 == v126)
      {
        v127 = (char *)swift_dynamicCastClass();
        v97 = v118;
        if (!v127)
        {
          swift_bridgeObjectRelease();
          v127 = (char *)MEMORY[0x24BEE4AF8];
        }
      }
      else
      {
        v154 = v125 - 32;
        swift_bridgeObjectRelease();
        v127 = (char *)MEMORY[0x24BEE4AF8];
        v97 = v118;
        if (v117 != v121)
        {
          v130 = v154;
          if (v154 < 1)
          {
            v132 = v155;
            if (v154 < 0)
              goto LABEL_261;
          }
          else
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_257473A70);
            v127 = (char *)swift_allocObject();
            v131 = _swift_stdlib_malloc_size(v127);
            v130 = v154;
            v132 = v155;
            *((_QWORD *)v127 + 2) = v154;
            *((_QWORD *)v127 + 3) = 2 * v131 - 64;
          }
          v133 = v127 + 32;
          if (&v132[v117] < &v127[v125] && v133 < &v132[v121])
            goto LABEL_261;
          memcpy(v133, &v132[v117], v130);
        }
      }
      swift_bridgeObjectRelease();
      v159 = (void (*)(char *, uint64_t, uint64_t))v97;
      v129 = *(_QWORD *)(v97 + 16);
      v128 = *(_QWORD *)(v97 + 24);
      if (v129 >= v128 >> 1)
      {
        sub_245477DE4(v128 > 1, v129 + 1, 1);
        v97 = (uint64_t)v159;
      }
      *(_QWORD *)(v97 + 16) = v129 + 1;
      *(_QWORD *)(v97 + 8 * v129 + 32) = v127;
      v117 += 4;
      v115 += 4;
      v116 -= 4;
      v91 = (uint64_t)v158;
      v98 = v156;
    }
    while (v120 < (uint64_t)v158);
  }
  swift_bridgeObjectRelease();
  v134 = *(_QWORD *)(v97 + 16);
  if (!v134)
  {
    swift_release();
    v137 = (void (*)(char *, uint64_t, uint64_t))MEMORY[0x24BEE4AF8];
    v146 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (!v146)
      goto LABEL_224;
LABEL_218:
    if (*((_BYTE *)v137 + 32) != 1)
    {
LABEL_225:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 3;
    }
    if (v146 == 1)
      goto LABEL_224;
    v147 = 33;
    while (1)
    {
      v148 = v147 - 31;
      if (__OFADD__(v147 - 32, 1))
        goto LABEL_258;
      if (*((_BYTE *)v137 + v147) != 1)
        goto LABEL_225;
      ++v147;
      if (v148 == v146)
        goto LABEL_224;
    }
  }
  v159 = (void (*)(char *, uint64_t, uint64_t))MEMORY[0x24BEE4AF8];
  v135 = v97;
  sub_245477E10(0, v134, 0);
  v136 = 0;
  v137 = v159;
  v138 = v135 + 32;
  while (2)
  {
    v139 = *(_QWORD *)(v138 + 8 * v136);
    v140 = *(_QWORD *)(v139 + 16);
    if (!v140)
      goto LABEL_203;
    if (*(_BYTE *)(v139 + 32) == 1)
      goto LABEL_201;
    if (v140 != 1)
    {
      if ((*(_BYTE *)(v139 + 33) & 1) == 0)
      {
        if (v140 != 2)
        {
          v144 = 34;
          while (1)
          {
            v145 = v144 - 31;
            if (__OFADD__(v144 - 32, 1))
              goto LABEL_244;
            v141 = *(_BYTE *)(v139 + v144);
            if ((v141 & 1) == 0)
            {
              ++v144;
              if (v145 != v140)
                continue;
            }
            goto LABEL_204;
          }
        }
        goto LABEL_203;
      }
LABEL_201:
      v141 = 1;
    }
    else
    {
LABEL_203:
      v141 = 0;
    }
LABEL_204:
    v159 = v137;
    v143 = *((_QWORD *)v137 + 2);
    v142 = *((_QWORD *)v137 + 3);
    if (v143 >= v142 >> 1)
    {
      sub_245477E10(v142 > 1, v143 + 1, 1);
      v137 = v159;
    }
    ++v136;
    *((_QWORD *)v137 + 2) = v143 + 1;
    *((_BYTE *)v137 + v143 + 32) = v141;
    if (v136 != v134)
      continue;
    break;
  }
  swift_release();
  v146 = *((_QWORD *)v137 + 2);
  if (v146)
    goto LABEL_218;
LABEL_224:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 2;
}

uint64_t _s15ReportingPlugin31PeopleSuggesterMetricsCollectorV019getShadowEvaluationE0ySaySDySSSo8NSObjectCGGSayAA0C21SuggestionsJointEventCGFZ_0(unint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  BOOL v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  id v27;
  int64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  unint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  char v41;
  unint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  _QWORD v73[2];
  uint64_t v74;
  uint64_t v75;
  int64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  char *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  const char *v86;
  char *v87;
  const char *v88;
  const char *v89;
  const char *v90;
  char *v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  int64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t i;
  char *v104;
  unint64_t v105;
  uint64_t v106;
  _QWORD v107[6];

  v75 = sub_245499FB8();
  v74 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v3 = (char *)v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BEE4AF8];
  v5 = sub_24546795C(MEMORY[0x24BEE4AF8]);
  v95 = v3;
  sub_245499FAC();
  if (a1 >> 62)
    goto LABEL_76;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_24549A3FC())
  {
    v7 = 0;
    v94 = a1 & 0xC000000000000001;
    v91 = (char *)(a1 & 0xFFFFFFFFFFFFFF8);
    v90 = (const char *)(a1 + 32);
    v98 = (const char *)(MEMORY[0x24BEE4AD0] + 8);
    v93 = a1;
    v92 = v6;
    while (1)
    {
      if (v94)
      {
        v8 = (char *)MEMORY[0x249534988](v7, a1);
      }
      else
      {
        if (v7 >= *((_QWORD *)v91 + 2))
          goto LABEL_75;
        v8 = (char *)*(id *)&v90[8 * v7];
      }
      v104 = v8;
      v9 = __OFADD__(v7++, 1);
      if (v9)
        break;
      v10 = v5;
      v5 = (uint64_t)v95;
      sub_245499F70();
      if ((~*(_QWORD *)&v11 & 0x7FF0000000000000) == 0)
        goto LABEL_72;
      if (v11 <= -9.22337204e18)
        goto LABEL_73;
      if (v11 >= 9.22337204e18)
        goto LABEL_74;
      v12 = (uint64_t)v11;
      if (((uint64_t)v11 & 0x8000000000000000) == 0)
      {
        v13 = v12 >> 7;
        if (v12 < 0x24EA00)
          v14 = 2;
        else
          v14 = 3;
        if (v12 >= 0x93A80)
          v15 = v14;
        else
          v15 = 1;
        if (v13 < 0x2A3)
          v15 = 0;
        LODWORD(v102) = v15;
        v97 = v7;
        v16 = *(_QWORD *)&v104[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_inferenceModels];
        if ((v16 & 0xC000000000000001) != 0)
        {
          swift_bridgeObjectRetain();
          sub_24549A2A0();
          v5 = type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
          sub_24547C3F0();
          sub_24549A1BC();
          v16 = v107[1];
          v101 = v107[2];
          v17 = v107[3];
          a1 = v107[4];
          v18 = v107[5];
        }
        else
        {
          v19 = -1 << *(_BYTE *)(v16 + 32);
          v20 = *(_QWORD *)(v16 + 56);
          v101 = v16 + 56;
          v5 = ~v19;
          v21 = -v19;
          if (v21 < 64)
            v22 = ~(-1 << v21);
          else
            v22 = -1;
          v18 = v22 & v20;
          swift_bridgeObjectRetain();
          v17 = v5;
          a1 = 0;
        }
        v96 = v17;
        v99 = v16 & 0x7FFFFFFFFFFFFFFFLL;
        v100 = (unint64_t)(v17 + 64) >> 6;
        for (i = v16; ; v16 = i)
        {
          if (v16 < 0)
          {
            v26 = sub_24549A300();
            if (!v26)
              goto LABEL_4;
            v106 = v26;
            type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
            swift_unknownObjectRetain();
            swift_dynamicCast();
            v27 = (id)v107[0];
            swift_unknownObjectRelease();
            v25 = a1;
            v23 = v18;
            if (!v27)
              goto LABEL_4;
          }
          else
          {
            if (v18)
            {
              v23 = (v18 - 1) & v18;
              v24 = __clz(__rbit64(v18)) | (a1 << 6);
              v25 = a1;
            }
            else
            {
              v28 = a1 + 1;
              if (__OFADD__(a1, 1))
                goto LABEL_70;
              if (v28 >= v100)
                goto LABEL_4;
              v29 = *(_QWORD *)(v101 + 8 * v28);
              v25 = a1 + 1;
              if (!v29)
              {
                v25 = a1 + 2;
                if ((uint64_t)(a1 + 2) >= v100)
                  goto LABEL_4;
                v29 = *(_QWORD *)(v101 + 8 * v25);
                if (!v29)
                {
                  v25 = a1 + 3;
                  if ((uint64_t)(a1 + 3) >= v100)
                    goto LABEL_4;
                  v29 = *(_QWORD *)(v101 + 8 * v25);
                  if (!v29)
                  {
                    v25 = a1 + 4;
                    if ((uint64_t)(a1 + 4) >= v100)
                      goto LABEL_4;
                    v29 = *(_QWORD *)(v101 + 8 * v25);
                    if (!v29)
                    {
                      v30 = a1 + 5;
                      while (v100 != v30)
                      {
                        v29 = *(_QWORD *)(v101 + 8 * v30++);
                        if (v29)
                        {
                          v25 = v30 - 1;
                          goto LABEL_51;
                        }
                      }
LABEL_4:
                      sub_24546A03C();
                      v4 = MEMORY[0x24BEE4AF8];
                      v5 = v10;
                      a1 = v93;
                      v6 = v92;
                      v7 = v97;
                      goto LABEL_5;
                    }
                  }
                }
              }
LABEL_51:
              v23 = (v29 - 1) & v29;
              v24 = __clz(__rbit64(v29)) + (v25 << 6);
            }
            v27 = *(id *)(*(_QWORD *)(v16 + 48) + 8 * v24);
            if (!v27)
              goto LABEL_4;
          }
          v31 = *(_QWORD *)&v104[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagement];
          v32 = *(_QWORD *)&v104[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagedModelRanks];
          v33 = *(_QWORD *)(v32 + 16);
          v34 = v27;
          a1 = (unint64_t)v34;
          v105 = v25;
          if (v33)
          {
            v35 = v34;
            v36 = sub_245472894((uint64_t)v35);
            v18 = v23;
            v38 = (v37 & 1) != 0 ? *(unsigned __int8 *)(*(_QWORD *)(v32 + 56) + v36) : 0;
            v39 = v10;
            v4 = v37 ^ 1u;

          }
          else
          {
            v18 = v23;
            v38 = 0;
            v4 = 1;
            v39 = v10;
          }
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v107[0] = v39;
          v5 = v10;
          v42 = sub_245472894(a1);
          v43 = *(_QWORD *)(v10 + 16);
          v44 = (v41 & 1) == 0;
          v45 = v43 + v44;
          if (__OFADD__(v43, v44))
            break;
          v46 = v41;
          if (*(_QWORD *)(v10 + 24) >= v45)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              sub_245477000();
          }
          else
          {
            sub_2454744C8(v45, isUniquelyReferenced_nonNull_native);
            type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
            v47 = sub_245472894(a1);
            if ((v46 & 1) != (v48 & 1))
            {
              sub_24549A4E0();
              __break(1u);
LABEL_99:
              swift_unexpectedError();
              __break(1u);
              JUMPOUT(0x24547C2A0);
            }
            v42 = v47;
          }
          v5 = v107[0];
          swift_bridgeObjectRelease();
          if ((v46 & 1) == 0)
          {
            *(_QWORD *)(v5 + 8 * (v42 >> 6) + 64) |= 1 << v42;
            *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v42) = a1;
            v49 = *(_QWORD *)(v5 + 56) + 16 * v42;
            *(_BYTE *)v49 = 0;
            *(_QWORD *)(v49 + 8) = MEMORY[0x24BEE4B00];
            v50 = *(_QWORD *)(v5 + 16);
            v9 = __OFADD__(v50, 1);
            v51 = v50 + 1;
            if (v9)
              goto LABEL_69;
            *(_QWORD *)(v5 + 16) = v51;
            v52 = (id)a1;
          }
          v10 = v5;
          v5 = *(_QWORD *)(v5 + 56) + 16 * v42;
          sub_24546BBA0(v102, v31, v38 & 0xFFFFFEFF | ((v4 & 1) << 8));

          a1 = v105;
        }
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
        break;
      }
      v5 = v10;
LABEL_5:

      if (v7 == v6)
        goto LABEL_77;
    }
    __break(1u);
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    swift_bridgeObjectRetain();
  }
LABEL_77:
  v53 = swift_bridgeObjectRelease();
  v107[0] = v4;
  MEMORY[0x24BDAC7A8](v53);
  v73[-2] = v107;
  v54 = swift_bridgeObjectRetain();
  sub_245479ABC(v54, (void (*)(void **, _BYTE *))sub_24547D0D4);
  v93 = v5;
  swift_bridgeObjectRelease();
  v55 = v107[0];
  v56 = *(_QWORD *)(v107[0] + 16);
  if (!v56)
  {
    swift_bridgeObjectRelease();
    v59 = MEMORY[0x24BEE4AF8];
    goto LABEL_94;
  }
  v107[0] = v4;
  v57 = v55;
  sub_245477E58(0, v56, 0);
  v58 = 0;
  v73[1] = v57;
  v78 = v57 + 32;
  v59 = v107[0];
  v98 = "has_all_daily_data";
  v91 = "";
  v90 = "num_airdrop_engaged_total";
  v89 = "num_airdrop_shown_total";
  v88 = "num_bottomrow_total";
  v87 = "intent_app_total";
  v86 = "num_sharesheet_abandoned_total";
  v85 = "num_sharesheet_others_total";
  v84 = "num_sharesheet_total";
  v83 = "num_sharing_intent_app_total";
  v82 = "num_suggestLess_total";
  v81 = "ng";
  v80 = "trialDeploymentId";
  v79 = "trialExperimentId";
  v76 = v56;
  do
  {
    v97 = v58;
    v96 = swift_bridgeObjectRetain();
    v60 = sub_24546C734(v96);
    v94 = 0;
    v61 = *(_QWORD *)(v60 + 16);
    if (v61)
    {
      v92 = v59;
      v106 = v4;
      sub_245477E84(0, v61, 0);
      v62 = sub_245496404(v60);
      v64 = *(_BYTE *)(v60 + 32);
      v99 = v63;
      v77 = v60 + 88;
      v101 = v60 + 64;
      v102 = v60;
      v100 = v61;
      if (v62 < 0 || v62 >= 1 << v64)
      {
        __break(1u);
      }
      else if ((*(_QWORD *)(v60 + 64 + 8 * ((unint64_t)v62 >> 6)) & (1 << v62)) != 0)
      {
        if (*(_DWORD *)(v60 + 36) == (_DWORD)v63)
        {
          v104 = (char *)(v62 & 0x3F);
          v105 = v63;
          v65 = *(unsigned __int8 *)(*(_QWORD *)(v60 + 48) + v62);
          i = 1;
          __asm { BR              X10 }
        }
LABEL_97:
        __break(1u);
        JUMPOUT(0x24547C268);
      }
      __break(1u);
      goto LABEL_97;
    }
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v4 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257473A98);
      v66 = sub_24549A420();
    }
    else
    {
      v66 = MEMORY[0x24BEE4B00];
    }
    v106 = v66;
    v67 = (_QWORD *)swift_bridgeObjectRetain();
    v68 = v94;
    sub_245477A10(v67, 1, &v106);
    if (v68)
      goto LABEL_99;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v69 = v106;
    v107[0] = v59;
    v71 = *(_QWORD *)(v59 + 16);
    v70 = *(_QWORD *)(v59 + 24);
    if (v71 >= v70 >> 1)
    {
      sub_245477E58(v70 > 1, v71 + 1, 1);
      v59 = v107[0];
    }
    v58 = v97 + 1;
    *(_QWORD *)(v59 + 16) = v71 + 1;
    *(_QWORD *)(v59 + 8 * v71 + 32) = v69;
  }
  while (v58 != v56);
  swift_bridgeObjectRelease();
LABEL_94:
  (*(void (**)(char *, uint64_t))(v74 + 8))(v95, v75);
  swift_bridgeObjectRelease();
  return v59;
}

uint64_t sub_24547C2E8(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24546FE4C(*a1, *(_BYTE *)a2, *(_QWORD *)(a2 + 8), *(_QWORD ***)(v2 + 16));
}

uint64_t sub_24547C300(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return sub_24546FC1C(*a1, a1[1], *a2, *((_QWORD *)a2 + 1), *(_QWORD ***)(v2 + 16));
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

unint64_t sub_24547C344()
{
  unint64_t result;

  result = qword_257473A00;
  if (!qword_257473A00)
  {
    result = MEMORY[0x249535018](&unk_24549BD08, &type metadata for UsageFrequency);
    atomic_store(result, (unint64_t *)&qword_257473A00);
  }
  return result;
}

uint64_t sub_24547C388(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_24547C3CC(uint64_t a1)
{
  unint64_t result;

  result = sub_24547C3F0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24547C3F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257473A10;
  if (!qword_257473A10)
  {
    v1 = type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    result = MEMORY[0x249535018](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_257473A10);
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsCollector()
{
  return &type metadata for PeopleSuggesterMetricsCollector;
}

uint64_t destroy for PeopleSuggesterMetricsCollector.Result()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for PeopleSuggesterMetricsCollector.Result(_QWORD *a1, _QWORD *a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for PeopleSuggesterMetricsCollector.Result(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for PeopleSuggesterMetricsCollector.Result(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsCollector.Result(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggesterMetricsCollector.Result(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsCollector.Result()
{
  return &type metadata for PeopleSuggesterMetricsCollector.Result;
}

uint64_t initializeBufferWithCopyOfBuffer for PeopleSuggesterMetricsCollector.ModelDataBuilder(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PeopleSuggesterMetricsCollector.ModelDataBuilder()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for PeopleSuggesterMetricsCollector.ModelDataBuilder(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
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

uint64_t assignWithTake for PeopleSuggesterMetricsCollector.ModelDataBuilder(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsCollector.ModelDataBuilder(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PeopleSuggesterMetricsCollector.ModelDataBuilder(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsCollector.ModelDataBuilder()
{
  return &type metadata for PeopleSuggesterMetricsCollector.ModelDataBuilder;
}

uint64_t dispatch thunk of TimestampedEvent.date.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t initializeBufferWithCopyOfBuffer for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_QWORD *assignWithTake for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals()
{
  return &type metadata for PeopleSuggesterMetricsCollector.ModelDataBuilder.RunningTotals;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsCollector.TimeRange(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PeopleSuggesterMetricsCollector.TimeRange(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24547CB58 + 4 * byte_24549B7E9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24547CB8C + 4 * byte_24549B7E4[v4]))();
}

uint64_t sub_24547CB8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24547CB94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24547CB9CLL);
  return result;
}

uint64_t sub_24547CBA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24547CBB0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24547CBB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24547CBBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_24547CBC8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsCollector.TimeRange()
{
  return &type metadata for PeopleSuggesterMetricsCollector.TimeRange;
}

unint64_t sub_24547CBE4()
{
  unint64_t result;

  result = qword_257473A18;
  if (!qword_257473A18)
  {
    result = MEMORY[0x249535018](&unk_24549B8FC, &type metadata for PeopleSuggesterMetricsCollector.TimeRange);
    atomic_store(result, (unint64_t *)&qword_257473A18);
  }
  return result;
}

uint64_t sub_24547CC28()
{
  uint64_t result;
  double v1;
  unint64_t v2;

  result = sub_245499F70();
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v1 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v2 = (uint64_t)v1;
  if ((uint64_t)v1 < 0)
    return 4;
  if (v2 >> 7 < 0x2A3)
    return 0;
  if (v2 < 0x93A80)
    return 1;
  if (v2 < 0x24EA00)
    return 2;
  return 3;
}

uint64_t sub_24547CCE0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v6 = a4 + 8 * a1 + 32;
    v7 = a3 + 8 * v5;
    if (v6 >= v7 || v6 + 8 * v5 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      swift_arrayInitWithCopy();
      return v7;
    }
  }
  result = sub_24549A42C();
  __break(1u);
  return result;
}

char *sub_24547CDE4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_24547CECC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_24547CEF0(void *a1)
{
  uint64_t v1;

  sub_24546F2BC(a1, v1);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_24547CF10()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_245499FB8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24547CFAC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(sub_245499FB8() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_24546F50C(a1, v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_24547D014(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_245471328(a1, a2, *(_QWORD ***)(v2 + 16));
}

uint64_t sub_24547D02C(uint64_t result)
{
  if (result)
    return swift_release();
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

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24547D098(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24547D0D4(uint64_t *a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return sub_245470AA8(*a1, *a2, *((_QWORD *)a2 + 1), *(_QWORD ***)(v2 + 16));
}

uint64_t sub_24547D0EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473A60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24547D134(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473A60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24547D17C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24547D1D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v4 = a3();
  v6 = v5;
  if (v4 == a3() && v6 == v7)
    v9 = 1;
  else
    v9 = sub_24549A4A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

uint64_t PeopleSuggesterShadowEvaluationField.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24547D2A4 + 4 * byte_24549B930[*v0]))(0xD00000000000001ALL, 0x800000024549D440);
}

uint64_t sub_24547D2A4()
{
  return 0x65735577654E7369;
}

uint64_t sub_24547D2C4()
{
  return 0x61746F745F72726DLL;
}

uint64_t sub_24547D2E0@<X0>(uint64_t a1@<X8>)
{
  return a1 + 9;
}

uint64_t sub_24547D3E4()
{
  return 0x72665F6567617375;
}

uint64_t PeopleSuggesterMetricsField.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24547D440 + 4 * byte_24549B942[*v0]))(0xD000000000000013, 0x800000024549D3E0);
}

uint64_t sub_24547D440@<X0>(uint64_t a1@<X8>)
{
  return a1 + 2;
}

uint64_t sub_24547D6D4()
{
  return 0x72665F6567617375;
}

ReportingPlugin::PeopleSuggesterMetricsField_optional __swiftcall PeopleSuggesterMetricsField.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  ReportingPlugin::PeopleSuggesterMetricsField_optional result;
  char v5;
  char v6;

  v2 = v1;
  v3 = sub_24549A4BC();
  result.value = swift_bridgeObjectRelease();
  v5 = 0;
  v6 = 23;
  switch(v3)
  {
    case 0:
      goto LABEL_25;
    case 1:
      v5 = 1;
      goto LABEL_25;
    case 2:
      v5 = 2;
      goto LABEL_25;
    case 3:
      v5 = 3;
      goto LABEL_25;
    case 4:
      v5 = 4;
      goto LABEL_25;
    case 5:
      v5 = 5;
      goto LABEL_25;
    case 6:
      v5 = 6;
      goto LABEL_25;
    case 7:
      v5 = 7;
      goto LABEL_25;
    case 8:
      v5 = 8;
      goto LABEL_25;
    case 9:
      v5 = 9;
      goto LABEL_25;
    case 10:
      v5 = 10;
      goto LABEL_25;
    case 11:
      v5 = 11;
      goto LABEL_25;
    case 12:
      v5 = 12;
      goto LABEL_25;
    case 13:
      v5 = 13;
      goto LABEL_25;
    case 14:
      v5 = 14;
      goto LABEL_25;
    case 15:
      v5 = 15;
      goto LABEL_25;
    case 16:
      v5 = 16;
      goto LABEL_25;
    case 17:
      v5 = 17;
      goto LABEL_25;
    case 18:
      v5 = 18;
      goto LABEL_25;
    case 19:
      v5 = 19;
      goto LABEL_25;
    case 20:
      v5 = 20;
      goto LABEL_25;
    case 21:
      v5 = 21;
      goto LABEL_25;
    case 22:
      v5 = 22;
LABEL_25:
      v6 = v5;
      break;
    case 23:
      break;
    case 24:
      v6 = 24;
      break;
    case 25:
      v6 = 25;
      break;
    case 26:
      v6 = 26;
      break;
    case 27:
      v6 = 27;
      break;
    case 28:
      v6 = 28;
      break;
    case 29:
      v6 = 29;
      break;
    case 30:
      v6 = 30;
      break;
    case 31:
      v6 = 31;
      break;
    case 32:
      v6 = 32;
      break;
    case 33:
      v6 = 33;
      break;
    case 34:
      v6 = 34;
      break;
    case 35:
      v6 = 35;
      break;
    case 36:
      v6 = 36;
      break;
    case 37:
      v6 = 37;
      break;
    case 38:
      v6 = 38;
      break;
    case 39:
      v6 = 39;
      break;
    case 40:
      v6 = 40;
      break;
    default:
      v6 = 41;
      break;
  }
  *v2 = v6;
  return result;
}

uint64_t sub_24547D8B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24547D1D0(*a1, *a2, PeopleSuggesterMetricsField.rawValue.getter) & 1;
}

uint64_t sub_24547D8DC(uint64_t a1, uint64_t a2)
{
  return sub_24547DA54(a1, a2, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter);
}

uint64_t sub_24547D8E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24547DAC8(a1, a2, a3, (void (*)(void))PeopleSuggesterMetricsField.rawValue.getter);
}

uint64_t sub_24547D8F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24547DB24(a1, a2, a3, (void (*)(uint64_t))PeopleSuggesterMetricsField.rawValue.getter);
}

ReportingPlugin::PeopleSuggesterMetricsField_optional sub_24547D900(Swift::String *a1)
{
  return PeopleSuggesterMetricsField.init(rawValue:)(*a1);
}

uint64_t sub_24547D90C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PeopleSuggesterMetricsField.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

ReportingPlugin::PeopleSuggesterShadowEvaluationField_optional __swiftcall PeopleSuggesterShadowEvaluationField.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  ReportingPlugin::PeopleSuggesterShadowEvaluationField_optional result;
  char v5;

  v2 = v1;
  v3 = sub_24549A4BC();
  result.value = swift_bridgeObjectRelease();
  v5 = 18;
  if (v3 < 0x12)
    v5 = v3;
  *v2 = v5;
  return result;
}

unint64_t sub_24547D994()
{
  unint64_t result;

  result = qword_257473B08;
  if (!qword_257473B08)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggesterMetricsField, &type metadata for PeopleSuggesterMetricsField);
    atomic_store(result, (unint64_t *)&qword_257473B08);
  }
  return result;
}

uint64_t sub_24547D9D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_24547D1D0(*a1, *a2, PeopleSuggesterShadowEvaluationField.rawValue.getter) & 1;
}

unint64_t sub_24547DA04()
{
  unint64_t result;

  result = qword_257473B10;
  if (!qword_257473B10)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggesterShadowEvaluationField, &type metadata for PeopleSuggesterShadowEvaluationField);
    atomic_store(result, (unint64_t *)&qword_257473B10);
  }
  return result;
}

uint64_t sub_24547DA48(uint64_t a1, uint64_t a2)
{
  return sub_24547DA54(a1, a2, (void (*)(uint64_t))PeopleSuggesterShadowEvaluationField.rawValue.getter);
}

uint64_t sub_24547DA54(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = sub_24549A51C();
  a3(v4);
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  return sub_24549A54C();
}

uint64_t sub_24547DABC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24547DAC8(a1, a2, a3, (void (*)(void))PeopleSuggesterShadowEvaluationField.rawValue.getter);
}

uint64_t sub_24547DAC8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  sub_24549A0D8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24547DB18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24547DB24(a1, a2, a3, (void (*)(uint64_t))PeopleSuggesterShadowEvaluationField.rawValue.getter);
}

uint64_t sub_24547DB24(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v5;

  v5 = sub_24549A51C();
  a4(v5);
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  return sub_24549A54C();
}

ReportingPlugin::PeopleSuggesterShadowEvaluationField_optional sub_24547DB88(Swift::String *a1)
{
  return PeopleSuggesterShadowEvaluationField.init(rawValue:)(*a1);
}

uint64_t sub_24547DB94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PeopleSuggesterShadowEvaluationField.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterMetricsField(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xD8)
    goto LABEL_17;
  if (a2 + 40 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 40) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 40;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 40;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 40;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x29;
  v8 = v6 - 41;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggesterMetricsField(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 40 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 40) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD7)
    return ((uint64_t (*)(void))((char *)&loc_24547DC94 + 4 * byte_24549B999[v4]))();
  *a1 = a2 + 40;
  return ((uint64_t (*)(void))((char *)sub_24547DCC8 + 4 * byte_24549B994[v4]))();
}

uint64_t sub_24547DCC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24547DCD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24547DCD8);
  return result;
}

uint64_t sub_24547DCE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24547DCECLL);
  *(_BYTE *)result = a2 + 40;
  return result;
}

uint64_t sub_24547DCF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24547DCF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterMetricsField()
{
  return &type metadata for PeopleSuggesterMetricsField;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterShadowEvaluationField(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEF)
    goto LABEL_17;
  if (a2 + 17 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 17) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 17;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 17;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 17;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x12;
  v8 = v6 - 18;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggesterShadowEvaluationField(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 17 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 17) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEE)
    return ((uint64_t (*)(void))((char *)&loc_24547DDF0 + 4 * byte_24549B9A3[v4]))();
  *a1 = a2 + 17;
  return ((uint64_t (*)(void))((char *)sub_24547DE24 + 4 * byte_24549B99E[v4]))();
}

uint64_t sub_24547DE24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24547DE2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24547DE34);
  return result;
}

uint64_t sub_24547DE40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24547DE48);
  *(_BYTE *)result = a2 + 17;
  return result;
}

uint64_t sub_24547DE4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24547DE54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterShadowEvaluationField()
{
  return &type metadata for PeopleSuggesterShadowEvaluationField;
}

uint64_t storeEnumTagSinglePayload for UsageFrequency(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24547DEBC + 4 * byte_24549B9AD[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24547DEF0 + 4 * byte_24549B9A8[v4]))();
}

uint64_t sub_24547DEF0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24547DEF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24547DF00);
  return result;
}

uint64_t sub_24547DF0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24547DF14);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24547DF18(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24547DF20(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UsageFrequency()
{
  return &type metadata for UsageFrequency;
}

unint64_t sub_24547DF3C@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_24547E0B4(*a1);
  *a2 = result;
  return result;
}

void sub_24547DF64(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_24547DF70()
{
  sub_24547E0C4();
  return sub_24549A108();
}

unint64_t sub_24547DFC0()
{
  unint64_t result;

  result = qword_257473B18;
  if (!qword_257473B18)
  {
    result = MEMORY[0x249535018](&unk_24549BCE0, &type metadata for UsageFrequency);
    atomic_store(result, (unint64_t *)&qword_257473B18);
  }
  return result;
}

unint64_t sub_24547E004(uint64_t a1)
{
  unint64_t result;

  result = sub_24547E028();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_24547E028()
{
  unint64_t result;

  result = qword_257473B20;
  if (!qword_257473B20)
  {
    result = MEMORY[0x249535018](&unk_24549BC40, &type metadata for UsageFrequency);
    atomic_store(result, (unint64_t *)&qword_257473B20);
  }
  return result;
}

void sub_24547E06C()
{
  qword_257477C30 = 0x6C6C617265766FLL;
  *(_QWORD *)algn_257477C38 = 0xE700000000000000;
}

void sub_24547E090()
{
  qword_257477C40 = 0x74756F656D6974;
  *(_QWORD *)algn_257477C48 = 0xE700000000000000;
}

unint64_t sub_24547E0B4(unint64_t result)
{
  if (result >= 4)
    return 4;
  return result;
}

unint64_t sub_24547E0C4()
{
  unint64_t result;

  result = qword_257473B28;
  if (!qword_257473B28)
  {
    result = MEMORY[0x249535018](&unk_24549BC68, &type metadata for UsageFrequency);
    atomic_store(result, (unint64_t *)&qword_257473B28);
  }
  return result;
}

uint64_t sub_24547E110(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;

  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_5;
    }
    v15 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v6)
      return swift_release();
    v16 = *(_QWORD *)(v2 + 8 * v15);
    ++v8;
    if (!v16)
    {
      v8 = v15 + 1;
      if (v15 + 1 >= v6)
        return swift_release();
      v16 = *(_QWORD *)(v2 + 8 * v8);
      if (!v16)
      {
        v8 = v15 + 2;
        if (v15 + 2 >= v6)
          return swift_release();
        v16 = *(_QWORD *)(v2 + 8 * v8);
        if (!v16)
        {
          v8 = v15 + 3;
          if (v15 + 3 >= v6)
            return swift_release();
          v16 = *(_QWORD *)(v2 + 8 * v8);
          if (!v16)
            break;
        }
      }
    }
LABEL_22:
    v5 = (v16 - 1) & v16;
    v10 = __clz(__rbit64(v16)) + (v8 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_245481C2C(v12, v13, v14);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v17 = v15 + 4;
  if (v17 >= v6)
    return swift_release();
  v16 = *(_QWORD *)(v2 + 8 * v17);
  if (v16)
  {
    v8 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    v8 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v8 >= v6)
      return swift_release();
    v16 = *(_QWORD *)(v2 + 8 * v8);
    ++v17;
    if (v16)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_24547E298(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v8 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v9 = v8 | (v7 << 6);
      goto LABEL_5;
    }
    v13 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v6)
      goto LABEL_23;
    v14 = *(_QWORD *)(v2 + 8 * v13);
    ++v7;
    if (!v14)
    {
      v7 = v13 + 1;
      if (v13 + 1 >= v6)
        goto LABEL_23;
      v14 = *(_QWORD *)(v2 + 8 * v7);
      if (!v14)
      {
        v7 = v13 + 2;
        if (v13 + 2 >= v6)
          goto LABEL_23;
        v14 = *(_QWORD *)(v2 + 8 * v7);
        if (!v14)
        {
          v7 = v13 + 3;
          if (v13 + 3 >= v6)
            goto LABEL_23;
          v14 = *(_QWORD *)(v2 + 8 * v7);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v5 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v7 << 6);
LABEL_5:
    v10 = 8 * v9;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + v10);
    v12 = *(id *)(*(_QWORD *)(a1 + 48) + v10);
    swift_bridgeObjectRetain();
    sub_245480BE0(v12, v11);
    swift_bridgeObjectRelease();

  }
  v15 = v13 + 4;
  if (v15 >= v6)
  {
LABEL_23:
    swift_release();
    return;
  }
  v14 = *(_QWORD *)(v2 + 8 * v15);
  if (v14)
  {
    v7 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v7 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v7 >= v6)
      goto LABEL_23;
    v14 = *(_QWORD *)(v2 + 8 * v7);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
}

uint64_t PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = 0xD000000000000015;
  switch(a1)
  {
    case 0:
      result = 0x6C6C69666B636162;
      break;
    case 1:
      result = 0x4C4D65726F63;
      break;
    case 2:
    case 7:
    case 12:
    case 20:
      return result;
    case 3:
      result = 0xD000000000000019;
      break;
    case 4:
      result = 0xD000000000000014;
      break;
    case 5:
      result = 0xD000000000000010;
      break;
    case 6:
      result = 5131883;
      break;
    case 8:
      result = 0xD000000000000021;
      break;
    case 9:
      v3 = 0x6C6C414E4E6BLL;
      goto LABEL_9;
    case 10:
      result = 0xD000000000000018;
      break;
    case 11:
      result = 0x7265746E494E4E6BLL;
      break;
    case 13:
      result = 0xD000000000000021;
      break;
    case 14:
      v3 = 0x706F544E4E6BLL;
LABEL_9:
      result = v3 & 0xFFFFFFFFFFFFLL | 0x6853000000000000;
      break;
    case 15:
      result = 0xD000000000000018;
      break;
    case 16:
      result = 0x646F4D6C61636F6CLL;
      break;
    case 17:
      result = 0x736567617373656DLL;
      break;
    case 18:
      result = 0xD000000000000014;
      break;
    case 19:
      result = 0xD00000000000001CLL;
      break;
    case 21:
      result = 0xD000000000000017;
      break;
    case 22:
      result = 0x6F546E7275746572;
      break;
    case 23:
      result = 0x696E694D656C7572;
      break;
    case 24:
      result = 0xD000000000000011;
      break;
    case 25:
      result = 0xD000000000000014;
      break;
    default:
      result = sub_24549A4C8();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_24547E688()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  void *v18;
  uint64_t result;
  unsigned int v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void (*v27)(char *, _QWORD);
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36[32];
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions);
  v35 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v2 = sub_24549A2DC();
    if (!v2)
      goto LABEL_19;
    v3 = v2;
    v40 = MEMORY[0x24BEE4AF8];
    sub_24549A3B4();
    v37 = sub_24549A294();
    v38 = v4;
    v39 = 1;
    if ((v3 & 0x8000000000000000) == 0)
      goto LABEL_7;
    __break(1u);
  }
  v3 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v3)
  {
LABEL_19:
    swift_bridgeObjectRelease();
LABEL_20:
    v28 = sub_245483BF4(*(_QWORD *)(v33 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType));
    v29 = objc_allocWithZone(MEMORY[0x24BE0C508]);
    v30 = (void *)sub_24549A0A8();
    swift_bridgeObjectRelease();
    sub_24547D17C(0, &qword_254413818);
    v31 = (void *)sub_24549A120();
    swift_bridgeObjectRelease();
    v32 = objc_msgSend(v29, sel_initWithIdentifier_sourceBundleId_peopleSuggestions_responseType_, v30, 0, v31, v28);

    return (uint64_t)v32;
  }
  v40 = MEMORY[0x24BEE4AF8];
  sub_24549A3B4();
  v37 = sub_245486250(v1);
  v38 = v6;
  v39 = v7 & 1;
LABEL_7:
  v34 = v1;
  while (1)
  {
    sub_245485FFC(v37, v38, v39, v1, v5, (void (*)(void *))type metadata accessor for PeopleSuggestions.PeopleSuggestion);
    v17 = v16;
    if ((v16[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_score + 8] & 1) != 0)
    {
      v18 = 0;
    }
    else
    {
      sub_24547D17C(0, &qword_257473AC0);
      v18 = (void *)sub_24549A204();
    }
    swift_bridgeObjectRetain();
    result = (uint64_t)sub_245483988();
    v20 = v17[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_rank] + 1;
    if (((v20 >> 8) & 1) != 0)
      break;
    v21 = (void *)result;
    v22 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    swift_bridgeObjectRetain();
    v23 = objc_msgSend(v22, sel_initWithUnsignedChar_, v20);
    v24 = objc_allocWithZone(MEMORY[0x24BE0C510]);
    v25 = (void *)sub_24549A0A8();
    swift_bridgeObjectRelease();
    v26 = (void *)sub_24549A0A8();
    swift_bridgeObjectRelease();
    objc_msgSend(v24, sel_initWithIdentifier_model_modelIdentifier_transportBundleId_rank_score_, v25, 0, v21, v26, v23, v18);

    sub_24549A39C();
    sub_24549A3C0();
    sub_24549A3CC();
    result = sub_24549A3A8();
    if (v35)
    {
      v1 = v34;
      if ((v39 & 1) == 0)
        goto LABEL_22;
      if (sub_24549A2AC())
        swift_isUniquelyReferenced_nonNull_native();
      __swift_instantiateConcreteTypeFromMangledName(&qword_257473CF0);
      v27 = (void (*)(char *, _QWORD))sub_24549A1B0();
      sub_24549A318();
      v27(v36, 0);
      if (!--v3)
      {
LABEL_18:
        sub_245489D60(v37, v38, v39);
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    else
    {
      v8 = v37;
      v9 = v38;
      v10 = v39;
      v1 = v34;
      v11 = sub_245485EFC(v37, v38, v39, v34);
      v13 = v12;
      v15 = v14;
      sub_245489D60(v8, v9, v10);
      v37 = v11;
      v38 = v13;
      v39 = v15 & 1;
      if (!--v3)
        goto LABEL_18;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
  return result;
}

void sub_24547EAEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  int64_t v14;
  char v15;
  unsigned __int8 *v16;
  unsigned int v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void (*v24)(char *, _QWORD);
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31[32];
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions);
  v29 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v2 = sub_24549A2DC();
    if (!v2)
      goto LABEL_17;
    v3 = v2;
    v35 = MEMORY[0x24BEE4AF8];
    sub_24549A3B4();
    v32 = sub_24549A294();
    v33 = v4;
    v34 = 1;
    if ((v3 & 0x8000000000000000) == 0)
      goto LABEL_7;
    __break(1u);
  }
  v3 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (!v3)
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    v25 = objc_allocWithZone(MEMORY[0x24BE0C4F8]);
    v26 = (void *)sub_24549A0A8();
    swift_bridgeObjectRelease();
    sub_24547D17C(0, (unint64_t *)&qword_254413768);
    v27 = (void *)sub_24549A120();
    swift_bridgeObjectRelease();
    objc_msgSend(v25, sel_initWithIdentifier_sourceBundleId_appSuggestions_, v26, 0, v27);

    return;
  }
  v35 = MEMORY[0x24BEE4AF8];
  sub_24549A3B4();
  v32 = sub_245486250(v1);
  v33 = v6;
  v34 = v7 & 1;
LABEL_7:
  v28 = v1;
  while (v3)
  {
    v14 = v32;
    v13 = v33;
    v15 = v34;
    sub_245485FFC(v32, v33, v34, v1, v5, (void (*)(void *))type metadata accessor for AppSuggestions.AppSuggestion);
    v17 = v16[OBJC_IVAR____PSAppSuggestionsMetricsItem_rank] + 1;
    if (((v17 >> 8) & 1) != 0)
      goto LABEL_20;
    v18 = v16;
    v30 = v3;
    v19 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = objc_msgSend(v19, sel_initWithUnsignedChar_, v17);
    v21 = objc_allocWithZone(MEMORY[0x24BE0C500]);
    v22 = (void *)sub_24549A0A8();
    swift_bridgeObjectRelease();
    v23 = (void *)sub_24549A0A8();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_initWithTransportBundleId_model_rank_, v22, v23, v20);

    sub_24549A39C();
    sub_24549A3C0();
    sub_24549A3CC();
    sub_24549A3A8();
    if (v29)
    {
      v1 = v28;
      if ((v15 & 1) == 0)
        goto LABEL_21;
      if (sub_24549A2AC())
        swift_isUniquelyReferenced_nonNull_native();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254413760);
      v24 = (void (*)(char *, _QWORD))sub_24549A1B0();
      sub_24549A318();
      v24(v31, 0);
      v3 = v30 - 1;
      if (v30 == 1)
      {
LABEL_16:
        sub_245489D60(v32, v33, v34);
        swift_bridgeObjectRelease();
        goto LABEL_18;
      }
    }
    else
    {
      v1 = v28;
      v8 = sub_245485EFC(v14, v13, v15, v28);
      v10 = v9;
      v12 = v11;
      sub_245489D60(v14, v13, v15);
      v32 = v8;
      v33 = v10;
      v34 = v12 & 1;
      v3 = v30 - 1;
      if (v30 == 1)
        goto LABEL_16;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  __break(1u);
}

id sub_24547EEE8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  unsigned int v25;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_type);
  if (v1 >= 7)
    goto LABEL_15;
  v25 = dword_24549CBF0[v1];
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_engagedSuggestionId + 8);
  v3 = *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_visiblePeopleSuggestionCount);
  v4 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v24 = objc_msgSend(v4, sel_initWithUnsignedChar_, v3);
  v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithUnsignedChar_, *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_visibleAppSuggestionCount));
  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithBool_, *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_airdropOptionPresent));
  v5 = objc_allocWithZone(MEMORY[0x24BE0C4F0]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v5, sel_initWithTrialExperimentId_trialTreatmentId_trialDeploymentId_, v6, v7, v8);

  v10 = *(_QWORD *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_timeouts);
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    sub_24549A3B4();
    v12 = 0;
    do
    {
      v14 = *(_QWORD *)(v10 + 8 * v12 + 32);
      if (v14)
      {
        if (v14 != 1)
        {
          while (1)
          {
            sub_24549A4C8();
            __break(1u);
LABEL_15:
            swift_bridgeObjectRetain();
          }
        }
        v13 = 2;
      }
      else
      {
        v13 = 1;
      }
      ++v12;
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C4E8]), sel_initWithOccurrence_, v13);
      sub_24549A39C();
      sub_24549A3C0();
      sub_24549A3CC();
      sub_24549A3A8();
    }
    while (v11 != v12);
    swift_bridgeObjectRelease();
  }
  v15 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  if (v2)
  {
    v16 = (void *)sub_24549A0A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_allocWithZone(MEMORY[0x24BE0C4E0]);
  sub_24547D17C(0, &qword_2544137E0);
  v18 = (void *)sub_24549A120();
  swift_bridgeObjectRelease();
  LODWORD(v21) = 0;
  v19 = objc_msgSend(v17, sel_initWithIdentifier_engagementType_engagementIdentifier_visiblePeopleSuggestionCount_visibleAppSuggestionCount_airdropPeopleSuggestionShown_inferenceSource_trialIdentifier_timeouts_, v15, v25, v16, v24, v23, v22, v21, v9, v18);

  return v19;
}

id PeopleSuggesterMetricsManager.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeopleSuggesterMetricsManager();
  return objc_msgSendSuper2(&v2, sel_init);
}

id PeopleSuggesterMetricsManager.__deallocating_deinit()
{
  return sub_245483630(type metadata accessor for PeopleSuggesterMetricsManager);
}

void sub_24547F364(void **a1)
{
  _s15ReportingPlugin29PeopleSuggesterMetricsManagerC6record9inferenceyAA0C19SuggestionInferenceC_tFZ_0(*a1);
}

void sub_24547F36C()
{
  _s15ReportingPlugin29PeopleSuggesterMetricsManagerC6record8feedbackyAA0cD13FeedbackEventC_tFZ_0();
}

uint64_t PeopleSuggestionInference.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id);
  swift_bridgeObjectRetain();
  return v1;
}

id PeopleSuggestionInference.__allocating_init(id:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  objc_super v8;

  v5 = (char *)objc_allocWithZone(v2);
  v6 = &v5[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(_QWORD *)v6 = a1;
  *((_QWORD *)v6 + 1) = a2;
  v8.receiver = v5;
  v8.super_class = v2;
  return objc_msgSendSuper2(&v8, sel_init);
}

id PeopleSuggestionInference.init(id:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_super v5;

  v3 = &v2[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(_QWORD *)v3 = a1;
  *((_QWORD *)v3 + 1) = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return objc_msgSendSuper2(&v5, sel_init);
}

void PeopleSuggestionInference.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PeopleSuggestionInference.__deallocating_deinit()
{
  return sub_245483630(type metadata accessor for PeopleSuggestionInference);
}

uint64_t sub_24547F4C0@<X0>(_QWORD *a1@<X8>)
{
  return sub_2454830AC(&OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id, a1);
}

id PeopleSuggestions.__allocating_init(id:responseType:suggestions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  objc_super v12;

  v9 = (char *)objc_allocWithZone(v4);
  sub_245487774(a4);
  *(_QWORD *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType] = a3;
  *(_QWORD *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions] = a4;

  v10 = &v9[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return objc_msgSendSuper2(&v12, sel_init);
}

id PeopleSuggestions.init(id:responseType:suggestions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  char *v9;
  char *v10;
  objc_super v12;

  v9 = v4;
  sub_245487774(a4);
  *(_QWORD *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType] = a3;
  *(_QWORD *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions] = a4;

  v10 = &v9[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(_QWORD *)v10 = a1;
  *((_QWORD *)v10 + 1) = a2;
  v12.receiver = v9;
  v12.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return objc_msgSendSuper2(&v12, sel_init);
}

unint64_t PeopleSuggestions.ResponseType.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

uint64_t *sub_24547F6F0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_24547F70C()
{
  sub_24548B300();
  return sub_24549A108();
}

uint64_t PeopleSuggestions.PeopleSuggestion.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id);
  swift_bridgeObjectRetain();
  return v1;
}

id PeopleSuggestions.PeopleSuggestion.model.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model);
}

uint64_t PeopleSuggestions.PeopleSuggestion.transportBundleId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_transportBundleId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PeopleSuggestions.PeopleSuggestion.rank.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_rank);
}

uint64_t PeopleSuggestions.PeopleSuggestion.score.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_score);
}

unint64_t PeopleSuggestions.PeopleSuggestion.ModelType.init(rawValue:)(unint64_t a1)
{
  return sub_24548917C(a1);
}

BOOL sub_24547F838(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24547F84C()
{
  return sub_24549A528();
}

unint64_t sub_24547F874@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_24548917C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_24547F8A4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_24547F8B0()
{
  sub_24548B2BC();
  return sub_24549A108();
}

id PeopleSuggestions.PeopleSuggestion.Model.__allocating_init(modelType:trialIdentifier:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  objc_class *v6;
  char *v7;
  char *v8;
  char *v9;
  id v10;
  objc_super v12;

  v5 = objc_allocWithZone(v2);
  v6 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(_QWORD *)v8 = a1;
  v8[8] = 0;
  v9 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a2;
  v12.receiver = v7;
  v12.super_class = v6;
  v10 = objc_msgSendSuper2(&v12, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

id PeopleSuggestions.PeopleSuggestion.Model.init(modelType:trialIdentifier:)(uint64_t a1, uint64_t a2)
{
  objc_class *v4;
  char *v5;
  char *v6;
  char *v7;
  id v8;
  objc_super v10;

  v4 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  v5 = (char *)objc_allocWithZone(v4);
  v6 = &v5[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(_QWORD *)v6 = a1;
  v6[8] = 0;
  v7 = &v5[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *(_QWORD *)&v5[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a2;
  v10.receiver = v5;
  v10.super_class = v4;
  v8 = objc_msgSendSuper2(&v10, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

id PeopleSuggestions.PeopleSuggestion.Model.__allocating_init(modelIdentifier:trialIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;
  objc_class *v8;
  char *v9;
  char *v10;
  char *v11;
  id v12;
  objc_super v14;

  v7 = objc_allocWithZone(v3);
  v8 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = &v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = &v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *(_QWORD *)v11 = a1;
  *((_QWORD *)v11 + 1) = a2;
  *(_QWORD *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a3;
  v14.receiver = v9;
  v14.super_class = v8;
  v12 = objc_msgSendSuper2(&v14, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

id PeopleSuggestions.PeopleSuggestion.Model.init(modelIdentifier:trialIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v6;
  char *v7;
  char *v8;
  char *v9;
  id v10;
  objc_super v12;

  v6 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(_QWORD *)v8 = 0;
  v8[8] = 1;
  v9 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = a2;
  *(_QWORD *)&v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a3;
  v12.receiver = v7;
  v12.super_class = v6;
  v10 = objc_msgSendSuper2(&v12, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v10;
}

uint64_t sub_24547FD6C()
{
  uint64_t v0;
  void *v1;
  id v2;

  sub_24549A558();
  if (*(_BYTE *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8) == 1)
  {
    sub_24549A534();
  }
  else
  {
    sub_24549A534();
    sub_24549A528();
  }
  if (*(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8))
  {
    sub_24549A534();
    swift_bridgeObjectRetain();
    sub_24549A0D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24549A534();
  }
  v1 = *(void **)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  sub_24549A534();
  if (v1)
  {
    v2 = v1;
    sub_24549A240();

  }
  return sub_24549A540();
}

uint64_t sub_24547FEA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v12;
  _BYTE *v13;
  _BYTE v14[24];
  uint64_t v15;

  sub_2454891AC(a1, (uint64_t)v14);
  if (!v15)
  {
    sub_2454891F4((uint64_t)v14);
    goto LABEL_22;
  }
  type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    v10 = 0;
    return v10 & 1;
  }
  if ((*(_BYTE *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8) & 1) != 0)
  {
    if ((v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8] & 1) == 0)
      goto LABEL_21;
  }
  else if ((v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8] & 1) != 0
         || *(_QWORD *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType) != *(_QWORD *)&v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType])
  {
    goto LABEL_21;
  }
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8);
  v3 = *(_QWORD *)&v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8];
  if (v2)
  {
    if (!v3)
      goto LABEL_21;
    v4 = *(_QWORD *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier) == *(_QWORD *)&v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier]
      && v2 == v3;
    if (!v4 && (sub_24549A4A4() & 1) == 0)
      goto LABEL_21;
  }
  else if (v3)
  {
LABEL_21:

    goto LABEL_22;
  }
  v5 = *(void **)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  v6 = *(void **)&v13[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier];
  if (!v5)
  {
    v12 = v6;

    if (!v6)
    {
      v10 = 1;
      return v10 & 1;
    }

    goto LABEL_22;
  }
  if (!v6)
    goto LABEL_21;
  type metadata accessor for TrialIdentifier();
  v7 = v5;
  v8 = v6;
  v9 = v7;
  v10 = sub_24549A234();

  return v10 & 1;
}

void PeopleSuggestions.PeopleSuggestion.Model.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245480080(char a1)
{
  if (!a1)
    return 0x7079546C65646F6DLL;
  if (a1 == 1)
    return 0xD000000000000018;
  return 0x6564496C61697274;
}

uint64_t sub_2454800F4()
{
  char *v0;

  return sub_245480080(*v0);
}

uint64_t sub_2454800FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2454895A8(a1, a2);
  *a3 = result;
  return result;
}

void sub_245480120(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24548012C()
{
  sub_245489254();
  return sub_24549A570();
}

uint64_t sub_245480154()
{
  sub_245489254();
  return sub_24549A57C();
}

id PeopleSuggestions.PeopleSuggestion.Model.__deallocating_deinit()
{
  return sub_245483630(type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model);
}

uint64_t sub_2454801C4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473B88);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245489254();
  sub_24549A564();
  v9 = *(_BYTE *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8);
  v13 = *(_QWORD *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType);
  v14 = v9;
  v12 = 0;
  sub_245489298();
  sub_24549A450();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_24549A438();
    v13 = *(_QWORD *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
    v12 = 2;
    type metadata accessor for TrialIdentifier();
    sub_24548B1F8(&qword_257473BA0, type metadata accessor for TrialIdentifier, (uint64_t)&protocol conformance descriptor for TrialIdentifier);
    sub_24549A450();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_245480374(_QWORD *a1)
{
  return sub_2454801C4(a1);
}

id PeopleSuggestions.PeopleSuggestion.__allocating_init(id:model:transportBundleId:rank:score:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, double a7)
{
  objc_class *v7;
  id v15;

  v15 = objc_allocWithZone(v7);
  return PeopleSuggestions.PeopleSuggestion.init(id:model:transportBundleId:rank:score:)(a1, a2, a3, a4, a5, a6, a7);
}

id PeopleSuggestions.PeopleSuggestion.init(id:model:transportBundleId:rank:score:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, double a7)
{
  _BOOL4 v13;
  _BOOL4 v14;
  BOOL v15;
  double v16;
  objc_class *v17;
  _BYTE *v18;
  _QWORD *v19;
  _QWORD *v20;
  double *v21;
  id v22;
  objc_super v24;

  v13 = (~*(_QWORD *)&a7 & 0x7FF0000000000000) == 0;
  v14 = (*(_QWORD *)&a7 & 0xFFFFFFFFFFFFFLL) != 0;
  v15 = v13 && v14;
  if (v13 && v14)
    v16 = 0.0;
  else
    v16 = a7;
  v17 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion();
  v18 = objc_allocWithZone(v17);
  v19 = &v18[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id];
  *v19 = a1;
  v19[1] = a2;
  *(_QWORD *)&v18[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model] = a3;
  v20 = &v18[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_transportBundleId];
  *v20 = a4;
  v20[1] = a5;
  v18[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_rank] = a6;
  v21 = (double *)&v18[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_score];
  *v21 = v16;
  *((_BYTE *)v21 + 8) = v15;
  v24.receiver = v18;
  v24.super_class = v17;
  v22 = objc_msgSendSuper2(&v24, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v22;
}

uint64_t sub_245480674(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  id v3;
  char v4;
  char *v6;
  _BYTE v7[24];
  uint64_t v8;

  sub_2454891AC(a1, (uint64_t)v7);
  if (!v8)
  {
    sub_2454891F4((uint64_t)v7);
    goto LABEL_10;
  }
  type metadata accessor for PeopleSuggestions.PeopleSuggestion();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    v4 = 0;
    return v4 & 1;
  }
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id) == *(_QWORD *)&v6[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id]
    && *(_QWORD *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id + 8) == *(_QWORD *)&v6[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id + 8];
  if (!v2 && (sub_24549A4A4() & 1) == 0)
  {

    goto LABEL_10;
  }
  sub_24547D17C(0, &qword_2574739F0);
  v3 = *(id *)&v6[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model];
  v4 = sub_24549A234();

  return v4 & 1;
}

uint64_t static PeopleSuggestions.PeopleSuggestion.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v2;

  v2 = *(_QWORD *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id) == *(_QWORD *)(a2
                                                                                             + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id)
    && *(_QWORD *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id + 8) == *(_QWORD *)(a2
                                                                                                 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id
                                                                                                 + 8);
  if (!v2 && (sub_24549A4A4() & 1) == 0)
    return 0;
  sub_24547D17C(0, &qword_2574739F0);
  return sub_24549A234() & 1;
}

void PeopleSuggestions.PeopleSuggestion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245480868(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2454808A0 + 4 * byte_24549BD4A[a1]))(0xD000000000000011, 0x800000024549E8E0);
}

uint64_t sub_2454808A0()
{
  return 25705;
}

uint64_t sub_2454808AC()
{
  return 0x6C65646F6DLL;
}

uint64_t sub_2454808C0()
{
  return 1802396018;
}

uint64_t sub_2454808D0()
{
  return 0x65726F6373;
}

uint64_t sub_2454808E4()
{
  unsigned __int8 *v0;

  return sub_245480868(*v0);
}

uint64_t sub_2454808EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24548970C(a1, a2);
  *a3 = result;
  return result;
}

void sub_245480910(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24548091C()
{
  sub_2454892FC();
  return sub_24549A570();
}

uint64_t sub_245480944()
{
  sub_2454892FC();
  return sub_24549A57C();
}

id PeopleSuggestions.PeopleSuggestion.__deallocating_deinit()
{
  return sub_245483630(type metadata accessor for PeopleSuggestions.PeopleSuggestion);
}

uint64_t sub_2454809C8(_QWORD *a1)
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

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473BA8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2454892FC();
  sub_24549A564();
  v12 = 0;
  sub_24549A45C();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model);
    v10[15] = 1;
    type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
    sub_24548B1F8(&qword_257473BB8, type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model, (uint64_t)&protocol conformance descriptor for PeopleSuggestions.PeopleSuggestion.Model);
    sub_24549A474();
    v10[14] = 2;
    sub_24549A45C();
    v10[13] = 3;
    sub_24549A480();
    v10[12] = 4;
    sub_24549A444();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_245480BC0(_QWORD *a1)
{
  return sub_2454809C8(a1);
}

void sub_245480BE0(void *a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  NSObject *log;
  os_log_t loga;
  uint64_t v27;

  v2 = *(NSObject **)(a2 + 16);
  if (v2)
  {
    v3 = a2;
    if (!*(_BYTE *)(a2 + 32))
      goto LABEL_8;
    if (qword_254413850 != -1)
      goto LABEL_24;
    while (1)
    {
      v5 = sub_24549A078();
      __swift_project_value_buffer(v5, (uint64_t)qword_254413928);
      v6 = a1;
      v7 = sub_24549A060();
      v8 = sub_24549A1D4();
      log = v7;
      if (os_log_type_enabled(v7, v8))
      {
        v9 = swift_slowAlloc();
        v24 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v9 = 138412546;
        v10 = v6;
        sub_24549A258();
        *v24 = v6;

        *(_WORD *)(v9 + 12) = 256;
        sub_24549A258();
        v6 = log;
        _os_log_impl(&dword_245461000, log, v8, "Lowest rank for model %@ should be 0, not %hhu", (uint8_t *)v9, 0xFu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254413840);
        swift_arrayDestroy();
        MEMORY[0x2495350C0](v24, -1, -1);
        MEMORY[0x2495350C0](v9, -1, -1);
      }
      else
      {

      }
LABEL_8:
      v2 = ((char *)v2 - 1);
      if (!v2)
        break;
      swift_bridgeObjectRetain();
      v11 = 0;
      loga = v2;
      v27 = v3;
      while (v2 != v11)
      {
        v13 = (uint64_t)v11 + v3;
        v14 = *((unsigned __int8 *)&v11[4].isa + v3 + 1);
        if (((v14 - *((unsigned __int8 *)&v11[4].isa + v3)) & 0xFFFFFF00) != 0)
          goto LABEL_23;
        v15 = ((char *)&v11->isa + 1);
        if ((v14 - *((_BYTE *)&v11[4].isa + v3)) != 1)
        {
          if (qword_254413850 != -1)
            swift_once();
          v16 = sub_24549A078();
          __swift_project_value_buffer(v16, (uint64_t)qword_254413928);
          v17 = a1;
          v18 = a1;
          swift_bridgeObjectRetain();
          v12 = sub_24549A060();
          v19 = sub_24549A1D4();
          if (os_log_type_enabled(v12, v19))
          {
            v20 = swift_slowAlloc();
            v21 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v20 = 138413314;
            *(_QWORD *)(v20 + 4) = v18;
            *v21 = v17;
            *(_WORD *)(v20 + 12) = 2048;
            *(_QWORD *)(v20 + 14) = v11;
            *(_WORD *)(v20 + 22) = 256;
            *(_BYTE *)(v20 + 24) = *(_BYTE *)(v13 + 32);
            swift_bridgeObjectRelease();
            *(_WORD *)(v20 + 25) = 2048;
            *(_QWORD *)(v20 + 27) = v15;
            *(_WORD *)(v20 + 35) = 256;
            *(_BYTE *)(v20 + 37) = v14;
            _os_log_impl(&dword_245461000, v12, v19, "Unexpected jump in ranks for model %@; rank[%ld]: %hhu, rank[%ld]: %hhu",
              (uint8_t *)v20,
              0x26u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_254413840);
            swift_arrayDestroy();
            v22 = v21;
            v2 = loga;
            MEMORY[0x2495350C0](v22, -1, -1);
            v23 = v20;
            v3 = v27;
            MEMORY[0x2495350C0](v23, -1, -1);
          }
          else
          {

            swift_bridgeObjectRelease();
            v12 = v18;
          }
          a1 = v17;

        }
        v11 = ((char *)v11 + 1);
        if (v2 == v15)
        {
          swift_bridgeObjectRelease();
          return;
        }
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      swift_once();
    }
  }
}

void PeopleSuggestions.__allocating_init(id:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void PeopleSuggestions.init(id:)()
{
  sub_245482060();
}

uint64_t sub_245480FDC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6974736567677573;
  else
    return 0x65736E6F70736572;
}

uint64_t sub_245481024()
{
  char *v0;

  return sub_245480FDC(*v0);
}

uint64_t sub_24548102C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2454898D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_245481050()
{
  sub_245489360();
  return sub_24549A570();
}

uint64_t sub_245481078()
{
  sub_245489360();
  return sub_24549A57C();
}

uint64_t sub_2454810A0()
{
  return swift_bridgeObjectRelease();
}

id PeopleSuggestions.__deallocating_deinit()
{
  return sub_245483630(type metadata accessor for PeopleSuggestions);
}

uint64_t sub_2454810CC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473BC0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245489360();
  sub_24549A564();
  v11 = *(_QWORD *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType);
  HIBYTE(v10) = 0;
  sub_2454893A4();
  sub_24549A474();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions);
    HIBYTE(v10) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257473BD8);
    sub_2454893E8();
    sub_24549A474();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24548122C(_QWORD *a1)
{
  return sub_2454810CC(a1);
}

uint64_t AppSuggestions.suggestions.getter()
{
  return swift_bridgeObjectRetain();
}

id AppSuggestions.__allocating_init(id:suggestions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  char *v8;
  objc_super v10;

  v7 = (char *)objc_allocWithZone(v3);
  sub_2454862D8(a3);
  *(_QWORD *)&v7[OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions] = a3;

  v8 = &v7[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return objc_msgSendSuper2(&v10, sel_init);
}

id AppSuggestions.init(id:suggestions:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  char *v7;
  char *v8;
  objc_super v10;

  v7 = v3;
  sub_2454862D8(a3);
  *(_QWORD *)&v7[OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions] = a3;

  v8 = &v7[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
  *(_QWORD *)v8 = a1;
  *((_QWORD *)v8 + 1) = a2;
  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t AppSuggestions.AppSuggestion.transportBundleId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSuggestions.AppSuggestion.model.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSAppSuggestionsMetricsItem_model);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSuggestions.AppSuggestion.rank.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____PSAppSuggestionsMetricsItem_rank);
}

id AppSuggestions.AppSuggestion.__allocating_init(transportBundleId:model:rank:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  objc_class *v5;
  _BYTE *v11;
  _QWORD *v12;
  _QWORD *v13;
  objc_super v15;

  v11 = objc_allocWithZone(v5);
  v12 = &v11[OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId];
  *v12 = a1;
  v12[1] = a2;
  v13 = &v11[OBJC_IVAR____PSAppSuggestionsMetricsItem_model];
  *v13 = a3;
  v13[1] = a4;
  v11[OBJC_IVAR____PSAppSuggestionsMetricsItem_rank] = a5;
  v15.receiver = v11;
  v15.super_class = v5;
  return objc_msgSendSuper2(&v15, sel_init);
}

id AppSuggestions.AppSuggestion.init(transportBundleId:model:rank:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _BYTE *v5;
  _QWORD *v6;
  _QWORD *v7;
  objc_super v9;

  v6 = &v5[OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId];
  *v6 = a1;
  v6[1] = a2;
  v7 = &v5[OBJC_IVAR____PSAppSuggestionsMetricsItem_model];
  *v7 = a3;
  v7[1] = a4;
  v5[OBJC_IVAR____PSAppSuggestionsMetricsItem_rank] = a5;
  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for AppSuggestions.AppSuggestion();
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t sub_245481794(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  char v4;
  char *v6;
  _BYTE v7[24];
  uint64_t v8;

  sub_2454891AC(a1, (uint64_t)v7);
  if (!v8)
  {
    sub_2454891F4((uint64_t)v7);
    goto LABEL_14;
  }
  type metadata accessor for AppSuggestions.AppSuggestion();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    v4 = 0;
    return v4 & 1;
  }
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId) == *(_QWORD *)&v6[OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId]
    && *(_QWORD *)(v1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId + 8) == *(_QWORD *)&v6[OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId + 8];
  if (!v2 && (sub_24549A4A4() & 1) == 0)
  {

    goto LABEL_14;
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_model) == *(_QWORD *)&v6[OBJC_IVAR____PSAppSuggestionsMetricsItem_model]
    && *(_QWORD *)(v1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_model + 8) == *(_QWORD *)&v6[OBJC_IVAR____PSAppSuggestionsMetricsItem_model
                                                                                            + 8])
  {

    v4 = 1;
  }
  else
  {
    v4 = sub_24549A4A4();

  }
  return v4 & 1;
}

uint64_t static AppSuggestions.AppSuggestion.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId) == *(_QWORD *)(a2
                                                                                                 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId)
    && *(_QWORD *)(a1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId + 8) == *(_QWORD *)(a2 + OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId + 8);
  if (v4 || (v5 = sub_24549A4A4(), result = 0, (v5 & 1) != 0))
  {
    if (*(_QWORD *)(a1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_model) == *(_QWORD *)(a2
                                                                                       + OBJC_IVAR____PSAppSuggestionsMetricsItem_model)
      && *(_QWORD *)(a1 + OBJC_IVAR____PSAppSuggestionsMetricsItem_model + 8) == *(_QWORD *)(a2
                                                                                           + OBJC_IVAR____PSAppSuggestionsMetricsItem_model
                                                                                           + 8))
    {
      return 1;
    }
    else
    {
      return sub_24549A4A4();
    }
  }
  return result;
}

id AppSuggestions.AppSuggestion.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AppSuggestions.AppSuggestion.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245481998(char a1)
{
  if (!a1)
    return 0xD000000000000011;
  if (a1 == 1)
    return 0x6C65646F6DLL;
  return 1802396018;
}

uint64_t sub_2454819E8()
{
  char *v0;

  return sub_245481998(*v0);
}

uint64_t sub_2454819F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2454899D8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_245481A14()
{
  sub_245489484();
  return sub_24549A570();
}

uint64_t sub_245481A3C()
{
  sub_245489484();
  return sub_24549A57C();
}

id AppSuggestions.AppSuggestion.__deallocating_deinit()
{
  return sub_245483630(type metadata accessor for AppSuggestions.AppSuggestion);
}

uint64_t sub_245481AB0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473C10);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245489484();
  sub_24549A564();
  v8[15] = 0;
  sub_24549A45C();
  if (!v1)
  {
    v8[14] = 1;
    sub_24549A45C();
    v8[13] = 2;
    sub_24549A480();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_245481C0C(_QWORD *a1)
{
  return sub_245481AB0(a1);
}

void sub_245481C2C(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v3 = *(_QWORD *)(a3 + 16);
  if (v3)
  {
    v4 = a3;
    v6 = 0x254413000uLL;
    if (!*(_BYTE *)(a3 + 32))
      goto LABEL_8;
    if (qword_254413850 != -1)
      goto LABEL_23;
    while (1)
    {
      v7 = sub_24549A078();
      __swift_project_value_buffer(v7, (uint64_t)qword_254413928);
      swift_bridgeObjectRetain_n();
      v8 = sub_24549A060();
      v9 = a2;
      v10 = sub_24549A1D4();
      if (os_log_type_enabled(v8, v10))
      {
        v11 = swift_slowAlloc();
        v12 = swift_slowAlloc();
        v29 = v12;
        *(_DWORD *)v11 = 136315394;
        swift_bridgeObjectRetain();
        sub_2454720F4(a1, v9, &v29);
        sub_24549A258();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v11 + 12) = 256;
        sub_24549A258();
        _os_log_impl(&dword_245461000, v8, v10, "Lowest rank for model %s should be 0, not %hhu", (uint8_t *)v11, 0xFu);
        swift_arrayDestroy();
        v13 = v12;
        v6 = 0x254413000;
        MEMORY[0x2495350C0](v13, -1, -1);
        MEMORY[0x2495350C0](v11, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      a2 = v9;
LABEL_8:
      v14 = v3 - 1;
      if (v3 == 1)
        break;
      swift_bridgeObjectRetain();
      v3 = 0;
      v27 = v14;
      while (v14 != v3)
      {
        v15 = v4 + v3;
        v16 = *(unsigned __int8 *)(v4 + v3 + 33);
        if (((v16 - *(unsigned __int8 *)(v4 + v3 + 32)) & 0xFFFFFF00) != 0)
          goto LABEL_22;
        v17 = v3 + 1;
        if ((v16 - *(_BYTE *)(v4 + v3 + 32)) != 1)
        {
          if (*(_QWORD *)(v6 + 2128) != -1)
            swift_once();
          v18 = sub_24549A078();
          __swift_project_value_buffer(v18, (uint64_t)qword_254413928);
          swift_bridgeObjectRetain_n();
          swift_bridgeObjectRetain_n();
          v19 = sub_24549A060();
          v20 = sub_24549A1D4();
          if (os_log_type_enabled(v19, v20))
          {
            v21 = swift_slowAlloc();
            v22 = v4;
            v23 = swift_slowAlloc();
            v29 = v23;
            *(_DWORD *)v21 = 136316162;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v21 + 4) = sub_2454720F4(a1, a2, &v29);
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v21 + 12) = 2048;
            *(_QWORD *)(v21 + 14) = v3;
            *(_WORD *)(v21 + 22) = 256;
            v24 = *(_BYTE *)(v15 + 32);
            swift_bridgeObjectRelease();
            *(_BYTE *)(v21 + 24) = v24;
            swift_bridgeObjectRelease();
            *(_WORD *)(v21 + 25) = 2048;
            *(_QWORD *)(v21 + 27) = v17;
            *(_WORD *)(v21 + 35) = 256;
            *(_BYTE *)(v21 + 37) = v16;
            _os_log_impl(&dword_245461000, v19, v20, "Unexpected jump in ranks for model %s; rank[%ld]: %hhu, rank[%ld]: %hhu",
              (uint8_t *)v21,
              0x26u);
            swift_arrayDestroy();
            v25 = v23;
            v4 = v22;
            v6 = 0x254413000;
            MEMORY[0x2495350C0](v25, -1, -1);
            v26 = v21;
            v14 = v27;
            MEMORY[0x2495350C0](v26, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();
          }
        }
        ++v3;
        if (v14 == v17)
        {
          swift_bridgeObjectRelease();
          return;
        }
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      swift_once();
    }
  }
}

void AppSuggestions.__allocating_init(id:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void AppSuggestions.init(id:)()
{
  sub_245482060();
}

void sub_245482060()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245482088()
{
  return 1;
}

uint64_t sub_245482090()
{
  sub_24549A51C();
  sub_24549A528();
  return sub_24549A54C();
}

uint64_t sub_2454820D0()
{
  return sub_24549A528();
}

uint64_t sub_2454820F4()
{
  sub_24549A51C();
  sub_24549A528();
  return sub_24549A54C();
}

uint64_t sub_245482134@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245489B08(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_24548215C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_245482168()
{
  sub_2454894E8();
  return sub_24549A570();
}

uint64_t sub_245482190()
{
  sub_2454894E8();
  return sub_24549A57C();
}

uint64_t sub_2454821B8()
{
  return swift_bridgeObjectRelease();
}

id AppSuggestions.__deallocating_deinit()
{
  return sub_245483630(type metadata accessor for AppSuggestions);
}

uint64_t sub_2454821E4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473C20);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2454894E8();
  sub_24549A564();
  v9[1] = *(_QWORD *)(v2 + OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473C30);
  sub_24548952C();
  sub_24549A474();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2454822F4(_QWORD *a1)
{
  return sub_2454821E4(a1);
}

uint64_t PeopleSuggesterFeedbackEvent.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_id);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PeopleSuggesterFeedbackEvent.type.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_type);
}

uint64_t PeopleSuggesterFeedbackEvent.engagedSuggestionId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_engagedSuggestionId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PeopleSuggesterFeedbackEvent.airdropOptionPresent.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_airdropOptionPresent);
}

uint64_t PeopleSuggesterFeedbackEvent.visiblePeopleSuggestionCount.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_visiblePeopleSuggestionCount);
}

uint64_t PeopleSuggesterFeedbackEvent.visibleAppSuggestionCount.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_visibleAppSuggestionCount);
}

uint64_t PeopleSuggesterFeedbackEvent.trialExperimentId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_trialExperimentId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PeopleSuggesterFeedbackEvent.trialTreatmentId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_trialTreatmentId);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_245482500()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PeopleSuggesterFeedbackEvent.trialDeploymentId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSFeedbackMetricsEventInternal_trialDeploymentId);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t PeopleSuggesterFeedbackEvent.EngagementType.init(rawValue:)(unint64_t a1)
{
  return sub_245489BBC(a1);
}

unint64_t sub_24548259C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_245489BBC(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_2454825CC()
{
  sub_24548B278();
  return sub_24549A108();
}

BOOL PeopleSuggesterFeedbackEvent.Timeout.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

uint64_t sub_24548263C()
{
  sub_24549A51C();
  sub_24549A528();
  return sub_24549A54C();
}

uint64_t sub_245482680()
{
  sub_24549A51C();
  sub_24549A528();
  return sub_24549A54C();
}

_QWORD *sub_2454826C0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_2454826F0()
{
  sub_24548B234();
  return sub_24549A108();
}

id sub_24548273C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  _BYTE *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  objc_super v22;

  v16 = &v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_id];
  *v16 = a1;
  v16[1] = a2;
  *(_QWORD *)&v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_type] = a3;
  v17 = &v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_engagedSuggestionId];
  *v17 = a4;
  v17[1] = a5;
  v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_airdropOptionPresent] = a6;
  v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_visiblePeopleSuggestionCount] = a7;
  v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_visibleAppSuggestionCount] = a8;
  v18 = &v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_trialExperimentId];
  *v18 = a9;
  v18[1] = a10;
  v19 = &v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_trialTreatmentId];
  *v19 = a11;
  v19[1] = a12;
  v20 = &v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_trialDeploymentId];
  *v20 = a13;
  v20[1] = a14;
  *(_QWORD *)&v15[OBJC_IVAR____PSFeedbackMetricsEventInternal_timeouts] = a15;
  v22.receiver = v15;
  v22.super_class = (Class)type metadata accessor for PeopleSuggesterFeedbackEvent();
  return objc_msgSendSuper2(&v22, sel_init);
}

id PeopleSuggesterFeedbackEvent.__allocating_init(id:type:engagedSuggestionId:airdropOptionPresent:visiblePeopleSuggestionCount:visibleAppSuggestionCount:trialExperimentId:trialTreatmentId:trialDeploymentId:peopleSuggestionsTimeoutOccurred:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8, __int128 a9, __int128 a10, uint64_t a11, uint64_t a12, char a13)
{
  objc_class *v13;
  id v19;
  void *v20;
  id v21;
  id v22;

  v19 = objc_allocWithZone(v13);
  if ((a13 & 1) != 0)
    v20 = &unk_25165B2A0;
  else
    v20 = (void *)MEMORY[0x24BEE4AF8];
  v21 = objc_allocWithZone((Class)type metadata accessor for PeopleSuggesterFeedbackEvent());
  v22 = sub_24548273C(a1, a2, a3, a4, a5, a6, a7, a8, a9, *((uint64_t *)&a9 + 1), a10, *((uint64_t *)&a10 + 1), a11, a12, (uint64_t)v20);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v22;
}

id PeopleSuggesterFeedbackEvent.init(id:type:engagedSuggestionId:airdropOptionPresent:visiblePeopleSuggestionCount:visibleAppSuggestionCount:trialExperimentId:trialTreatmentId:trialDeploymentId:peopleSuggestionsTimeoutOccurred:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, char a7, char a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v21;
  id v22;
  id v23;

  if ((a15 & 1) != 0)
    v21 = &unk_25165B2C8;
  else
    v21 = (void *)MEMORY[0x24BEE4AF8];
  v22 = objc_allocWithZone((Class)type metadata accessor for PeopleSuggesterFeedbackEvent());
  v23 = sub_24548273C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, (uint64_t)v21);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v23;
}

void PeopleSuggesterFeedbackEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245482B8C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_245482BC8 + 4 * byte_24549BD4F[a1]))(0xD000000000000013, 0x800000024549EAE0);
}

uint64_t sub_245482BC8()
{
  return 25705;
}

uint64_t sub_245482BD4()
{
  return 1701869940;
}

uint64_t sub_245482BE4()
{
  uint64_t v0;

  return v0 + 3;
}

uint64_t sub_245482C54()
{
  return 0x7374756F656D6974;
}

uint64_t sub_245482C6C()
{
  unsigned __int8 *v0;

  return sub_245482B8C(*v0);
}

uint64_t sub_245482C74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24548AD14(a1, a2);
  *a3 = result;
  return result;
}

void sub_245482C98(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_245482CA4()
{
  sub_245489BEC();
  return sub_24549A570();
}

uint64_t sub_245482CCC()
{
  sub_245489BEC();
  return sub_24549A57C();
}

id PeopleSuggesterFeedbackEvent.__deallocating_deinit()
{
  return sub_245483630(type metadata accessor for PeopleSuggesterFeedbackEvent);
}

uint64_t sub_245482D8C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473C90);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245489BEC();
  sub_24549A564();
  LOBYTE(v11) = 0;
  sub_24549A45C();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____PSFeedbackMetricsEventInternal_type);
    HIBYTE(v10) = 1;
    sub_245489C30();
    sub_24549A474();
    LOBYTE(v11) = 2;
    sub_24549A438();
    LOBYTE(v11) = 3;
    sub_24549A468();
    LOBYTE(v11) = 4;
    sub_24549A480();
    LOBYTE(v11) = 5;
    sub_24549A480();
    LOBYTE(v11) = 6;
    sub_24549A45C();
    LOBYTE(v11) = 7;
    sub_24549A45C();
    LOBYTE(v11) = 8;
    sub_24549A45C();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____PSFeedbackMetricsEventInternal_timeouts);
    HIBYTE(v10) = 9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257473CB0);
    sub_245489C74();
    sub_24549A474();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_245483080(_QWORD *a1)
{
  return sub_245482D8C(a1);
}

uint64_t sub_2454830A0@<X0>(_QWORD *a1@<X8>)
{
  return sub_2454830AC(&OBJC_IVAR____PSFeedbackMetricsEventInternal_id, a1);
}

uint64_t sub_2454830AC@<X0>(_QWORD *a1@<X2>, _QWORD *a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*v2 + *a1);
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

id TrialIdentifier.__allocating_init(experiment:treatment:deployment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  objc_super v18;

  v13 = (char *)objc_allocWithZone(v6);
  v14 = &v13[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v13[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v16 = &v13[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment];
  *(_QWORD *)v16 = a5;
  *((_QWORD *)v16 + 1) = a6;
  v18.receiver = v13;
  v18.super_class = v6;
  return objc_msgSendSuper2(&v18, sel_init);
}

id TrialIdentifier.init(experiment:treatment:deployment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  objc_super v11;

  v7 = &v6[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment];
  *(_QWORD *)v7 = a1;
  *((_QWORD *)v7 + 1) = a2;
  v8 = &v6[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment];
  *(_QWORD *)v8 = a3;
  *((_QWORD *)v8 + 1) = a4;
  v9 = &v6[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment];
  *(_QWORD *)v9 = a5;
  *((_QWORD *)v9 + 1) = a6;
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for TrialIdentifier();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t sub_24548329C()
{
  sub_24549A558();
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  return sub_24549A540();
}

uint64_t sub_245483384(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  BOOL v3;
  char v5;
  char *v7;
  _BYTE v8[24];
  uint64_t v9;

  sub_2454891AC(a1, (uint64_t)v8);
  if (!v9)
  {
    sub_2454891F4((uint64_t)v8);
    goto LABEL_20;
  }
  type metadata accessor for TrialIdentifier();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_20:
    v5 = 0;
    return v5 & 1;
  }
  v2 = *(_QWORD *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment) == *(_QWORD *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment]
    && *(_QWORD *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment + 8) == *(_QWORD *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment + 8];
  if (!v2 && (sub_24549A4A4() & 1) == 0
    || (*(_QWORD *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment) == *(_QWORD *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment]
      ? (v3 = *(_QWORD *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment + 8) == *(_QWORD *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment + 8])
      : (v3 = 0),
        !v3 && (sub_24549A4A4() & 1) == 0))
  {

    goto LABEL_20;
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment) == *(_QWORD *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment]
    && *(_QWORD *)(v1 + OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment + 8) == *(_QWORD *)&v7[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment + 8])
  {

    v5 = 1;
  }
  else
  {
    v5 = sub_24549A4A4();

  }
  return v5 & 1;
}

uint64_t sub_2454834B0(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_OWORD *))
{
  id v6;
  id v7;
  char v8;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a1;
    swift_unknownObjectRetain();
    sub_24549A270();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = a1;
  }
  v8 = a4(v10);

  sub_2454891F4((uint64_t)v10);
  return v8 & 1;
}

void TrialIdentifier.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245483588(char a1)
{
  return *(_QWORD *)&aExperimetreatm[8 * a1];
}

uint64_t sub_2454835A8()
{
  char *v0;

  return sub_245483588(*v0);
}

uint64_t sub_2454835B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24548B09C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2454835D4()
{
  sub_245489D1C();
  return sub_24549A570();
}

uint64_t sub_2454835FC()
{
  sub_245489D1C();
  return sub_24549A57C();
}

id TrialIdentifier.__deallocating_deinit()
{
  return sub_245483630(type metadata accessor for TrialIdentifier);
}

id sub_245483630(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_2454836B4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473CE0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245489D1C();
  sub_24549A564();
  v8[15] = 0;
  sub_24549A45C();
  if (!v1)
  {
    v8[14] = 1;
    sub_24549A45C();
    v8[13] = 2;
    sub_24549A45C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_245483814(_QWORD *a1)
{
  return sub_2454836B4(a1);
}

uint64_t sub_245483834(unint64_t a1)
{
  uint64_t result;

  if (a1 < 0x1A)
    return dword_24549CC40[a1];
  result = sub_24549A4C8();
  __break(1u);
  return result;
}

id sub_245483884()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_allocWithZone(MEMORY[0x24BE0C810]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v1 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  v2 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  v3 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v0, sel_initWithTrialNamespace_task_treatment_deployment_, 0, v1, v2, v3);

  return v4;
}

id sub_245483988()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;

  v1 = v0;
  if (*(_BYTE *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8) == 1)
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8);
    v3 = v2 == 0;
    if (v2)
      v4 = 20;
    else
      v4 = 0;
  }
  else
  {
    v4 = sub_245483834(*(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType));
    if (*(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8))
    {
      if (qword_254413850 != -1)
        swift_once();
      v5 = sub_24549A078();
      __swift_project_value_buffer(v5, (uint64_t)qword_254413928);
      v6 = sub_24549A060();
      v7 = sub_24549A1E0();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        v9 = swift_slowAlloc();
        v16 = v9;
        *(_DWORD *)v8 = 136315138;
        type metadata accessor for BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelType(0);
        v10 = sub_24549A0C0();
        sub_2454720F4(v10, v11, &v16);
        sub_24549A258();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_245461000, v6, v7, "incorrect model type with other: %s", v8, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2495350C0](v9, -1, -1);
        MEMORY[0x2495350C0](v8, -1, -1);
      }

      v3 = 0;
      v4 = 20;
    }
    else
    {
      v3 = 1;
    }
  }
  v12 = *(id *)(v1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  if (v12)
    v12 = sub_245483884();
  if (v3)
  {
    v13 = 0;
  }
  else
  {
    swift_bridgeObjectRetain();
    v13 = (void *)sub_24549A0A8();
    swift_bridgeObjectRelease();
  }
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0C518]), sel_initWithModelType_trialIdentifier_otherModelTypeName_, v4, v12, v13);

  return v14;
}

uint64_t sub_245483BF4(unint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (a1 < 3)
    return (a1 + 1);
  if (qword_254413850 != -1)
    swift_once();
  v2 = sub_24549A078();
  __swift_project_value_buffer(v2, (uint64_t)qword_254413928);
  v3 = sub_24549A060();
  v4 = sub_24549A1D4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_245461000, v3, v4, "Unhandled response type", v5, 2u);
    MEMORY[0x2495350C0](v5, -1, -1);
  }

  return 0;
}

uint64_t PeopleSuggestions.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  int64_t v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *, _QWORD);
  unint64_t v28;
  _QWORD v29[4];
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;

  v29[0] = 0;
  v29[1] = 0xE000000000000000;
  sub_24549A354();
  v34 = 0;
  v35 = 0xE000000000000000;
  sub_24549A0E4();
  swift_bridgeObjectRetain();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions);
  v28 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v2 = sub_24549A2DC();
    if (v2)
      goto LABEL_3;
LABEL_6:
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
LABEL_21:
    v29[0] = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254413828);
    sub_245489D6C();
    sub_24549A09C();
    swift_bridgeObjectRelease();
    sub_24549A0E4();
    swift_bridgeObjectRelease();
    sub_24549A0E4();
    return v34;
  }
  v2 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_6;
LABEL_3:
  v33 = MEMORY[0x24BEE4AF8];
  sub_245477EBC(0, v2 & ~(v2 >> 63), 0);
  if (v28)
  {
    result = sub_24549A294();
    v6 = 1;
  }
  else
  {
    result = sub_245486250(v1);
    v6 = v8 & 1;
  }
  v30 = result;
  v31 = v4;
  v32 = v6;
  if ((v2 & 0x8000000000000000) == 0)
  {
    do
    {
      while (1)
      {
        v15 = v30;
        v14 = v31;
        v16 = v32;
        sub_245485FFC(v30, v31, v32, v1, v5, (void (*)(void *))type metadata accessor for PeopleSuggestions.PeopleSuggestion);
        v18 = v17;
        v19 = objc_msgSend(v17, sel_description);
        v20 = sub_24549A0B4();
        v22 = v21;

        v23 = v33;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = sub_245477EBC(0, *(_QWORD *)(v23 + 16) + 1, 1);
          v23 = v33;
        }
        v25 = *(_QWORD *)(v23 + 16);
        v24 = *(_QWORD *)(v23 + 24);
        if (v25 >= v24 >> 1)
        {
          result = sub_245477EBC(v24 > 1, v25 + 1, 1);
          v23 = v33;
        }
        *(_QWORD *)(v23 + 16) = v25 + 1;
        v26 = v23 + 16 * v25;
        *(_QWORD *)(v26 + 32) = v20;
        *(_QWORD *)(v26 + 40) = v22;
        if (v28)
          break;
        v9 = sub_245485EFC(v15, v14, v16, v1);
        v11 = v10;
        v13 = v12;
        sub_245489D60(v15, v14, v16);
        v30 = v9;
        v31 = v11;
        v32 = v13 & 1;
        if (!--v2)
          goto LABEL_20;
      }
      if ((v16 & 1) == 0)
        goto LABEL_23;
      if (sub_24549A2AC())
        swift_isUniquelyReferenced_nonNull_native();
      __swift_instantiateConcreteTypeFromMangledName(&qword_257473CF0);
      v27 = (void (*)(_QWORD *, _QWORD))sub_24549A1B0();
      sub_24549A318();
      v27(v29, 0);
      --v2;
    }
    while (v2);
LABEL_20:
    sub_245489D60(v30, v31, v32);
    swift_bridgeObjectRelease();
    v7 = v33;
    goto LABEL_21;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t PeopleSuggestions.ResponseType.description.getter(unint64_t a1)
{
  if (a1 > 2)
    return 0x2053492054414857;
  else
    return *(_QWORD *)&aDefault[8 * a1];
}

uint64_t sub_245484164()
{
  unint64_t *v0;

  return PeopleSuggestions.ResponseType.description.getter(*v0);
}

uint64_t PeopleSuggestions.PeopleSuggestion.description.getter()
{
  uint64_t v0;
  id v1;
  id v2;

  sub_24549A354();
  sub_24549A0E4();
  swift_bridgeObjectRetain();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v1 = *(id *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model);
  v2 = objc_msgSend(v1, sel_description);
  sub_24549A0B4();

  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  swift_bridgeObjectRetain();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  sub_24549A498();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473CF8);
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  return 0;
}

uint64_t TrialIdentifier.description.getter()
{
  _QWORD v1[2];

  sub_24549A354();
  swift_bridgeObjectRelease();
  strcpy((char *)v1, "(experiment: ");
  swift_bridgeObjectRetain();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  swift_bridgeObjectRetain();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  swift_bridgeObjectRetain();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  return v1[0];
}

uint64_t PeopleSuggestions.PeopleSuggestion.Model.description.getter()
{
  uint64_t v0;
  id v1;

  sub_24549A354();
  sub_24549A0E4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473D00);
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473848);
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v1 = *(id *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473D08);
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  return 0;
}

uint64_t sub_2454846B4()
{
  uint64_t *v0;

  return PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(*v0);
}

uint64_t AppSuggestions.description.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  int64_t v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD *, _QWORD);
  unint64_t v28;
  _QWORD v29[4];
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;

  v29[0] = 0;
  v29[1] = 0xE000000000000000;
  sub_24549A354();
  swift_bridgeObjectRelease();
  v34 = 0xD000000000000014;
  v35 = 0x800000024549E6E0;
  swift_bridgeObjectRetain();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions);
  v28 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v2 = sub_24549A2DC();
    if (v2)
      goto LABEL_3;
LABEL_6:
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
LABEL_21:
    v29[0] = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254413828);
    sub_245489D6C();
    sub_24549A09C();
    swift_bridgeObjectRelease();
    sub_24549A0E4();
    swift_bridgeObjectRelease();
    sub_24549A0E4();
    return v34;
  }
  v2 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_6;
LABEL_3:
  v33 = MEMORY[0x24BEE4AF8];
  sub_245477EBC(0, v2 & ~(v2 >> 63), 0);
  if (v28)
  {
    result = sub_24549A294();
    v6 = 1;
  }
  else
  {
    result = sub_245486250(v1);
    v6 = v8 & 1;
  }
  v30 = result;
  v31 = v4;
  v32 = v6;
  if ((v2 & 0x8000000000000000) == 0)
  {
    do
    {
      while (1)
      {
        v15 = v30;
        v14 = v31;
        v16 = v32;
        sub_245485FFC(v30, v31, v32, v1, v5, (void (*)(void *))type metadata accessor for AppSuggestions.AppSuggestion);
        v18 = v17;
        v19 = objc_msgSend(v17, sel_description);
        v20 = sub_24549A0B4();
        v22 = v21;

        v23 = v33;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = sub_245477EBC(0, *(_QWORD *)(v23 + 16) + 1, 1);
          v23 = v33;
        }
        v25 = *(_QWORD *)(v23 + 16);
        v24 = *(_QWORD *)(v23 + 24);
        if (v25 >= v24 >> 1)
        {
          result = sub_245477EBC(v24 > 1, v25 + 1, 1);
          v23 = v33;
        }
        *(_QWORD *)(v23 + 16) = v25 + 1;
        v26 = v23 + 16 * v25;
        *(_QWORD *)(v26 + 32) = v20;
        *(_QWORD *)(v26 + 40) = v22;
        if (v28)
          break;
        v9 = sub_245485EFC(v15, v14, v16, v1);
        v11 = v10;
        v13 = v12;
        sub_245489D60(v15, v14, v16);
        v30 = v9;
        v31 = v11;
        v32 = v13 & 1;
        if (!--v2)
          goto LABEL_20;
      }
      if ((v16 & 1) == 0)
        goto LABEL_23;
      if (sub_24549A2AC())
        swift_isUniquelyReferenced_nonNull_native();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254413760);
      v27 = (void (*)(_QWORD *, _QWORD))sub_24549A1B0();
      sub_24549A318();
      v27(v29, 0);
      --v2;
    }
    while (v2);
LABEL_20:
    sub_245489D60(v30, v31, v32);
    swift_bridgeObjectRelease();
    v7 = v33;
    goto LABEL_21;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

unint64_t AppSuggestions.AppSuggestion.description.getter()
{
  sub_24549A354();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  swift_bridgeObjectRetain();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  sub_24549A498();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  return 0xD000000000000014;
}

id sub_245484BD8(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_24549A0A8();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t PeopleSuggesterFeedbackEvent.description.getter()
{
  sub_24549A354();
  sub_24549A0E4();
  swift_bridgeObjectRetain();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  sub_24549A3D8();
  sub_24549A0E4();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473848);
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  sub_24549A498();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  sub_24549A498();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  return 0;
}

uint64_t sub_245484EBC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245485EE4(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_245484F24(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_245484F24(_QWORD *a1)
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
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _BYTE *v22;
  unsigned int v23;
  uint64_t v24;
  _BYTE *v25;
  unsigned int v26;
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
  unsigned int v81;
  uint64_t v82;
  unsigned int v83;
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
  unsigned __int8 *__dst;

  v2 = a1;
  v3 = a1[1];
  result = sub_24549A48C();
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
        v81 = *(unsigned __int8 *)(v79 + i);
        v82 = v78;
        do
        {
          v83 = *(unsigned __int8 *)(v79 + v82);
          if (v81 >= v83)
            break;
          if (!v79)
            goto LABEL_141;
          *(_BYTE *)(v79 + v82 + 1) = v83;
          *(_BYTE *)(v79 + v82--) = v81;
        }
        while (v82 != -1);
        ++v78;
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
  v94 = result;
  v95 = v3;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (unsigned __int8 *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_103:
      v93 = v8;
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
          sub_24548559C((unsigned __int8 *)(v84 + v88), (unsigned __int8 *)(v84 + *(_QWORD *)&v87[16 * v12 - 16]), v84 + v89, __dst);
          if (v1)
            break;
          if (v89 < v88)
            goto LABEL_133;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v86 = sub_245485A8C((uint64_t)v86);
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
      *(_QWORD *)(v93 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v93 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_24549A15C();
    *(_QWORD *)(v7 + 16) = v6;
    v3 = v95;
    v93 = v7;
    __dst = (unsigned __int8 *)(v7 + 32);
  }
  v9 = 0;
  v92 = v2;
  v10 = *v2;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v96 = *v2;
  while (1)
  {
    v13 = v9++;
    if (v9 < v3)
    {
      v14 = *(unsigned __int8 *)(v10 + v9);
      v15 = *(unsigned __int8 *)(v10 + v13);
      v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        v16 = v14;
        while (1)
        {
          v17 = *(unsigned __int8 *)(v10 + v9);
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
              v20 = *(_BYTE *)(v10 + v19);
              *(_BYTE *)(v10 + v19) = *(_BYTE *)(v10 + v18);
              *(_BYTE *)(v10 + v18) = v20;
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
    if (v9 - v13 >= v94)
      goto LABEL_47;
    v21 = v13 + v94;
    if (__OFADD__(v13, v94))
      goto LABEL_139;
    if (v21 >= v3)
      v21 = v3;
    if (v21 < v13)
      break;
    if (v9 != v21)
    {
      v22 = (_BYTE *)(v10 + v9);
      do
      {
        v23 = *(unsigned __int8 *)(v10 + v9);
        v24 = v13;
        v25 = v22;
        do
        {
          v26 = *(v25 - 1);
          if (v23 >= v26)
            break;
          if (!v10)
            goto LABEL_142;
          *v25 = v26;
          *--v25 = v23;
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
      v11 = sub_2454857D4(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v28 = *((_QWORD *)v11 + 2);
    v27 = *((_QWORD *)v11 + 3);
    v12 = v28 + 1;
    v10 = v96;
    if (v28 >= v27 >> 1)
    {
      v77 = sub_2454857D4((char *)(v27 > 1), v28 + 1, 1, v11);
      v10 = v96;
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
        sub_24548559C((unsigned __int8 *)(v10 + *(_QWORD *)v71), (unsigned __int8 *)(v10 + *(_QWORD *)v74), v10 + v75, __dst);
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
        v10 = v96;
        if (v76 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v95;
    if (v9 >= v95)
    {
      v2 = v92;
      v8 = v93;
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
  result = sub_24549A3E4();
  __break(1u);
  return result;
}

uint64_t sub_24548559C(unsigned __int8 *__src, unsigned __int8 *a2, unint64_t a3, unsigned __int8 *__dst)
{
  unsigned __int8 *v4;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  size_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  unsigned int v18;
  uint64_t result;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;

  v22 = __src;
  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a3 - (_QWORD)a2;
  v21 = __dst;
  if (a2 - __src >= (uint64_t)(a3 - (_QWORD)a2))
  {
    if ((v9 & 0x8000000000000000) == 0)
    {
      if (__dst != a2 || a3 <= (unint64_t)__dst)
        memmove(__dst, a2, a3 - (_QWORD)a2);
      v14 = &v4[v9];
      v20 = &v4[v9];
      v22 = v6;
      if (v7 < v6 && (unsigned __int8 *)a3 != v6)
      {
        v15 = (unsigned __int8 *)(a3 - 1);
        while (1)
        {
          v16 = v15 + 1;
          v17 = v6 - 1;
          v18 = *(v6 - 1);
          if (*(v14 - 1) >= v18)
          {
            v20 = v14 - 1;
            if (v16 < v14 || v15 >= v14 || v16 != v14)
              *v15 = *(v14 - 1);
            --v14;
            if (v6 <= v7)
              goto LABEL_38;
          }
          else
          {
            if (v16 != v6 || v15 >= v6)
              *v15 = v18;
            v22 = --v6;
            if (v17 <= v7)
              goto LABEL_38;
          }
          --v15;
          if (v14 <= v4)
            goto LABEL_38;
        }
      }
      goto LABEL_38;
    }
  }
  else if ((v8 & 0x8000000000000000) == 0)
  {
    if (__dst != __src || a2 <= __dst)
      memmove(__dst, __src, v8);
    v10 = &v4[v8];
    v20 = &v4[v8];
    if (v6 != v7 && (unint64_t)v6 < a3)
    {
      do
      {
        v11 = *v6;
        v12 = *v4;
        if (v11 >= v12)
        {
          if (v7 != v4)
            *v7 = v12;
          v21 = ++v4;
          v13 = v6;
        }
        else
        {
          v13 = v6 + 1;
          if (v7 < v6 || v7 >= v13 || v7 != v6)
            *v7 = v11;
        }
        ++v7;
        if (v4 >= v10)
          break;
        v6 = v13;
      }
      while ((unint64_t)v13 < a3);
      v22 = v7;
    }
LABEL_38:
    sub_2454859FC((void **)&v22, (const void **)&v21, &v20);
    return 1;
  }
  result = sub_24549A42C();
  __break(1u);
  return result;
}

char *sub_2454857D4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257473E78);
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

uint64_t sub_2454858CC(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return sub_2454858F0(a1, a2, a3, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped);
}

uint64_t sub_2454858D8(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return sub_2454858F0(a1, a2, a3, type metadata accessor for AppSuggestionInferenceEventTimestamped);
}

uint64_t sub_2454858E4(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  return sub_2454858F0(a1, a2, a3, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
}

uint64_t sub_2454858F0(unint64_t *a1, unint64_t *a2, uint64_t *a3, uint64_t (*a4)(_QWORD))
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v4 = *a1;
  v5 = *a2;
  v6 = *a3;
  result = a4(0);
  v8 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v8)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v9 = v6 - v5;
  if (v6 - v5 == 0x8000000000000000 && v8 == -1)
    goto LABEL_14;
  if (v9 / v8 < 0)
  {
LABEL_15:
    result = sub_24549A42C();
    __break(1u);
    return result;
  }
  if (v4 < v5 || v4 >= v5 + v9 / v8 * v8)
    return swift_arrayInitWithTakeFrontToBack();
  if (v4 != v5)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_2454859FC(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  int64_t v4;
  char *result;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  if (v4 < 0)
  {
    result = (char *)sub_24549A42C();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    if (result != v3 || result >= &v3[v4])
      return (char *)memmove(result, v3, v4);
  }
  return result;
}

char *sub_245485A8C(uint64_t a1)
{
  return sub_2454857D4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_245485AA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t i;
  BOOL v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254413770);
  v4 = sub_24549A408();
  v5 = (_QWORD *)v4;
  v6 = 0;
  v29 = a1;
  v9 = *(_QWORD *)(a1 + 64);
  v8 = a1 + 64;
  v7 = v9;
  v10 = 1 << *(_BYTE *)(v8 - 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v7;
  v27 = v8;
  v28 = (unint64_t)(v10 + 63) >> 6;
  v13 = v4 + 64;
  if ((v11 & v7) == 0)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v6 << 6); ; i = __clz(__rbit64(v17)) + (v6 << 6))
  {
    v19 = (uint64_t *)(*(_QWORD *)(v29 + 48) + 16 * i);
    v20 = *v19;
    v21 = v19[1];
    v30 = *(_QWORD *)(*(_QWORD *)(v29 + 56) + 8 * i);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_245484EBC(&v30);
    if (v2)
      break;
    v2 = 0;
    swift_bridgeObjectRelease();
    v22 = v30;
    *(_QWORD *)(v13 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v23 = (_QWORD *)(v5[6] + 16 * i);
    *v23 = v20;
    v23[1] = v21;
    *(_QWORD *)(v5[7] + 8 * i) = v22;
    v24 = v5[2];
    v16 = __OFADD__(v24, 1);
    v25 = v24 + 1;
    if (v16)
    {
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      break;
    }
    v5[2] = v25;
    if (v12)
      goto LABEL_4;
LABEL_5:
    v16 = __OFADD__(v6++, 1);
    if (v16)
      goto LABEL_26;
    if (v6 >= v28)
      return (uint64_t)v5;
    v17 = *(_QWORD *)(v27 + 8 * v6);
    if (!v17)
    {
      v18 = v6 + 1;
      if (v6 + 1 >= v28)
        return (uint64_t)v5;
      v17 = *(_QWORD *)(v27 + 8 * v18);
      if (!v17)
      {
        v18 = v6 + 2;
        if (v6 + 2 >= v28)
          return (uint64_t)v5;
        v17 = *(_QWORD *)(v27 + 8 * v18);
        if (!v17)
        {
          v18 = v6 + 3;
          if (v6 + 3 >= v28)
            return (uint64_t)v5;
          v17 = *(_QWORD *)(v27 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v6 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_27;
              if (v6 >= v28)
                return (uint64_t)v5;
              v17 = *(_QWORD *)(v27 + 8 * v6);
              ++v18;
              if (v17)
                goto LABEL_15;
            }
          }
        }
      }
      v6 = v18;
    }
LABEL_15:
    v12 = (v17 - 1) & v17;
  }
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_245485CC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t i;
  BOOL v16;
  unint64_t v17;
  int64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254413858);
  v4 = sub_24549A408();
  v5 = (_QWORD *)v4;
  v6 = 0;
  v25 = a1;
  v9 = *(_QWORD *)(a1 + 64);
  v8 = a1 + 64;
  v7 = v9;
  v10 = 1 << *(_BYTE *)(v8 - 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v7;
  v24 = (unint64_t)(v10 + 63) >> 6;
  v13 = v4 + 64;
  if ((v11 & v7) == 0)
    goto LABEL_5;
LABEL_4:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v6 << 6); ; i = __clz(__rbit64(v17)) + (v6 << 6))
  {
    v19 = *(void **)(*(_QWORD *)(v25 + 48) + 8 * i);
    v26 = *(_QWORD *)(*(_QWORD *)(v25 + 56) + 8 * i);
    swift_bridgeObjectRetain_n();
    v20 = v19;
    sub_245484EBC(&v26);
    if (v2)
      break;
    v2 = 0;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v13 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    *(_QWORD *)(v5[6] + 8 * i) = v20;
    *(_QWORD *)(v5[7] + 8 * i) = v26;
    v21 = v5[2];
    v16 = __OFADD__(v21, 1);
    v22 = v21 + 1;
    if (v16)
    {
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      break;
    }
    v5[2] = v22;
    if (v12)
      goto LABEL_4;
LABEL_5:
    v16 = __OFADD__(v6++, 1);
    if (v16)
      goto LABEL_26;
    if (v6 >= v24)
      return (uint64_t)v5;
    v17 = *(_QWORD *)(v8 + 8 * v6);
    if (!v17)
    {
      v18 = v6 + 1;
      if (v6 + 1 >= v24)
        return (uint64_t)v5;
      v17 = *(_QWORD *)(v8 + 8 * v18);
      if (!v17)
      {
        v18 = v6 + 2;
        if (v6 + 2 >= v24)
          return (uint64_t)v5;
        v17 = *(_QWORD *)(v8 + 8 * v18);
        if (!v17)
        {
          v18 = v6 + 3;
          if (v6 + 3 >= v24)
            return (uint64_t)v5;
          v17 = *(_QWORD *)(v8 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v6 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_27;
              if (v6 >= v24)
                return (uint64_t)v5;
              v17 = *(_QWORD *)(v8 + 8 * v6);
              ++v18;
              if (v17)
                goto LABEL_15;
            }
          }
        }
      }
      v6 = v18;
    }
LABEL_15:
    v12 = (v17 - 1) & v17;
  }
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_245485EE4(uint64_t a1)
{
  return sub_245478850(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

int64_t sub_245485EFC(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_245485FE0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void *a5)
{
  sub_245485FFC(a1, a2, a3, a4, a5, (void (*)(void *))type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model);
}

void sub_245485FEC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_245485FFC(a1, a2, a3, a4, 0, (void (*)(void *))type metadata accessor for Bookmark);
}

void sub_245485FFC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, void *a5, void (*a6)(void *))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  id v18;
  void *v19;

  v9 = a1;
  if ((a4 & 0xC000000000000001) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_13;
    if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
        goto LABEL_20;
      __break(1u);
LABEL_13:
      if (sub_24549A2C4() == *(_DWORD *)(a4 + 36))
      {
        sub_24549A2D0();
        a6(a5);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        a5 = v19;
        swift_unknownObjectRelease();
        v11 = sub_24549A228();
        v12 = -1 << *(_BYTE *)(a4 + 32);
        v9 = v11 & ~v12;
        if (((*(_QWORD *)(a4 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
        {
          v13 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v9);
          v14 = sub_24549A234();

          if ((v14 & 1) == 0)
          {
            v15 = ~v12;
            do
            {
              v9 = (v9 + 1) & v15;
              if (((*(_QWORD *)(a4 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
                goto LABEL_24;
              v16 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v9);
              v17 = sub_24549A234();

            }
            while ((v17 & 1) == 0);
          }

LABEL_20:
          v18 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v9);
          return;
        }
LABEL_24:

        __break(1u);
        goto LABEL_25;
      }
LABEL_23:
      __break(1u);
      goto LABEL_24;
    }
    __break(1u);
    goto LABEL_23;
  }
  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }
  if (a4 < 0)
    v10 = a4;
  else
    v10 = a4 & 0xFFFFFFFFFFFFFF8;
  MEMORY[0x249534904](a1, a2, v10);
  a6(a5);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
}

uint64_t sub_245486250(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 72);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_2454862D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  int64_t v17;
  char v18;
  char *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(_QWORD **, _QWORD);
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char isUniquelyReferenced_nonNull_native;
  char v34;
  unint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  char v41;
  uint64_t *v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  unint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;

  v1 = a1;
  v54 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
    v2 = sub_24549A2DC();
  else
    v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v8 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v8)
      goto LABEL_23;
LABEL_8:
    v9 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_39:
    swift_bridgeObjectRelease();
    v51 = sub_245485AA0((uint64_t)v9);
    swift_bridgeObjectRelease();
    sub_24547E110(v51);
    return swift_release();
  }
  v59 = MEMORY[0x24BEE4AF8];
  sub_245477D9C(0, v2 & ~(v2 >> 63), 0);
  if (v54)
  {
    v3 = sub_24549A294();
    v6 = 1;
  }
  else
  {
    v3 = sub_245486250(v1);
    v6 = v10 & 1;
  }
  v56 = v3;
  v57 = v4;
  v58 = v6;
  if (v2 < 0)
    goto LABEL_42;
  v53 = v1;
  do
  {
    while (1)
    {
      v17 = v56;
      v16 = v57;
      v18 = v58;
      sub_245485FFC(v56, v57, v58, v1, v5, (void (*)(void *))type metadata accessor for AppSuggestions.AppSuggestion);
      v20 = v19;
      v21 = *(_QWORD *)&v19[OBJC_IVAR____PSAppSuggestionsMetricsItem_model];
      v22 = *(_QWORD *)&v19[OBJC_IVAR____PSAppSuggestionsMetricsItem_model + 8];
      v23 = v19[OBJC_IVAR____PSAppSuggestionsMetricsItem_rank];
      swift_bridgeObjectRetain();

      v24 = v59;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_245477D9C(0, *(_QWORD *)(v24 + 16) + 1, 1);
        v24 = v59;
      }
      v26 = *(_QWORD *)(v24 + 16);
      v25 = *(_QWORD *)(v24 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_245477D9C(v25 > 1, v26 + 1, 1);
        v24 = v59;
      }
      *(_QWORD *)(v24 + 16) = v26 + 1;
      v27 = v24 + 24 * v26;
      *(_QWORD *)(v27 + 32) = v21;
      *(_QWORD *)(v27 + 40) = v22;
      *(_BYTE *)(v27 + 48) = v23;
      if (v54)
        break;
      v1 = v53;
      v11 = sub_245485EFC(v17, v16, v18, v53);
      v13 = v12;
      v15 = v14;
      sub_245489D60(v17, v16, v18);
      v56 = v11;
      v57 = v13;
      v58 = v15 & 1;
      if (!--v2)
        goto LABEL_22;
    }
    v1 = v53;
    if ((v18 & 1) == 0)
      goto LABEL_43;
    if (sub_24549A2AC())
      swift_isUniquelyReferenced_nonNull_native();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254413760);
    v28 = (void (*)(_QWORD **, _QWORD))sub_24549A1B0();
    sub_24549A318();
    v28(&v55, 0);
    --v2;
  }
  while (v2);
LABEL_22:
  sub_245489D60(v56, v57, v58);
  v7 = v59;
  v8 = *(_QWORD *)(v59 + 16);
  if (!v8)
    goto LABEL_8;
LABEL_23:
  swift_bridgeObjectRetain();
  v29 = (_BYTE *)(v7 + 48);
  v9 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    v31 = *((_QWORD *)v29 - 2);
    v30 = *((_QWORD *)v29 - 1);
    v32 = *v29;
    swift_bridgeObjectRetain_n();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v55 = v9;
    v35 = sub_245472734(v31, v30);
    v36 = v9[2];
    v37 = (v34 & 1) == 0;
    v38 = v36 + v37;
    if (__OFADD__(v36, v37))
      break;
    v39 = v34;
    if (v9[3] >= v38)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_245476604();
        v9 = v55;
      }
    }
    else
    {
      sub_2454729B4(v38, isUniquelyReferenced_nonNull_native);
      v9 = v55;
      v40 = sub_245472734(v31, v30);
      if ((v39 & 1) != (v41 & 1))
        goto LABEL_44;
      v35 = v40;
    }
    swift_bridgeObjectRelease();
    if ((v39 & 1) == 0)
    {
      v9[(v35 >> 6) + 8] |= 1 << v35;
      v42 = (uint64_t *)(v9[6] + 16 * v35);
      *v42 = v31;
      v42[1] = v30;
      *(_QWORD *)(v9[7] + 8 * v35) = MEMORY[0x24BEE4AF8];
      v43 = v9[2];
      v44 = __OFADD__(v43, 1);
      v45 = v43 + 1;
      if (v44)
        goto LABEL_41;
      v9[2] = v45;
      swift_bridgeObjectRetain();
    }
    v46 = v9[7];
    v47 = *(char **)(v46 + 8 * v35);
    v48 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v46 + 8 * v35) = v47;
    if ((v48 & 1) == 0)
    {
      v47 = sub_245471B98(0, *((_QWORD *)v47 + 2) + 1, 1, v47);
      *(_QWORD *)(v46 + 8 * v35) = v47;
    }
    v50 = *((_QWORD *)v47 + 2);
    v49 = *((_QWORD *)v47 + 3);
    if (v50 >= v49 >> 1)
    {
      v47 = sub_245471B98((char *)(v49 > 1), v50 + 1, 1, v47);
      *(_QWORD *)(v46 + 8 * v35) = v47;
    }
    v29 += 24;
    *((_QWORD *)v47 + 2) = v50 + 1;
    v47[v50 + 32] = v32;
    swift_bridgeObjectRelease_n();
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      goto LABEL_39;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  result = sub_24549A4E0();
  __break(1u);
  return result;
}

id sub_245486778(void *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  char v13;
  objc_class *v14;
  _BYTE *v15;
  uint64_t *v16;
  uint64_t *v17;
  id result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  objc_super v28;
  uint64_t v29;
  uint64_t v30;

  v2 = objc_msgSend(a1, sel_transportBundleId);
  if (!v2)
  {
    sub_24549A354();
    swift_getObjectType();
    v19 = sub_24549A588();
    v21 = v20;
    swift_bridgeObjectRelease();
    v29 = v19;
    v30 = v21;
LABEL_9:
    sub_24549A0E4();
    v26 = v30;
    sub_24546A66C();
    swift_allocError();
    *(_QWORD *)v27 = v29;
    *(_QWORD *)(v27 + 8) = v26;
    *(_BYTE *)(v27 + 16) = 0;
    return (id)swift_willThrow();
  }
  v3 = v2;
  v4 = sub_24549A0B4();
  v6 = v5;

  v7 = objc_msgSend(a1, sel_model);
  if (!v7)
  {
    swift_bridgeObjectRelease();
    sub_24549A354();
    swift_getObjectType();
    v22 = sub_24549A588();
    v24 = v23;
    swift_bridgeObjectRelease();
    v29 = v22;
    v30 = v24;
    goto LABEL_9;
  }
  v8 = v7;
  v9 = sub_24549A0B4();
  v11 = v10;

  if (!objc_msgSend(a1, sel_hasRank))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_getObjectType();
    v29 = sub_24549A588();
    v30 = v25;
    goto LABEL_9;
  }
  v12 = objc_msgSend(a1, sel_rank);
  if (v12 >= 0x100)
  {
    result = (id)sub_24549A3E4();
    __break(1u);
  }
  else
  {
    v13 = v12;
    v14 = (objc_class *)type metadata accessor for AppSuggestions.AppSuggestion();
    v15 = objc_allocWithZone(v14);
    v16 = (uint64_t *)&v15[OBJC_IVAR____PSAppSuggestionsMetricsItem_transportBundleId];
    *v16 = v4;
    v16[1] = v6;
    v17 = (uint64_t *)&v15[OBJC_IVAR____PSAppSuggestionsMetricsItem_model];
    *v17 = v9;
    v17[1] = v11;
    v15[OBJC_IVAR____PSAppSuggestionsMetricsItem_rank] = v13;
    v28.receiver = v15;
    v28.super_class = v14;
    return objc_msgSendSuper2(&v28, sel_init);
  }
  return result;
}

id sub_245486A28(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  uint64_t v22;
  objc_super v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = objc_msgSend(a1, sel_identifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_24549A0B4();
    v7 = v6;

    v8 = objc_msgSend(a1, sel_appSuggestions);
    sub_24547D17C(0, (unint64_t *)&qword_254413768);
    v9 = sub_24549A12C();

    v24 = MEMORY[0x24BEE4AF8];
    if (v9 >> 62)
      goto LABEL_17;
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v10; v10 = sub_24549A3FC())
    {
      v22 = v5;
      v26 = v7;
      v5 = 4;
      while (1)
      {
        v11 = (v9 & 0xC000000000000001) != 0 ? (id)MEMORY[0x249534988](v5 - 4, v9) : *(id *)(v9 + 8 * v5);
        v12 = v11;
        v7 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
          break;
        sub_245486778(v11);
        if (v1)
        {
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return (id)swift_bridgeObjectRelease();
        }

        MEMORY[0x249534724]();
        if (*(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_24549A150();
        sub_24549A168();
        sub_24549A144();
        ++v5;
        if (v7 == v10)
        {
          swift_bridgeObjectRelease();
          v18 = v24;
          v7 = v26;
          v5 = v22;
          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_17:
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    v18 = MEMORY[0x24BEE4AF8];
LABEL_19:
    swift_bridgeObjectRelease();
    v19 = sub_245487604(v18, (void (*)(void))type metadata accessor for AppSuggestions.AppSuggestion, &qword_254413750, (void (*)(id *, uint64_t))sub_245492DF4);
    swift_bridgeObjectRelease();
    v20 = (char *)objc_allocWithZone((Class)type metadata accessor for AppSuggestions());
    sub_2454862D8(v19);
    *(_QWORD *)&v20[OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions] = v19;

    v21 = (uint64_t *)&v20[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
    *v21 = v5;
    v21[1] = v7;
    v23.receiver = v20;
    v23.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
    return objc_msgSendSuper2(&v23, sel_init);
  }
  else
  {
    sub_24549A354();
    swift_getObjectType();
    v13 = sub_24549A588();
    v15 = v14;
    swift_bridgeObjectRelease();
    v24 = v13;
    v25 = v15;
    sub_24549A0E4();
    sub_24546A66C();
    swift_allocError();
    *(_QWORD *)v16 = v13;
    *(_QWORD *)(v16 + 8) = v15;
    *(_BYTE *)(v16 + 16) = 0;
    return (id)swift_willThrow();
  }
}

uint64_t sub_245486D5C(int a1)
{
  uint64_t result;
  uint64_t v3;
  const char *v4;

  result = 0;
  switch(a1)
  {
    case 0:
      sub_24546A66C();
      swift_allocError();
      *(_QWORD *)v3 = 0xD000000000000017;
      v4 = "unknown engagement type";
      goto LABEL_4;
    case 1:
      return result;
    case 2:
      result = 1;
      break;
    case 3:
      result = 2;
      break;
    case 4:
      result = 4;
      break;
    case 5:
      result = 3;
      break;
    case 6:
      result = 5;
      break;
    case 7:
      result = 6;
      break;
    default:
      sub_24546A66C();
      swift_allocError();
      *(_QWORD *)v3 = 0xD00000000000001ALL;
      v4 = "unexpected engagement type";
LABEL_4:
      *(_QWORD *)(v3 + 8) = (unint64_t)(v4 - 32) | 0x8000000000000000;
      *(_BYTE *)(v3 + 16) = 0;
      result = swift_willThrow();
      break;
  }
  return result;
}

id sub_245486E60(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id result;
  uint64_t v10;
  const char *v11;
  unint64_t v12;
  const char *v13;
  unint64_t v14;
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  NSObject *v28;
  os_log_type_t v29;
  const char *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  os_log_type_t v35;
  const char *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int8 v41;
  unsigned int v42;
  char v43;
  unsigned int v44;
  unint64_t v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v3 = objc_msgSend(a1, sel_identifier);
  if (!v3)
  {
    sub_24546A66C();
    swift_allocError();
    v11 = "BMMLSEShareSheetFeedback missing identifier";
    v12 = 0xD00000000000002BLL;
LABEL_5:
    v13 = v11 - 32;
LABEL_44:
    *(_QWORD *)v10 = v12;
    *(_QWORD *)(v10 + 8) = (unint64_t)v13 | 0x8000000000000000;
    *(_BYTE *)(v10 + 16) = 0;
    return (id)swift_willThrow();
  }
  v4 = v3;
  v5 = sub_24549A0B4();
  v7 = v6;

  v8 = sub_245486D5C((int)objc_msgSend(a1, sel_engagementType));
  if (v1)
    return (id)swift_bridgeObjectRelease();
  v14 = v8;
  v15 = objc_msgSend(a1, sel_engagementIdentifier);
  if (v15)
  {

    goto LABEL_10;
  }
  if (v14 <= 1)
  {
    swift_bridgeObjectRelease();
    sub_24546A66C();
    swift_allocError();
    v11 = "BMMLSEShareSheetFeedback missing engagement identifier";
    v12 = 0xD000000000000036;
    goto LABEL_5;
  }
LABEL_10:
  if ((objc_msgSend(a1, sel_hasVisiblePeopleSuggestionCount) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_24546A66C();
    swift_allocError();
    v36 = "BMMLSEShareSheetFeedback missing visiblePeopleSuggestionCount";
LABEL_43:
    v12 = 0xD00000000000003DLL;
    v13 = v36 - 32;
    goto LABEL_44;
  }
  if ((objc_msgSend(a1, sel_hasVisibleAppSuggestionCount) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_24546A66C();
    swift_allocError();
    v11 = "BMMLSEShareSheetFeedback missing visibleAppSuggestionCount";
    v12 = 0xD00000000000003ALL;
    goto LABEL_5;
  }
  if ((objc_msgSend(a1, sel_hasAirdropPeopleSuggestionShown) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_24546A66C();
    swift_allocError();
    v36 = "BMMLSEShareSheetFeedback missing airdropPeopleSuggestionShown";
    goto LABEL_43;
  }
  v16 = objc_msgSend(a1, sel_timeouts);
  sub_24547D17C(0, &qword_2544137E0);
  v17 = sub_24549A12C();

  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    v18 = sub_24549A3FC();
  }
  else
  {
    v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v68 = v7;
  v66 = v14;
  v67 = v5;
  if (v18)
  {
    if (v18 >= 1)
    {
      v19 = 0;
      v20 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v69 = v18;
      while (1)
      {
        if ((v17 & 0xC000000000000001) != 0)
          v21 = (id)MEMORY[0x249534988](v19, v17);
        else
          v21 = *(id *)(v17 + 8 * v19 + 32);
        v22 = v21;
        v23 = objc_msgSend(v21, sel_occurrence);
        if (v23 == 2)
        {
          v31 = 1;
          goto LABEL_33;
        }
        if (v23 == 1)
        {
          v31 = 0;
LABEL_33:

          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v20 = sub_245471C90(0, v20[2] + 1, 1, v20);
          v33 = v20[2];
          v32 = v20[3];
          if (v33 >= v32 >> 1)
            v20 = sub_245471C90((_QWORD *)(v32 > 1), v33 + 1, 1, v20);
          v20[2] = v33 + 1;
          v20[v33 + 4] = v31;
          goto LABEL_20;
        }
        if (v23)
        {
          if (qword_254413850 != -1)
            swift_once();
          v34 = sub_24549A078();
          __swift_project_value_buffer(v34, (uint64_t)qword_254413928);
          v25 = sub_24549A060();
          v35 = sub_24549A1E0();
          if (!os_log_type_enabled(v25, v35))
            goto LABEL_19;
          v27 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v27 = 0;
          v28 = v25;
          v29 = v35;
          v30 = "new timeout";
        }
        else
        {
          if (qword_254413850 != -1)
            swift_once();
          v24 = sub_24549A078();
          __swift_project_value_buffer(v24, (uint64_t)qword_254413928);
          v25 = sub_24549A060();
          v26 = sub_24549A1E0();
          if (!os_log_type_enabled(v25, v26))
            goto LABEL_19;
          v27 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v27 = 0;
          v28 = v25;
          v29 = v26;
          v30 = "unknown timeout";
        }
        _os_log_impl(&dword_245461000, v28, v29, v30, v27, 2u);
        MEMORY[0x2495350C0](v27, -1, -1);
LABEL_19:

        v18 = v69;
LABEL_20:
        if (v18 == ++v19)
          goto LABEL_48;
      }
    }
    __break(1u);
    goto LABEL_66;
  }
  v20 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_48:
  swift_bridgeObjectRelease_n();
  v37 = objc_msgSend(a1, sel_engagementIdentifier);
  if (v37)
  {
    v38 = v37;
    v70 = sub_24549A0B4();
    v40 = v39;

  }
  else
  {
    v70 = 0;
    v40 = 0;
  }
  v41 = objc_msgSend(a1, sel_airdropPeopleSuggestionShown);
  v42 = objc_msgSend(a1, sel_visiblePeopleSuggestionCount);
  if (v42 >= 0x100 || (v43 = v42, v44 = objc_msgSend(a1, sel_visibleAppSuggestionCount), v44 >= 0x100))
  {
LABEL_66:
    result = (id)sub_24549A3E4();
    __break(1u);
    return result;
  }
  v64 = v44;
  v45 = 0xD000000000000019;
  v46 = objc_msgSend(a1, sel_trialIdentifier);
  v71 = 0x800000024549EE00;
  v62 = v40;
  if (v46
    && (v47 = v46,
        v48 = objc_msgSend(v46, sel_trialExperimentId),
        v47,
        v48))
  {
    v63 = sub_24549A0B4();
    v71 = v49;

  }
  else
  {
    v63 = 0xD000000000000019;
  }
  v65 = v41;
  v50 = objc_msgSend(a1, sel_trialIdentifier);
  v51 = 0xD000000000000018;
  v52 = 0x800000024549EE20;
  if (v50)
  {
    v53 = v50;
    v54 = objc_msgSend(v50, sel_trialTreatmentId);

    if (v54)
    {
      v51 = sub_24549A0B4();
      v52 = v55;

    }
  }
  v56 = objc_msgSend(a1, sel_trialIdentifier);
  v57 = 0x800000024549EE40;
  if (v56)
  {
    v58 = v56;
    v59 = objc_msgSend(v56, sel_trialDeploymentId);

    if (v59)
    {
      v45 = sub_24549A0B4();
      v57 = v60;

    }
  }
  v61 = objc_allocWithZone((Class)type metadata accessor for PeopleSuggesterFeedbackEvent());
  return sub_24548273C(v67, v68, v66, v70, v62, v65, v43, v64, v63, v71, v51, v52, v45, v57, (uint64_t)v20);
}

uint64_t sub_245487604(unint64_t a1, void (*a2)(void), unint64_t *a3, void (*a4)(id *, uint64_t))
{
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void **v13;
  void *v14;
  id v15;
  uint64_t v16;

  v8 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24549A3FC();
    swift_bridgeObjectRelease();
  }
  a2();
  sub_24548B1F8(a3, (uint64_t (*)(void))a2, MEMORY[0x24BEE5BD8]);
  result = sub_24549A1A4();
  v16 = result;
  if (v8)
  {
    swift_bridgeObjectRetain();
    v10 = sub_24549A3FC();
    result = swift_bridgeObjectRelease();
    if (!v10)
      return v16;
  }
  else
  {
    v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v10)
      return v16;
  }
  if (v10 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v10; ++i)
      {
        v12 = MEMORY[0x249534988](i, a1);
        a4(&v15, v12);

      }
    }
    else
    {
      v13 = (void **)(a1 + 32);
      do
      {
        v14 = *v13++;
        a4(&v15, (uint64_t)v14);

        --v10;
      }
      while (v10);
    }
    return v16;
  }
  __break(1u);
  return result;
}

uint64_t sub_245487774(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  int64_t v17;
  char v18;
  char *v19;
  void *v20;
  char v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD **, _QWORD);
  id *v28;
  char v29;
  id v30;
  char isUniquelyReferenced_nonNull_native;
  char v32;
  unint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  char v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  char *v45;
  char v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t result;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;

  v51 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
    v2 = sub_24549A2DC();
  else
    v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v8 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (v8)
      goto LABEL_23;
LABEL_8:
    v9 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_39:
    swift_bridgeObjectRelease();
    v49 = sub_245485CC4((uint64_t)v9);
    swift_bridgeObjectRelease();
    sub_24547E298(v49);
    return swift_release();
  }
  v56 = MEMORY[0x24BEE4AF8];
  sub_245477EA0(0, v2 & ~(v2 >> 63), 0);
  if (v51)
  {
    v3 = sub_24549A294();
    v6 = 1;
  }
  else
  {
    v3 = sub_245486250(a1);
    v6 = v10 & 1;
  }
  v53 = v3;
  v54 = v4;
  v55 = v6;
  if (v2 < 0)
    goto LABEL_42;
  do
  {
    while (1)
    {
      v17 = v53;
      v16 = v54;
      v18 = v55;
      sub_245485FFC(v53, v54, v55, a1, v5, (void (*)(void *))type metadata accessor for PeopleSuggestions.PeopleSuggestion);
      v20 = v19;
      v21 = v19[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_rank];
      v22 = *(id *)&v19[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model];

      v23 = v56;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_245477EA0(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v56;
      }
      v25 = *(_QWORD *)(v23 + 16);
      v24 = *(_QWORD *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        sub_245477EA0(v24 > 1, v25 + 1, 1);
        v23 = v56;
      }
      *(_QWORD *)(v23 + 16) = v25 + 1;
      v26 = v23 + 16 * v25;
      *(_QWORD *)(v26 + 32) = v22;
      *(_BYTE *)(v26 + 40) = v21;
      if (v51)
        break;
      v11 = sub_245485EFC(v17, v16, v18, a1);
      v13 = v12;
      v15 = v14;
      sub_245489D60(v17, v16, v18);
      v53 = v11;
      v54 = v13;
      v55 = v15 & 1;
      if (!--v2)
        goto LABEL_22;
    }
    if ((v18 & 1) == 0)
      goto LABEL_43;
    if (sub_24549A2AC())
      swift_isUniquelyReferenced_nonNull_native();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257473CF0);
    v27 = (void (*)(_QWORD **, _QWORD))sub_24549A1B0();
    sub_24549A318();
    v27(&v52, 0);
    --v2;
  }
  while (v2);
LABEL_22:
  sub_245489D60(v53, v54, v55);
  v7 = v56;
  v8 = *(_QWORD *)(v56 + 16);
  if (!v8)
    goto LABEL_8;
LABEL_23:
  swift_bridgeObjectRetain();
  v28 = (id *)(v7 + 40);
  v9 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    v29 = *(_BYTE *)v28;
    v30 = *(v28 - 1);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v52 = v9;
    v33 = sub_245472894((uint64_t)v30);
    v34 = v9[2];
    v35 = (v32 & 1) == 0;
    v36 = v34 + v35;
    if (__OFADD__(v34, v35))
      break;
    v37 = v32;
    if (v9[3] >= v36)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        sub_245477508();
        v9 = v52;
      }
    }
    else
    {
      sub_24547537C(v36, isUniquelyReferenced_nonNull_native);
      v9 = v52;
      v38 = sub_245472894((uint64_t)v30);
      if ((v37 & 1) != (v39 & 1))
        goto LABEL_44;
      v33 = v38;
    }
    swift_bridgeObjectRelease();
    if ((v37 & 1) == 0)
    {
      v9[(v33 >> 6) + 8] |= 1 << v33;
      *(_QWORD *)(v9[6] + 8 * v33) = v30;
      *(_QWORD *)(v9[7] + 8 * v33) = MEMORY[0x24BEE4AF8];
      v40 = v9[2];
      v41 = __OFADD__(v40, 1);
      v42 = v40 + 1;
      if (v41)
        goto LABEL_41;
      v9[2] = v42;
      v43 = v30;
    }
    v44 = v9[7];
    v45 = *(char **)(v44 + 8 * v33);
    v46 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v44 + 8 * v33) = v45;
    if ((v46 & 1) == 0)
    {
      v45 = sub_245471B98(0, *((_QWORD *)v45 + 2) + 1, 1, v45);
      *(_QWORD *)(v44 + 8 * v33) = v45;
    }
    v48 = *((_QWORD *)v45 + 2);
    v47 = *((_QWORD *)v45 + 3);
    if (v48 >= v47 >> 1)
    {
      v45 = sub_245471B98((char *)(v47 > 1), v48 + 1, 1, v45);
      *(_QWORD *)(v44 + 8 * v33) = v45;
    }
    *((_QWORD *)v45 + 2) = v48 + 1;
    v45[v48 + 32] = v29;

    v28 += 2;
    if (!--v8)
    {
      swift_bridgeObjectRelease();
      goto LABEL_39;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  result = sub_24549A4E0();
  __break(1u);
  return result;
}

uint64_t sub_245487BEC(int a1)
{
  uint64_t result;

  result = 0;
  switch(a1)
  {
    case 1:
      result = 0;
      break;
    case 2:
      result = 1;
      break;
    case 4:
      result = 2;
      break;
    case 5:
      result = 3;
      break;
    case 6:
      result = 4;
      break;
    case 7:
      result = 5;
      break;
    case 8:
      result = 6;
      break;
    case 9:
      result = 7;
      break;
    case 10:
      result = 8;
      break;
    case 11:
      result = 9;
      break;
    case 12:
      result = 10;
      break;
    case 13:
      result = 11;
      break;
    case 14:
      result = 12;
      break;
    case 15:
      result = 13;
      break;
    case 16:
      result = 14;
      break;
    case 17:
      result = 15;
      break;
    case 18:
      result = 16;
      break;
    case 19:
      result = 17;
      break;
    case 21:
      result = 18;
      break;
    case 22:
      result = 19;
      break;
    case 24:
      result = 20;
      break;
    case 25:
      result = 21;
      break;
    case 26:
      result = 22;
      break;
    case 27:
      result = 23;
      break;
    case 28:
      result = 24;
      break;
    case 29:
      result = 25;
      break;
    default:
      return result;
  }
  return result;
}

void *sub_245487D54(void *a1, void *a2)
{
  uint64_t v4;
  char v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  objc_class *v14;
  id v15;
  char *v16;
  char *v17;
  uint64_t *v18;
  id v19;
  id v20;
  objc_class *v21;
  id v22;
  char *v23;
  char *v24;
  uint64_t *v25;
  id v26;
  objc_super v28;
  objc_super v29;

  v4 = sub_245487BEC((int)objc_msgSend(a1, sel_modelType));
  v6 = v5;
  v7 = objc_msgSend(a1, sel_otherModelTypeName);
  if (v7)
  {
    v8 = v7;
    v9 = sub_24549A0B4();
    v11 = v10;

    if ((v6 & 1) == 0)
    {
      if (v11)
      {
        swift_bridgeObjectRelease();
        sub_24546A66C();
        swift_allocError();
        *(_QWORD *)v12 = 0xD00000000000002DLL;
        v13 = "both modelType and otherModelTypeName are set";
LABEL_12:
        *(_QWORD *)(v12 + 8) = (unint64_t)(v13 - 32) | 0x8000000000000000;
        *(_BYTE *)(v12 + 16) = 0;
        swift_willThrow();
        return a2;
      }
      goto LABEL_7;
    }
    if (v11)
    {
      v21 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
      v22 = objc_allocWithZone(v21);
      v23 = (char *)objc_allocWithZone(v21);
      v24 = &v23[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
      *(_QWORD *)v24 = 0;
      v24[8] = 1;
      v25 = (uint64_t *)&v23[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
      *v25 = v9;
      v25[1] = v11;
      *(_QWORD *)&v23[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a2;
      v29.receiver = v23;
      v26 = a2;
      v20 = objc_msgSendSuper2(&v29, sel_init, v28.receiver, v28.super_class, v29.receiver, v21);
      goto LABEL_10;
    }
LABEL_11:
    sub_24546A66C();
    swift_allocError();
    *(_QWORD *)v12 = 0xD000000000000030;
    v13 = "neither modelType and otherModelTypeName are set";
    goto LABEL_12;
  }
  if ((v6 & 1) != 0)
    goto LABEL_11;
  v9 = 0;
LABEL_7:
  v14 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  v15 = objc_allocWithZone(v14);
  v16 = (char *)objc_allocWithZone(v14);
  v17 = &v16[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(_QWORD *)v17 = v4;
  v17[8] = 0;
  v18 = (uint64_t *)&v16[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *v18 = v9;
  v18[1] = 0;
  *(_QWORD *)&v16[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a2;
  v28.receiver = v16;
  v19 = a2;
  v20 = objc_msgSendSuper2(&v28, sel_init, v28.receiver, v14, v29.receiver, v29.super_class);
LABEL_10:
  a2 = v20;
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return a2;
}

id sub_245487F78(void *a1, void *a2)
{
  uint64_t v2;
  id v3;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  objc_class *v19;
  id v20;
  char *v21;
  char *v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  objc_super v29;
  uint64_t v30;
  id v31;

  v6 = objc_msgSend(a1, sel_modelIdentifier);
  if (!v6)
    goto LABEL_12;
  v7 = v6;
  v8 = sub_245487D54(v6, a2);
  if (v2)
  {
LABEL_3:

    return v3;
  }
  v3 = v8;
  if (!v8)
  {

LABEL_12:
    v14 = objc_msgSend(a1, sel_model);
    if (v14)
    {
      v15 = v14;
      v16 = sub_24549A0B4();
      v18 = v17;

      v19 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
      v20 = objc_allocWithZone(v19);
      v21 = (char *)objc_allocWithZone(v19);
      v22 = &v21[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
      *(_QWORD *)v22 = 0;
      v22[8] = 1;
      v23 = (uint64_t *)&v21[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
      *v23 = v16;
      v23[1] = v18;
      *(_QWORD *)&v21[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a2;
      v29.receiver = v21;
      v29.super_class = v19;
      v24 = a2;
      v3 = objc_msgSendSuper2(&v29, sel_init);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
    }
    else
    {
      sub_24549A354();
      swift_getObjectType();
      v25 = sub_24549A588();
      v3 = v26;
      swift_bridgeObjectRelease();
      v30 = v25;
      v31 = v3;
      sub_24549A0E4();
      sub_24546A66C();
      swift_allocError();
      *(_QWORD *)v27 = v25;
      *(_QWORD *)(v27 + 8) = v3;
      *(_BYTE *)(v27 + 16) = 0;
      swift_willThrow();
    }
    return v3;
  }
  v9 = objc_msgSend(a1, sel_model);
  if (!v9)
    goto LABEL_3;

  if (qword_254413850 != -1)
    swift_once();
  v10 = sub_24549A078();
  __swift_project_value_buffer(v10, (uint64_t)qword_254413928);
  v11 = sub_24549A060();
  v12 = sub_24549A1E0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_245461000, v11, v12, "both 'model' and 'modelIdentifier' set", v13, 2u);
    MEMORY[0x2495350C0](v13, -1, -1);
  }

  return v3;
}

void sub_245488228(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  _BYTE *v24;
  uint64_t *v25;
  uint64_t *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;
  uint64_t v35;
  uint64_t v36;

  v3 = objc_msgSend(a1, sel_identifier);
  if (!v3)
  {
    sub_24549A354();
    swift_getObjectType();
    v9 = sub_24549A588();
    v11 = v10;
    swift_bridgeObjectRelease();
    v36 = v11;
    sub_24549A0E4();
    sub_24546A66C();
    swift_allocError();
    *(_QWORD *)v12 = v9;
    *(_QWORD *)(v12 + 8) = v11;
    *(_BYTE *)(v12 + 16) = 0;
    swift_willThrow();
    return;
  }
  v4 = v3;
  v5 = sub_24549A0B4();
  v7 = v6;

  v8 = sub_245487F78(a1, 0);
  if (v1)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v13 = v8;
  v14 = objc_msgSend(a1, sel_transportBundleId);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    sub_24549A354();
    swift_getObjectType();
    v28 = sub_24549A588();
    v30 = v29;
    swift_bridgeObjectRelease();
    v35 = v28;
    v36 = v30;
LABEL_13:
    sub_24549A0E4();
    v32 = v36;
    sub_24546A66C();
    swift_allocError();
    *(_QWORD *)v33 = v35;
    *(_QWORD *)(v33 + 8) = v32;
    *(_BYTE *)(v33 + 16) = 0;
    swift_willThrow();

    return;
  }
  v15 = v14;
  v16 = sub_24549A0B4();
  v18 = v17;

  if ((objc_msgSend(a1, sel_hasRank) & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_getObjectType();
    v35 = sub_24549A588();
    v36 = v31;
    goto LABEL_13;
  }
  v19 = objc_msgSend(a1, sel_rank);
  v20 = objc_msgSend(a1, sel_hasScore);
  v21 = 0;
  if (v20)
  {
    objc_msgSend(a1, sel_score);
    v21 = v22;
  }
  if (v19 >= 0x100)
  {
    sub_24549A3E4();
    __break(1u);
  }
  else
  {
    v23 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion();
    v24 = objc_allocWithZone(v23);
    v25 = (uint64_t *)&v24[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_id];
    *v25 = v5;
    v25[1] = v7;
    *(_QWORD *)&v24[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_model] = v13;
    v26 = (uint64_t *)&v24[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_transportBundleId];
    *v26 = v16;
    v26[1] = v18;
    v24[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_rank] = v19;
    v27 = &v24[OBJC_IVAR____PSPeopleSuggestionsMetricsItemInternal_score];
    *(_QWORD *)v27 = v21;
    v27[8] = v20 ^ 1;
    v34.receiver = v24;
    v34.super_class = v23;
    objc_msgSendSuper2(&v34, sel_init);
  }
}

id sub_24548859C(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t *v25;
  uint64_t v26;
  unint64_t v27;
  objc_super v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = objc_msgSend(a1, sel_identifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_24549A0B4();
    v7 = v6;

    v8 = 0;
    switch(objc_msgSend(a1, sel_responseType))
    {
      case 0u:
        sub_24546A66C();
        swift_allocError();
        *(_QWORD *)v9 = 0xD000000000000017;
        v10 = "\"unknown\" response type";
        goto LABEL_6;
      case 1u:
        goto LABEL_9;
      case 2u:
        v8 = 1;
        goto LABEL_9;
      case 3u:
        v8 = 2;
LABEL_9:
        v16 = objc_msgSend(a1, sel_peopleSuggestions);
        sub_24547D17C(0, &qword_254413818);
        v17 = sub_24549A12C();

        v29 = MEMORY[0x24BEE4AF8];
        if (v17 >> 62)
          goto LABEL_24;
        v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v18)
          goto LABEL_25;
        break;
      default:
        sub_24546A66C();
        swift_allocError();
        *(_QWORD *)v9 = 0xD000000000000011;
        v10 = "new response type";
LABEL_6:
        *(_QWORD *)(v9 + 8) = (unint64_t)(v10 - 32) | 0x8000000000000000;
        *(_BYTE *)(v9 + 16) = 0;
        swift_willThrow();
        return (id)swift_bridgeObjectRelease();
    }
LABEL_11:
    v26 = v8;
    v27 = v5;
    v31 = v7;
    v5 = v17 & 0xC000000000000001;
    v7 = 4;
    while (1)
    {
      v8 = v7 - 4;
      if (v5)
        v19 = (id)MEMORY[0x249534988](v7 - 4, v17);
      else
        v19 = *(id *)(v17 + 8 * v7);
      v20 = v19;
      v21 = v7 - 3;
      if (__OFADD__(v8, 1))
      {
        __break(1u);
LABEL_24:
        swift_bridgeObjectRetain();
        v18 = sub_24549A3FC();
        if (!v18)
        {
LABEL_25:
          swift_bridgeObjectRelease();
          v22 = MEMORY[0x24BEE4AF8];
          goto LABEL_26;
        }
        goto LABEL_11;
      }
      sub_245488228(v19);
      if (v1)
        break;

      MEMORY[0x249534724]();
      if (*(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_24549A150();
      sub_24549A168();
      sub_24549A144();
      ++v7;
      if (v21 == v18)
      {
        swift_bridgeObjectRelease();
        v22 = v29;
        v7 = v31;
        v8 = v26;
        v5 = v27;
LABEL_26:
        swift_bridgeObjectRelease();
        v23 = sub_245487604(v22, (void (*)(void))type metadata accessor for PeopleSuggestions.PeopleSuggestion, &qword_254413848, (void (*)(id *, uint64_t))sub_245492FB4);
        swift_bridgeObjectRelease();
        v24 = (char *)objc_allocWithZone((Class)type metadata accessor for PeopleSuggestions());
        sub_245487774(v23);
        *(_QWORD *)&v24[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_responseType] = v8;
        *(_QWORD *)&v24[OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions] = v23;

        v25 = (unint64_t *)&v24[OBJC_IVAR____TtC15ReportingPlugin25PeopleSuggestionInference_id];
        *v25 = v5;
        v25[1] = v7;
        v28.receiver = v24;
        v28.super_class = (Class)type metadata accessor for PeopleSuggestionInference();
        return objc_msgSendSuper2(&v28, sel_init);
      }
    }
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    sub_24549A354();
    swift_getObjectType();
    v11 = sub_24549A588();
    v13 = v12;
    swift_bridgeObjectRelease();
    v29 = v11;
    v30 = v13;
    sub_24549A0E4();
    sub_24546A66C();
    swift_allocError();
    *(_QWORD *)v14 = v11;
    *(_QWORD *)(v14 + 8) = v13;
    *(_BYTE *)(v14 + 16) = 0;
    return (id)swift_willThrow();
  }
}

void _s15ReportingPlugin29PeopleSuggesterMetricsManagerC6record9inferenceyAA0C19SuggestionInferenceC_tFZ_0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  id v40;
  uint64_t v41;

  type metadata accessor for PeopleSuggestions();
  v2 = swift_dynamicCastClass();
  if (!v2)
  {
    type metadata accessor for AppSuggestions();
    v13 = swift_dynamicCastClass();
    if (!v13)
    {
      if (qword_254413850 != -1)
        swift_once();
      v31 = sub_24549A078();
      __swift_project_value_buffer(v31, (uint64_t)qword_254413928);
      v40 = a1;
      v25 = sub_24549A060();
      v32 = sub_24549A1D4();
      if (os_log_type_enabled(v25, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        v34 = swift_slowAlloc();
        v41 = v34;
        *(_DWORD *)v33 = 136315138;
        swift_getObjectType();
        v35 = sub_24549A588();
        sub_2454720F4(v35, v36, &v41);
        sub_24549A258();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_245461000, v25, v32, "unexpected inference type: %s", v33, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2495350C0](v34, -1, -1);
        MEMORY[0x2495350C0](v33, -1, -1);
LABEL_25:

        return;
      }

LABEL_28:
      goto LABEL_29;
    }
    v14 = v13;
    v15 = *(_QWORD *)(v13 + OBJC_IVAR____PSAppSuggestionsMetricsInferenceEventInternal_suggestions);
    if ((v15 & 0xC000000000000001) != 0)
    {
      v16 = a1;
      swift_bridgeObjectRetain();
      v17 = sub_24549A2DC();
      swift_bridgeObjectRelease();
      if (v17)
      {
LABEL_8:
        v18 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
        swift_unknownObjectRelease();
        v19 = objc_msgSend(v18, sel_ShareSheet);
        swift_unknownObjectRelease();
        v20 = objc_msgSend(v19, sel_Inference);
        swift_unknownObjectRelease();
        v21 = objc_msgSend(v20, sel_AppSuggestions);
        swift_unknownObjectRelease();
        v11 = objc_msgSend(v21, sel_source);

        sub_24547EAEC();
        goto LABEL_9;
      }
    }
    else
    {
      v37 = *(_QWORD *)(v15 + 16);
      v38 = a1;
      if (v37)
        goto LABEL_8;
    }
    if (qword_254413850 != -1)
      swift_once();
    v39 = sub_24549A078();
    __swift_project_value_buffer(v39, (uint64_t)qword_254413928);
    v40 = a1;
    v25 = sub_24549A060();
    v26 = sub_24549A1E0();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v27 = 138412290;
      v41 = v14;
      v29 = v40;
      sub_24549A258();
      *v28 = v14;

      v30 = "Ignoring empty app suggestions event %@";
      goto LABEL_24;
    }
    goto LABEL_26;
  }
  v3 = v2;
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____PSPeopleSuggestionsMetricsInferenceEventInternal_suggestions);
  if ((v4 & 0xC000000000000001) == 0)
  {
    v22 = *(_QWORD *)(v4 + 16);
    v23 = a1;
    if (v22)
      goto LABEL_4;
LABEL_11:
    if (qword_254413850 != -1)
      swift_once();
    v24 = sub_24549A078();
    __swift_project_value_buffer(v24, (uint64_t)qword_254413928);
    v40 = a1;
    v25 = sub_24549A060();
    v26 = sub_24549A1E0();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v27 = 138412290;
      v41 = v3;
      v29 = v40;
      sub_24549A258();
      *v28 = v3;

      v30 = "Ignoring empty people suggestions event %@";
LABEL_24:
      _os_log_impl(&dword_245461000, v25, v26, v30, v27, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254413840);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v28, -1, -1);
      MEMORY[0x2495350C0](v27, -1, -1);

      goto LABEL_25;
    }
LABEL_26:

    goto LABEL_28;
  }
  v5 = a1;
  swift_bridgeObjectRetain();
  v6 = sub_24549A2DC();
  swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_11;
LABEL_4:
  v7 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v8 = objc_msgSend(v7, sel_ShareSheet);
  swift_unknownObjectRelease();
  v9 = objc_msgSend(v8, sel_Inference);
  swift_unknownObjectRelease();
  v10 = objc_msgSend(v9, sel_PeopleSuggestions);
  swift_unknownObjectRelease();
  v11 = objc_msgSend(v10, sel_source);

  v12 = sub_24547E688();
LABEL_9:
  v40 = (id)v12;
  objc_msgSend(v11, sel_sendEvent_, v12);

LABEL_29:
}

void _s15ReportingPlugin29PeopleSuggesterMetricsManagerC6record8feedbackyAA0cD13FeedbackEventC_tFZ_0()
{
  id v0;
  id v1;
  id v2;
  id v3;
  id v4;

  v0 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v1 = objc_msgSend(v0, sel_ShareSheet);
  swift_unknownObjectRelease();
  v2 = objc_msgSend(v1, sel_Feedback);
  swift_unknownObjectRelease();
  v3 = objc_msgSend(v2, sel_source);

  v4 = sub_24547EEE8();
  objc_msgSend(v3, sel_sendEvent_, v4);

}

uint64_t type metadata accessor for PeopleSuggesterMetricsManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PeopleSuggestionInference()
{
  return objc_opt_self();
}

unint64_t sub_24548917C(unint64_t result)
{
  if (result > 0x19)
    return 0;
  return result;
}

uint64_t type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model()
{
  return objc_opt_self();
}

uint64_t sub_2454891AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254413788);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2454891F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254413788);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for TrialIdentifier()
{
  return objc_opt_self();
}

unint64_t sub_245489254()
{
  unint64_t result;

  result = qword_257473B90;
  if (!qword_257473B90)
  {
    result = MEMORY[0x249535018](&unk_24549CB9C, &type metadata for PeopleSuggestions.PeopleSuggestion.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473B90);
  }
  return result;
}

unint64_t sub_245489298()
{
  unint64_t result;

  result = qword_257473B98;
  if (!qword_257473B98)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggestions.PeopleSuggestion.ModelType, &type metadata for PeopleSuggestions.PeopleSuggestion.ModelType);
    atomic_store(result, (unint64_t *)&qword_257473B98);
  }
  return result;
}

uint64_t type metadata accessor for PeopleSuggestions.PeopleSuggestion()
{
  return objc_opt_self();
}

unint64_t sub_2454892FC()
{
  unint64_t result;

  result = qword_257473BB0;
  if (!qword_257473BB0)
  {
    result = MEMORY[0x249535018](&unk_24549CB4C, &type metadata for PeopleSuggestions.PeopleSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473BB0);
  }
  return result;
}

uint64_t type metadata accessor for PeopleSuggestions()
{
  return objc_opt_self();
}

unint64_t sub_245489360()
{
  unint64_t result;

  result = qword_257473BC8;
  if (!qword_257473BC8)
  {
    result = MEMORY[0x249535018](&unk_24549CAFC, &type metadata for PeopleSuggestions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473BC8);
  }
  return result;
}

unint64_t sub_2454893A4()
{
  unint64_t result;

  result = qword_257473BD0;
  if (!qword_257473BD0)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggestions.ResponseType, &type metadata for PeopleSuggestions.ResponseType);
    atomic_store(result, (unint64_t *)&qword_257473BD0);
  }
  return result;
}

unint64_t sub_2454893E8()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_257473BE0;
  if (!qword_257473BE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257473BD8);
    v2 = sub_24548B1F8(&qword_257473BE8, type metadata accessor for PeopleSuggestions.PeopleSuggestion, (uint64_t)&protocol conformance descriptor for PeopleSuggestions.PeopleSuggestion);
    result = MEMORY[0x249535018](MEMORY[0x24BEE1700], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257473BE0);
  }
  return result;
}

uint64_t type metadata accessor for AppSuggestions.AppSuggestion()
{
  return objc_opt_self();
}

unint64_t sub_245489484()
{
  unint64_t result;

  result = qword_257473C18;
  if (!qword_257473C18)
  {
    result = MEMORY[0x249535018](&unk_24549CAAC, &type metadata for AppSuggestions.AppSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473C18);
  }
  return result;
}

uint64_t type metadata accessor for AppSuggestions()
{
  return objc_opt_self();
}

unint64_t sub_2454894E8()
{
  unint64_t result;

  result = qword_257473C28;
  if (!qword_257473C28)
  {
    result = MEMORY[0x249535018](&unk_24549CA5C, &type metadata for AppSuggestions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473C28);
  }
  return result;
}

unint64_t sub_24548952C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_257473C38;
  if (!qword_257473C38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257473C30);
    v2 = sub_24548B1F8(&qword_257473C40, type metadata accessor for AppSuggestions.AppSuggestion, (uint64_t)&protocol conformance descriptor for AppSuggestions.AppSuggestion);
    result = MEMORY[0x249535018](MEMORY[0x24BEE1700], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257473C38);
  }
  return result;
}

uint64_t sub_2454895A8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7079546C65646F6DLL && a2 == 0xE900000000000065;
  if (v3 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000018 && a2 == 0x800000024549E9C0 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6564496C61697274 && a2 == 0xEF7265696669746ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_24548970C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024549E8E0 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 1802396018 && a2 == 0xE400000000000000 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x65726F6373 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_2454898D0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x65736E6F70736572 && a2 == 0xEC00000065707954;
  if (v3 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6974736567677573 && a2 == 0xEB00000000736E6FLL)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2454899D8(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000011 && a2 == 0x800000024549E8E0 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C65646F6DLL && a2 == 0xE500000000000000 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1802396018 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_245489B08(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6974736567677573 && a2 == 0xEB00000000736E6FLL)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_245489B9C()
{
  return 0x6974736567677573;
}

unint64_t sub_245489BBC(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for PeopleSuggesterFeedbackEvent()
{
  return objc_opt_self();
}

unint64_t sub_245489BEC()
{
  unint64_t result;

  result = qword_257473C98;
  if (!qword_257473C98)
  {
    result = MEMORY[0x249535018](&unk_24549CA0C, &type metadata for PeopleSuggesterFeedbackEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473C98);
  }
  return result;
}

unint64_t sub_245489C30()
{
  unint64_t result;

  result = qword_257473CA0;
  if (!qword_257473CA0)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggesterFeedbackEvent.EngagementType, &type metadata for PeopleSuggesterFeedbackEvent.EngagementType);
    atomic_store(result, (unint64_t *)&qword_257473CA0);
  }
  return result;
}

unint64_t sub_245489C74()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_257473CB8;
  if (!qword_257473CB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257473CB0);
    v2 = sub_245489CD8();
    result = MEMORY[0x249535018](MEMORY[0x24BEE12A0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257473CB8);
  }
  return result;
}

unint64_t sub_245489CD8()
{
  unint64_t result;

  result = qword_257473CC0;
  if (!qword_257473CC0)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggesterFeedbackEvent.Timeout, &type metadata for PeopleSuggesterFeedbackEvent.Timeout);
    atomic_store(result, (unint64_t *)&qword_257473CC0);
  }
  return result;
}

unint64_t sub_245489D1C()
{
  unint64_t result;

  result = qword_257473CE8;
  if (!qword_257473CE8)
  {
    result = MEMORY[0x249535018](&unk_24549C9BC, &type metadata for TrialIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473CE8);
  }
  return result;
}

uint64_t sub_245489D60(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_245489D6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254413830;
  if (!qword_254413830)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254413828);
    result = MEMORY[0x249535018](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_254413830);
  }
  return result;
}

uint64_t sub_245489DB8()
{
  return sub_24548B1F8(&qword_257473D10, type metadata accessor for PeopleSuggesterFeedbackEvent, (uint64_t)&protocol conformance descriptor for PeopleSuggesterFeedbackEvent);
}

uint64_t sub_245489DE4()
{
  return sub_24548B1F8(&qword_257473D18, type metadata accessor for PeopleSuggestionInference, (uint64_t)&protocol conformance descriptor for PeopleSuggestionInference);
}

uint64_t sub_245489E10(uint64_t a1)
{
  uint64_t result;

  result = sub_24548B1F8(&qword_257473D58, type metadata accessor for PeopleSuggestionInference, (uint64_t)&protocol conformance descriptor for PeopleSuggestionInference);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_245489E4C()
{
  return MEMORY[0x24BEE0D10];
}

unint64_t sub_245489E5C()
{
  unint64_t result;

  result = qword_257473D60;
  if (!qword_257473D60)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggestions.ResponseType, &type metadata for PeopleSuggestions.ResponseType);
    atomic_store(result, (unint64_t *)&qword_257473D60);
  }
  return result;
}

unint64_t sub_245489EA4()
{
  unint64_t result;

  result = qword_257473D68;
  if (!qword_257473D68)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggestions.PeopleSuggestion.ModelType, &type metadata for PeopleSuggestions.PeopleSuggestion.ModelType);
    atomic_store(result, (unint64_t *)&qword_257473D68);
  }
  return result;
}

unint64_t sub_245489EEC()
{
  unint64_t result;

  result = qword_257473D70;
  if (!qword_257473D70)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggesterFeedbackEvent.EngagementType, &type metadata for PeopleSuggesterFeedbackEvent.EngagementType);
    atomic_store(result, (unint64_t *)&qword_257473D70);
  }
  return result;
}

unint64_t sub_245489F34()
{
  unint64_t result;

  result = qword_257473D78;
  if (!qword_257473D78)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggesterFeedbackEvent.Timeout, &type metadata for PeopleSuggesterFeedbackEvent.Timeout);
    atomic_store(result, (unint64_t *)&qword_257473D78);
  }
  return result;
}

uint64_t sub_245489F78(uint64_t a1)
{
  uint64_t result;

  result = sub_24548B1F8(&qword_257473D80, type metadata accessor for PeopleSuggesterFeedbackEvent, (uint64_t)&protocol conformance descriptor for PeopleSuggesterFeedbackEvent);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t method lookup function for PeopleSuggestionInference()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PeopleSuggestionInference.__allocating_init(id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t method lookup function for PeopleSuggestions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PeopleSuggestions.__allocating_init(id:responseType:suggestions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PeopleSuggestions.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

ValueMetadata *type metadata accessor for PeopleSuggestions.ResponseType()
{
  return &type metadata for PeopleSuggestions.ResponseType;
}

uint64_t method lookup function for PeopleSuggestions.PeopleSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PeopleSuggestions.PeopleSuggestion.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

ValueMetadata *type metadata accessor for PeopleSuggestions.PeopleSuggestion.ModelType()
{
  return &type metadata for PeopleSuggestions.PeopleSuggestion.ModelType;
}

uint64_t method lookup function for PeopleSuggestions.PeopleSuggestion.Model()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for AppSuggestions()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppSuggestions.__allocating_init(id:suggestions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t method lookup function for AppSuggestions.AppSuggestion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppSuggestions.AppSuggestion.__allocating_init(transportBundleId:model:rank:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AppSuggestions.AppSuggestion.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t method lookup function for PeopleSuggesterFeedbackEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PeopleSuggesterFeedbackEvent.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

ValueMetadata *type metadata accessor for PeopleSuggesterFeedbackEvent.EngagementType()
{
  return &type metadata for PeopleSuggesterFeedbackEvent.EngagementType;
}

ValueMetadata *type metadata accessor for PeopleSuggesterFeedbackEvent.Timeout()
{
  return &type metadata for PeopleSuggesterFeedbackEvent.Timeout;
}

uint64_t method lookup function for TrialIdentifier()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TrialIdentifier.__allocating_init(experiment:treatment:deployment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

ValueMetadata *type metadata accessor for TrialIdentifier.CodingKeys()
{
  return &type metadata for TrialIdentifier.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterFeedbackEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggesterFeedbackEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_24548A220 + 4 * byte_24549BD83[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_24548A254 + 4 * byte_24549BD7E[v4]))();
}

uint64_t sub_24548A254(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24548A25C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24548A264);
  return result;
}

uint64_t sub_24548A270(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24548A278);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_24548A27C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24548A284(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggesterFeedbackEvent.CodingKeys()
{
  return &type metadata for PeopleSuggesterFeedbackEvent.CodingKeys;
}

uint64_t getEnumTagSinglePayload for AppSuggestions.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppSuggestions.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24548A334 + 4 * byte_24549BD88[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24548A354 + 4 * byte_24549BD8D[v4]))();
}

_BYTE *sub_24548A334(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24548A354(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24548A35C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24548A364(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24548A36C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24548A374(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_24548A380()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppSuggestions.CodingKeys()
{
  return &type metadata for AppSuggestions.CodingKeys;
}

ValueMetadata *type metadata accessor for AppSuggestions.AppSuggestion.CodingKeys()
{
  return &type metadata for AppSuggestions.AppSuggestion.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for PeopleSuggestions.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24548A3F4 + 4 * byte_24549BD97[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24548A428 + 4 * byte_24549BD92[v4]))();
}

uint64_t sub_24548A428(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24548A430(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24548A438);
  return result;
}

uint64_t sub_24548A444(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24548A44CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24548A450(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24548A458(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggestions.CodingKeys()
{
  return &type metadata for PeopleSuggestions.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PeopleSuggestions.PeopleSuggestion.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PeopleSuggestions.PeopleSuggestion.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24548A550 + 4 * byte_24549BDA1[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24548A584 + 4 * byte_24549BD9C[v4]))();
}

uint64_t sub_24548A584(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24548A58C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24548A594);
  return result;
}

uint64_t sub_24548A5A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24548A5A8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24548A5AC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24548A5B4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggestions.PeopleSuggestion.CodingKeys()
{
  return &type metadata for PeopleSuggestions.PeopleSuggestion.CodingKeys;
}

uint64_t _s15ReportingPlugin15TrialIdentifierC10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s15ReportingPlugin15TrialIdentifierC10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24548A6AC + 4 * byte_24549BDAB[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24548A6E0 + 4 * byte_24549BDA6[v4]))();
}

uint64_t sub_24548A6E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24548A6E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24548A6F0);
  return result;
}

uint64_t sub_24548A6FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24548A704);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24548A708(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24548A710(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model.CodingKeys()
{
  return &type metadata for PeopleSuggestions.PeopleSuggestion.Model.CodingKeys;
}

unint64_t sub_24548A730()
{
  unint64_t result;

  result = qword_257473DB0;
  if (!qword_257473DB0)
  {
    result = MEMORY[0x249535018](&unk_24549C544, &type metadata for PeopleSuggestions.PeopleSuggestion.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473DB0);
  }
  return result;
}

unint64_t sub_24548A778()
{
  unint64_t result;

  result = qword_257473DB8;
  if (!qword_257473DB8)
  {
    result = MEMORY[0x249535018](&unk_24549C5FC, &type metadata for PeopleSuggestions.PeopleSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473DB8);
  }
  return result;
}

unint64_t sub_24548A7C0()
{
  unint64_t result;

  result = qword_257473DC0;
  if (!qword_257473DC0)
  {
    result = MEMORY[0x249535018](&unk_24549C6B4, &type metadata for PeopleSuggestions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473DC0);
  }
  return result;
}

unint64_t sub_24548A808()
{
  unint64_t result;

  result = qword_257473DC8;
  if (!qword_257473DC8)
  {
    result = MEMORY[0x249535018](&unk_24549C76C, &type metadata for AppSuggestions.AppSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473DC8);
  }
  return result;
}

unint64_t sub_24548A850()
{
  unint64_t result;

  result = qword_257473DD0;
  if (!qword_257473DD0)
  {
    result = MEMORY[0x249535018](&unk_24549C824, &type metadata for AppSuggestions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473DD0);
  }
  return result;
}

unint64_t sub_24548A898()
{
  unint64_t result;

  result = qword_257473DD8;
  if (!qword_257473DD8)
  {
    result = MEMORY[0x249535018](&unk_24549C8DC, &type metadata for PeopleSuggesterFeedbackEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473DD8);
  }
  return result;
}

unint64_t sub_24548A8E0()
{
  unint64_t result;

  result = qword_257473DE0;
  if (!qword_257473DE0)
  {
    result = MEMORY[0x249535018](&unk_24549C994, &type metadata for TrialIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473DE0);
  }
  return result;
}

unint64_t sub_24548A928()
{
  unint64_t result;

  result = qword_257473DE8;
  if (!qword_257473DE8)
  {
    result = MEMORY[0x249535018](&unk_24549C904, &type metadata for TrialIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473DE8);
  }
  return result;
}

unint64_t sub_24548A970()
{
  unint64_t result;

  result = qword_257473DF0;
  if (!qword_257473DF0)
  {
    result = MEMORY[0x249535018](&unk_24549C92C, &type metadata for TrialIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473DF0);
  }
  return result;
}

unint64_t sub_24548A9B8()
{
  unint64_t result;

  result = qword_257473DF8;
  if (!qword_257473DF8)
  {
    result = MEMORY[0x249535018](&unk_24549C84C, &type metadata for PeopleSuggesterFeedbackEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473DF8);
  }
  return result;
}

unint64_t sub_24548AA00()
{
  unint64_t result;

  result = qword_257473E00;
  if (!qword_257473E00)
  {
    result = MEMORY[0x249535018](&unk_24549C874, &type metadata for PeopleSuggesterFeedbackEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E00);
  }
  return result;
}

unint64_t sub_24548AA48()
{
  unint64_t result;

  result = qword_257473E08;
  if (!qword_257473E08)
  {
    result = MEMORY[0x249535018](&unk_24549C794, &type metadata for AppSuggestions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E08);
  }
  return result;
}

unint64_t sub_24548AA90()
{
  unint64_t result;

  result = qword_257473E10;
  if (!qword_257473E10)
  {
    result = MEMORY[0x249535018](&unk_24549C7BC, &type metadata for AppSuggestions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E10);
  }
  return result;
}

unint64_t sub_24548AAD8()
{
  unint64_t result;

  result = qword_257473E18;
  if (!qword_257473E18)
  {
    result = MEMORY[0x249535018](&unk_24549C6DC, &type metadata for AppSuggestions.AppSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E18);
  }
  return result;
}

unint64_t sub_24548AB20()
{
  unint64_t result;

  result = qword_257473E20;
  if (!qword_257473E20)
  {
    result = MEMORY[0x249535018](&unk_24549C704, &type metadata for AppSuggestions.AppSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E20);
  }
  return result;
}

unint64_t sub_24548AB68()
{
  unint64_t result;

  result = qword_257473E28;
  if (!qword_257473E28)
  {
    result = MEMORY[0x249535018](&unk_24549C624, &type metadata for PeopleSuggestions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E28);
  }
  return result;
}

unint64_t sub_24548ABB0()
{
  unint64_t result;

  result = qword_257473E30;
  if (!qword_257473E30)
  {
    result = MEMORY[0x249535018](&unk_24549C64C, &type metadata for PeopleSuggestions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E30);
  }
  return result;
}

unint64_t sub_24548ABF8()
{
  unint64_t result;

  result = qword_257473E38;
  if (!qword_257473E38)
  {
    result = MEMORY[0x249535018](&unk_24549C56C, &type metadata for PeopleSuggestions.PeopleSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E38);
  }
  return result;
}

unint64_t sub_24548AC40()
{
  unint64_t result;

  result = qword_257473E40;
  if (!qword_257473E40)
  {
    result = MEMORY[0x249535018](&unk_24549C594, &type metadata for PeopleSuggestions.PeopleSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E40);
  }
  return result;
}

unint64_t sub_24548AC88()
{
  unint64_t result;

  result = qword_257473E48;
  if (!qword_257473E48)
  {
    result = MEMORY[0x249535018](&unk_24549C4B4, &type metadata for PeopleSuggestions.PeopleSuggestion.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E48);
  }
  return result;
}

unint64_t sub_24548ACD0()
{
  unint64_t result;

  result = qword_257473E50;
  if (!qword_257473E50)
  {
    result = MEMORY[0x249535018](&unk_24549C4DC, &type metadata for PeopleSuggestions.PeopleSuggestion.Model.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E50);
  }
  return result;
}

uint64_t sub_24548AD14(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701869940 && a2 == 0xE400000000000000 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024549EAE0 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024549EB00 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x800000024549EB20 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x800000024549EB40 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024549D8A0 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x800000024549D8C0 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024549D880 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x7374756F656D6974 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    v6 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 9;
    else
      return 10;
  }
}

uint64_t sub_24548B09C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656D697265707865 && a2 == 0xEA0000000000746ELL;
  if (v3 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E656D7461657274 && a2 == 0xE900000000000074 || (sub_24549A4A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656D796F6C706564 && a2 == 0xEA0000000000746ELL)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_24549A4A4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_24548B1F8(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2();
    result = MEMORY[0x249535018](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24548B234()
{
  unint64_t result;

  result = qword_257473E58;
  if (!qword_257473E58)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggesterFeedbackEvent.Timeout, &type metadata for PeopleSuggesterFeedbackEvent.Timeout);
    atomic_store(result, (unint64_t *)&qword_257473E58);
  }
  return result;
}

unint64_t sub_24548B278()
{
  unint64_t result;

  result = qword_257473E60;
  if (!qword_257473E60)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggesterFeedbackEvent.EngagementType, &type metadata for PeopleSuggesterFeedbackEvent.EngagementType);
    atomic_store(result, (unint64_t *)&qword_257473E60);
  }
  return result;
}

unint64_t sub_24548B2BC()
{
  unint64_t result;

  result = qword_257473E68;
  if (!qword_257473E68)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggestions.PeopleSuggestion.ModelType, &type metadata for PeopleSuggestions.PeopleSuggestion.ModelType);
    atomic_store(result, (unint64_t *)&qword_257473E68);
  }
  return result;
}

unint64_t sub_24548B300()
{
  unint64_t result;

  result = qword_257473E70;
  if (!qword_257473E70)
  {
    result = MEMORY[0x249535018](&protocol conformance descriptor for PeopleSuggestions.ResponseType, &type metadata for PeopleSuggestions.ResponseType);
    atomic_store(result, (unint64_t *)&qword_257473E70);
  }
  return result;
}

uint64_t dispatch thunk of PeopleSuggestions.PeopleSuggestion.Model.encode(to:)()
{
  return dispatch thunk of AppSuggestions.AppSuggestion.encode(to:)();
}

uint64_t dispatch thunk of AppSuggestions.encode(to:)()
{
  return dispatch thunk of AppSuggestions.AppSuggestion.encode(to:)();
}

uint64_t dispatch thunk of TrialIdentifier.encode(to:)()
{
  return dispatch thunk of AppSuggestions.AppSuggestion.encode(to:)();
}

void sub_24548B3AC(uint64_t a1, _QWORD **a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  unint64_t v16;
  int64_t v17;
  id v18;
  int64_t v19;
  id v20;

  v7 = a1 + 64;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a1 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  swift_bridgeObjectRetain();
  v12 = 0;
  if (!v10)
    goto LABEL_5;
LABEL_4:
  v13 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    v20 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * i);
    v18 = v20;
    sub_24548E2B0(&v20, a2, a3);
    if (v3)
    {
      swift_release();

      return;
    }

    if (v10)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v12++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v12 >= v11)
      goto LABEL_26;
    v16 = *(_QWORD *)(v7 + 8 * v12);
    if (!v16)
    {
      v17 = v12 + 1;
      if (v12 + 1 >= v11)
        goto LABEL_26;
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (v16)
        goto LABEL_14;
      v17 = v12 + 2;
      if (v12 + 2 >= v11)
        goto LABEL_26;
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (v16)
        goto LABEL_14;
      v17 = v12 + 3;
      if (v12 + 3 >= v11)
        goto LABEL_26;
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (v16)
      {
LABEL_14:
        v12 = v17;
        goto LABEL_15;
      }
      v19 = v12 + 4;
      if (v12 + 4 >= v11)
      {
LABEL_26:
        swift_release();
        return;
      }
      v16 = *(_QWORD *)(v7 + 8 * v19);
      v12 += 4;
      if (!v16)
        break;
    }
LABEL_15:
    v10 = (v16 - 1) & v16;
  }
  while (1)
  {
    v12 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v12 >= v11)
      goto LABEL_26;
    v16 = *(_QWORD *)(v7 + 8 * v12);
    ++v19;
    if (v16)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
}

void sub_24548B54C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void (*v6)(_QWORD *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t *v11;
  char v12;
  char v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23[3];
  _QWORD v24[2];

  v1 = v0;
  swift_unknownObjectRetain();
  objc_opt_self();
  v2 = (void *)swift_dynamicCastObjCClass();
  if (v2 && (v3 = (uint64_t)v2, (v4 = objc_msgSend(v2, sel_eventBody)) != 0))
  {
    v5 = v4;
    v6 = *(void (**)(_QWORD *__return_ptr, void *))(v0 + 56);
    swift_retain();
    v6(v24, v5);
    swift_release();
    swift_beginAccess();
    v7 = *(_QWORD *)(v0 + 16);
    v9 = v24[0];
    v8 = v24[1];
    swift_bridgeObjectRetain();
    v10 = sub_24548BBFC(v9, v8, v7);
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      v11 = (uint64_t *)(v1 + 32);
      swift_beginAccess();
      if (!*(_QWORD *)(*(_QWORD *)(v1 + 32) + 16)
        || (swift_bridgeObjectRetain(),
            swift_bridgeObjectRetain(),
            sub_245472734(v9, v8),
            v13 = v12,
            swift_bridgeObjectRelease(),
            swift_bridgeObjectRelease(),
            (v13 & 1) == 0))
      {
        swift_beginAccess();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v22 = *v11;
        *v11 = 0x8000000000000000;
        sub_245495CE4(v3, v9, v8, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_245476948, (void (*)(void))sub_245472FD0);
        *v11 = v22;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_unknownObjectRelease();
    if (qword_254413850 != -1)
      swift_once();
    v15 = sub_24549A078();
    __swift_project_value_buffer(v15, (uint64_t)qword_254413928);
    swift_unknownObjectRetain_n();
    v16 = sub_24549A060();
    v17 = sub_24549A1D4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v23[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_getObjectType();
      v20 = sub_24549A588();
      sub_2454720F4(v20, v21, v23);
      sub_24549A258();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245461000, v16, v17, "unexpected type %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v19, -1, -1);
      MEMORY[0x2495350C0](v18, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

void sub_24548B898()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void (*v6)(_QWORD *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  uint64_t *v12;
  char v13;
  char v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24[3];
  _QWORD v25[2];
  unsigned __int8 v26;

  v1 = v0;
  swift_unknownObjectRetain();
  objc_opt_self();
  v2 = (void *)swift_dynamicCastObjCClass();
  if (v2 && (v3 = (uint64_t)v2, (v4 = objc_msgSend(v2, sel_eventBody)) != 0))
  {
    v5 = v4;
    v6 = *(void (**)(_QWORD *__return_ptr, void *))(v0 + 56);
    swift_retain();
    v6(v25, v5);
    swift_release();
    swift_beginAccess();
    v7 = *(_QWORD *)(v0 + 16);
    v9 = v25[0];
    v8 = v25[1];
    v10 = v26;
    swift_bridgeObjectRetain();
    v11 = sub_24548BD30(v9, v8, v10, v7);
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = (uint64_t *)(v1 + 32);
      swift_beginAccess();
      if (!*(_QWORD *)(*(_QWORD *)(v1 + 32) + 16)
        || (swift_bridgeObjectRetain(),
            swift_bridgeObjectRetain(),
            sub_245472798(v9, v8, v10),
            v14 = v13,
            swift_bridgeObjectRelease(),
            swift_bridgeObjectRelease(),
            (v14 & 1) == 0))
      {
        swift_beginAccess();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v23 = *v12;
        *v12 = 0x8000000000000000;
        sub_245495E54(v3, v9, v8, v10, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_245477850, (void (*)(void))sub_245475914);
        *v12 = v23;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_unknownObjectRelease();
    if (qword_254413850 != -1)
      swift_once();
    v16 = sub_24549A078();
    __swift_project_value_buffer(v16, (uint64_t)qword_254413928);
    swift_unknownObjectRetain_n();
    v17 = sub_24549A060();
    v18 = sub_24549A1D4();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v24[0] = v20;
      *(_DWORD *)v19 = 136315138;
      swift_getObjectType();
      v21 = sub_24549A588();
      sub_2454720F4(v21, v22, v24);
      sub_24549A258();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245461000, v17, v18, "unexpected type %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v20, -1, -1);
      MEMORY[0x2495350C0](v19, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

uint64_t sub_24548BBFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_24549A51C();
    sub_24549A0D8();
    v6 = sub_24549A54C();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24549A4A4() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24549A4A4() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_24548BD30(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  if (*(_QWORD *)(a4 + 16))
  {
    sub_24549A51C();
    swift_bridgeObjectRetain();
    sub_24549A0D8();
    swift_bridgeObjectRelease();
    sub_24549A534();
    v8 = sub_24549A54C();
    v9 = -1 << *(_BYTE *)(a4 + 32);
    v10 = v8 & ~v9;
    v11 = a4 + 56;
    if (((*(_QWORD *)(a4 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
    {
      v12 = ~v9;
      v13 = *(_QWORD *)(a4 + 48);
      do
      {
        v14 = v13 + 24 * v10;
        v15 = *(unsigned __int8 *)(v14 + 16);
        if (*(_QWORD *)v14 == a1 && *(_QWORD *)(v14 + 8) == a2)
        {
          if (v15 == (a3 & 1))
            return 1;
        }
        else if ((sub_24549A4A4() & 1) != 0 && ((v15 ^ a3) & 1) == 0)
        {
          return 1;
        }
        v10 = (v10 + 1) & v12;
      }
      while (((*(_QWORD *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
  }
  return 0;
}

void sub_24548BE68()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void (*v6)(_QWORD *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t *v11;
  char v12;
  char v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23[3];
  _QWORD v24[2];

  v1 = v0;
  swift_unknownObjectRetain();
  objc_opt_self();
  v2 = (void *)swift_dynamicCastObjCClass();
  if (v2 && (v3 = (uint64_t)v2, (v4 = objc_msgSend(v2, sel_eventBody)) != 0))
  {
    v5 = v4;
    v6 = *(void (**)(_QWORD *__return_ptr, void *))(v0 + 40);
    swift_retain();
    v6(v24, v5);
    swift_release();
    swift_beginAccess();
    v7 = *(_QWORD *)(v0 + 16);
    v9 = v24[0];
    v8 = v24[1];
    swift_bridgeObjectRetain();
    v10 = sub_24548BBFC(v9, v8, v7);
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {
      v11 = (uint64_t *)(v1 + 24);
      swift_beginAccess();
      if (!*(_QWORD *)(*(_QWORD *)(v1 + 24) + 16)
        || (swift_bridgeObjectRetain(),
            swift_bridgeObjectRetain(),
            sub_245472734(v9, v8),
            v13 = v12,
            swift_bridgeObjectRelease(),
            swift_bridgeObjectRelease(),
            (v13 & 1) == 0))
      {
        swift_beginAccess();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v22 = *v11;
        *v11 = 0x8000000000000000;
        sub_245495CE4(v3, v9, v8, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_245476948, (void (*)(void))sub_245472FD0);
        *v11 = v22;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_unknownObjectRelease();
    if (qword_254413850 != -1)
      swift_once();
    v15 = sub_24549A078();
    __swift_project_value_buffer(v15, (uint64_t)qword_254413928);
    swift_unknownObjectRetain_n();
    v16 = sub_24549A060();
    v17 = sub_24549A1D4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v23[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_getObjectType();
      v20 = sub_24549A588();
      sub_2454720F4(v20, v21, v23);
      sub_24549A258();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245461000, v16, v17, "unexpected type %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v19, -1, -1);
      MEMORY[0x2495350C0](v18, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

void sub_24548C1B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void (*v6)(_QWORD *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  uint64_t *v12;
  char v13;
  char v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24[3];
  _QWORD v25[2];
  unsigned __int8 v26;

  v1 = v0;
  swift_unknownObjectRetain();
  objc_opt_self();
  v2 = (void *)swift_dynamicCastObjCClass();
  if (v2 && (v3 = (uint64_t)v2, (v4 = objc_msgSend(v2, sel_eventBody)) != 0))
  {
    v5 = v4;
    v6 = *(void (**)(_QWORD *__return_ptr, void *))(v0 + 40);
    swift_retain();
    v6(v25, v5);
    swift_release();
    swift_beginAccess();
    v7 = *(_QWORD *)(v0 + 16);
    v9 = v25[0];
    v8 = v25[1];
    v10 = v26;
    swift_bridgeObjectRetain();
    v11 = sub_24548BD30(v9, v8, v10, v7);
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = (uint64_t *)(v1 + 24);
      swift_beginAccess();
      if (!*(_QWORD *)(*(_QWORD *)(v1 + 24) + 16)
        || (swift_bridgeObjectRetain(),
            swift_bridgeObjectRetain(),
            sub_245472798(v9, v8, v10),
            v14 = v13,
            swift_bridgeObjectRelease(),
            swift_bridgeObjectRelease(),
            (v14 & 1) == 0))
      {
        swift_beginAccess();
        swift_unknownObjectRetain();
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v23 = *v12;
        *v12 = 0x8000000000000000;
        sub_245495E54(v3, v9, v8, v10, isUniquelyReferenced_nonNull_native, (void (*)(void))sub_245477850, (void (*)(void))sub_245475914);
        *v12 = v23;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
      }
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_unknownObjectRelease();
    if (qword_254413850 != -1)
      swift_once();
    v16 = sub_24549A078();
    __swift_project_value_buffer(v16, (uint64_t)qword_254413928);
    swift_unknownObjectRetain_n();
    v17 = sub_24549A060();
    v18 = sub_24549A1D4();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v24[0] = v20;
      *(_DWORD *)v19 = 136315138;
      swift_getObjectType();
      v21 = sub_24549A588();
      sub_2454720F4(v21, v22, v24);
      sub_24549A258();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_245461000, v17, v18, "unexpected type %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v20, -1, -1);
      MEMORY[0x2495350C0](v19, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
    }
  }
}

id sub_24548C518()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void (*v6)(_QWORD *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  id v12;
  void (*v13)(_QWORD *__return_ptr, void *);
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[3];
  uint64_t v22;
  _QWORD v23[2];

  v1 = v0;
  swift_unknownObjectRetain();
  objc_opt_self();
  v2 = (void *)swift_dynamicCastObjCClass();
  if (!v2 || (v3 = v2, (v4 = objc_msgSend(v2, sel_eventBody)) == 0))
  {
    swift_unknownObjectRelease();
    return 0;
  }
  v5 = v4;
  v6 = *(void (**)(_QWORD *__return_ptr, void *))(v0 + 40);
  swift_retain();
  v6(v21, v5);
  swift_release();
  swift_beginAccess();
  v7 = *(_QWORD *)(v0 + 32);
  v8 = v21[1];
  if (!*(_QWORD *)(v7 + 16))
  {

    swift_unknownObjectRelease();
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = v21[0];
  swift_bridgeObjectRetain();
  v10 = sub_245472734(v9, v8);
  if ((v11 & 1) == 0)
  {

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v12 = *(id *)(*(_QWORD *)(v7 + 56) + 8 * v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v13 = *(void (**)(_QWORD *__return_ptr, void *))(v1 + 40);
  swift_retain();
  v13(v23, v5);
  swift_release();
  v15 = v23[0];
  v14 = v23[1];
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_245492E08(&v22, v15, v14);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v16 = (void *)sub_245495168(v15, v14, (void (*)(void))sub_245476948);
  swift_endAccess();

  swift_beginAccess();
  v17 = (void *)sub_245495168(v15, v14, (void (*)(void))sub_245476948);
  swift_endAccess();

  v18 = objc_allocWithZone((Class)type metadata accessor for AppSuggestionsJointEvent(0));
  v19 = sub_24546667C(v3, v12);
  swift_bridgeObjectRelease();

  return v19;
}

id sub_24548C770()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void (*v6)(_QWORD *__return_ptr, void *);
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  id v13;
  void (*v14)(_QWORD *__return_ptr, void *);
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[2];
  unsigned __int8 v24;
  _BYTE v25[8];
  _QWORD v26[2];
  unsigned __int8 v27;

  v1 = v0;
  swift_unknownObjectRetain();
  objc_opt_self();
  v2 = (void *)swift_dynamicCastObjCClass();
  if (!v2 || (v3 = v2, (v4 = objc_msgSend(v2, sel_eventBody)) == 0))
  {
    swift_unknownObjectRelease();
    return 0;
  }
  v5 = v4;
  v6 = *(void (**)(_QWORD *__return_ptr, void *))(v0 + 40);
  swift_retain();
  v6(v23, v5);
  swift_release();
  swift_beginAccess();
  v7 = *(_QWORD *)(v0 + 32);
  v8 = v23[1];
  if (!*(_QWORD *)(v7 + 16))
  {

    swift_unknownObjectRelease();
LABEL_9:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = v24;
  v10 = v23[0];
  swift_bridgeObjectRetain();
  v11 = sub_245472798(v10, v8, v9);
  if ((v12 & 1) == 0)
  {

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  v13 = *(id *)(*(_QWORD *)(v7 + 56) + 8 * v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v14 = *(void (**)(_QWORD *__return_ptr, void *))(v1 + 40);
  swift_retain();
  v14(v26, v5);
  swift_release();
  v16 = v26[0];
  v15 = v26[1];
  v17 = v27;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_245493274((uint64_t)v25, v16, v15, v17);
  swift_endAccess();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v18 = (void *)sub_245495320(v16, v15, v17, (void (*)(void))sub_245477850);
  swift_endAccess();

  swift_beginAccess();
  v19 = (void *)sub_245495320(v16, v15, v17, (void (*)(void))sub_245477850);
  swift_endAccess();

  v20 = objc_allocWithZone((Class)type metadata accessor for PeopleSuggestionsJointEvent(0));
  v21 = sub_24548F024(v3, (uint64_t)v13);
  swift_bridgeObjectRelease();

  return v21;
}

uint64_t sub_24548C9E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, _QWORD);
  uint64_t v26;
  unint64_t v27;
  _BYTE v28[32];
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;

  v1 = a1;
  v27 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
    v2 = sub_24549A2DC();
  else
    v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v32 = MEMORY[0x24BEE4AF8];
    sub_245477EBC(0, v2 & ~(v2 >> 63), 0);
    if (v27)
    {
      result = sub_24549A294();
      v6 = 1;
    }
    else
    {
      result = sub_24548624C(v1);
      v6 = v7 & 1;
    }
    v29 = result;
    v30 = v4;
    v31 = v6;
    if (v2 < 0)
    {
      __break(1u);
LABEL_23:
      __break(1u);
    }
    else
    {
      v26 = v1;
      do
      {
        while (1)
        {
          v14 = v29;
          v13 = v30;
          v15 = v31;
          sub_245485FE0(v29, v30, v31, v1, v5);
          v17 = (void *)v16;
          v18 = sub_245490D50(v16);
          v20 = v19;

          v21 = v32;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = sub_245477EBC(0, *(_QWORD *)(v21 + 16) + 1, 1);
            v21 = v32;
          }
          v23 = *(_QWORD *)(v21 + 16);
          v22 = *(_QWORD *)(v21 + 24);
          if (v23 >= v22 >> 1)
          {
            result = sub_245477EBC(v22 > 1, v23 + 1, 1);
            v21 = v32;
          }
          *(_QWORD *)(v21 + 16) = v23 + 1;
          v24 = v21 + 16 * v23;
          *(_QWORD *)(v24 + 32) = v18;
          *(_QWORD *)(v24 + 40) = v20;
          if (v27)
            break;
          v1 = v26;
          v8 = sub_245485EF8(v14, v13, v15, v26);
          v10 = v9;
          v12 = v11;
          sub_245489D60(v14, v13, v15);
          v29 = v8;
          v30 = v10;
          v31 = v12 & 1;
          if (!--v2)
            goto LABEL_20;
        }
        v1 = v26;
        if ((v15 & 1) == 0)
          goto LABEL_23;
        if (sub_24549A2AC())
          swift_isUniquelyReferenced_nonNull_native();
        __swift_instantiateConcreteTypeFromMangledName(&qword_257474158);
        v25 = (void (*)(_BYTE *, _QWORD))sub_24549A1B0();
        sub_24549A318();
        v25(v28, 0);
        --v2;
      }
      while (v2);
LABEL_20:
      sub_245489D60(v29, v30, v31);
      return v32;
    }
  }
  return result;
}

void sub_24548CC44(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = a1;
    v28 = MEMORY[0x24BEE4AF8];
    sub_245477EBC(0, v1, 0);
    v4 = sub_245496408(v2);
    v5 = 0;
    v6 = v2 + 64;
    v23 = v2 + 80;
    v24 = v1;
    v25 = v3;
    v26 = v2 + 64;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(_BYTE *)(v2 + 32))
    {
      v9 = (unint64_t)v4 >> 6;
      if ((*(_QWORD *)(v6 + 8 * ((unint64_t)v4 >> 6)) & (1 << v4)) == 0)
        goto LABEL_23;
      if (*(_DWORD *)(v2 + 36) != v3)
        goto LABEL_24;
      v27 = v5;
      v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v4);
      v11 = sub_245490DE0((uint64_t)v10);
      v13 = v12;

      v14 = v2;
      v16 = *(_QWORD *)(v28 + 16);
      v15 = *(_QWORD *)(v28 + 24);
      if (v16 >= v15 >> 1)
        sub_245477EBC(v15 > 1, v16 + 1, 1);
      *(_QWORD *)(v28 + 16) = v16 + 1;
      v17 = v28 + 16 * v16;
      *(_QWORD *)(v17 + 32) = v11;
      *(_QWORD *)(v17 + 40) = v13;
      v7 = 1 << *(_BYTE *)(v14 + 32);
      if (v4 >= v7)
        goto LABEL_25;
      v6 = v26;
      v18 = *(_QWORD *)(v26 + 8 * v9);
      if ((v18 & (1 << v4)) == 0)
        goto LABEL_26;
      v2 = v14;
      v3 = v25;
      if (*(_DWORD *)(v14 + 36) != v25)
        goto LABEL_27;
      v19 = v18 & (-2 << (v4 & 0x3F));
      if (v19)
      {
        v7 = __clz(__rbit64(v19)) | v4 & 0xFFFFFFFFFFFFFFC0;
        v8 = v24;
      }
      else
      {
        v20 = v9 + 1;
        v21 = (unint64_t)(v7 + 63) >> 6;
        v8 = v24;
        if (v9 + 1 < v21)
        {
          v22 = *(_QWORD *)(v26 + 8 * v20);
          if (v22)
          {
LABEL_20:
            v7 = __clz(__rbit64(v22)) + (v20 << 6);
          }
          else
          {
            while (v21 - 2 != v9)
            {
              v22 = *(_QWORD *)(v23 + 8 * v9++);
              if (v22)
              {
                v20 = v9 + 1;
                goto LABEL_20;
              }
            }
          }
        }
      }
      v5 = v27 + 1;
      v4 = v7;
      if (v27 + 1 == v8)
        return;
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
LABEL_27:
    __break(1u);
  }
}

uint64_t collectPeopleSuggestionEvents()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  unint64_t v20;
  void (*v21)(void);
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD **v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t result;
  id v41;
  uint64_t *v42;
  id v43;
  _QWORD *v44;
  char *v45;
  unint64_t v46;
  unint64_t v47[2];
  _QWORD *v48;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473E80);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v41 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v45 = (char *)&v41 - v10;
  v11 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v12 = objc_msgSend(v11, sel_ShareSheet);
  swift_unknownObjectRelease();
  v13 = objc_msgSend(v12, sel_Inference);
  swift_unknownObjectRelease();
  v14 = objc_msgSend(v13, sel_PeopleSuggestions);
  swift_unknownObjectRelease();
  v15 = v14;
  v16 = objc_msgSend((id)BiomeLibrary(), sel_MLSE);
  swift_unknownObjectRelease();
  v17 = objc_msgSend(v16, sel_ShareSheet);
  swift_unknownObjectRelease();
  v18 = objc_msgSend(v17, sel_Feedback);
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473870);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = MEMORY[0x24BEE4B08];
  v20 = MEMORY[0x24BEE4AF8];
  v19[3] = sub_245467820(MEMORY[0x24BEE4AF8]);
  v19[4] = sub_245467820(v20);
  v19[5] = sub_24548DCA4;
  v19[6] = 0;
  v19[7] = sub_24548E014;
  v19[8] = 0;
  v48 = v19;
  sub_245465060(v15, v18, &v48, (uint64_t)v9);
  v21 = *(void (**)(void))(v3 + 32);
  v43 = v18;
  v22 = v3;
  v23 = v45;
  v21();
  v24 = swift_allocObject();
  *(_QWORD *)(v24 + 16) = v20;
  v42 = (uint64_t *)(v24 + 16);
  v25 = swift_allocObject();
  v44 = a1;
  *(_QWORD *)(v25 + 16) = v20;
  v26 = (_QWORD **)(v25 + 16);
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v6, v23, v2);
  sub_24548E264();
  v41 = v15;
  swift_retain();
  swift_retain();

  swift_release();
  swift_release();
  v27 = *(void (**)(char *, uint64_t))(v22 + 8);
  v27(v6, v2);
  v47[0] = v20;
  swift_beginAccess();
  v28 = swift_bridgeObjectRetain();
  sub_24548B3AC(v28, v26, v47);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  v29 = swift_bridgeObjectRetain();
  v30 = sub_245469314(v29);
  swift_bridgeObjectRelease();
  v31 = sub_24548E640(v30);
  v33 = v32;
  swift_release();
  v46 = v31;
  swift_beginAccess();
  sub_245465F4C(v33);
  swift_endAccess();
  sub_2454915B8(v47);
  sub_245467E40((uint64_t *)&v46);

  v27(v45, v2);
  swift_release();
  v34 = v42;
  swift_beginAccess();
  v35 = *v34;
  v36 = v47[0];
  v37 = v46;
  v38 = *v26;
  v39 = v44;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  result = swift_release();
  *v39 = v35;
  v39[1] = v36;
  v39[2] = v37;
  v39[3] = v38;
  return result;
}

uint64_t sub_24548D32C()
{
  unint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD v28[2];
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;

  v1 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245499FB8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v31 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v28 - v9;
  v12 = *v0;
  v11 = v0[1];
  v13 = *(_QWORD *)(v11 + 16);
  v14 = MEMORY[0x24BEE4AF8];
  v30 = v12;
  if (v13)
  {
    v32 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_245477DB8(0, v13, 0);
    v15 = v11 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v16 = *(_QWORD *)(v2 + 72);
    v28[1] = v11;
    v29 = v16;
    do
    {
      sub_2454968EC(v15, (uint64_t)v4);
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v10, v4, v5);
      sub_245496930((uint64_t)v4);
      v17 = v32;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_245477DB8(0, *(_QWORD *)(v17 + 16) + 1, 1);
        v16 = v29;
        v17 = v32;
      }
      v19 = *(_QWORD *)(v17 + 16);
      v18 = *(_QWORD *)(v17 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_245477DB8(v18 > 1, v19 + 1, 1);
        v16 = v29;
        v17 = v32;
      }
      *(_QWORD *)(v17 + 16) = v19 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v17+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v19, v10, v5);
      v32 = v17;
      v15 += v16;
      --v13;
    }
    while (v13);
    swift_bridgeObjectRelease();
    v12 = v30;
    v14 = MEMORY[0x24BEE4AF8];
    if (!(v30 >> 62))
    {
LABEL_9:
      v20 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v20)
        goto LABEL_10;
LABEL_21:
      swift_bridgeObjectRelease();
      v23 = MEMORY[0x24BEE4AF8];
LABEL_22:
      v32 = v17;
      sub_2454660AC(v23);
      return v32;
    }
  }
  else
  {
    v17 = MEMORY[0x24BEE4AF8];
    if (!(v12 >> 62))
      goto LABEL_9;
  }
  swift_bridgeObjectRetain();
  v20 = sub_24549A3FC();
  if (!v20)
    goto LABEL_21;
LABEL_10:
  v32 = v14;
  result = sub_245477DB8(0, v20 & ~(v20 >> 63), 0);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v22 = 0;
    v23 = v32;
    v24 = v12 & 0xC000000000000001;
    do
    {
      if (v24)
      {
        v25 = MEMORY[0x249534988](v22, v12);
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v31, v25 + OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp, v5);
        swift_unknownObjectRelease();
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v31, *(_QWORD *)(v12 + 8 * v22 + 32) + OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp, v5);
      }
      v32 = v23;
      v27 = *(_QWORD *)(v23 + 16);
      v26 = *(_QWORD *)(v23 + 24);
      if (v27 >= v26 >> 1)
      {
        sub_245477DB8(v26 > 1, v27 + 1, 1);
        v23 = v32;
      }
      ++v22;
      *(_QWORD *)(v23 + 16) = v27 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v23+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v27, v31, v5);
      v12 = v30;
    }
    while (v20 != v22);
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

id PeopleSuggestionInferenceEventTimestamped.event.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + *(int *)(type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0) + 20)));
}

uint64_t sub_24548D6D0()
{
  sub_245492000();
  return sub_24549A570();
}

uint64_t sub_24548D6F8()
{
  sub_245492000();
  return sub_24549A57C();
}

uint64_t PeopleSuggestionInferenceEventTimestamped.encode(to:)(_QWORD *a1)
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

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473E90);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245492000();
  sub_24549A564();
  v12 = 0;
  sub_245499FB8();
  sub_245464488(&qword_257473658, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  sub_24549A474();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0) + 20));
    v10[15] = 1;
    type metadata accessor for PeopleSuggestions();
    sub_245464488(&qword_257473EA0, (uint64_t (*)(uint64_t))type metadata accessor for PeopleSuggestions, (uint64_t)&protocol conformance descriptor for PeopleSuggestions);
    sub_24549A474();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24548D8A8(_QWORD *a1)
{
  return PeopleSuggestionInferenceEventTimestamped.encode(to:)(a1);
}

id PeopleSuggesterFeedbackEventTimestamped.event.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for PeopleSuggesterFeedbackEventTimestamped(0) + 20));
}

uint64_t sub_24548D8E4()
{
  sub_245492058();
  return sub_24549A570();
}

uint64_t sub_24548D90C()
{
  sub_245492058();
  return sub_24549A57C();
}

uint64_t PeopleSuggesterFeedbackEventTimestamped.encode(to:)(_QWORD *a1)
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

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257473EA8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245492058();
  sub_24549A564();
  v12 = 0;
  sub_245499FB8();
  sub_245464488(&qword_257473658, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
  sub_24549A474();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for PeopleSuggesterFeedbackEventTimestamped(0) + 20));
    v10[15] = 1;
    type metadata accessor for PeopleSuggesterFeedbackEvent();
    sub_245464488(&qword_257473EB8, (uint64_t (*)(uint64_t))type metadata accessor for PeopleSuggesterFeedbackEvent, (uint64_t)&protocol conformance descriptor for PeopleSuggesterFeedbackEvent);
    sub_24549A474();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_24548DABC(_QWORD *a1)
{
  return PeopleSuggesterFeedbackEventTimestamped.encode(to:)(a1);
}

uint64_t PeopleSuggestionsJoiningResult.unmatchedInferenceEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PeopleSuggestionsJoiningResult.unmatchedFeedbackEvents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PeopleSuggestionsJoiningResult.errors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24548DAE8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v14;

  v2 = sub_245499FDC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_responseType) != 2)
    objc_msgSend(a1, sel_responseType);
  v6 = objc_msgSend(a1, sel_identifier);
  if (v6)
  {
    v7 = v6;
    v8 = sub_24549A0B4();

  }
  else
  {
    if (qword_254413850 != -1)
      swift_once();
    v9 = sub_24549A078();
    __swift_project_value_buffer(v9, (uint64_t)qword_254413928);
    v10 = sub_24549A060();
    v11 = sub_24549A1E0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_245461000, v10, v11, "missing ps identifier", v12, 2u);
      MEMORY[0x2495350C0](v12, -1, -1);
    }

    sub_245499FD0();
    v8 = sub_245499FC4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v8;
}

uint64_t sub_24548DCA4@<X0>(uint64_t a1@<X8>)
{
  return sub_24548E020((uint64_t (*)(void))sub_24548DAE8, a1);
}

uint64_t sub_24548DCB0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  char *v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v2 = sub_245499FDC();
  v30 = *(_QWORD *)(v2 - 8);
  v31 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v29 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(a1, sel_timeouts);
  sub_24547D17C(0, &qword_2544137E0);
  v5 = sub_24549A12C();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_24549A3FC();
    if (v6)
      goto LABEL_3;
LABEL_15:
    v8 = (char *)MEMORY[0x24BEE4AF8];
    goto LABEL_16;
  }
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_15;
LABEL_3:
  if (v6 < 1)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_once();
    goto LABEL_30;
  }
  v7 = 0;
  v8 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    if ((v5 & 0xC000000000000001) != 0)
      v9 = (id)MEMORY[0x249534988](v7, v5);
    else
      v9 = *(id *)(v5 + 8 * v7 + 32);
    v10 = v9;
    v11 = objc_msgSend(v9, sel_occurrence);

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v8 = sub_245471FE8(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
    v13 = *((_QWORD *)v8 + 2);
    v12 = *((_QWORD *)v8 + 3);
    if (v13 >= v12 >> 1)
      v8 = sub_245471FE8((char *)(v12 > 1), v13 + 1, 1, v8);
    ++v7;
    *((_QWORD *)v8 + 2) = v13 + 1;
    *(_DWORD *)&v8[4 * v13 + 32] = v11;
  }
  while (v6 != v7);
LABEL_16:
  swift_bridgeObjectRelease_n();
  v14 = *((_QWORD *)v8 + 2);
  if (v14 && *((_DWORD *)v8 + 8) != 1 && v14 != 1)
  {
    v15 = 9;
    while (1)
    {
      v16 = v15 - 7;
      if (__OFADD__(v15 - 8, 1))
        break;
      v17 = *(_DWORD *)&v8[4 * v15++];
      if (v17 == 1 || v16 == v14)
        goto LABEL_27;
    }
    __break(1u);
    goto LABEL_35;
  }
LABEL_27:
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(a1, sel_identifier);
  if (v19)
  {
    v20 = v19;
    v21 = sub_24549A0B4();

    return v21;
  }
  if (qword_254413850 != -1)
    goto LABEL_36;
LABEL_30:
  v22 = sub_24549A078();
  __swift_project_value_buffer(v22, (uint64_t)qword_254413928);
  v23 = sub_24549A060();
  v24 = sub_24549A1E0();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_245461000, v23, v24, "missing feedback identifier", v25, 2u);
    MEMORY[0x2495350C0](v25, -1, -1);
  }

  v26 = v29;
  sub_245499FD0();
  v21 = sub_245499FC4();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v26, v31);
  return v21;
}

uint64_t sub_24548E014@<X0>(uint64_t a1@<X8>)
{
  return sub_24548E020((uint64_t (*)(void))sub_24548DCB0, a1);
}

uint64_t sub_24548E020@<X0>(uint64_t (*a1)(void)@<X1>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  result = a1();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v4;
  *(_BYTE *)(a2 + 16) = v5 & 1;
  return result;
}

uint64_t sub_24548E04C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_24548E070(void *a1, uint64_t a2)
{
  _QWORD **v4;
  id v5;
  void *v6;
  _QWORD *v7;
  id v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  unint64_t v17;

  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    v4 = (_QWORD **)(a2 + 16);
    v5 = objc_msgSend(a1, sel_error);
    if (v5)
    {
      v6 = v5;
      swift_beginAccess();
      v7 = *v4;
      v8 = v6;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *v4 = v7;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v7 = sub_24547186C(0, v7[2] + 1, 1, v7);
        *v4 = v7;
      }
      v11 = v7[2];
      v10 = v7[3];
      if (v11 >= v10 >> 1)
      {
        v7 = sub_24547186C((_QWORD *)(v10 > 1), v11 + 1, 1, v7);
        *v4 = v7;
      }
      v7[2] = v11 + 1;
      v7[v11 + 4] = v8;
      swift_endAccess();

    }
    else
    {
      sub_24546A66C();
      v12 = swift_allocError();
      *(_QWORD *)v13 = 0xD00000000000003ELL;
      *(_QWORD *)(v13 + 8) = 0x800000024549F100;
      *(_BYTE *)(v13 + 16) = 1;
      swift_beginAccess();
      v14 = *v4;
      v15 = swift_isUniquelyReferenced_nonNull_native();
      *v4 = v14;
      if ((v15 & 1) == 0)
      {
        v14 = sub_24547186C(0, v14[2] + 1, 1, v14);
        *v4 = v14;
      }
      v17 = v14[2];
      v16 = v14[3];
      if (v17 >= v16 >> 1)
      {
        v14 = sub_24547186C((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
        *v4 = v14;
      }
      v14[2] = v17 + 1;
      v14[v17 + 4] = v12;
      swift_endAccess();
    }
  }
}

void sub_24548E25C(void *a1)
{
  uint64_t v1;

  sub_24548E070(a1, v1);
}

unint64_t sub_24548E264()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257473E88;
  if (!qword_257473E88)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257473E80);
    result = MEMORY[0x249535018](MEMORY[0x24BE0C968], v1);
    atomic_store(result, (unint64_t *)&qword_257473E88);
  }
  return result;
}

void sub_24548E2B0(id *a1, _QWORD **a2, unint64_t *a3)
{
  void *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD *v15;
  id v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  id v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v7 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v12 = objc_msgSend(*a1, sel_eventBody);
  if (v12)
  {
    v13 = v12;
    v14 = sub_24548859C(v12);
    if (v3)
    {
      swift_beginAccess();
      v15 = *a2;
      v16 = v3;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *a2 = v15;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        v15 = sub_24547186C(0, v15[2] + 1, 1, v15);
        *a2 = v15;
      }
      v19 = v15[2];
      v18 = v15[3];
      if (v19 >= v18 >> 1)
      {
        v15 = sub_24547186C((_QWORD *)(v18 > 1), v19 + 1, 1, v15);
        *a2 = v15;
      }
      v15[2] = v19 + 1;
      v15[v19 + 4] = v3;
      swift_endAccess();

    }
    else
    {
      v28 = v14;
      objc_msgSend(v11, sel_timestamp);
      sub_245499F64();
      *(_QWORD *)&v10[*(int *)(v7 + 20)] = v28;
      v29 = *a3;
      v30 = v28;
      v31 = swift_isUniquelyReferenced_nonNull_native();
      *a3 = v29;
      if ((v31 & 1) == 0)
      {
        v29 = sub_245471D9C(0, *(_QWORD *)(v29 + 16) + 1, 1, v29);
        *a3 = v29;
      }
      v33 = *(_QWORD *)(v29 + 16);
      v32 = *(_QWORD *)(v29 + 24);
      if (v33 >= v32 >> 1)
      {
        v29 = sub_245471D9C(v32 > 1, v33 + 1, 1, v29);
        *a3 = v29;
      }
      *(_QWORD *)(v29 + 16) = v33 + 1;
      sub_24546A628((uint64_t)v10, v29+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v33, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);

    }
  }
  else
  {
    v35 = 0;
    v36 = 0xE000000000000000;
    sub_24549A354();
    sub_24549A0E4();
    swift_getObjectType();
    sub_24549A588();
    sub_24549A0E4();
    swift_bridgeObjectRelease();
    sub_24549A0E4();
    objc_msgSend(v11, sel_timestamp);
    sub_24549A180();
    v20 = v35;
    v21 = v36;
    sub_24546A66C();
    v22 = swift_allocError();
    *(_QWORD *)v23 = v20;
    *(_QWORD *)(v23 + 8) = v21;
    *(_BYTE *)(v23 + 16) = 0;
    swift_beginAccess();
    v24 = *a2;
    v25 = swift_isUniquelyReferenced_nonNull_native();
    *a2 = v24;
    if ((v25 & 1) == 0)
    {
      v24 = sub_24547186C(0, v24[2] + 1, 1, v24);
      *a2 = v24;
    }
    v27 = v24[2];
    v26 = v24[3];
    if (v27 >= v26 >> 1)
    {
      v24 = sub_24547186C((_QWORD *)(v26 > 1), v27 + 1, 1, v24);
      *a2 = v24;
    }
    v24[2] = v27 + 1;
    v24[v27 + 4] = v22;
    swift_endAccess();
  }
}

unint64_t sub_24548E640(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  _QWORD v27[2];
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;

  v2 = type metadata accessor for PeopleSuggesterFeedbackEventTimestamped(0);
  v29 = *(_QWORD *)(v2 - 8);
  v30 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_23;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_24549A3FC())
  {
    v6 = 0;
    v32 = a1 & 0xC000000000000001;
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v27[1] = 0x800000024549DD00;
    v8 = MEMORY[0x24BEE4AF8];
    v31 = v5;
LABEL_4:
    v28 = v7;
    v9 = v6;
    while (1)
    {
      v10 = v32 ? (id)MEMORY[0x249534988](v9, a1) : *(id *)(a1 + 8 * v9 + 32);
      v11 = v10;
      v6 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v12 = objc_msgSend(v10, sel_eventBody);
      if (!v12)
      {
        v33 = 0;
        v34 = 0xE000000000000000;
        sub_24549A354();
        sub_24549A0E4();
        swift_getObjectType();
        sub_24549A588();
        sub_24549A0E4();
        swift_bridgeObjectRelease();
        sub_24549A0E4();
        objc_msgSend(v11, sel_timestamp);
        sub_24549A180();
        v18 = v33;
        v19 = v34;
        sub_24546A66C();
        v20 = swift_allocError();
        *(_QWORD *)v21 = v18;
        *(_QWORD *)(v21 + 8) = v19;
        *(_BYTE *)(v21 + 16) = 0;
        v22 = v28;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v22 = sub_24547186C(0, v22[2] + 1, 1, v22);
        v24 = v22[2];
        v23 = v22[3];
        v25 = v22;
        if (v24 >= v23 >> 1)
          v25 = sub_24547186C((_QWORD *)(v23 > 1), v24 + 1, 1, v22);
        v7 = v25;
        v25[2] = v24 + 1;
        v25[v24 + 4] = v20;

        if (v6 == v31)
        {
LABEL_15:
          swift_bridgeObjectRelease();
          return v8;
        }
        goto LABEL_4;
      }
      v13 = v12;
      v14 = a1;
      v15 = sub_245486E60(v12);
      objc_msgSend(v11, sel_timestamp);
      sub_245499F64();
      *(_QWORD *)&v4[*(int *)(v30 + 20)] = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_245471858(0, *(_QWORD *)(v8 + 16) + 1, 1, v8);
      v17 = *(_QWORD *)(v8 + 16);
      v16 = *(_QWORD *)(v8 + 24);
      if (v17 >= v16 >> 1)
        v8 = sub_245471858(v16 > 1, v17 + 1, 1, v8);
      *(_QWORD *)(v8 + 16) = v17 + 1;
      sub_24546A628((uint64_t)v4, v8+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v29 + 72) * v17, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped);

      ++v9;
      a1 = v14;
      if (v6 == v31)
        goto LABEL_15;
    }
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_24548EA6C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  id v11;
  char *v12;
  char *v13;
  uint64_t *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  char *v20;
  char *v21;
  uint64_t *v22;
  id v23;
  id v24;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  objc_class *v30;
  id v31;
  char *v32;
  char *v33;
  uint64_t *v34;
  id v35;
  id v36;
  objc_super v37;
  objc_super v38;
  uint64_t v39;
  objc_super v40;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier);
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8);
  if (v2)
  {
    v3 = *v1;
    v4 = *v1 == 0x6B6361626C6C6166 && v2 == 0xE800000000000000;
    if (v4
      || (sub_24549A4A4() & 1) != 0
      || (v3 == 0x646568636163 ? (v5 = v2 == 0xE600000000000000) : (v5 = 0), v5 || (sub_24549A4A4() & 1) != 0))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254413820);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_24549CD10;
      if (qword_257473390 != -1)
        swift_once();
      v8 = qword_257477C30;
      v7 = *(_QWORD *)algn_257477C38;
      v9 = *(void **)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
      v10 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
      v11 = objc_allocWithZone(v10);
      v12 = (char *)objc_allocWithZone(v10);
      v13 = &v12[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
      *(_QWORD *)v13 = 0;
      v13[8] = 1;
      v14 = (uint64_t *)&v12[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
      *v14 = v8;
      v14[1] = v7;
      *(_QWORD *)&v12[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = v9;
      v38.receiver = v12;
      v38.super_class = v10;
      swift_bridgeObjectRetain();
      v15 = v9;
      v16 = objc_msgSendSuper2(&v38, sel_init);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      *(_QWORD *)(v6 + 32) = v16;
      if (qword_257473398 != -1)
        swift_once();
      v18 = qword_257477C40;
      v17 = *(_QWORD *)algn_257477C48;
      v19 = objc_allocWithZone(v10);
      v20 = (char *)objc_allocWithZone(v10);
      v21 = &v20[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
      *(_QWORD *)v21 = 0;
      v21[8] = 1;
      v22 = (uint64_t *)&v20[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
      *v22 = v18;
      v22[1] = v17;
      *(_QWORD *)&v20[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = v9;
      v37.receiver = v20;
      v37.super_class = v10;
      v23 = v15;
      swift_bridgeObjectRetain();
      v24 = objc_msgSendSuper2(&v37, sel_init);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      *(_QWORD *)(v6 + 40) = v24;
LABEL_17:
      v39 = v6;
      sub_24549A144();
      return v39;
    }
    v26 = v3 == 0x656C626D65736E65 && v2 == 0xE800000000000000;
    if (v26 || (sub_24549A4A4() & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254413820);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_24549CD00;
      if (qword_257473390 != -1)
        swift_once();
      v28 = qword_257477C30;
      v27 = *(_QWORD *)algn_257477C38;
      v29 = *(void **)(v0 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier);
      v30 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
      v31 = objc_allocWithZone(v30);
      v32 = (char *)objc_allocWithZone(v30);
      v33 = &v32[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
      *(_QWORD *)v33 = 0;
      v33[8] = 1;
      v34 = (uint64_t *)&v32[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
      *v34 = v28;
      v34[1] = v27;
      *(_QWORD *)&v32[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = v29;
      v40.receiver = v32;
      v40.super_class = v30;
      swift_bridgeObjectRetain();
      v35 = v29;
      v36 = objc_msgSendSuper2(&v40, sel_init);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      *(_QWORD *)(v6 + 32) = v36;
      goto LABEL_17;
    }
  }
  return MEMORY[0x24BEE4AF8];
}

id PeopleSuggestionsJointEvent.__allocating_init(timestamp:engagement:inferenceModels:engagedModelRanks:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  objc_super v15;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = &v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp];
  v11 = sub_245499FB8();
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v10, a1, v11);
  *(_QWORD *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagement] = a2;
  *(_QWORD *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_inferenceModels] = a3;
  *(_QWORD *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagedModelRanks] = a4;
  v15.receiver = v9;
  v15.super_class = v4;
  v13 = objc_msgSendSuper2(&v15, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  return v13;
}

id PeopleSuggestionsJointEvent.init(timestamp:engagement:inferenceModels:engagedModelRanks:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v9 = &v4[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp];
  v10 = sub_245499FB8();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  *(_QWORD *)&v4[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagement] = a2;
  *(_QWORD *)&v4[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_inferenceModels] = a3;
  *(_QWORD *)&v4[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagedModelRanks] = a4;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for PeopleSuggestionsJointEvent(0);
  v12 = objc_msgSendSuper2(&v14, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v12;
}

id sub_24548F024(id a1, uint64_t a2)
{
  void *v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  id v40;
  void *v41;
  objc_class *v42;
  id v44;
  id v45;
  objc_super v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;

  v5 = (_QWORD *)sub_245499FB8();
  v6 = *(v5 - 1);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v2;
  v10 = objc_msgSend(a1, sel_eventBody);
  if (!v10)
  {
    if (qword_254413850 != -1)
      swift_once();
    v23 = sub_24549A078();
    __swift_project_value_buffer(v23, (uint64_t)qword_254413928);
    v24 = a1;
    v25 = sub_24549A060();
    v26 = sub_24549A1E0();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v27 = 134217984;
      objc_msgSend(v24, sel_timestamp);
      v49 = v28;
      sub_24549A258();

      _os_log_impl(&dword_245461000, v25, v26, "no people suggestions inference at %f", v27, 0xCu);
      MEMORY[0x2495350C0](v27, -1, -1);

    }
    else
    {

    }
LABEL_17:

    goto LABEL_19;
  }
  v11 = v10;
  v12 = objc_msgSend((id)a2, sel_eventBody);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(a1, sel_timestamp);
    sub_245499F64();
    v14 = (uint64_t)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp];
    (*(void (**)(char *, char *, _QWORD *))(v6 + 32))(&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_timestamp], v8, v5);
    v15 = objc_msgSend(v13, sel_engagementType);
    v45 = a1;
    v16 = 0;
    switch(v15)
    {
      case 0u:
        if (qword_254413850 != -1)
          goto LABEL_54;
        goto LABEL_5;
      case 1u:
        goto LABEL_32;
      case 2u:
        v16 = 1;
        goto LABEL_32;
      case 3u:
        v16 = 2;
        goto LABEL_32;
      case 4u:
        v16 = 4;
        goto LABEL_32;
      case 5u:
        v16 = 3;
        goto LABEL_32;
      case 6u:
        v16 = 5;
        goto LABEL_32;
      case 7u:
        v16 = 6;
LABEL_32:
        *(_QWORD *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagement] = v16;
        if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_24549A3FC())
          sub_245496490(MEMORY[0x24BEE4AF8]);
        else
          v37 = MEMORY[0x24BEE4B08];
        v49 = v37;
        v48 = MEMORY[0x24BEE4B00];
        v38 = objc_msgSend(v11, sel_responseType) == 2
           || objc_msgSend(v11, sel_responseType) == 3;
        v5 = objc_msgSend(v11, sel_peopleSuggestions, a2);
        sub_24547D17C(0, &qword_254413818);
        v14 = sub_24549A12C();

        if ((unint64_t)v14 >> 62)
        {
          if (v14 < 0)
            v5 = (_QWORD *)v14;
          else
            v5 = (_QWORD *)(v14 & 0xFFFFFFFFFFFFFF8);
          swift_bridgeObjectRetain();
          a2 = sub_24549A3FC();
          if (a2)
            goto LABEL_39;
        }
        else
        {
          a2 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (a2)
          {
LABEL_39:
            if (a2 >= 1)
            {
              v39 = 0;
              do
              {
                if ((v14 & 0xC000000000000001) != 0)
                  v40 = (id)MEMORY[0x249534988](v39, v14);
                else
                  v40 = *(id *)(v14 + 8 * v39 + 32);
                v41 = v40;
                ++v39;
                v47 = v40;
                sub_24548F77C(&v47, v13, v38, (uint64_t)&v49, &v48);

              }
              while (a2 != v39);
              goto LABEL_51;
            }
            __break(1u);
LABEL_54:
            swift_once();
LABEL_5:
            v17 = sub_24549A078();
            __swift_project_value_buffer(v17, (uint64_t)qword_254413928);
            v18 = sub_24549A060();
            v19 = sub_24549A1D4();
            if (os_log_type_enabled(v18, v19))
            {
              v20 = a2;
              v21 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v21 = 0;
              v22 = "unexpected unknown engagement type";
LABEL_24:
              _os_log_impl(&dword_245461000, v18, v19, v22, v21, 2u);
              MEMORY[0x2495350C0](v21, -1, -1);
              a2 = v20;
              a1 = v45;
            }
LABEL_25:

            (*(void (**)(uint64_t, _QWORD *))(v6 + 8))(v14, v5);
            goto LABEL_17;
          }
        }
LABEL_51:

        swift_bridgeObjectRelease_n();
        *(_QWORD *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_inferenceModels] = v49;
        *(_QWORD *)&v9[OBJC_IVAR____TtC15ReportingPlugin27PeopleSuggestionsJointEvent_engagedModelRanks] = v48;

        v42 = (objc_class *)type metadata accessor for PeopleSuggestionsJointEvent(0);
        v46.receiver = v9;
        v46.super_class = v42;
        v35 = objc_msgSendSuper2(&v46, sel_init);

        return v35;
      default:
        if (qword_254413850 != -1)
          swift_once();
        v36 = sub_24549A078();
        __swift_project_value_buffer(v36, (uint64_t)qword_254413928);
        v18 = sub_24549A060();
        v19 = sub_24549A1D4();
        if (!os_log_type_enabled(v18, v19))
          goto LABEL_25;
        v20 = a2;
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        v22 = "unexpected engagement type";
        goto LABEL_24;
    }
  }
  if (qword_254413850 != -1)
    swift_once();
  v29 = sub_24549A078();
  __swift_project_value_buffer(v29, (uint64_t)qword_254413928);
  v30 = (id)a2;
  v31 = sub_24549A060();
  v32 = sub_24549A1E0();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v33 = 134217984;
    objc_msgSend(v30, sel_timestamp);
    v49 = v34;
    sub_24549A258();

    _os_log_impl(&dword_245461000, v31, v32, "no feedback at %f", v33, 0xCu);
    MEMORY[0x2495350C0](v33, -1, -1);

  }
  else
  {

  }
LABEL_19:
  type metadata accessor for PeopleSuggestionsJointEvent(0);
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_24548F77C(void **a1, id a2, char a3, uint64_t a4, uint64_t *a5)
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  objc_class *v25;
  char *v26;
  char *v27;
  uint64_t *v28;
  uint64_t *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  _QWORD *v59;
  void *v60;
  id v61;
  id v62;
  char v63;
  uint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  id v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  id v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  objc_class *v81;
  id v82;
  char *v83;
  char *v84;
  id v85;
  char v86;
  id v87;
  uint64_t v88;
  id v89;
  id v90;
  uint64_t inited;
  void *v92;
  id v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  id v97;
  void *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  void *v107;
  uint64_t v108;
  id v109;
  NSObject *v110;
  os_log_type_t v111;
  uint8_t *v112;
  void *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  id v118;
  id v119;
  id v120;
  objc_super v121;
  uint64_t v122;
  objc_super v123;
  void *v124;

  v7 = *a1;
  v8 = objc_msgSend(a2, sel_trialIdentifier);
  v9 = v8;
  if (!v8)
    goto LABEL_5;
  v10 = objc_msgSend(v8, sel_trialExperimentId);

  if (!v10)
  {
    v9 = 0;
LABEL_5:
    v12 = 0xE000000000000000;
    goto LABEL_6;
  }
  v9 = (void *)sub_24549A0B4();
  v12 = v11;

LABEL_6:
  v13 = objc_msgSend(a2, sel_trialIdentifier);
  v118 = v7;
  if (v13
    && (v14 = v13,
        v15 = objc_msgSend(v13, sel_trialTreatmentId),
        v14,
        v15))
  {
    v16 = sub_24549A0B4();
    v18 = v17;

  }
  else
  {
    v16 = 0;
    v18 = 0xE000000000000000;
  }
  v19 = objc_msgSend(a2, sel_trialIdentifier);
  if (v19
    && (v20 = v19,
        v21 = objc_msgSend(v19, sel_trialDeploymentId),
        v20,
        v21))
  {
    v22 = sub_24549A0B4();
    v24 = v23;

  }
  else
  {
    v22 = 0;
    v24 = 0xE000000000000000;
  }
  v25 = (objc_class *)type metadata accessor for TrialIdentifier();
  v26 = (char *)objc_allocWithZone(v25);
  v27 = &v26[OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment];
  *(_QWORD *)v27 = v9;
  *((_QWORD *)v27 + 1) = v12;
  v28 = (uint64_t *)&v26[OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment];
  *v28 = v16;
  v28[1] = v18;
  v29 = (uint64_t *)&v26[OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment];
  *v29 = v22;
  v29[1] = v24;
  v123.receiver = v26;
  v123.super_class = v25;
  v30 = objc_msgSendSuper2(&v123, sel_init);
  v31 = v118;
  v32 = objc_msgSend(v118, sel_identifier);
  if (v32)
  {
    v33 = v32;
    v34 = sub_24549A0B4();
    v36 = v35;

    if ((a3 & 1) == 0)
    {
      v51 = sub_245487F78(v118, v30);
      if (!v120)
      {
        v62 = v51;
        v116 = v34;
LABEL_59:
        __swift_instantiateConcreteTypeFromMangledName(&qword_254413820);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_24549CD00;
        *(_QWORD *)(inited + 32) = v62;
        v124 = (void *)inited;
        sub_24549A144();
        v92 = v124;
        v93 = v62;
        v94 = sub_24548EA6C();
        v124 = v92;
        sub_2454664C4(v94);
        v95 = (unint64_t)v124;
        v96 = swift_bridgeObjectRetain();
        sub_2454967E8(v96);
        swift_bridgeObjectRelease();
        if (objc_msgSend(a2, sel_engagementType) == 1
          && (v97 = objc_msgSend(a2, sel_engagementIdentifier)) != 0)
        {
          v98 = v97;
          v99 = v30;
          v100 = sub_24549A0B4();
          v102 = v101;

          if (v116 == v100 && v36 == v102)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_67;
          }
          v103 = sub_24549A4A4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v103 & 1) != 0)
          {
LABEL_67:
            if (!objc_msgSend(v31, sel_rank))
            {
              swift_bridgeObjectRelease();
              if (qword_254413850 == -1)
                goto LABEL_77;
              goto LABEL_84;
            }
            if (v95 >> 62)
            {
              swift_bridgeObjectRetain();
              v104 = sub_24549A3FC();
              if (v104)
                goto LABEL_70;
            }
            else
            {
              v104 = *(_QWORD *)((v95 & 0xFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain();
              if (v104)
              {
LABEL_70:
                if (v104 >= 1)
                {
                  v105 = 0;
                  do
                  {
                    if ((v95 & 0xC000000000000001) != 0)
                      v106 = (id)MEMORY[0x249534988](v105, v95);
                    else
                      v106 = *(id *)(v95 + 8 * v105 + 32);
                    v107 = v106;
                    ++v105;
                    v124 = v106;
                    sub_2454907F8(&v124, a5, v31);

                  }
                  while (v104 != v105);
                  goto LABEL_82;
                }
                __break(1u);
LABEL_84:
                swift_once();
LABEL_77:
                v108 = sub_24549A078();
                __swift_project_value_buffer(v108, (uint64_t)qword_254413928);
                v109 = v31;
                v110 = sub_24549A060();
                v111 = sub_24549A1D4();
                if (os_log_type_enabled(v110, v111))
                {
                  v112 = (uint8_t *)swift_slowAlloc();
                  v113 = (void *)swift_slowAlloc();
                  v124 = v113;
                  *(_DWORD *)v112 = 136315138;
                  v114 = sub_2454904DC();
                  v122 = sub_2454720F4(v114, v115, (uint64_t *)&v124);
                  sub_24549A258();

                  swift_bridgeObjectRelease();
                  _os_log_impl(&dword_245461000, v110, v111, "Missing or negative rank: %s", v112, 0xCu);
                  swift_arrayDestroy();
                  MEMORY[0x2495350C0](v113, -1, -1);
                  MEMORY[0x2495350C0](v112, -1, -1);

                }
                else
                {

                }
                return;
              }
            }
LABEL_82:

            swift_bridgeObjectRelease_n();
            return;
          }

        }
        else
        {

          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        return;
      }
      v119 = v30;
      if (qword_254413850 != -1)
        swift_once();
      v52 = sub_24549A078();
      __swift_project_value_buffer(v52, (uint64_t)qword_254413928);
      v53 = v120;
      v54 = v120;
      swift_bridgeObjectRetain();
      v55 = v120;
      v56 = sub_24549A060();
      v57 = sub_24549A1E0();
      if (!os_log_type_enabled(v56, v57))
        goto LABEL_57;
      goto LABEL_30;
    }
    v116 = v34;
    v37 = objc_msgSend(v118, sel_modelIdentifier);
    if (v37)
    {
      v38 = v37;
      v39 = objc_msgSend(v37, sel_otherModelTypeName);

      if (v39)
      {
        v40 = sub_24549A0B4();
        v42 = v41;

        if (v42)
        {
          if (v40 == 0x656C626D65736E65 && v42 == 0xE800000000000000)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            v63 = sub_24549A4A4();
            swift_bridgeObjectRelease();
            if ((v63 & 1) == 0)
              goto LABEL_39;
          }
          if (qword_254413850 != -1)
            swift_once();
          v64 = sub_24549A078();
          __swift_project_value_buffer(v64, (uint64_t)qword_254413928);
          v65 = sub_24549A060();
          v66 = sub_24549A1D4();
          if (os_log_type_enabled(v65, v66))
          {
            v67 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v67 = 0;
            _os_log_impl(&dword_245461000, v65, v66, "Ensemble in timeout", v67, 2u);
            MEMORY[0x2495350C0](v67, -1, -1);
          }

        }
      }
    }
LABEL_39:
    v68 = objc_msgSend(v118, sel_modelIdentifier);
    if (v68)
    {
      v69 = v68;
      v70 = objc_msgSend(v68, sel_otherModelTypeName);

      if (v70)
      {
        v71 = sub_24549A0B4();
        v73 = v72;

        if (v73)
        {
          if (v71 == 0x656C626D65736E65 && v73 == 0xE800000000000000)
            goto LABEL_50;
          v74 = sub_24549A4A4();
          swift_bridgeObjectRelease();
          if ((v74 & 1) != 0)
          {
LABEL_51:
            v81 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
            v82 = objc_allocWithZone(v81);
            v83 = (char *)objc_allocWithZone(v81);
            v84 = &v83[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
            *(_QWORD *)v84 = 0;
            v84[8] = 1;
            *(_OWORD *)&v83[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier] = xmmword_24549CD20;
            *(_QWORD *)&v83[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = v30;
            v121.receiver = v83;
            v121.super_class = v81;
            v85 = v30;
            v62 = objc_msgSendSuper2(&v121, sel_init);
            swift_getObjectType();
            swift_deallocPartialClassInstance();
            v31 = v118;
            goto LABEL_59;
          }
        }
      }
    }
    v75 = objc_msgSend(v118, sel_modelIdentifier);
    if (v75)
    {
      v76 = v75;
      v77 = objc_msgSend(v75, sel_otherModelTypeName);

      if (v77)
      {
        v78 = sub_24549A0B4();
        v80 = v79;

        if (v80)
        {
          if (v78 == 0x6B6361626C6C6166 && v80 == 0xE800000000000000)
          {
LABEL_50:
            swift_bridgeObjectRelease();
            goto LABEL_51;
          }
          v86 = sub_24549A4A4();
          swift_bridgeObjectRelease();
          if ((v86 & 1) != 0)
            goto LABEL_51;
        }
      }
    }
    v31 = v118;
    v87 = sub_245487F78(v118, v30);
    if (!v120)
    {
      v62 = v87;
      goto LABEL_59;
    }
    v119 = v30;
    if (qword_254413850 != -1)
      swift_once();
    v88 = sub_24549A078();
    __swift_project_value_buffer(v88, (uint64_t)qword_254413928);
    v53 = v120;
    v89 = v120;
    v90 = v120;
    swift_bridgeObjectRetain();
    v56 = sub_24549A060();
    v57 = sub_24549A1E0();
    if (!os_log_type_enabled(v56, v57))
    {
LABEL_57:

      swift_bridgeObjectRelease_n();
      return;
    }
LABEL_30:
    v58 = swift_slowAlloc();
    v59 = (_QWORD *)swift_slowAlloc();
    v60 = (void *)swift_slowAlloc();
    v124 = v60;
    *(_DWORD *)v58 = 136315394;
    swift_bridgeObjectRetain();
    sub_2454720F4(v34, v36, (uint64_t *)&v124);
    sub_24549A258();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v58 + 12) = 2112;
    v61 = v53;
    v122 = _swift_stdlib_bridgeErrorToNSError();
    sub_24549A258();
    *v59 = v122;

    _os_log_impl(&dword_245461000, v56, v57, "Model error for %s: %@", (uint8_t *)v58, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254413840);
    swift_arrayDestroy();
    MEMORY[0x2495350C0](v59, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2495350C0](v60, -1, -1);
    MEMORY[0x2495350C0](v58, -1, -1);

    return;
  }
  if (qword_254413850 != -1)
    swift_once();
  v43 = sub_24549A078();
  __swift_project_value_buffer(v43, (uint64_t)qword_254413928);
  v44 = v118;
  v45 = sub_24549A060();
  v46 = sub_24549A1D4();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    v48 = (void *)swift_slowAlloc();
    v124 = v48;
    *(_DWORD *)v47 = 136315138;
    v49 = sub_2454904DC();
    v122 = sub_2454720F4(v49, v50, (uint64_t *)&v124);
    sub_24549A258();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_245461000, v45, v46, "PeopleSuggestion missing required fields: %s", v47, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495350C0](v48, -1, -1);
    MEMORY[0x2495350C0](v47, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_2454904DC()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v1 = v0;
  sub_24549A354();
  sub_24549A0E4();
  v2 = objc_msgSend(v0, sel_identifier);
  if (v2)
  {
    v3 = v2;
    v4 = sub_24549A0B4();
    v6 = v5;

  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473848);
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v7 = objc_msgSend(v1, sel_model, v4, v6);
  if (v7)
  {
    v8 = v7;
    v9 = sub_24549A0B4();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v12 = objc_msgSend(v1, sel_modelIdentifier, v9, v11);
  if (v12)
  {
    v13 = v12;
    sub_2454913F4();

  }
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v14 = objc_msgSend(v1, sel_transportBundleId);
  if (v14)
  {
    v15 = v14;
    v16 = sub_24549A0B4();
    v18 = v17;

  }
  else
  {
    v16 = 0;
    v18 = 0;
  }
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  LODWORD(v20) = objc_msgSend(v1, sel_rank, v16, v18);
  sub_24549A498();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  objc_msgSend(v1, sel_score, v20);
  sub_24549A180();
  sub_24549A0E4();
  return 0;
}

void sub_2454907F8(void **a1, uint64_t *a2, id a3)
{
  void *v5;
  unsigned int v6;
  char v7;
  char isUniquelyReferenced_nonNull_native;
  __int16 v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  NSObject *log;
  os_log_type_t type;
  uint64_t v22;

  v5 = *a1;
  v6 = objc_msgSend(a3, sel_rank);
  if (v6 >= 0x100)
  {
    sub_24549A3E4();
    __break(1u);
  }
  else
  {
    v7 = v6;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v22 = *a2;
    *a2 = 0x8000000000000000;
    v9 = sub_2454961D0(v7, v5, isUniquelyReferenced_nonNull_native);
    *a2 = v22;
    swift_bridgeObjectRelease();
    if ((v9 & 0x100) == 0)
    {
      if (qword_254413850 != -1)
        swift_once();
      v10 = sub_24549A078();
      __swift_project_value_buffer(v10, (uint64_t)qword_254413928);
      v11 = v5;
      v12 = a3;
      v13 = v11;
      v14 = v12;
      v15 = sub_24549A060();
      v16 = sub_24549A1E0();
      if (os_log_type_enabled(v15, v16))
      {
        type = v16;
        v17 = swift_slowAlloc();
        log = v15;
        v18 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v17 = 138412802;
        v19 = v13;
        sub_24549A258();
        *v18 = v13;

        *(_WORD *)(v17 + 12) = 256;
        sub_24549A258();
        *(_WORD *)(v17 + 15) = 1024;
        objc_msgSend(v14, sel_rank);

        sub_24549A258();
        _os_log_impl(&dword_245461000, log, type, "duplicate ranks for %@: %hhu, %u", (uint8_t *)v17, 0x15u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254413840);
        swift_arrayDestroy();
        MEMORY[0x2495350C0](v18, -1, -1);
        MEMORY[0x2495350C0](v17, -1, -1);

      }
      else
      {

      }
    }
  }
}

uint64_t sub_245490B2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_24549A354();
  sub_24549A0E4();
  sub_245499FB8();
  sub_245464488(&qword_257473EC0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
  sub_24549A498();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  sub_24549A3D8();
  sub_24549A0E4();
  v0 = swift_bridgeObjectRetain();
  v1 = sub_24548C9E8(v0);
  swift_bridgeObjectRelease();
  v2 = MEMORY[0x24BEE0D00];
  MEMORY[0x249534748](v1, MEMORY[0x24BEE0D00]);
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v3 = swift_bridgeObjectRetain();
  sub_24548CC44(v3);
  v5 = v4;
  swift_bridgeObjectRelease();
  MEMORY[0x249534748](v5, v2);
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  return 0;
}

uint64_t sub_245490D50(uint64_t a1)
{
  uint64_t v1;

  if ((*(_BYTE *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8) & 1) == 0)
    return PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(*(_QWORD *)(a1
                                                                                     + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType));
  if (!*(_QWORD *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8))
    return 0x676E697373696D3CLL;
  v1 = *(_QWORD *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_245490DE0(uint64_t a1)
{
  if ((*(_BYTE *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType + 8) & 1) != 0)
  {
    if (*(_QWORD *)(a1 + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier + 8))
      swift_bridgeObjectRetain();
  }
  else
  {
    PeopleSuggestions.PeopleSuggestion.ModelType.description.getter(*(_QWORD *)(a1
                                                                              + OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType));
  }
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  sub_24549A498();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  return 0;
}

id PeopleSuggestionsJointEvent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PeopleSuggestionsJointEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PeopleSuggestionsJointEvent.__deallocating_deinit()
{
  return sub_245467658(type metadata accessor for PeopleSuggestionsJointEvent);
}

uint64_t sub_245490FC4()
{
  sub_24549A51C();
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  sub_24549A534();
  return sub_24549A54C();
}

uint64_t sub_245491034()
{
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  return sub_24549A534();
}

uint64_t sub_24549108C()
{
  sub_24549A51C();
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  sub_24549A534();
  return sub_24549A54C();
}

uint64_t sub_2454910F8(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  char v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a2 + 16);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
    return v2 ^ v3 ^ 1u;
  v5 = sub_24549A4A4();
  result = 0;
  if ((v5 & 1) != 0)
    return v2 ^ v3 ^ 1u;
  return result;
}

id sub_2454911E0()
{
  return sub_245467658((uint64_t (*)(_QWORD))type metadata accessor for PeopleSuggestionEventsHandler);
}

uint64_t sub_2454911EC()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[2];

  v1 = v0;
  sub_24549A354();
  swift_bridgeObjectRelease();
  strcpy((char *)v15, "(experiment: ");
  HIWORD(v15[1]) = -4864;
  v2 = objc_msgSend(v0, sel_task);
  if (v2)
  {
    v3 = v2;
    v4 = sub_24549A0B4();
    v6 = v5;

  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473848);
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v7 = objc_msgSend(v1, sel_treatment, v4, v6);
  if (v7)
  {
    v8 = v7;
    v9 = sub_24549A0B4();
    v11 = v10;

  }
  else
  {
    v9 = 0;
    v11 = 0;
  }
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v12 = objc_msgSend(v1, sel_deployment, v9, v11);
  if (v12)
  {
    v13 = v12;
    sub_24549A0B4();

  }
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  return v15[0];
}

uint64_t sub_2454913F4()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;

  v1 = v0;
  sub_24549A354();
  sub_24549A0E4();
  LODWORD(v10) = objc_msgSend(v0, sel_modelType);
  type metadata accessor for BMMLSEShareSheetInferencePeopleSuggestionsPeopleSuggestionModelIdentifierModelType(0);
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v2 = objc_msgSend(v0, sel_otherModelTypeName, v10);
  if (v2)
  {
    v3 = v2;
    v4 = sub_24549A0B4();
    v6 = v5;

  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257473848);
  sub_24549A0C0();
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  v7 = objc_msgSend(v1, sel_trialIdentifier, v4, v6);
  if (v7)
  {
    v8 = v7;
    sub_2454911EC();

  }
  sub_24549A0E4();
  swift_bridgeObjectRelease();
  sub_24549A0E4();
  return 0;
}

uint64_t sub_2454915B8(unint64_t *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0) - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_245496194(v3);
  v4 = *(_QWORD *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_24549163C(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_24549163C(uint64_t *a1)
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
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
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
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
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
  unint64_t v74;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v76;
  unint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  uint64_t v103;
  char v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  BOOL v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  uint64_t v121;
  char *v122;
  char *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  unint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;

  v2 = v1;
  v4 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  v144 = *(_QWORD *)(v4 - 8);
  v145 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v141 = (uint64_t)&v135 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v151 = (uint64_t)&v135 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v148 = (uint64_t)&v135 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v147 = (uint64_t)&v135 - v11;
  v12 = a1[1];
  result = sub_24549A48C();
  if (result >= v12)
  {
    if (v12 < 0)
      goto LABEL_138;
    if (v12)
      return sub_24549276C(0, v12, 1, a1);
    return result;
  }
  if (v12 >= 0)
    v14 = v12;
  else
    v14 = v12 + 1;
  if (v12 < -1)
    goto LABEL_146;
  v138 = result;
  if (v12 < 2)
  {
    v18 = (char *)MEMORY[0x24BEE4AF8];
    v143 = MEMORY[0x24BEE4AF8]
         + ((*(unsigned __int8 *)(v144 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v144 + 80));
    v137 = MEMORY[0x24BEE4AF8];
    if (v12 != 1)
    {
      v20 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_104:
      if (v20 >= 2)
      {
        v128 = *a1;
        do
        {
          v129 = v20 - 2;
          if (v20 < 2)
            goto LABEL_133;
          if (!v128)
            goto LABEL_145;
          v130 = v18;
          v131 = *(_QWORD *)&v18[16 * v129 + 32];
          v132 = *(_QWORD *)&v18[16 * v20 + 24];
          sub_245492994(v128 + *(_QWORD *)(v144 + 72) * v131, v128 + *(_QWORD *)(v144 + 72) * *(_QWORD *)&v18[16 * v20 + 16], v128 + *(_QWORD *)(v144 + 72) * v132, v143);
          if (v2)
            break;
          if (v132 < v131)
            goto LABEL_134;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v130 = sub_245485A8C((uint64_t)v18);
          if (v129 >= *((_QWORD *)v130 + 2))
            goto LABEL_135;
          v133 = &v130[16 * v129 + 32];
          *(_QWORD *)v133 = v131;
          *((_QWORD *)v133 + 1) = v132;
          v134 = *((_QWORD *)v130 + 2);
          if (v20 > v134)
            goto LABEL_136;
          memmove(&v130[16 * v20 + 16], &v130[16 * v20 + 32], 16 * (v134 - v20));
          *((_QWORD *)v130 + 2) = v134 - 1;
          v20 = v134 - 1;
          v18 = v130;
        }
        while (v134 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v137 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v15 = v14 >> 1;
    v16 = sub_24549A15C();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = *(unsigned __int8 *)(v144 + 80);
    v137 = v16;
    v143 = v16 + ((v17 + 32) & ~v17);
  }
  v19 = 0;
  v18 = (char *)MEMORY[0x24BEE4AF8];
  v150 = a1;
  while (1)
  {
    v21 = v19;
    v22 = v19 + 1;
    v142 = v19;
    if (v19 + 1 >= v12)
    {
      v34 = v19 + 1;
      goto LABEL_24;
    }
    v146 = *a1;
    v23 = v146;
    v24 = *(_QWORD *)(v144 + 72);
    v152 = v24;
    v25 = v147;
    sub_2454968EC(v146 + v24 * v22, v147);
    v26 = v23 + v24 * v21;
    v27 = v148;
    sub_2454968EC(v26, v148);
    sub_245499F94();
    v29 = v28;
    sub_245499F94();
    v31 = v30;
    v32 = v27;
    v33 = v146;
    sub_245496930(v32);
    sub_245496930(v25);
    v34 = v21 + 2;
    if (v21 + 2 >= v12)
    {
LABEL_21:
      if (v29 >= v31)
        goto LABEL_24;
LABEL_42:
      if (v34 < v21)
        goto LABEL_139;
      if (v21 < v34)
      {
        v139 = v18;
        v140 = v12;
        v64 = 0;
        v65 = v152;
        v66 = v152 * (v34 - 1);
        v67 = v21;
        v68 = v34 * v152;
        v69 = v67;
        v70 = v67 * v152;
        do
        {
          if (v69 != v34 + v64 - 1)
          {
            v72 = v34;
            v73 = v146;
            if (!v146)
              goto LABEL_144;
            v74 = v146 + v70;
            v149 = v146 + v66;
            sub_24546A628(v146 + v70, v141, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
            if (v70 < v66 || v74 >= v73 + v68)
            {
              v71 = v149;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              v71 = v149;
              if (v70 != v66)
                swift_arrayInitWithTakeBackToFront();
            }
            sub_24546A628(v141, v71, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
            a1 = v150;
            v34 = v72;
            v65 = v152;
          }
          ++v69;
          --v64;
          v66 -= v65;
          v68 -= v65;
          v70 += v65;
        }
        while (v69 < v34 + v64);
        v18 = v139;
        v12 = v140;
        v21 = v142;
      }
      goto LABEL_24;
    }
    v136 = v2;
    v139 = v18;
    v149 = v152 * v22;
    v35 = v152 * v34;
    while (1)
    {
      v36 = v12;
      v37 = v34;
      v38 = v147;
      sub_2454968EC(v33 + v35, v147);
      v39 = v148;
      sub_2454968EC(v33 + v149, v148);
      sub_245499F94();
      v41 = v40;
      sub_245499F94();
      v43 = v41 >= v42;
      sub_245496930(v39);
      sub_245496930(v38);
      if (v29 < v31 == v43)
        break;
      v34 = v37 + 1;
      v33 += v152;
      v12 = v36;
      if (v36 == v37 + 1)
      {
        v34 = v36;
        v18 = v139;
        v2 = v136;
        v21 = v142;
        goto LABEL_21;
      }
    }
    v18 = v139;
    v34 = v37;
    v2 = v136;
    v21 = v142;
    v12 = v36;
    if (v29 < v31)
      goto LABEL_42;
LABEL_24:
    if (v34 >= v12)
      goto LABEL_56;
    if (__OFSUB__(v34, v21))
      goto LABEL_137;
    if (v34 - v21 >= v138)
      goto LABEL_56;
    if (__OFADD__(v21, v138))
      goto LABEL_140;
    v44 = v21 + v138 >= v12 ? v12 : v21 + v138;
    if (v44 < v21)
      break;
    if (v34 != v44)
    {
      v139 = v18;
      v140 = v44;
      v136 = v2;
      v45 = *(_QWORD *)(v144 + 72);
      v46 = v45 * (v34 - 1);
      v146 = v45;
      v47 = v34 * v45;
      do
      {
        v49 = 0;
        v149 = v34;
        while (1)
        {
          v152 = v21;
          v50 = *a1;
          v51 = v47;
          v52 = v47 + v49 + *a1;
          v53 = a1;
          v54 = v147;
          sub_2454968EC(v52, v147);
          v55 = v46;
          v56 = v46 + v49 + v50;
          v57 = v148;
          sub_2454968EC(v56, v148);
          sub_245499F94();
          v59 = v58;
          sub_245499F94();
          v61 = v60;
          sub_245496930(v57);
          sub_245496930(v54);
          if (v59 >= v61)
            break;
          v62 = *v53;
          if (!*v53)
            goto LABEL_142;
          v47 = v51;
          v46 = v55;
          v63 = v62 + v55 + v49;
          sub_24546A628(v62 + v51 + v49, v151, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
          swift_arrayInitWithTakeFrontToBack();
          sub_24546A628(v151, v63, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
          v49 -= v146;
          v21 = v152 + 1;
          v48 = v149;
          a1 = v150;
          if (v149 == v152 + 1)
            goto LABEL_35;
        }
        a1 = v53;
        v48 = v149;
        v46 = v55;
        v47 = v51;
LABEL_35:
        v34 = v48 + 1;
        v46 += v146;
        v47 += v146;
        v21 = v142;
      }
      while (v34 != v140);
      v34 = v140;
      v2 = v136;
      v18 = v139;
    }
LABEL_56:
    if (v34 < v21)
      goto LABEL_132;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v149 = v34;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v18 = sub_2454857D4(0, *((_QWORD *)v18 + 2) + 1, 1, v18);
    v77 = *((_QWORD *)v18 + 2);
    v76 = *((_QWORD *)v18 + 3);
    v20 = v77 + 1;
    if (v77 >= v76 >> 1)
      v18 = sub_2454857D4((char *)(v76 > 1), v77 + 1, 1, v18);
    *((_QWORD *)v18 + 2) = v20;
    v78 = v18 + 32;
    v79 = &v18[16 * v77 + 32];
    v80 = v149;
    *(_QWORD *)v79 = v21;
    *((_QWORD *)v79 + 1) = v80;
    if (v77)
    {
      while (1)
      {
        v81 = v20 - 1;
        if (v20 >= 4)
        {
          v86 = &v78[16 * v20];
          v87 = *((_QWORD *)v86 - 8);
          v88 = *((_QWORD *)v86 - 7);
          v92 = __OFSUB__(v88, v87);
          v89 = v88 - v87;
          if (v92)
            goto LABEL_121;
          v91 = *((_QWORD *)v86 - 6);
          v90 = *((_QWORD *)v86 - 5);
          v92 = __OFSUB__(v90, v91);
          v84 = v90 - v91;
          v85 = v92;
          if (v92)
            goto LABEL_122;
          v93 = v20 - 2;
          v94 = &v78[16 * v20 - 32];
          v96 = *(_QWORD *)v94;
          v95 = *((_QWORD *)v94 + 1);
          v92 = __OFSUB__(v95, v96);
          v97 = v95 - v96;
          if (v92)
            goto LABEL_124;
          v92 = __OFADD__(v84, v97);
          v98 = v84 + v97;
          if (v92)
            goto LABEL_127;
          if (v98 >= v89)
          {
            v116 = &v78[16 * v81];
            v118 = *(_QWORD *)v116;
            v117 = *((_QWORD *)v116 + 1);
            v92 = __OFSUB__(v117, v118);
            v119 = v117 - v118;
            if (v92)
              goto LABEL_131;
            v109 = v84 < v119;
            goto LABEL_93;
          }
        }
        else
        {
          if (v20 != 3)
          {
            v110 = *((_QWORD *)v18 + 4);
            v111 = *((_QWORD *)v18 + 5);
            v92 = __OFSUB__(v111, v110);
            v103 = v111 - v110;
            v104 = v92;
            goto LABEL_87;
          }
          v83 = *((_QWORD *)v18 + 4);
          v82 = *((_QWORD *)v18 + 5);
          v92 = __OFSUB__(v82, v83);
          v84 = v82 - v83;
          v85 = v92;
        }
        if ((v85 & 1) != 0)
          goto LABEL_123;
        v93 = v20 - 2;
        v99 = &v78[16 * v20 - 32];
        v101 = *(_QWORD *)v99;
        v100 = *((_QWORD *)v99 + 1);
        v102 = __OFSUB__(v100, v101);
        v103 = v100 - v101;
        v104 = v102;
        if (v102)
          goto LABEL_126;
        v105 = &v78[16 * v81];
        v107 = *(_QWORD *)v105;
        v106 = *((_QWORD *)v105 + 1);
        v92 = __OFSUB__(v106, v107);
        v108 = v106 - v107;
        if (v92)
          goto LABEL_129;
        if (__OFADD__(v103, v108))
          goto LABEL_130;
        if (v103 + v108 >= v84)
        {
          v109 = v84 < v108;
LABEL_93:
          if (v109)
            v81 = v93;
          goto LABEL_95;
        }
LABEL_87:
        if ((v104 & 1) != 0)
          goto LABEL_125;
        v112 = &v78[16 * v81];
        v114 = *(_QWORD *)v112;
        v113 = *((_QWORD *)v112 + 1);
        v92 = __OFSUB__(v113, v114);
        v115 = v113 - v114;
        if (v92)
          goto LABEL_128;
        if (v115 < v103)
          goto LABEL_14;
LABEL_95:
        v120 = v81 - 1;
        if (v81 - 1 >= v20)
        {
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
LABEL_140:
          __break(1u);
          goto LABEL_141;
        }
        v121 = *a1;
        if (!*a1)
          goto LABEL_143;
        v122 = v18;
        v123 = &v78[16 * v120];
        v124 = *(_QWORD *)v123;
        v125 = &v78[16 * v81];
        v126 = *((_QWORD *)v125 + 1);
        sub_245492994(v121 + *(_QWORD *)(v144 + 72) * *(_QWORD *)v123, v121 + *(_QWORD *)(v144 + 72) * *(_QWORD *)v125, v121 + *(_QWORD *)(v144 + 72) * v126, v143);
        if (v2)
          goto LABEL_115;
        if (v126 < v124)
          goto LABEL_118;
        if (v81 > *((_QWORD *)v122 + 2))
          goto LABEL_119;
        *(_QWORD *)v123 = v124;
        *(_QWORD *)&v78[16 * v120 + 8] = v126;
        v127 = *((_QWORD *)v122 + 2);
        if (v81 >= v127)
          goto LABEL_120;
        v18 = v122;
        v20 = v127 - 1;
        memmove(&v78[16 * v81], v125 + 16, 16 * (v127 - 1 - v81));
        *((_QWORD *)v122 + 2) = v127 - 1;
        a1 = v150;
        if (v127 <= 2)
          goto LABEL_14;
      }
    }
    v20 = 1;
LABEL_14:
    v12 = a1[1];
    v19 = v149;
    if (v149 >= v12)
      goto LABEL_104;
  }
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
  result = sub_24549A3E4();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for PeopleSuggestionInferenceEventTimestamped(uint64_t a1)
{
  return sub_245468948(a1, qword_257473F60);
}

unint64_t sub_245492000()
{
  unint64_t result;

  result = qword_257473E98;
  if (!qword_257473E98)
  {
    result = MEMORY[0x249535018](&unk_24549D204, &type metadata for PeopleSuggestionInferenceEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473E98);
  }
  return result;
}

uint64_t type metadata accessor for PeopleSuggesterFeedbackEventTimestamped(uint64_t a1)
{
  return sub_245468948(a1, qword_257473FF0);
}

unint64_t sub_245492058()
{
  unint64_t result;

  result = qword_257473EB0;
  if (!qword_257473EB0)
  {
    result = MEMORY[0x249535018](&unk_24549D1B4, &type metadata for PeopleSuggesterFeedbackEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257473EB0);
  }
  return result;
}

uint64_t type metadata accessor for PeopleSuggestionsJointEvent(uint64_t a1)
{
  return sub_245468948(a1, (uint64_t *)&unk_257474050);
}

uint64_t sub_2454920B0(uint64_t a1)
{
  uint64_t result;

  result = sub_245464488(&qword_257473EC8, type metadata accessor for PeopleSuggestionInferenceEventTimestamped, (uint64_t)&protocol conformance descriptor for PeopleSuggestionInferenceEventTimestamped);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2454920EC()
{
  return sub_245464488(&qword_257473ED0, type metadata accessor for PeopleSuggestionInferenceEventTimestamped, (uint64_t)&protocol conformance descriptor for PeopleSuggestionInferenceEventTimestamped);
}

uint64_t sub_245492118(uint64_t a1)
{
  uint64_t result;

  result = sub_245464488(&qword_257473ED8, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped, (uint64_t)&protocol conformance descriptor for PeopleSuggesterFeedbackEventTimestamped);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_245492154()
{
  return sub_245464488(qword_257473EE0, type metadata accessor for PeopleSuggesterFeedbackEventTimestamped, (uint64_t)&protocol conformance descriptor for PeopleSuggesterFeedbackEventTimestamped);
}

uint64_t getEnumTagSinglePayload for PeopleSuggestionInferenceEventTimestamped()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for PeopleSuggestionInferenceEventTimestamped()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t getEnumTagSinglePayload for PeopleSuggesterFeedbackEventTimestamped()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_245499FB8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggesterFeedbackEventTimestamped()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_245499FB8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggestionsJoiningResult()
{
  return &type metadata for PeopleSuggestionsJoiningResult;
}

uint64_t sub_2454922E0()
{
  return type metadata accessor for PeopleSuggestionsJointEvent(0);
}

uint64_t method lookup function for PeopleSuggestionsJointEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PeopleSuggestionsJointEvent.__allocating_init(timestamp:engagement:inferenceModels:engagedModelRanks:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t type metadata accessor for PeopleSuggestionEventsHandler()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for PeopleSuggesterFeedbackEventTimestamped.CodingKeys()
{
  return &type metadata for PeopleSuggesterFeedbackEventTimestamped.CodingKeys;
}

uint64_t _s15ReportingPlugin39PeopleSuggesterFeedbackEventTimestampedV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_245492380 + 4 * byte_24549CD35[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2454923B4 + 4 * byte_24549CD30[v4]))();
}

uint64_t sub_2454923B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2454923BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2454923C4);
  return result;
}

uint64_t sub_2454923D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2454923D8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2454923DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2454923E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggestionInferenceEventTimestamped.CodingKeys()
{
  return &type metadata for PeopleSuggestionInferenceEventTimestamped.CodingKeys;
}

uint64_t sub_245492404(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PeopleSuggestionsEventKey(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for PeopleSuggestionsEventKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for PeopleSuggestionsEventKey(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PeopleSuggestionsEventKey(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PeopleSuggestionsEventKey()
{
  return &type metadata for PeopleSuggestionsEventKey;
}

unint64_t sub_245492578()
{
  unint64_t result;

  result = qword_257474100;
  if (!qword_257474100)
  {
    result = MEMORY[0x249535018](&unk_24549CFDC, &type metadata for PeopleSuggestionsEventKey);
    atomic_store(result, (unint64_t *)&qword_257474100);
  }
  return result;
}

unint64_t sub_2454925C0()
{
  unint64_t result;

  result = qword_257474108;
  if (!qword_257474108)
  {
    result = MEMORY[0x249535018](&unk_24549D0D4, &type metadata for PeopleSuggestionInferenceEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257474108);
  }
  return result;
}

unint64_t sub_245492608()
{
  unint64_t result;

  result = qword_257474110;
  if (!qword_257474110)
  {
    result = MEMORY[0x249535018](&unk_24549D18C, &type metadata for PeopleSuggesterFeedbackEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257474110);
  }
  return result;
}

unint64_t sub_245492650()
{
  unint64_t result;

  result = qword_257474118;
  if (!qword_257474118)
  {
    result = MEMORY[0x249535018](&unk_24549D0FC, &type metadata for PeopleSuggesterFeedbackEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257474118);
  }
  return result;
}

unint64_t sub_245492698()
{
  unint64_t result;

  result = qword_257474120;
  if (!qword_257474120)
  {
    result = MEMORY[0x249535018](&unk_24549D124, &type metadata for PeopleSuggesterFeedbackEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257474120);
  }
  return result;
}

unint64_t sub_2454926E0()
{
  unint64_t result;

  result = qword_257474128;
  if (!qword_257474128)
  {
    result = MEMORY[0x249535018](&unk_24549D044, &type metadata for PeopleSuggestionInferenceEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257474128);
  }
  return result;
}

unint64_t sub_245492728()
{
  unint64_t result;

  result = qword_257474130;
  if (!qword_257474130)
  {
    result = MEMORY[0x249535018](&unk_24549D06C, &type metadata for PeopleSuggestionInferenceEventTimestamped.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257474130);
  }
  return result;
}

uint64_t sub_24549276C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
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

  v28 = a1;
  v29 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  v7 = MEMORY[0x24BDAC7A8](v29);
  v32 = (uint64_t)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v26 - v10;
  result = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)&v26 - v14;
  v31 = a3;
  v27 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v34 = v16 * (v31 - 1);
    v30 = v16;
    v33 = v16 * v31;
LABEL_5:
    v17 = 0;
    v18 = v28;
    while (1)
    {
      v19 = *a4;
      sub_2454968EC(v33 + v17 + *a4, (uint64_t)v15);
      sub_2454968EC(v34 + v17 + v19, (uint64_t)v11);
      sub_245499F94();
      v21 = v20;
      sub_245499F94();
      v23 = v22;
      sub_245496930((uint64_t)v11);
      result = sub_245496930((uint64_t)v15);
      if (v21 >= v23)
      {
LABEL_4:
        v34 += v30;
        v33 += v30;
        if (++v31 == v27)
          return result;
        goto LABEL_5;
      }
      v24 = *a4;
      if (!*a4)
        break;
      v25 = v24 + v34 + v17;
      sub_24546A628(v24 + v33 + v17, v32, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_24546A628(v32, v25, type metadata accessor for PeopleSuggestionInferenceEventTimestamped);
      v17 -= v30;
      if (v31 == ++v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_245492994(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  unint64_t v38;
  uint64_t result;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;

  v42 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  v8 = MEMORY[0x24BDAC7A8](v42);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v40 - v11;
  v14 = *(_QWORD *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1)
    goto LABEL_61;
  v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1)
    goto LABEL_62;
  v16 = (uint64_t)(a2 - a1) / v14;
  v45 = a1;
  v44 = a4;
  v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v29 = a4 + v19;
      v43 = a4 + v19;
      v45 = a2;
      v41 = a1;
      if (v19 >= 1 && a1 < a2)
      {
        v31 = -v14;
        do
        {
          v32 = a3 + v31;
          sub_2454968EC(v29 + v31, (uint64_t)v12);
          v33 = a2 + v31;
          sub_2454968EC(a2 + v31, (uint64_t)v10);
          sub_245499F94();
          v35 = v34;
          sub_245499F94();
          v37 = v36;
          sub_245496930((uint64_t)v10);
          sub_245496930((uint64_t)v12);
          if (v35 >= v37)
          {
            v38 = v43;
            v43 += v31;
            if (a3 < v38 || v32 >= v38)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v38)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v33 = a2;
          }
          else
          {
            if (a3 < a2 || v32 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v45 += v31;
          }
          v29 = v43;
          if (v43 <= a4)
            break;
          a2 = v33;
          a3 += v31;
        }
        while (v33 > v41);
      }
      goto LABEL_59;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v20 = a4 + v18;
    v43 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_2454968EC(a2, (uint64_t)v12);
        sub_2454968EC(a4, (uint64_t)v10);
        sub_245499F94();
        v23 = v22;
        sub_245499F94();
        v25 = v24;
        sub_245496930((uint64_t)v10);
        sub_245496930((uint64_t)v12);
        v26 = v45;
        if (v23 >= v25)
        {
          v28 = v44 + v14;
          if (v45 < v44 || v45 >= v28)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v45 != v44)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v44 = v28;
          v27 = a2;
        }
        else
        {
          v27 = a2 + v14;
          if (v45 < a2 || v45 >= v27)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v45 == a2)
          {
            v26 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        v45 = v26 + v14;
        a4 = v44;
        if (v44 >= v20)
          break;
        a2 = v27;
      }
      while (v27 < a3);
    }
LABEL_59:
    sub_2454858E4(&v45, &v44, (uint64_t *)&v43);
    return 1;
  }
LABEL_63:
  result = sub_24549A42C();
  __break(1u);
  return result;
}

uint64_t sub_245492DF4(_QWORD *a1, void *a2)
{
  return sub_245492FC8(a1, a2, (void (*)(_QWORD))type metadata accessor for AppSuggestions.AppSuggestion, &qword_257474168);
}

uint64_t sub_245492E08(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_24549A51C();
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  v8 = sub_24549A54C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24549A4A4() & 1) != 0)
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
      if (v19 || (sub_24549A4A4() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_245493F78(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_245492FB4(_QWORD *a1, void *a2)
{
  return sub_245492FC8(a1, a2, (void (*)(_QWORD))type metadata accessor for PeopleSuggestions.PeopleSuggestion, &qword_257474160);
}

uint64_t sub_245492FC8(_QWORD *a1, void *a2, void (*a3)(_QWORD), uint64_t *a4)
{
  uint64_t *v4;
  uint64_t *v7;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  char v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  char isUniquelyReferenced_nonNull_native;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v7 = v4;
  v10 = *v4;
  if ((*v4 & 0xC000000000000001) != 0)
  {
    if (v10 < 0)
      v11 = *v4;
    else
      v11 = v10 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v12 = a2;
    v13 = sub_24549A2E8();

    if (v13)
    {
      swift_bridgeObjectRelease();

      a3(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v35;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_24549A2DC();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v25 = sub_24549345C(v11, result + 1, a4, a3);
    v36 = v25;
    v26 = *(_QWORD *)(v25 + 16);
    if (*(_QWORD *)(v25 + 24) <= v26)
    {
      v31 = v26 + 1;
      v32 = v12;
      sub_245493C60(v31, a4);
      v27 = v36;
    }
    else
    {
      v27 = v25;
      v28 = v12;
    }
    sub_245493EF8((uint64_t)v12, v27);
    *v7 = v27;
    swift_bridgeObjectRelease();
    *a1 = v12;
  }
  else
  {
    swift_bridgeObjectRetain();
    v15 = sub_24549A228();
    v16 = -1 << *(_BYTE *)(v10 + 32);
    v17 = v15 & ~v16;
    if (((*(_QWORD *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) != 0)
    {
      a3(0);
      v18 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * v17);
      v19 = sub_24549A234();

      if ((v19 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v23 = *(void **)(*(_QWORD *)(*v4 + 48) + 8 * v17);
        *a1 = v23;
        v24 = v23;
        return 0;
      }
      v20 = ~v16;
      while (1)
      {
        v17 = (v17 + 1) & v20;
        if (((*(_QWORD *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8)) >> v17) & 1) == 0)
          break;
        v21 = *(id *)(*(_QWORD *)(v10 + 48) + 8 * v17);
        v22 = sub_24549A234();

        if ((v22 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v37 = *v4;
    *v4 = 0x8000000000000000;
    v30 = a2;
    sub_245494110((uint64_t)v30, v17, isUniquelyReferenced_nonNull_native, a4, a3);
    *v4 = v37;
    swift_bridgeObjectRelease();
    *a1 = v30;
  }
  return 1;
}

uint64_t sub_245493274(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;

  v9 = *v4;
  sub_24549A51C();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  sub_24549A534();
  v10 = sub_24549A54C();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  v12 = v10 & ~v11;
  v24 = a1;
  v23 = a4 & 1;
  if (((*(_QWORD *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    v13 = ~v11;
    v14 = *(_QWORD *)(v9 + 48);
    while (1)
    {
      v15 = v14 + 24 * v12;
      v16 = *(unsigned __int8 *)(v15 + 16);
      v17 = *(_QWORD *)v15 == a2 && *(_QWORD *)(v15 + 8) == a3;
      if ((v17 || (sub_24549A4A4() & 1) != 0) && ((v16 ^ a4) & 1) == 0)
        break;
      v12 = (v12 + 1) & v13;
      if (((*(_QWORD *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
        goto LABEL_11;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v20 = *(_QWORD *)(*v4 + 48) + 24 * v12;
    v22 = *(_QWORD *)v20;
    v21 = *(_QWORD *)(v20 + 8);
    LOBYTE(v20) = *(_BYTE *)(v20 + 16);
    *(_QWORD *)v24 = v22;
    *(_QWORD *)(v24 + 8) = v21;
    *(_BYTE *)(v24 + 16) = v20;
    swift_bridgeObjectRetain();
    return 0;
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = *v4;
    *v4 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    sub_245494294(a2, a3, v23, v12, isUniquelyReferenced_nonNull_native);
    *v4 = v25;
    swift_bridgeObjectRelease();
    *(_QWORD *)v24 = a2;
    *(_QWORD *)(v24 + 8) = a3;
    result = 1;
    *(_BYTE *)(v24 + 16) = v23;
  }
  return result;
}

uint64_t sub_24549345C(uint64_t a1, uint64_t a2, uint64_t *a3, void (*a4)(_QWORD))
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v6 = sub_24549A33C();
    v19 = v6;
    sub_24549A2A0();
    if (sub_24549A300())
    {
      a4(0);
      do
      {
        swift_dynamicCast();
        v6 = v19;
        v13 = *(_QWORD *)(v19 + 16);
        if (*(_QWORD *)(v19 + 24) <= v13)
        {
          sub_245493C60(v13 + 1, a3);
          v6 = v19;
        }
        result = sub_24549A228();
        v8 = v6 + 56;
        v9 = -1 << *(_BYTE *)(v6 + 32);
        v10 = result & ~v9;
        v11 = v10 >> 6;
        if (((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          v12 = __clz(__rbit64((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v14 = 0;
          v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v16 = v11 == v15;
            if (v11 == v15)
              v11 = 0;
            v14 |= v16;
            v17 = *(_QWORD *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(_QWORD *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12) = v18;
        ++*(_QWORD *)(v6 + 16);
      }
      while (sub_24549A300());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v6;
}

uint64_t sub_245493650()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257474148);
  v3 = sub_24549A330();
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
      sub_24549A51C();
      sub_24549A0D8();
      result = sub_24549A54C();
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

uint64_t sub_24549392C()
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
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  _QWORD *v32;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257474140);
  v3 = sub_24549A330();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v32 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v31 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v13 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v14 = v13 | (v10 << 6);
      }
      else
      {
        v15 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v31)
          goto LABEL_33;
        v16 = v32[v15];
        ++v10;
        if (!v16)
        {
          v10 = v15 + 1;
          if (v15 + 1 >= v31)
            goto LABEL_33;
          v16 = v32[v10];
          if (!v16)
          {
            v10 = v15 + 2;
            if (v15 + 2 >= v31)
              goto LABEL_33;
            v16 = v32[v10];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v31)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v30 = 1 << *(_BYTE *)(v2 + 32);
                if (v30 > 63)
                  bzero(v32, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v32 = -1 << v30;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v32[v17];
              if (!v16)
              {
                while (1)
                {
                  v10 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v10 >= v31)
                    goto LABEL_33;
                  v16 = v32[v10];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v10 = v17;
            }
          }
        }
LABEL_23:
        v7 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v10 << 6);
      }
      v18 = v2;
      v19 = *(_QWORD *)(v2 + 48) + 24 * v14;
      v20 = *(_QWORD *)v19;
      v21 = *(_QWORD *)(v19 + 8);
      v22 = *(_BYTE *)(v19 + 16);
      sub_24549A51C();
      swift_bridgeObjectRetain();
      sub_24549A0D8();
      swift_bridgeObjectRelease();
      sub_24549A534();
      result = sub_24549A54C();
      v23 = -1 << *(_BYTE *)(v4 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v8 + 8 * (v24 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v8 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v8 + 8 * v25);
        }
        while (v29 == -1);
        v11 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      v12 = *(_QWORD *)(v4 + 48) + 24 * v11;
      *(_QWORD *)v12 = v20;
      *(_QWORD *)(v12 + 8) = v21;
      *(_BYTE *)(v12 + 16) = v22;
      ++*(_QWORD *)(v4 + 16);
      v2 = v18;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_245493C54(uint64_t a1)
{
  return sub_245493C60(a1, &qword_257474150);
}

uint64_t sub_245493C60(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_24549A330();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v8 = (_QWORD *)(v4 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_33;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_33;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_33;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                v3 = v30;
                v29 = 1 << *(_BYTE *)(v4 + 32);
                if (v29 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v11)
                    goto LABEL_33;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17);
      result = sub_24549A228();
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

unint64_t sub_245493EF8(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_24549A228();
  result = sub_24549A288();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_245493F78(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_245493650();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_245494450();
      goto LABEL_22;
    }
    sub_24549495C();
  }
  v11 = *v4;
  sub_24549A51C();
  sub_24549A0D8();
  result = sub_24549A54C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_24549A4A4(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_24549A4D4();
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
          result = sub_24549A4A4();
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

void sub_245494110(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, void (*a5)(_QWORD))
{
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v9 = *(_QWORD *)(*v5 + 16);
  v10 = *(_QWORD *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0)
    goto LABEL_14;
  v11 = v9 + 1;
  if ((a3 & 1) != 0)
  {
    sub_245493C60(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_245494600(a4);
      goto LABEL_14;
    }
    sub_245494C08(v11, a4);
  }
  v12 = *v5;
  v13 = sub_24549A228();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    a5(0);
    v15 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
    v16 = sub_24549A234();

    if ((v16 & 1) != 0)
    {
LABEL_13:
      sub_24549A4D4();
      __break(1u);
    }
    else
    {
      v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v18 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
        v19 = sub_24549A234();

        if ((v19 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v20 + 48) + 8 * a2) = a1;
  v21 = *(_QWORD *)(v20 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v23;
}

uint64_t sub_245494294(uint64_t result, uint64_t a2, int a3, unint64_t a4, char a5)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v6 = v5;
  v10 = result;
  v11 = *(_QWORD *)(*v5 + 16);
  v12 = *(_QWORD *)(*v5 + 24);
  if (v12 > v11 && (a5 & 1) != 0)
    goto LABEL_18;
  if ((a5 & 1) != 0)
  {
    sub_24549392C();
  }
  else
  {
    if (v12 > v11)
    {
      result = (uint64_t)sub_2454947A0();
      goto LABEL_18;
    }
    sub_245494E7C();
  }
  v13 = *v5;
  sub_24549A51C();
  swift_bridgeObjectRetain();
  sub_24549A0D8();
  swift_bridgeObjectRelease();
  sub_24549A534();
  result = sub_24549A54C();
  v14 = -1 << *(_BYTE *)(v13 + 32);
  a4 = result & ~v14;
  v15 = v13 + 56;
  if (((*(_QWORD *)(v13 + 56 + ((a4 >> 3) & 0xFFFFFFFFFFFFF8)) >> a4) & 1) != 0)
  {
    v16 = ~v14;
    v17 = *(_QWORD *)(v13 + 48);
    do
    {
      v18 = v17 + 24 * a4;
      result = *(_QWORD *)v18;
      v19 = *(unsigned __int8 *)(v18 + 16);
      v20 = *(_QWORD *)v18 == v10 && *(_QWORD *)(v18 + 8) == a2;
      if (v20 || (result = sub_24549A4A4(), (result & 1) != 0))
      {
        if (((v19 ^ a3) & 1) == 0)
          goto LABEL_21;
      }
      a4 = (a4 + 1) & v16;
    }
    while (((*(_QWORD *)(v15 + ((a4 >> 3) & 0xFFFFFFFFFFFFF8)) >> a4) & 1) != 0);
  }
LABEL_18:
  v21 = *v6;
  *(_QWORD *)(*v6 + 8 * (a4 >> 6) + 56) |= 1 << a4;
  v22 = *(_QWORD *)(v21 + 48) + 24 * a4;
  *(_QWORD *)v22 = v10;
  *(_QWORD *)(v22 + 8) = a2;
  *(_BYTE *)(v22 + 16) = a3 & 1;
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_21:
  result = sub_24549A4D4();
  __break(1u);
  return result;
}

void *sub_245494450()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257474148);
  v2 = *v0;
  v3 = sub_24549A324();
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

id sub_245494600(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
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
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_24549A324();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
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
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2454947A0()
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257474140);
  v2 = *v0;
  v3 = sub_24549A324();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v13)
      goto LABEL_28;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_28;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
      {
        v9 = v21 + 2;
        if (v21 + 2 >= v13)
          goto LABEL_28;
        v22 = *(_QWORD *)(v6 + 8 * v9);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = *(_QWORD *)(v2 + 48) + v16;
    v19 = *(_QWORD *)v17;
    v18 = *(_QWORD *)(v17 + 8);
    LOBYTE(v17) = *(_BYTE *)(v17 + 16);
    v20 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v20 = v19;
    *(_QWORD *)(v20 + 8) = v18;
    *(_BYTE *)(v20 + 16) = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v23 = v21 + 3;
  if (v23 >= v13)
    goto LABEL_28;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24549495C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257474148);
  v3 = sub_24549A330();
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
    sub_24549A51C();
    swift_bridgeObjectRetain();
    sub_24549A0D8();
    result = sub_24549A54C();
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

uint64_t sub_245494C08(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_24549A330();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v29 = v2;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = v4 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v4 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_33;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    result = sub_24549A228();
    v22 = -1 << *(_BYTE *)(v6 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    result = swift_release_n();
    v3 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_245494E7C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257474140);
  v2 = sub_24549A330();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
    result = swift_release();
LABEL_35:
    *v0 = v3;
    return result;
  }
  v4 = 1 << *(_BYTE *)(v1 + 32);
  v28 = v1 + 56;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v1 + 56);
  v29 = (unint64_t)(v4 + 63) >> 6;
  v7 = v2 + 56;
  result = swift_retain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_24;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v14);
    ++v9;
    if (!v15)
    {
      v9 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_33;
      v15 = *(_QWORD *)(v28 + 8 * v9);
      if (!v15)
      {
        v9 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_33;
        v15 = *(_QWORD *)(v28 + 8 * v9);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v9 << 6);
LABEL_24:
    v17 = *(_QWORD *)(v1 + 48) + 24 * v13;
    v18 = *(_QWORD *)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(_BYTE *)(v17 + 16);
    sub_24549A51C();
    swift_bridgeObjectRetain_n();
    sub_24549A0D8();
    swift_bridgeObjectRelease();
    sub_24549A534();
    result = sub_24549A54C();
    v21 = -1 << *(_BYTE *)(v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v7 + 8 * (v22 >> 6))) != 0)
    {
      v10 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v7 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v7 + 8 * v23);
      }
      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    v11 = *(_QWORD *)(v3 + 48) + 24 * v10;
    *(_QWORD *)v11 = v18;
    *(_QWORD *)(v11 + 8) = v19;
    *(_BYTE *)(v11 + 16) = v20;
    ++*(_QWORD *)(v3 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    goto LABEL_35;
  }
  v15 = *(_QWORD *)(v28 + 8 * v16);
  if (v15)
  {
    v9 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v9 >= v29)
      goto LABEL_33;
    v15 = *(_QWORD *)(v28 + 8 * v9);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_245495168(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t *v3;
  uint64_t *v5;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v5 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_245472734(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v11 = *v5;
  v14 = *v5;
  *v5 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a3();
    v11 = v14;
  }
  swift_bridgeObjectRelease();
  v12 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v8);
  sub_245495404(v8, v11);
  *v5 = v11;
  swift_bridgeObjectRelease();
  return v12;
}

double sub_245495240@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  double result;
  uint64_t v11;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_245472828(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v11 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_245476954();
      v9 = v11;
    }
    sub_24546A54C((__int128 *)(*(_QWORD *)(v9 + 56) + 40 * v6), a2);
    sub_2454955D8(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_245495320(uint64_t a1, uint64_t a2, int a3, void (*a4)(void))
{
  uint64_t *v4;
  uint64_t *v6;
  unint64_t v10;
  char v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v6 = v4;
  swift_bridgeObjectRetain();
  v10 = sub_245472798(a1, a2, a3);
  LOBYTE(a3) = v11;
  swift_bridgeObjectRelease();
  if ((a3 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v6;
  v16 = *v6;
  *v6 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    a4();
    v13 = v16;
  }
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v10);
  sub_245495988(v10, v13);
  *v6 = v13;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_245495404(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_24549A27C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_24549A51C();
        swift_bridgeObjectRetain();
        sub_24549A0D8();
        v9 = sub_24549A54C();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_2454955D8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  unint64_t v16;
  __int128 *v17;
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
    result = sub_24549A27C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_24549A51C();
        PeopleSuggesterMetricsField.rawValue.getter();
        sub_24549A0D8();
        swift_bridgeObjectRelease();
        result = sub_24549A54C();
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_BYTE *)(v12 + v3);
          v14 = (_BYTE *)(v12 + v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = v15 + 40 * v3;
          v17 = (__int128 *)(v15 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= (unint64_t)v17 + 40))
          {
            v9 = *v17;
            v10 = v17[1];
            *(_QWORD *)(v16 + 32) = *((_QWORD *)v17 + 4);
            *(_OWORD *)v16 = v9;
            *(_OWORD *)(v16 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
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

unint64_t sub_2454957BC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  unint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_24549A27C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_24549A51C();
        sub_24549A528();
        result = sub_24549A54C();
        v10 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_BYTE *)(v11 + v3);
          v13 = (_BYTE *)(v11 + v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = v14 + 24 * v3;
          v16 = (__int128 *)(v14 + 24 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= (unint64_t)v16 + 24))
          {
            v9 = *v16;
            *(_QWORD *)(v15 + 16) = *((_QWORD *)v16 + 2);
            *(_OWORD *)v15 = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_245495988(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 *v14;
  __int128 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_24549A27C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = 24 * v6;
        sub_24549A51C();
        swift_bridgeObjectRetain();
        sub_24549A0D8();
        sub_24549A534();
        v10 = sub_24549A54C();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = v12 + 24 * v3;
          v14 = (__int128 *)(v12 + v9);
          if (24 * v3 < v9 || v13 >= (unint64_t)v14 + 24 || v3 != v6)
          {
            v15 = *v14;
            *(_QWORD *)(v13 + 16) = *((_QWORD *)v14 + 2);
            *(_OWORD *)v13 = v15;
          }
          v16 = *(_QWORD *)(a2 + 56);
          v17 = (_QWORD *)(v16 + 8 * v3);
          v18 = (_QWORD *)(v16 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= v18 + 1))
          {
            *v17 = *v18;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_245495B94(char a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_245472734(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_2454767A0();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v18[7] + v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_BYTE *)(v18[7] + v12) = a1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_245472CC8(result, a4 & 1);
  result = sub_245472734(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_24549A4E0();
  __break(1u);
  return result;
}

void sub_245495CE4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void (*a5)(void), void (*a6)(void))
{
  _QWORD *v6;
  _QWORD *v9;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v9 = v6;
  v14 = *v6;
  v16 = sub_245472734(a2, a3);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a4 & 1) == 0)
  {
    a5();
LABEL_7:
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = v22[7];

      *(_QWORD *)(v23 + 8 * v16) = a1;
      return;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v26 = (uint64_t *)(v22[6] + 16 * v16);
    *v26 = a2;
    v26[1] = a3;
    *(_QWORD *)(v22[7] + 8 * v16) = a1;
    v27 = v22[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v22[2] = v29;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  a6();
  v24 = sub_245472734(a2, a3);
  if ((v20 & 1) == (v25 & 1))
  {
    v16 = v24;
    v22 = (_QWORD *)*v9;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_24549A4E0();
  __break(1u);
}

void sub_245495E54(uint64_t a1, uint64_t a2, uint64_t a3, int a4, char a5, void (*a6)(void), void (*a7)(void))
{
  _QWORD *v7;
  _QWORD *v10;
  char v12;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;

  v10 = v7;
  v12 = a4;
  v15 = *v7;
  v17 = sub_245472798(a2, a3, a4);
  v18 = *(_QWORD *)(v15 + 16);
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v21 = v16;
  v22 = *(_QWORD *)(v15 + 24);
  if (v22 >= v20 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v22 >= v20 && (a5 & 1) == 0)
  {
    a6();
LABEL_7:
    v23 = (_QWORD *)*v10;
    if ((v21 & 1) != 0)
    {
LABEL_8:
      v24 = v23[7];

      *(_QWORD *)(v24 + 8 * v17) = a1;
      return;
    }
LABEL_11:
    v23[(v17 >> 6) + 8] |= 1 << v17;
    v27 = v23[6] + 24 * v17;
    *(_QWORD *)v27 = a2;
    *(_QWORD *)(v27 + 8) = a3;
    *(_BYTE *)(v27 + 16) = v12 & 1;
    *(_QWORD *)(v23[7] + 8 * v17) = a1;
    v28 = v23[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (!v29)
    {
      v23[2] = v30;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  a7();
  v25 = sub_245472798(a2, a3, v12 & 1);
  if ((v21 & 1) == (v26 & 1))
  {
    v17 = v25;
    v23 = (_QWORD *)*v10;
    if ((v21 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_24549A4E0();
  __break(1u);
}

unint64_t sub_245495FF0(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  a4[(result >> 6) + 8] |= 1 << result;
  v4 = 8 * result;
  *(_QWORD *)(a4[6] + v4) = a2;
  *(_QWORD *)(a4[7] + v4) = a3;
  v5 = a4[2];
  v6 = __OFADD__(v5, 1);
  v7 = v5 + 1;
  if (v6)
    __break(1u);
  else
    a4[2] = v7;
  return result;
}

unint64_t sub_245496038(unint64_t result, char a2, uint64_t a3, uint64_t a4, _QWORD *a5, double a6)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a5[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a5[6] + result) = a2;
  v6 = a5[7] + 24 * result;
  *(double *)v6 = a6;
  *(_QWORD *)(v6 + 8) = a3;
  *(_QWORD *)(v6 + 16) = a4;
  v7 = a5[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a5[2] = v9;
  return result;
}

unint64_t sub_245496088(unint64_t result, uint64_t a2, char a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a5[6] + 8 * result) = a2;
  v5 = a5[7] + 16 * result;
  *(_BYTE *)v5 = a3;
  *(_QWORD *)(v5 + 8) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_2454960D4(unint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = a6[7] + 16 * result;
  *(_BYTE *)v7 = a4;
  *(_QWORD *)(v7 + 8) = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

unint64_t sub_245496128(unint64_t result, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a4[6] + result) = a2;
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

uint64_t sub_24549616C(unint64_t a1)
{
  return sub_245471858(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_245496180(unint64_t a1)
{
  return sub_245471978(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_245496194(unint64_t a1)
{
  return sub_245471D9C(0, *(_QWORD *)(a1 + 16), 0, a1);
}

_QWORD *sub_2454961A8(_QWORD *a1)
{
  return sub_245471DC4(0, a1[2], 0, a1);
}

char *sub_2454961BC(uint64_t a1)
{
  return sub_245471EF0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2454961D0(char a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  unsigned __int8 v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  id v24;
  uint64_t result;

  v4 = v3;
  v8 = *v3;
  v10 = sub_245472894((uint64_t)a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = v9 ^ 1;
  v13 = v11 + ((v9 ^ 1) & 1);
  if (__OFADD__(v11, (v9 ^ 1) & 1))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_2454776B0();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      v18 = *(unsigned __int8 *)(v17 + v10);
      *(_BYTE *)(v17 + v10) = a1;
      return v18 & 0xFFFFFEFF | ((v12 & 1) << 8);
    }
    goto LABEL_11;
  }
  sub_245475650(v13, a3 & 1);
  v19 = sub_245472894((uint64_t)a2);
  if ((v14 & 1) == (v20 & 1))
  {
    v10 = v19;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_QWORD *)(v16[6] + 8 * v10) = a2;
    *(_BYTE *)(v16[7] + v10) = a1;
    v21 = v16[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      v24 = a2;
      v18 = 0;
      return v18 & 0xFFFFFEFF | ((v12 & 1) << 8);
    }
    goto LABEL_15;
  }
LABEL_16:
  type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  result = sub_24549A4E0();
  __break(1u);
  return result;
}

void (*sub_245496310(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_245496390(v6, a2, a3);
  return sub_245496364;
}

void sub_245496364(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_245496390(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x249534988](a2, a3);
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
    return sub_2454963FC;
  }
  __break(1u);
  return result;
}

void sub_2454963FC(id *a1)
{

}

uint64_t sub_245496408(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

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
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

void sub_245496490(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_24549A3FC();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_257474138);
      v3 = sub_24549A348();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_24549A3FC();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v41 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v39 = v1;
    while (1)
    {
      v8 = MEMORY[0x249534988](v7, v1);
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
        __break(1u);
        goto LABEL_37;
      }
      v10 = v8;
      v11 = sub_24549A228();
      v12 = -1 << *(_BYTE *)(v3 + 32);
      v13 = v11 & ~v12;
      v14 = v13 >> 6;
      v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
      v16 = 1 << v13;
      if (((1 << v13) & v15) != 0)
      {
        type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
        v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v18 = sub_24549A234();

        if ((v18 & 1) != 0)
        {
LABEL_11:
          swift_unknownObjectRelease();
          v1 = v39;
          goto LABEL_12;
        }
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_24549A234();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v39;
      }
      *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
      v22 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v9)
        goto LABEL_38;
      *(_QWORD *)(v3 + 16) = v23;
LABEL_12:
      if (v7 == v41)
        return;
    }
  }
  v24 = 0;
  v40 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v40)
  {
    v25 = *(id *)(v1 + 32 + 8 * v24);
    v26 = sub_24549A228();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_24549A234();

      if ((v33 & 1) != 0)
        goto LABEL_24;
      v34 = ~v27;
      v28 = (v28 + 1) & v34;
      v29 = v28 >> 6;
      v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
      v31 = 1 << v28;
      if ((v30 & (1 << v28)) != 0)
      {
        while (1)
        {
          v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
          v36 = sub_24549A234();

          if ((v36 & 1) != 0)
            break;
          v28 = (v28 + 1) & v34;
          v29 = v28 >> 6;
          v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
          v31 = 1 << v28;
          if ((v30 & (1 << v28)) == 0)
            goto LABEL_32;
        }
LABEL_24:

        v4 = v41;
        goto LABEL_25;
      }
LABEL_32:
      v4 = v41;
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_39;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v4)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

void sub_2454967E8(unint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  void **v5;
  void *v6;
  id v7;

  if (a1 >> 62)
  {
    v2 = sub_24549A3FC();
    if (!v2)
      return;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v2)
      return;
  }
  if (v2 < 1)
  {
    __break(1u);
  }
  else if ((a1 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v2; ++i)
    {
      v4 = (void *)MEMORY[0x249534988](i, a1);
      sub_245492FC8(&v7, v4, (void (*)(_QWORD))type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model, &qword_257474138);

    }
  }
  else
  {
    v5 = (void **)(a1 + 32);
    do
    {
      v6 = *v5++;
      sub_245492FC8(&v7, v6, (void (*)(_QWORD))type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model, &qword_257474138);

      --v2;
    }
    while (v2);
  }
}

uint64_t sub_2454968EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_245496930(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PeopleSuggestionInferenceEventTimestamped(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2454969A4(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X12 }
}

unint64_t sub_2454969F0()
{
  sub_24549A0E4();
  return 0xD000000000000012;
}

void sub_245496A6C()
{
  uint64_t v0;

  sub_2454969A4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_245496A7C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for ReportingError(uint64_t a1)
{
  return sub_245496AA4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_245496AA4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s15ReportingPlugin14ReportingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_245496A7C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ReportingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_245496A7C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_245496AA4(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ReportingError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_245496AA4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReportingError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ReportingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_245496C28(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_245496C40(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ReportingError()
{
  return &type metadata for ReportingError;
}

uint64_t SignpostEvent.init(rawValue:)@<X0>(unint64_t a1@<X0>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  char *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  _QWORD v24[2];

  v10 = sub_24549A24C();
  v11 = *(_QWORD *)(v10 - 8);
  result = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v24 - v13;
  if ((a2 & 1) == 0)
  {
    if (a1)
      goto LABEL_11;
    __break(1u);
    goto LABEL_16;
  }
  v13 = HIDWORD(a1);
  if (HIDWORD(a1))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (a1 >> 11 == 27)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  LODWORD(v13) = WORD1(a1);
  if (WORD1(a1) > 0x10u)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    v19 = (a1 & 0x3F) << 8;
    v20 = (v19 | (a1 >> 6)) + 33217;
    v21 = (v19 | (a1 >> 6) & 0x3F) << 8;
    v22 = (((v21 | (a1 >> 12) & 0x3F) << 8) | (a1 >> 18)) - 2122219023;
    v23 = (v21 | (a1 >> 12)) + 8487393;
    if ((_DWORD)v13)
      v15 = v22;
    else
      v15 = v23;
    if (a1 < 0x800)
      v15 = v20;
    goto LABEL_10;
  }
  if ((a1 & 0xFFFFFF80) != 0)
    goto LABEL_18;
  if (a1 > 0xFF)
  {
    __break(1u);
    goto LABEL_25;
  }
  v15 = (a1 + 1);
LABEL_10:
  v24[1] = (v15 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v15) >> 3)) & 7)));
LABEL_11:
  v16 = sub_24549A0CC();
  (*(void (**)(uint64_t))(a4 + 16))(v16);
  v17 = *(_QWORD *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v14, 1, a3))
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    v18 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(a5, v14, a3);
    v18 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(a5, v18, 1, a3);
}

uint64_t withSignpost<A>(_:_:around:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _QWORD **v18;
  void (*v19)(_QWORD *, uint64_t *, uint64_t *);
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];
  char v24;
  _QWORD *v25;

  v4 = sub_24549A03C();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_24549A078();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24549A054();
  MEMORY[0x24BDAC7A8](v9);
  if (qword_257473388 != -1)
    goto LABEL_22;
  while (1)
  {
    v10 = __swift_project_value_buffer(v5, (uint64_t)qword_2574739D8);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v10, v5);
    sub_24549A048();
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_24549A0FC();
    v11 = v23[1];
    v12 = v24;
    sub_24549A030();
    v13 = sub_24549A024();
    if ((v12 & 1) == 0)
    {
      if (v11)
        goto LABEL_8;
      __break(1u);
    }
    if (HIDWORD(v11))
      break;
    if (v11 >> 11 == 27)
      goto LABEL_27;
    if (WORD1(v11) > 0x10u)
      goto LABEL_24;
LABEL_8:
    if ((v13 & 0x8000000000000000) != 0 || HIDWORD(v13))
      goto LABEL_28;
    a1 = *(_QWORD **)(a2 + 16);
    v5 = *(unsigned __int8 *)(a2 + 24);
    v8 = (char *)*(unsigned __int8 *)(a2 + 25);
    v15 = *(_QWORD *)(a2 + 40);
    v14 = *(_QWORD *)(a2 + 48);
    v16 = (_BYTE *)swift_slowAlloc();
    if (v14)
    {
      if ((unint64_t)(v14 - 0x1000000000000000) >> 61 != 7)
        goto LABEL_25;
      v14 = swift_slowAlloc();
    }
    if (v15)
    {
      if ((unint64_t)(v15 - 0x400000000000000) >> 59 != 31)
        goto LABEL_26;
      v17 = swift_slowAlloc();
    }
    else
    {
      v17 = 0;
    }
    v25 = a1;
    v21 = v17;
    v22 = v14;
    *v16 = v5;
    v16[1] = (_BYTE)v8;
    v23[0] = v16 + 2;
    a2 = a1[2];
    if (a2)
    {
      swift_bridgeObjectRetain();
      v18 = (_QWORD **)(a1 + 5);
      do
      {
        v19 = (void (*)(_QWORD *, uint64_t *, uint64_t *))*(v18 - 1);
        a1 = *v18;
        swift_retain();
        v19(v23, &v22, &v21);
        swift_release();
        v18 += 2;
        --a2;
      }
      while (a2);
      sub_245497178((uint64_t)&v25);
    }
    __break(1u);
LABEL_22:
    swift_once();
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  result = sub_24549A3E4();
  __break(1u);
  return result;
}

uint64_t sub_245497178(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t dispatch thunk of SignpostEvent.init(rawValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_2454971A8(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    v3 = sub_24549A294();
    v5 = v4;
    v6 = sub_24549A30C();
    v8 = MEMORY[0x2495348C8](v3, v5, v6, v7);
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
LABEL_3:
      sub_245489D60(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_245485FEC(v3, v5, v2 != 0, a1);
    v9 = v13;
    sub_245489D60(v3, v5, v2 != 0);
    return v9;
  }
  result = sub_24548624C(a1);
  if ((v12 & 1) == 0)
  {
    v5 = v11;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v11)
    {
      v3 = result;
      if (result == 1 << *(_BYTE *)(a1 + 32))
        goto LABEL_3;
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_2454972B4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  id v5;

  v1 = *(void **)(v0 + 24);
  if (v1)
  {
    v2 = *(id *)(v0 + 24);
  }
  else
  {
    v3 = sub_24549730C(v0);
    v4 = *(void **)(v0 + 24);
    *(_QWORD *)(v0 + 24) = v3;
    v2 = v3;

    v1 = 0;
  }
  v5 = v1;
  return v2;
}

id sub_24549730C(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  type metadata accessor for PersistentContainer();
  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_24549A0A8();
  v4 = objc_msgSend(v2, sel_initWithName_, v3);

  v5 = *(void **)(a1 + 16);
  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254413820);
    v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_24549CD00;
    *(_QWORD *)(v6 + 32) = v5;
    v12[0] = v6;
    sub_24549A144();
    sub_2454996A8();
    v7 = v5;
    v8 = v4;
    v9 = (void *)sub_24549A120();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setPersistentStoreDescriptions_, v9, v12[0]);

  }
  v12[4] = sub_245497490;
  v12[5] = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_24549766C;
  v12[3] = &block_descriptor_0;
  v10 = _Block_copy(v12);
  objc_msgSend(v4, sel_loadPersistentStoresWithCompletionHandler_, v10);
  _Block_release(v10);
  return v4;
}

void sub_245497490(int a1, id a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  NSObject *oslog;
  uint64_t v12;

  if (a2)
  {
    v3 = a2;
    if (qword_254413850 != -1)
      swift_once();
    v4 = sub_24549A078();
    __swift_project_value_buffer(v4, (uint64_t)qword_254413928);
    v5 = a2;
    v6 = a2;
    oslog = sub_24549A060();
    v7 = sub_24549A1D4();
    if (os_log_type_enabled(oslog, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v8 = 138412290;
      v10 = a2;
      v12 = _swift_stdlib_bridgeErrorToNSError();
      sub_24549A258();
      *v9 = v12;

      _os_log_impl(&dword_245461000, oslog, v7, "Unable to load persistent stores: %@", v8, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254413840);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v9, -1, -1);
      MEMORY[0x2495350C0](v8, -1, -1);

    }
    else
    {

    }
  }
}

void sub_24549766C(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, void *);
  id v6;
  id v7;

  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, a3);
  swift_release();

}

uint64_t StreamBookmarkManager.__allocating_init()()
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = 0;
  return result;
}

uint64_t StreamBookmarkManager.init()()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  return result;
}

uint64_t sub_245497710(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  id v6;
  char *v7;
  void *v8;
  uint64_t inited;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  void (*v16)();
  id v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t aBlock[7];
  uint64_t v26;

  v26 = 0;
  v5 = sub_2454972B4();
  v6 = objc_msgSend(v5, sel_managedObjectModel);

  v7 = "tion\"8@\"NSError\"16";
  v8 = (void *)sub_24549A0A8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2574742B0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24549B250;
  strcpy((char *)(inited + 32), "STREAM_READER");
  *(_WORD *)(inited + 46) = -4864;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  sub_245467D0C(inited);
  v10 = (void *)sub_24549A084();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v6, sel_fetchRequestFromTemplateWithName_substitutionVariables_, v8, v10);

  if (v11)
  {
    v12 = sub_2454972B4();
    v13 = objc_msgSend(v12, sel_viewContext);

    v14 = (_QWORD *)swift_allocObject();
    v14[2] = &v26;
    v14[3] = v2;
    v14[4] = v11;
    v15 = swift_allocObject();
    v16 = sub_245499710;
    *(_QWORD *)(v15 + 16) = sub_245499710;
    *(_QWORD *)(v15 + 24) = v14;
    aBlock[4] = (uint64_t)sub_24549972C;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_245497C2C;
    aBlock[3] = (uint64_t)&block_descriptor_6;
    v7 = (char *)_Block_copy(aBlock);
    swift_retain();
    v17 = v11;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_performBlockAndWait_, v7);

    _Block_release(v7);
    LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v17 & 1) == 0)
      goto LABEL_9;
    __break(1u);
  }
  if (qword_254413850 != -1)
    swift_once();
  v18 = sub_24549A078();
  __swift_project_value_buffer(v18, (uint64_t)qword_254413928);
  v19 = sub_24549A060();
  v20 = sub_24549A1D4();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    aBlock[0] = v22;
    *(_DWORD *)v21 = 136315138;
    aBlock[6] = sub_2454720F4(0xD000000000000011, (unint64_t)v7 | 0x8000000000000000, aBlock);
    sub_24549A258();
    _os_log_impl(&dword_245461000, v19, v20, "No fetch template found for %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495350C0](v22, -1, -1);
    MEMORY[0x2495350C0](v21, -1, -1);
  }

  v16 = 0;
LABEL_9:
  v23 = v26;
  sub_24547D02C((uint64_t)v16);
  return v23;
}

void sub_245497ADC(void **a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;

  v2 = sub_2454972B4();
  v3 = objc_msgSend(v2, sel_viewContext);

  __swift_instantiateConcreteTypeFromMangledName(&qword_2574742B8);
  v6 = sub_24549A1F8();

  if (!(v6 >> 62))
  {
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_6;
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_2;
  }
  swift_bridgeObjectRetain();
  v7 = sub_24549A3FC();
  swift_bridgeObjectRelease();
  if (!v7)
    goto LABEL_12;
LABEL_6:
  if ((v6 & 0xC000000000000001) != 0)
  {
    MEMORY[0x249534988](0, v6);
    goto LABEL_9;
  }
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_unknownObjectRetain();
LABEL_9:
    swift_bridgeObjectRelease();
    type metadata accessor for StreamReader();
    v4 = swift_dynamicCastClass();
    if (v4)
      goto LABEL_3;
    swift_unknownObjectRelease();
LABEL_2:
    v4 = 0;
LABEL_3:
    v5 = *a1;
    *a1 = (void *)v4;

    return;
  }
  __break(1u);
}

uint64_t sub_245497C2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_245497C4C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  id v37;
  id v38;
  os_log_type_t type;
  uint64_t v40;
  _OWORD v41[2];
  uint64_t v42[6];

  v9 = (void *)sub_245497710(a1, a2);
  if (v4)
  {

LABEL_3:
    if (qword_254413850 != -1)
      swift_once();
    v10 = sub_24549A078();
    __swift_project_value_buffer(v10, (uint64_t)qword_254413928);
    swift_bridgeObjectRetain_n();
    v11 = sub_24549A060();
    v12 = sub_24549A1C8();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v42[0] = v14;
      *(_DWORD *)v13 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v41[0] = sub_2454720F4(a1, a2, v42);
      sub_24549A258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_245461000, v11, v12, "no stream reader %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v14, -1, -1);
      MEMORY[0x2495350C0](v13, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  v16 = v9;
  if (!v9)
    goto LABEL_3;
  v17 = objc_msgSend(v9, sel_bookmarks);
  if (!v17)
    goto LABEL_14;
  v18 = v17;
  type metadata accessor for Bookmark();
  sub_245498B70();
  v19 = sub_24549A198();

  swift_bridgeObjectRetain();
  v20 = sub_245499228(v19, a3, a4);
  swift_bridgeObjectRelease();
  v21 = (void *)sub_2454971A8(v20);
  swift_release();
  if (!v21)
  {
LABEL_14:
    if (qword_254413850 != -1)
      swift_once();
    v28 = sub_24549A078();
    __swift_project_value_buffer(v28, (uint64_t)qword_254413928);
    swift_bridgeObjectRetain_n();
    v29 = sub_24549A060();
    v30 = sub_24549A1C8();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v42[0] = v32;
      *(_DWORD *)v31 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v41[0] = sub_2454720F4(a1, a2, v42);
      sub_24549A258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_245461000, v29, v30, "No bookmarks for stream reader %s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v32, -1, -1);
      MEMORY[0x2495350C0](v31, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  v22 = objc_msgSend(v21, sel_data);
  if (!v22)
  {
    if (qword_254413850 != -1)
      swift_once();
    v33 = sub_24549A078();
    __swift_project_value_buffer(v33, (uint64_t)qword_254413928);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v34 = sub_24549A060();
    v35 = sub_24549A1D4();
    if (os_log_type_enabled(v34, v35))
    {
      type = v35;
      v36 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      v42[0] = v40;
      *(_DWORD *)v36 = 136315394;
      swift_bridgeObjectRetain();
      sub_2454720F4(a3, a4, v42);
      sub_24549A258();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v36 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v41[0] = sub_2454720F4(a1, a2, v42);
      sub_24549A258();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_245461000, v34, type, "No data found for bookmark named %s with stream reader %s", (uint8_t *)v36, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2495350C0](v40, -1, -1);
      MEMORY[0x2495350C0](v36, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }

    return 0;
  }
  v23 = v22;
  v24 = sub_245499F58();
  v26 = v25;

  v27 = objc_allocWithZone(MEMORY[0x24BDD1620]);
  sub_245499564(v24, v26);
  v37 = sub_2454994A8();
  sub_2454995A8(v24, v26);
  v38 = objc_msgSend(v37, sel_decodeObject);

  if (v38)
  {
    sub_24549A270();
    sub_2454995A8(v24, v26);

    swift_unknownObjectRelease();
  }
  else
  {
    sub_2454995A8(v24, v26);

    memset(v41, 0, sizeof(v41));
  }
  sub_24546ABE8((uint64_t)v41, (uint64_t)v42);
  if (!v42[3])
  {
    sub_2454891F4((uint64_t)v42);
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257474180);
  if (swift_dynamicCast())
    return v42[5];
  else
    return 0;
}

void sub_245498360(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  os_log_type_t v37;
  uint8_t *v38;

  v4 = sub_245497710(a2, a3);
  if (v3)
  {

  }
  else
  {
    v14 = v4;
    if (v4)
      goto LABEL_6;
  }
  v5 = (void *)objc_opt_self();
  v6 = (void *)sub_24549A0A8();
  v7 = sub_2454972B4();
  v8 = objc_msgSend(v7, sel_viewContext);

  v9 = objc_msgSend(v5, sel_entityForName_inManagedObjectContext_, v6, v8);
  if (!v9)
  {
    if (qword_254413850 != -1)
      swift_once();
    v33 = sub_24549A078();
    __swift_project_value_buffer(v33, (uint64_t)qword_254413928);
    v14 = sub_24549A060();
    v34 = sub_24549A1D4();
    if (os_log_type_enabled(v14, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_245461000, v14, v34, "No entity description for StreamReader", v35, 2u);
      MEMORY[0x2495350C0](v35, -1, -1);
    }
    goto LABEL_17;
  }
  v10 = v9;
  v11 = sub_2454972B4();
  v12 = objc_msgSend(v11, sel_viewContext);

  v13 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for StreamReader()), sel_initWithEntity_insertIntoManagedObjectContext_, v10, v12);
  v14 = v13;
  v15 = (void *)sub_24549A0A8();
  -[NSObject setName:](v14, sel_setName_, v15);

LABEL_6:
  v16 = (void *)objc_opt_self();
  v17 = (void *)sub_24549A0A8();
  v18 = sub_2454972B4();
  v19 = objc_msgSend(v18, sel_viewContext);

  v20 = objc_msgSend(v16, sel_entityForName_inManagedObjectContext_, v17, v19);
  if (v20)
  {
    v21 = v20;
    v22 = sub_2454972B4();
    v23 = objc_msgSend(v22, sel_viewContext);

    v24 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for Bookmark()), sel_initWithEntity_insertIntoManagedObjectContext_, v21, v23);
    v25 = (void *)sub_24549A0A8();
    objc_msgSend(v24, sel_setStreamName_, v25);

    objc_msgSend(v24, sel_setStreamReader_, v14);
    v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_, 1);
    objc_msgSend(v26, sel_encodeObject_, v24);
    v27 = objc_msgSend(v26, sel_encodedData);
    v28 = sub_245499F58();
    v30 = v29;

    v31 = (void *)sub_245499F4C();
    sub_2454995A8(v28, v30);
    objc_msgSend(v24, sel_setData_, v31);

    v32 = sub_2454972B4();
    sub_245498894(0);

LABEL_16:
    goto LABEL_17;
  }
  if (qword_254413850 != -1)
    swift_once();
  v36 = sub_24549A078();
  __swift_project_value_buffer(v36, (uint64_t)qword_254413928);
  v32 = sub_24549A060();
  v37 = sub_24549A1D4();
  if (!os_log_type_enabled(v32, v37))
    goto LABEL_16;
  v38 = (uint8_t *)swift_slowAlloc();
  *(_WORD *)v38 = 0;
  _os_log_impl(&dword_245461000, v32, v37, "No entity description for Bookmark", v38, 2u);
  MEMORY[0x2495350C0](v38, -1, -1);

  v14 = v32;
LABEL_17:

}

uint64_t StreamBookmarkManager.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t StreamBookmarkManager.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

void sub_245498894(void *a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  if (a1)
    v3 = a1;
  else
    v3 = objc_msgSend(v1, sel_viewContext);
  v4 = a1;
  v5 = objc_msgSend(v3, sel_hasChanges);
  if ((_DWORD)v5)
  {
    MEMORY[0x24BDAC7A8](v5);
    sub_24549A1EC();

  }
  else
  {
    if (qword_254413850 != -1)
      swift_once();
    v6 = sub_24549A078();
    __swift_project_value_buffer(v6, (uint64_t)qword_254413928);
    v7 = sub_24549A060();
    v8 = sub_24549A1C8();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_245461000, v7, v8, "no changes", v9, 2u);
      MEMORY[0x2495350C0](v9, -1, -1);
    }

  }
}

id sub_245498A10(void *a1)
{
  id v2;
  id v3[2];

  v3[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3[0] = 0;
  if (objc_msgSend(a1, sel_save_, v3))
    return v3[0];
  v2 = v3[0];
  sub_245499F40();

  return (id)swift_willThrow();
}

id sub_245498B40()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PersistentContainer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_245498B70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257474170;
  if (!qword_257474170)
  {
    v1 = type metadata accessor for Bookmark();
    result = MEMORY[0x249535018](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_257474170);
  }
  return result;
}

uint64_t sub_245498BB8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t *v28;

  v4 = a4;
  if (!a3)
  {
    v9 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v9;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257474150);
  result = sub_24549A348();
  v9 = result;
  v28 = a1;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_39;
    if (v15 >= a2)
      goto LABEL_36;
    v16 = v28[v15];
    ++v11;
    if (!v16)
    {
      v11 = v15 + 1;
      if (v15 + 1 >= a2)
        goto LABEL_36;
      v16 = v28[v11];
      if (!v16)
      {
        v11 = v15 + 2;
        if (v15 + 2 >= a2)
          goto LABEL_36;
        v16 = v28[v11];
        if (!v16)
          break;
      }
    }
LABEL_23:
    v10 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    v18 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    result = sub_24549A228();
    v19 = -1 << *(_BYTE *)(v9 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v12 + 8 * v21);
      }
      while (v26 == -1);
      v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }
    *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v9 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v9 + 16);
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
  v17 = v15 + 3;
  if (v17 >= a2)
    goto LABEL_36;
  v16 = v28[v17];
  if (v16)
  {
    v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= a2)
      goto LABEL_36;
    v16 = v28[v11];
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_245498E14(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;

  v28 = a2;
  v30 = 0;
  v7 = 0;
  v10 = *(_QWORD *)(a3 + 56);
  v8 = a3 + 56;
  v9 = v10;
  v11 = 1 << *(_BYTE *)(v8 - 24);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & v9;
  v31 = v8;
  v32 = (unint64_t)(v11 + 63) >> 6;
  while (v13)
  {
    v14 = __clz(__rbit64(v13));
    v13 &= v13 - 1;
    v15 = v14 | (v7 << 6);
LABEL_21:
    v19 = *(id *)(*(_QWORD *)(a3 + 48) + 8 * v15);
    v20 = objc_msgSend(v19, sel_streamName, v28);
    if (v20)
    {
      v21 = v20;
      v22 = sub_24549A0B4();
      v24 = v23;

      if (v22 == a4 && v24 == a5)
      {

        swift_bridgeObjectRelease();
LABEL_29:
        *(unint64_t *)((char *)a1 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
        if (__OFADD__(v30++, 1))
        {
          __break(1u);
LABEL_32:
          swift_retain();
          sub_245498BB8(a1, v28, v30, a3);
          return;
        }
      }
      else
      {
        v26 = sub_24549A4A4();

        swift_bridgeObjectRelease();
        if ((v26 & 1) != 0)
          goto LABEL_29;
      }
    }
    else
    {

    }
  }
  v16 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v16 >= v32)
    goto LABEL_32;
  v17 = *(_QWORD *)(v31 + 8 * v16);
  ++v7;
  if (v17)
    goto LABEL_20;
  v7 = v16 + 1;
  if (v16 + 1 >= v32)
    goto LABEL_32;
  v17 = *(_QWORD *)(v31 + 8 * v7);
  if (v17)
    goto LABEL_20;
  v7 = v16 + 2;
  if (v16 + 2 >= v32)
    goto LABEL_32;
  v17 = *(_QWORD *)(v31 + 8 * v7);
  if (v17)
  {
LABEL_20:
    v13 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v7 << 6);
    goto LABEL_21;
  }
  v18 = v16 + 3;
  if (v18 >= v32)
    goto LABEL_32;
  v17 = *(_QWORD *)(v31 + 8 * v18);
  if (v17)
  {
    v7 = v18;
    goto LABEL_20;
  }
  while (1)
  {
    v7 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v7 >= v32)
      goto LABEL_32;
    v17 = *(_QWORD *)(v31 + 8 * v7);
    ++v18;
    if (v17)
      goto LABEL_20;
  }
LABEL_34:
  __break(1u);
}

uint64_t sub_245499058(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v7;
  unsigned int v8;
  unint64_t v9;
  size_t v10;
  uint64_t isStackAllocationSafe;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v7 = *(_BYTE *)(a1 + 32);
  v8 = v7 & 0x3F;
  v9 = (unint64_t)((1 << v7) + 63) >> 6;
  v10 = 8 * v9;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v8 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v17 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0), v10);
    swift_bridgeObjectRetain();
    sub_245498E14((_QWORD *)((char *)v17 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0)), v9, a1, a2, a3);
    v13 = v12;
    swift_release();
    swift_bridgeObjectRelease();
    if (v3)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v14 = (void *)swift_slowAlloc();
    bzero(v14, v10);
    swift_bridgeObjectRetain();
    sub_245498E14((unint64_t *)v14, v9, a1, a2, a3);
    v13 = v15;
    swift_release();
    swift_bridgeObjectRelease();
    MEMORY[0x2495350C0](v14, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  return v13;
}

uint64_t sub_245499228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  id v25;
  uint64_t v26;

  if ((a1 & 0xC000000000000001) == 0)
    return sub_245499058(a1, a2, a3);
  v5 = MEMORY[0x24BEE4B08];
  v26 = MEMORY[0x24BEE4B08];
  swift_bridgeObjectRetain();
  sub_24549A2A0();
  if (!sub_24549A300())
    goto LABEL_29;
  type metadata accessor for Bookmark();
  do
  {
    swift_dynamicCast();
    v6 = objc_msgSend(v25, sel_streamName);
    if (!v6)
    {
LABEL_4:

      continue;
    }
    v7 = v6;
    v8 = sub_24549A0B4();
    v10 = v9;

    if (v8 == a2 && v10 == a3)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v12 = sub_24549A4A4();
      swift_bridgeObjectRelease();
      if ((v12 & 1) == 0)
        goto LABEL_4;
    }
    v13 = v26;
    v14 = *(_QWORD *)(v26 + 16);
    if (*(_QWORD *)(v26 + 24) <= v14)
    {
      sub_245493C54(v14 + 1);
      v13 = v26;
    }
    result = sub_24549A228();
    v16 = v13 + 56;
    v17 = -1 << *(_BYTE *)(v13 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v13 + 56 + 8 * (v18 >> 6))) != 0)
    {
      v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v13 + 56 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v21 = 0;
      v22 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          return result;
        }
        v23 = v19 == v22;
        if (v19 == v22)
          v19 = 0;
        v21 |= v23;
        v24 = *(_QWORD *)(v16 + 8 * v19);
      }
      while (v24 == -1);
      v20 = __clz(__rbit64(~v24)) + (v19 << 6);
    }
    *(_QWORD *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    *(_QWORD *)(*(_QWORD *)(v13 + 48) + 8 * v20) = v25;
    ++*(_QWORD *)(v13 + 16);
  }
  while (sub_24549A300());
  v5 = v26;
LABEL_29:
  swift_bridgeObjectRelease();
  swift_release();
  return v5;
}

id sub_2454994A8()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_245499F4C();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_245499F40();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_245499564(uint64_t a1, unint64_t a2)
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

uint64_t sub_2454995A8(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for StreamBookmarkManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for StreamBookmarkManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StreamBookmarkManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of StreamBookmarkManager.getBookmark(readerName:streamName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of StreamBookmarkManager.store(bookmark:forReader:withName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t type metadata accessor for PersistentContainer()
{
  return objc_opt_self();
}

id sub_245499678()
{
  uint64_t v0;

  return sub_245498A10(*(void **)(v0 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

unint64_t sub_2454996A8()
{
  unint64_t result;

  result = qword_2574742A8;
  if (!qword_2574742A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2574742A8);
  }
  return result;
}

uint64_t sub_2454996E4()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_245499710()
{
  uint64_t v0;

  sub_245497ADC(*(void ***)(v0 + 16));
}

uint64_t sub_24549971C()
{
  return swift_deallocObject();
}

uint64_t sub_24549972C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

id StreamReader.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id StreamReader.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for StreamReader();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for StreamReader()
{
  return objc_opt_self();
}

id StreamReader.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StreamReader();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static StreamReader.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_24549A0A8();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_245499918()
{
  return MEMORY[0x24BEE0948];
}

void sub_245499924(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_name);
  if (v3)
  {
    v4 = v3;
    v5 = sub_24549A0B4();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_245499988(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_24549A0A8();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setName_);

}

void sub_2454999E4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_bookmarks);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for Bookmark();
    sub_245498B70();
    v5 = sub_24549A198();

  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
}

void sub_245499A5C(_QWORD *a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*a1)
  {
    type metadata accessor for Bookmark();
    sub_245498B70();
    v3 = sub_24549A18C();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  objc_msgSend(v2, sel_setBookmarks_);

}

uint64_t sub_245499AD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for StreamReader();
  result = sub_24549A36C();
  *a1 = result;
  return result;
}

char *keypath_get_selector_name()
{
  return sel_name;
}

char *keypath_get_selector_bookmarks()
{
  return sel_bookmarks;
}

id Bookmark.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id Bookmark.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for Bookmark();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

uint64_t type metadata accessor for Bookmark()
{
  return objc_opt_self();
}

id Bookmark.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Bookmark();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id static Bookmark.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_24549A0A8();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_245499CF8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(*a1, sel_data);
  if (v3)
  {
    v4 = v3;
    v5 = sub_245499F58();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0xF000000000000000;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_245499D5C(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v3 = 0;
  else
    v3 = sub_245499F4C();
  v4 = (id)v3;
  objc_msgSend(v2, sel_setData_);

}

void sub_245499DC0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_streamName);
  if (v3)
  {
    v4 = v3;
    v5 = sub_24549A0B4();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_245499E24(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_24549A0A8();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setStreamName_);

}

uint64_t sub_245499E80@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for Bookmark();
  result = sub_24549A36C();
  *a1 = result;
  return result;
}

char *keypath_get_selector_data()
{
  return sel_data;
}

char *keypath_get_selector_streamName()
{
  return sel_streamName;
}

char *keypath_get_selector_streamReader()
{
  return sel_streamReader;
}

id sub_245499EF4@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_streamReader);
  *a2 = result;
  return result;
}

id sub_245499F2C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStreamReader_, *a1);
}

uint64_t sub_245499F40()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_245499F4C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_245499F58()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_245499F64()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_245499F70()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_245499F7C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_245499F88()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_245499F94()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_245499FA0()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_245499FAC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_245499FB8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_245499FC4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_245499FD0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_245499FDC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_245499FE8()
{
  return MEMORY[0x24BE0C8C0]();
}

uint64_t sub_245499FF4()
{
  return MEMORY[0x24BE0C8F0]();
}

uint64_t sub_24549A000()
{
  return MEMORY[0x24BE0C910]();
}

uint64_t sub_24549A00C()
{
  return MEMORY[0x24BE0C930]();
}

uint64_t sub_24549A018()
{
  return MEMORY[0x24BE0C960]();
}

uint64_t sub_24549A024()
{
  return MEMORY[0x24BEE7708]();
}

uint64_t sub_24549A030()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_24549A03C()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_24549A048()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t sub_24549A054()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_24549A060()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24549A06C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24549A078()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24549A084()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24549A090()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_24549A09C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_24549A0A8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24549A0B4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24549A0C0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24549A0CC()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_24549A0D8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24549A0E4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24549A0F0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24549A0FC()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_24549A108()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_24549A114()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24549A120()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24549A12C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24549A138()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24549A144()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24549A150()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24549A15C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_24549A168()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24549A174()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_24549A180()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_24549A18C()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_24549A198()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_24549A1A4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_24549A1B0()
{
  return MEMORY[0x24BEE1608]();
}

uint64_t sub_24549A1BC()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_24549A1C8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24549A1D4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24549A1E0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_24549A1EC()
{
  return MEMORY[0x24BDBB360]();
}

uint64_t sub_24549A1F8()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t sub_24549A204()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_24549A210()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_24549A21C()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_24549A228()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_24549A234()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24549A240()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_24549A24C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24549A258()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24549A264()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24549A270()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24549A27C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_24549A288()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_24549A294()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_24549A2A0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_24549A2AC()
{
  return MEMORY[0x24BEE2308]();
}

uint64_t sub_24549A2B8()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t sub_24549A2C4()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_24549A2D0()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_24549A2DC()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_24549A2E8()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_24549A2F4()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_24549A300()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_24549A30C()
{
  return MEMORY[0x24BEE2368]();
}

uint64_t sub_24549A318()
{
  return MEMORY[0x24BEE2370]();
}

uint64_t sub_24549A324()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_24549A330()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_24549A33C()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_24549A348()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24549A354()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24549A360()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24549A36C()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_24549A378()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24549A384()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_24549A390()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24549A39C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_24549A3A8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_24549A3B4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_24549A3C0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_24549A3CC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_24549A3D8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24549A3E4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24549A3F0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24549A3FC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24549A408()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24549A414()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24549A420()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24549A42C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24549A438()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_24549A444()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_24549A450()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_24549A45C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_24549A468()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_24549A474()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_24549A480()
{
  return MEMORY[0x24BEE34F8]();
}

uint64_t sub_24549A48C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_24549A498()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24549A4A4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24549A4B0()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_24549A4BC()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_24549A4C8()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_24549A4D4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_24549A4E0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24549A4EC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24549A4F8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24549A504()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24549A510()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24549A51C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24549A528()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24549A534()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_24549A540()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_24549A54C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24549A558()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t sub_24549A564()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24549A570()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24549A57C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_24549A588()
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

uint64_t DMGetUserDataDisposition()
{
  return MEMORY[0x24BE2B608]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
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

