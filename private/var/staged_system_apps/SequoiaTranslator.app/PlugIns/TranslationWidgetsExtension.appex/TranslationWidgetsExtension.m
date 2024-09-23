uint64_t sub_100001EC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v0 = sub_100002588(&qword_100010398);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100002544();
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000017, 0x8000000100009E90, &type metadata for OpenTranslationDeepLinksIntent, v4);
  v5 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenTranslationDeepLinksIntent, v4);
  v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000024, 0x8000000100009EB0, &type metadata for OpenTranslationDeepLinksIntent, v4);
  v7 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenTranslationDeepLinksIntent, v4);
  v6(v3, v0);
  _AssistantIntent.Phrase.init(stringLiteral:)(0xD000000000000021, 0x8000000100009EE0, &type metadata for OpenTranslationDeepLinksIntent, v4);
  v8 = static _AssistantIntent.PhraseBuilder.buildExpression(_:)(v3, &type metadata for OpenTranslationDeepLinksIntent, v4);
  v6(v3, v0);
  v9 = sub_100002588(&qword_1000103A0);
  v10 = swift_allocObject(v9, 56, 7);
  *(_OWORD *)(v10 + 16) = xmmword_100008CA0;
  *(_QWORD *)(v10 + 32) = v5;
  *(_QWORD *)(v10 + 40) = v7;
  *(_QWORD *)(v10 + 48) = v8;
  v11 = static _AssistantIntent.PhraseBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v10);
  return v11;
}

uint64_t sub_100002070()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t KeyPath;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v0 = type metadata accessor for _AssistantIntent.Value(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath("0|");
  v5 = sub_1000025C8();
  v6 = _AssistantIntent.IntentProjection.subscript.getter(KeyPath, v5);
  swift_release(KeyPath, v7);
  v8 = sub_100002544();
  _AssistantIntent.Value.init<A>(for:builder:)(v6, sub_1000021EC, 0, v8);
  v9 = static _AssistantIntent.ParameterValueBuilder.buildExpression(_:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v10 = sub_100002588(&qword_100010390);
  v11 = swift_allocObject(v10, 40, 7);
  *(_OWORD *)(v11 + 16) = xmmword_100008CB0;
  *(_QWORD *)(v11 + 32) = v9;
  v12 = static _AssistantIntent.ParameterValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v11);
  return v12;
}

_QWORD *sub_100002180@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_1000021B8(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

uint64_t sub_1000021EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0x74616C736E617254, 0xE900000000000065);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000014, 0x8000000100009E50);
  v2 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD000000000000010, 0x8000000100009E70);
  v3 = sub_100002588(&qword_100010378);
  v4 = swift_allocObject(v3, 56, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100008CA0;
  *(_QWORD *)(v4 + 32) = v0;
  *(_QWORD *)(v4 + 40) = v1;
  *(_QWORD *)(v4 + 48) = v2;
  v5 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v4);
  return v5;
}

uint64_t sub_1000022B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD00000000000001ELL, 0x8000000100009E10);
  v1 = static _AssistantIntent.StringValueBuilder.buildExpression(_:)(0xD00000000000001CLL, 0x8000000100009E30);
  v2 = sub_100002588(&qword_100010378);
  v3 = swift_allocObject(v2, 48, 7);
  *(_OWORD *)(v3 + 16) = xmmword_100008CC0;
  *(_QWORD *)(v3 + 32) = v0;
  *(_QWORD *)(v3 + 40) = v1;
  v4 = static _AssistantIntent.StringValueBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v3);
  return v4;
}

uint64_t sub_100002358()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v0 = type metadata accessor for _AssistantIntent(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100002C60();
  v4 = sub_100002544();
  _AssistantIntent.init<A>(_:phrases:parameterValues:)(&v11, sub_100001EC8, 0, sub_100002070, 0, &type metadata for OpenTranslationDeepLinksIntent, v4);
  v5 = static _AssistantIntent.Builder.buildExpression(_:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v6 = sub_100002588(&qword_100010380);
  v7 = swift_allocObject(v6, 40, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100008CB0;
  *(_QWORD *)(v7 + 32) = v5;
  v8 = static _AssistantIntent.Builder.buildBlock(_:)();
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100002454()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v0 = type metadata accessor for _AssistantIntent.NegativeAssistantIntentPhrases(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100002544();
  _AssistantIntent.NegativeAssistantIntentPhrases.init<A>(for:phrases:)(&type metadata for OpenTranslationDeepLinksIntent, sub_1000022B4, 0, &type metadata for OpenTranslationDeepLinksIntent, v4);
  v5 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildExpression(_:)(v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v6 = sub_100002588(&qword_100010370);
  v7 = swift_allocObject(v6, 40, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100008CB0;
  *(_QWORD *)(v7 + 32) = v5;
  v8 = static _AssistantIntent.NegativeAssistantIntentPhrasesBuilder.buildBlock(_:)();
  swift_bridgeObjectRelease(v7);
  return v8;
}

ValueMetadata *type metadata accessor for TranslateAssistantIntents()
{
  return &type metadata for TranslateAssistantIntents;
}

unint64_t sub_100002544()
{
  unint64_t result;

  result = qword_100010368;
  if (!qword_100010368)
  {
    result = swift_getWitnessTable(&unk_100008E78, &type metadata for OpenTranslationDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_100010368);
  }
  return result;
}

uint64_t sub_100002588(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000025C8()
{
  unint64_t result;

  result = qword_100010388;
  if (!qword_100010388)
  {
    result = swift_getWitnessTable(&unk_100009BD4, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010388);
  }
  return result;
}

uint64_t sub_10000260C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100002688(v0, qword_100012A10);
  sub_1000026C8(v0, (uint64_t)qword_100012A10);
  return Logger.init(subsystem:category:)(0xD000000000000015, 0x8000000100009F10, 0x697463416576694CLL, 0xEC00000079746976);
}

uint64_t *sub_100002688(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_1000026C8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_1000026E4()
{
  unint64_t result;

  result = qword_1000103B8;
  if (!qword_1000103B8)
  {
    result = swift_getWitnessTable(&unk_100008E50, &type metadata for OpenTranslationDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_1000103B8);
  }
  return result;
}

unint64_t sub_10000272C()
{
  unint64_t result;

  result = qword_1000103C0;
  if (!qword_1000103C0)
  {
    result = swift_getWitnessTable(&unk_100009B1C, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000103C0);
  }
  return result;
}

uint64_t sub_100002770()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t sub_1000027A0()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100002688(v0, qword_100012A28);
  sub_1000026C8(v0, (uint64_t)qword_100012A28);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000017, 0x8000000100009FA0);
}

_QWORD *sub_100002800@<X0>(_BYTE *a1@<X8>)
{
  _QWORD *result;
  uint64_t v3;

  result = IntentParameter.wrappedValue.getter(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_100002838(char *a1)
{
  char v2;

  v2 = *a1;
  return IntentParameter.wrappedValue.setter(&v2);
}

void (*sub_10000286C(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_1000028B4;
}

void sub_1000028B4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

unint64_t sub_1000028EC()
{
  unint64_t result;

  result = qword_1000103C8;
  if (!qword_1000103C8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Never, &type metadata for Never);
    atomic_store(result, (unint64_t *)&qword_1000103C8);
  }
  return result;
}

uint64_t sub_100002930(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = sub_100002FB8();
  v5 = sub_100003040();
  return static _URLRepresentableIntent<>.urlRepresentation.getter(a1, v4, a2, v5);
}

uint64_t sub_100002988()
{
  uint64_t v0;

  v0 = qword_1000103A8;
  swift_bridgeObjectRetain(off_1000103B0);
  return v0;
}

unint64_t sub_1000029C4()
{
  unint64_t result;

  result = qword_1000103D0;
  if (!qword_1000103D0)
  {
    result = swift_getWitnessTable(&unk_100008F08, &type metadata for OpenTranslationDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_1000103D0);
  }
  return result;
}

unint64_t sub_100002A0C()
{
  unint64_t result;

  result = qword_1000103D8;
  if (!qword_1000103D8)
  {
    result = swift_getWitnessTable(&unk_100008F30, &type metadata for OpenTranslationDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_1000103D8);
  }
  return result;
}

uint64_t sub_100002A50(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100002544();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100002A90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100010330 != -1)
    swift_once(&qword_100010330, sub_1000027A0);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_1000026C8(v2, (uint64_t)qword_100012A28);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100002B00()
{
  return 0;
}

uint64_t sub_100002B0C()
{
  return 1;
}

uint64_t sub_100002B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to _URLRepresentableIntent<>.perform()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100002FB8();
  v7 = sub_100002FFC();
  v8 = sub_100003040();
  *v5 = v2;
  v5[1] = sub_100002BA8;
  return _URLRepresentableIntent<>.perform()(a1, a2, v6, v7, v8);
}

uint64_t sub_100002BA8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v5 = *v1;
  v2 = *(_QWORD *)(v5 + 16);
  v3 = *v1;
  v5 = v3;
  result = swift_task_dealloc(v2);
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  return result;
}

uint64_t sub_100002C04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100002C60();
  *a1 = result;
  return result;
}

uint64_t sub_100002C28(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100002544();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

ValueMetadata *type metadata accessor for OpenTranslationDeepLinksIntent()
{
  return &type metadata for OpenTranslationDeepLinksIntent;
}

uint64_t sub_100002C60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  char *v26;
  char *v27;
  unint64_t v28;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char v35[2];

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v33 = *(_QWORD *)(v0 - 8);
  v34 = v0;
  ((void (*)(void))__chkstk_darwin)();
  v32 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002588(&qword_1000103E8);
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v31 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v5 = (char *)&v30 - v4;
  v6 = sub_100002588(&qword_1000103F0);
  __chkstk_darwin(v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Locale(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v16);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for LocalizedStringResource(0);
  v20 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v22 = (char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_100002588(&qword_1000103F8);
  v23 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000012, 0x8000000100009F50);
  static Locale.current.getter(v23);
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for LocalizedStringResource.BundleDescription.main(_:), v9);
  LocalizedStringResource.init(_:table:locale:bundle:comment:)(v18, 0, 0, v15, v12, "Which target contains the deep links to open", 44, 2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v8, 1, 1, v19);
  v35[0] = 3;
  v24 = type metadata accessor for IntentDialog(0);
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v25(v5, 1, 1, v24);
  v26 = v31;
  v25(v31, 1, 1, v24);
  v27 = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v33 + 104))(v32, enum case for InputConnectionBehavior.default(_:), v34);
  v28 = sub_100002F74();
  return IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v22, v8, v35, v5, v26, v27, &off_10000C748, v28);
}

unint64_t sub_100002F74()
{
  unint64_t result;

  result = qword_100010400;
  if (!qword_100010400)
  {
    result = swift_getWitnessTable(&unk_100009AB4, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010400);
  }
  return result;
}

unint64_t sub_100002FB8()
{
  unint64_t result;

  result = qword_100010408;
  if (!qword_100010408)
  {
    result = swift_getWitnessTable(&unk_100008D80, &type metadata for OpenTranslationDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_100010408);
  }
  return result;
}

unint64_t sub_100002FFC()
{
  unint64_t result;

  result = qword_100010410;
  if (!qword_100010410)
  {
    result = swift_getWitnessTable(&unk_100008DD0, &type metadata for OpenTranslationDeepLinksIntent);
    atomic_store(result, (unint64_t *)&qword_100010410);
  }
  return result;
}

unint64_t sub_100003040()
{
  unint64_t result;

  result = qword_100010418;
  if (!qword_100010418)
  {
    result = swift_getWitnessTable(&unk_100009A7C, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010418);
  }
  return result;
}

uint64_t sub_100003084()
{
  return 0;
}

uint64_t sub_100003090()
{
  return 0;
}

void sub_10000309C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1000030A8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003C18();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000030D0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100003C18();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000030F8(_QWORD *a1)
{
  return sub_100003BD4(a1);
}

uint64_t sub_10000311C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v2 = sub_100002588(&qword_100010488);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1[3];
  v7 = a1[4];
  sub_100003BF4(a1, v6);
  v8 = sub_100003C18();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for SpeechTranslationActivityAttributes.ContentState.CodingKeys, &type metadata for SpeechTranslationActivityAttributes.ContentState.CodingKeys, v8, v6, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Int sub_1000031E0()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  return Hasher._finalize()();
}

Swift::Int sub_100003218(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  return Hasher._finalize()();
}

uint64_t sub_100003248(char a1)
{
  if ((a1 & 1) != 0)
    return 0x436C6F72746E6F63;
  else
    return 0x75426E6F69746361;
}

uint64_t sub_100003294(_QWORD *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  char v23;
  char v24;

  v22 = a2;
  v3 = sub_100002588(&qword_100010528);
  v20 = *(_QWORD *)(v3 - 8);
  v21 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100002588(&qword_100010530);
  v6 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100002588(&qword_100010538);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[3];
  v14 = a1[4];
  sub_100003BF4(a1, v13);
  v15 = sub_100004608();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys, v15, v13, v14);
  if ((v22 & 1) != 0)
  {
    v24 = 1;
    v17 = sub_10000464C();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys, &v24, v9, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys, v17);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v21);
  }
  else
  {
    v23 = 0;
    v16 = sub_100004690();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys, &v23, v9, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys, v16);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v19);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_100003464(_QWORD *a1, char a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  char v13;

  v3 = a2 & 1;
  v4 = sub_100002588(&qword_1000104B0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100003BF4(a1, v8);
  v10 = sub_10000426C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for SpeechTranslationActivityAttributes.CodingKeys, &type metadata for SpeechTranslationActivityAttributes.CodingKeys, v10, v8, v9);
  v13 = v3;
  sub_1000042F4();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v13);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10000355C@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_100003588(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004690();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000035B0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004690();
  return CodingKey.debugDescription.getter(a1, v2);
}

BOOL sub_1000035D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void sub_1000035F4()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

uint64_t sub_100003620()
{
  char *v0;

  return sub_100003248(*v0);
}

uint64_t sub_100003628@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100003C5C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000364C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100003658(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004608();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100003680(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004608();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000036A8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000464C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000036D0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000464C();
  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_1000036F8()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_10000373C(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000377C@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_100003D6C(a1);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_1000037A8(_QWORD *a1)
{
  unsigned __int8 *v1;

  return sub_100003294(a1, *v1);
}

Swift::Int sub_1000037C0()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void sub_100003800()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_100003824(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

uint64_t sub_100003864@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100004098(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_10000388C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000426C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000038B4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000426C();
  return CodingKey.debugDescription.getter(a1, v2);
}

unint64_t sub_1000038DC@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  unint64_t result;

  result = sub_10000414C(a1);
  if (!v2)
    *a2 = result & 1;
  return result;
}

uint64_t sub_100003908(_QWORD *a1)
{
  char *v1;

  return sub_100003464(a1, *v1);
}

id sub_100003974()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpeechTranslationActivityManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SpeechTranslationActivityManager()
{
  return objc_opt_self(_TtC27TranslationWidgetsExtension32SpeechTranslationActivityManager);
}

_BYTE *initializeBufferWithCopyOfBuffer for TranslationDeepLinks(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes()
{
  return &type metadata for SpeechTranslationActivityAttributes;
}

unint64_t sub_100003A28()
{
  unint64_t result;

  result = qword_100010458;
  if (!qword_100010458)
  {
    result = swift_getWitnessTable(&unk_10000901C, &type metadata for SpeechTranslationActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_100010458);
  }
  return result;
}

unint64_t sub_100003A70()
{
  unint64_t result;

  result = qword_100010460;
  if (!qword_100010460)
  {
    result = swift_getWitnessTable("5=", &type metadata for SpeechTranslationActivityAttributes);
    atomic_store(result, (unint64_t *)&qword_100010460);
  }
  return result;
}

unint64_t sub_100003AB8()
{
  unint64_t result;

  result = qword_100010468;
  if (!qword_100010468)
  {
    result = swift_getWitnessTable(&unk_100009124, &type metadata for SpeechTranslationActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_100010468);
  }
  return result;
}

unint64_t sub_100003B00()
{
  unint64_t result;

  result = qword_100010470;
  if (!qword_100010470)
  {
    result = swift_getWitnessTable(&unk_1000090FC, &type metadata for SpeechTranslationActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_100010470);
  }
  return result;
}

unint64_t sub_100003B48()
{
  unint64_t result;

  result = qword_100010478;
  if (!qword_100010478)
  {
    result = swift_getWitnessTable(&unk_100009094, &type metadata for SpeechTranslationActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_100010478);
  }
  return result;
}

unint64_t sub_100003B90()
{
  unint64_t result;

  result = qword_100010480;
  if (!qword_100010480)
  {
    result = swift_getWitnessTable(&unk_1000090D4, &type metadata for SpeechTranslationActivityAttributes.ContentState);
    atomic_store(result, (unint64_t *)&qword_100010480);
  }
  return result;
}

uint64_t sub_100003BD4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1[3];
  v2 = *(_QWORD *)(v1 - 8);
  if ((*(_BYTE *)(v2 + 82) & 2) != 0)
    return swift_release(*a1, v1);
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_100003BF4(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100003C18()
{
  unint64_t result;

  result = qword_100010490;
  if (!qword_100010490)
  {
    result = swift_getWitnessTable(&unk_10000939C, &type metadata for SpeechTranslationActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010490);
  }
  return result;
}

uint64_t sub_100003C5C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x75426E6F69746361 && a2 == 0xEC0000006E6F7474;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x75426E6F69746361, 0xEC0000006E6F7474, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  else if (a1 == 0x436C6F72746E6F63 && a2 == 0xED00007265746E65)
  {
    swift_bridgeObjectRelease(0xED00007265746E65);
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x436C6F72746E6F63, 0xED00007265746E65, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_100003D6C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char v35;
  char v36;

  v32 = sub_100002588(&qword_1000104F0);
  v30 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v33 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_100002588(&qword_1000104F8);
  v3 = *(_QWORD *)(v31 - 8);
  __chkstk_darwin(v31);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100002588(&qword_100010500);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[3];
  v11 = a1[4];
  sub_100003BF4(a1, v10);
  v12 = sub_100004608();
  v13 = v34;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys, v12, v10, v11);
  if (v13)
    goto LABEL_7;
  v14 = v5;
  v15 = v33;
  v29 = a1;
  v34 = v7;
  v16 = KeyedDecodingContainer.allKeys.getter(v6);
  v17 = v16;
  v18 = v6;
  if (*(_QWORD *)(v16 + 16) != 1)
  {
    v21 = type metadata accessor for DecodingError(0);
    swift_allocError(v21, &protocol witness table for DecodingError, 0, 0);
    v22 = v9;
    v24 = v23;
    sub_100002588(&qword_100010510);
    *v24 = &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin;
    v25 = KeyedDecodingContainer.codingPath.getter(v6);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)(v25, 0xD00000000000002BLL, 0x800000010000A030, 0);
    v26 = (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v24, enum case for DecodingError.typeMismatch(_:), v21);
    swift_willThrow(v26);
    swift_bridgeObjectRelease(v17);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v22, v6);
    a1 = v29;
LABEL_7:
    sub_100003BD4(a1);
    return v6;
  }
  v6 = *(unsigned __int8 *)(v16 + 32);
  if ((v6 & 1) != 0)
  {
    v36 = 1;
    v19 = sub_10000464C();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys, &v36, v18, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys, v19);
    v20 = v34;
    (*(void (**)(char *, uint64_t))(v30 + 8))(v15, v32);
  }
  else
  {
    v35 = 0;
    v27 = sub_100004690();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)(&type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys, &v35, v18, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys, v27);
    v20 = v34;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v14, v31);
  }
  swift_bridgeObjectRelease(v17);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v18);
  sub_100003BD4(v29);
  return v6;
}

uint64_t sub_100004098(uint64_t a1, uint64_t a2)
{
  char v4;
  char v5;

  if (a1 == 0x724F656372756F73 && a2 == 0xEC0000006E696769)
  {
    swift_bridgeObjectRelease(a2);
    v5 = 0;
  }
  else
  {
    v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0x724F656372756F73, 0xEC0000006E696769, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    v5 = v4 ^ 1;
  }
  return v5 & 1;
}

uint64_t sub_10000412C()
{
  return 0x724F656372756F73;
}

unint64_t sub_10000414C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v3 = sub_100002588(&qword_100010498);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  v9 = (unint64_t)sub_100003BF4(a1, v7);
  v10 = sub_10000426C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for SpeechTranslationActivityAttributes.CodingKeys, &type metadata for SpeechTranslationActivityAttributes.CodingKeys, v10, v7, v8);
  if (v1)
  {
    sub_100003BD4(a1);
  }
  else
  {
    sub_1000042B0();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v13);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v9 = v13;
    sub_100003BD4(a1);
  }
  return v9;
}

unint64_t sub_10000426C()
{
  unint64_t result;

  result = qword_1000104A0;
  if (!qword_1000104A0)
  {
    result = swift_getWitnessTable(&unk_10000934C, &type metadata for SpeechTranslationActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000104A0);
  }
  return result;
}

unint64_t sub_1000042B0()
{
  unint64_t result;

  result = qword_1000104A8;
  if (!qword_1000104A8)
  {
    result = swift_getWitnessTable(&unk_100009324, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin);
    atomic_store(result, (unint64_t *)&qword_1000104A8);
  }
  return result;
}

unint64_t sub_1000042F4()
{
  unint64_t result;

  result = qword_1000104B8;
  if (!qword_1000104B8)
  {
    result = swift_getWitnessTable(&unk_1000092FC, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin);
    atomic_store(result, (unint64_t *)&qword_1000104B8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SpeechTranslationActivityAttributes.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SpeechTranslationActivityAttributes.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1000043CC + 4 * byte_100008F80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1000043EC + 4 * byte_100008F85[v4]))();
}

_BYTE *sub_1000043CC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1000043EC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1000043F4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1000043FC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100004404(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000440C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.CodingKeys()
{
  return &type metadata for SpeechTranslationActivityAttributes.CodingKeys;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.ContentState.CodingKeys()
{
  return &type metadata for SpeechTranslationActivityAttributes.ContentState.CodingKeys;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.ContentState()
{
  return &type metadata for SpeechTranslationActivityAttributes.ContentState;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin()
{
  return &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin;
}

unint64_t sub_10000445C()
{
  unint64_t result;

  result = qword_1000104C0;
  if (!qword_1000104C0)
  {
    result = swift_getWitnessTable(&unk_1000091CC, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin);
    atomic_store(result, (unint64_t *)&qword_1000104C0);
  }
  return result;
}

unint64_t sub_1000044A4()
{
  unint64_t result;

  result = qword_1000104C8;
  if (!qword_1000104C8)
  {
    result = swift_getWitnessTable(&unk_1000092D4, &type metadata for SpeechTranslationActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000104C8);
  }
  return result;
}

unint64_t sub_1000044EC()
{
  unint64_t result;

  result = qword_1000104D0;
  if (!qword_1000104D0)
  {
    result = swift_getWitnessTable(&unk_100009244, &type metadata for SpeechTranslationActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000104D0);
  }
  return result;
}

unint64_t sub_100004534()
{
  unint64_t result;

  result = qword_1000104D8;
  if (!qword_1000104D8)
  {
    result = swift_getWitnessTable(&unk_10000926C, &type metadata for SpeechTranslationActivityAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000104D8);
  }
  return result;
}

unint64_t sub_10000457C()
{
  unint64_t result;

  result = qword_1000104E0;
  if (!qword_1000104E0)
  {
    result = swift_getWitnessTable(&unk_1000091F4, &type metadata for SpeechTranslationActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000104E0);
  }
  return result;
}

unint64_t sub_1000045C4()
{
  unint64_t result;

  result = qword_1000104E8;
  if (!qword_1000104E8)
  {
    result = swift_getWitnessTable(&unk_10000921C, &type metadata for SpeechTranslationActivityAttributes.ContentState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000104E8);
  }
  return result;
}

unint64_t sub_100004608()
{
  unint64_t result;

  result = qword_100010508;
  if (!qword_100010508)
  {
    result = swift_getWitnessTable(&unk_100009620, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010508);
  }
  return result;
}

unint64_t sub_10000464C()
{
  unint64_t result;

  result = qword_100010518;
  if (!qword_100010518)
  {
    result = swift_getWitnessTable(&unk_1000095D0, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010518);
  }
  return result;
}

unint64_t sub_100004690()
{
  unint64_t result;

  result = qword_100010520;
  if (!qword_100010520)
  {
    result = swift_getWitnessTable(&unk_100009580, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010520);
  }
  return result;
}

uint64_t _s27TranslationWidgetsExtension35SpeechTranslationActivityAttributesV24LiveActivitySourceOriginOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s27TranslationWidgetsExtension35SpeechTranslationActivityAttributesV24LiveActivitySourceOriginOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000047B0 + 4 * byte_100008F8F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000047E4 + 4 * byte_100008F8A[v4]))();
}

uint64_t sub_1000047E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000047EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000047F4);
  return result;
}

uint64_t sub_100004800(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100004808);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000480C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004814(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100004820(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100004828(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys()
{
  return &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys()
{
  return &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys;
}

ValueMetadata *type metadata accessor for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys()
{
  return &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys;
}

unint64_t sub_100004868()
{
  unint64_t result;

  result = qword_100010540;
  if (!qword_100010540)
  {
    result = swift_getWitnessTable(&unk_100009558, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010540);
  }
  return result;
}

unint64_t sub_1000048B0()
{
  unint64_t result;

  result = qword_100010548;
  if (!qword_100010548)
  {
    result = swift_getWitnessTable(&unk_100009478, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010548);
  }
  return result;
}

unint64_t sub_1000048F8()
{
  unint64_t result;

  result = qword_100010550;
  if (!qword_100010550)
  {
    result = swift_getWitnessTable(&unk_1000094A0, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ActionButtonCodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010550);
  }
  return result;
}

unint64_t sub_100004940()
{
  unint64_t result;

  result = qword_100010558;
  if (!qword_100010558)
  {
    result = swift_getWitnessTable(&unk_100009428, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010558);
  }
  return result;
}

unint64_t sub_100004988()
{
  unint64_t result;

  result = qword_100010560;
  if (!qword_100010560)
  {
    result = swift_getWitnessTable(&unk_100009450, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.ControlCenterCodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010560);
  }
  return result;
}

unint64_t sub_1000049D0()
{
  unint64_t result;

  result = qword_100010568;
  if (!qword_100010568)
  {
    result = swift_getWitnessTable(&unk_1000094C8, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010568);
  }
  return result;
}

unint64_t sub_100004A18()
{
  unint64_t result;

  result = qword_100010570;
  if (!qword_100010570)
  {
    result = swift_getWitnessTable(&unk_1000094F0, &type metadata for SpeechTranslationActivityAttributes.LiveActivitySourceOrigin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100010570);
  }
  return result;
}

unint64_t sub_100004A74()
{
  unint64_t result;

  result = qword_100010580;
  if (!qword_100010580)
  {
    result = swift_getWitnessTable(&unk_1000097A0, &type metadata for ToggleSpeechTranslationIntent);
    atomic_store(result, (unint64_t *)&qword_100010580);
  }
  return result;
}

unint64_t sub_100004ABC()
{
  unint64_t result;

  result = qword_100010588;
  if (!qword_100010588)
  {
    result = swift_getWitnessTable(&unk_1000097C8, &type metadata for ToggleSpeechTranslationIntent);
    atomic_store(result, (unint64_t *)&qword_100010588);
  }
  return result;
}

uint64_t sub_100004B00(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000A7A8, 1);
}

uint64_t sub_100004B10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004F48(a1, a2, a3, (uint64_t (*)(void))sub_100004B1C);
}

unint64_t sub_100004B1C()
{
  unint64_t result;

  result = qword_100010590;
  if (!qword_100010590)
  {
    result = swift_getWitnessTable(&unk_100009670, &type metadata for ToggleSpeechTranslationIntent);
    atomic_store(result, (unint64_t *)&qword_100010590);
  }
  return result;
}

uint64_t sub_100004B60(uint64_t a1)
{
  return sub_100005018(a1, qword_100012A40, 0xD000000000000023, 0x800000010000A180);
}

uint64_t sub_100004B84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100002588(&qword_1000106E0);
  sub_100002688(v0, qword_100012A58);
  v1 = sub_1000026C8(v0, (uint64_t)qword_100012A58);
  IntentDescription.init(stringLiteral:)(0xD000000000000029, 0x800000010000A150);
  v2 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 0, 1, v2);
}

uint64_t sub_100004C0C@<X0>(uint64_t a1@<X8>)
{
  return sub_100005090(&qword_100010338, (uint64_t)qword_100012A40, (uint64_t)sub_100004B60, a1);
}

uint64_t sub_100004C2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100010340 != -1)
    swift_once(&qword_100010340, sub_100004B84);
  v2 = sub_100002588(&qword_1000106E0);
  v3 = sub_1000026C8(v2, (uint64_t)qword_100012A58);
  return sub_100005EFC(v3, a1);
}

uint64_t sub_100004C8C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100004CA4, 0, 0);
}

uint64_t sub_100004CA4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_100010328 != -1)
    swift_once(&qword_100010328, sub_10000260C);
  v1 = type metadata accessor for Logger(0);
  sub_1000026C8(v1, (uint64_t)qword_100012A10);
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "No DynamicIsland support. Launching the Translate App.", v4, 2u);
    swift_slowDealloc(v4, -1, -1);
  }

  static IntentResult.result<>()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004D90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1000052A8();
  *a1 = result;
  return result;
}

unint64_t sub_100004DB8()
{
  unint64_t result;

  result = qword_1000105A0;
  if (!qword_1000105A0)
  {
    result = swift_getWitnessTable(&unk_1000097E4, &type metadata for ToggleSpeechTranslationIntent);
    atomic_store(result, (unint64_t *)&qword_1000105A0);
  }
  return result;
}

unint64_t sub_100004E04()
{
  unint64_t result;

  result = qword_1000105A8;
  if (!qword_1000105A8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Bool, &type metadata for Bool);
    atomic_store(result, (unint64_t *)&qword_1000105A8);
  }
  return result;
}

unint64_t sub_100004E48()
{
  return 0xD00000000000001DLL;
}

unint64_t sub_100004E68()
{
  unint64_t result;

  result = qword_1000105B0;
  if (!qword_1000105B0)
  {
    result = swift_getWitnessTable(&unk_10000983C, &type metadata for ToggleSpeechTranslationIntentConfiguration);
    atomic_store(result, (unint64_t *)&qword_1000105B0);
  }
  return result;
}

unint64_t sub_100004EB0()
{
  unint64_t result;

  result = qword_1000105B8;
  if (!qword_1000105B8)
  {
    result = swift_getWitnessTable(&unk_1000098CC, &type metadata for ToggleSpeechTranslationIntentConfiguration);
    atomic_store(result, (unint64_t *)&qword_1000105B8);
  }
  return result;
}

unint64_t sub_100004EF8()
{
  unint64_t result;

  result = qword_1000105C0;
  if (!qword_1000105C0)
  {
    result = swift_getWitnessTable(&unk_1000098F4, &type metadata for ToggleSpeechTranslationIntentConfiguration);
    atomic_store(result, (unint64_t *)&qword_1000105C0);
  }
  return result;
}

uint64_t sub_100004F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100004F48(a1, a2, a3, (uint64_t (*)(void))sub_100004E68);
}

uint64_t sub_100004F48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  _QWORD v5[2];

  v5[0] = a2;
  v5[1] = a4();
  return swift_getOpaqueTypeConformance2(v5, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_100004F88()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

void sub_100004F98(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_100004FA0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100004FB8, 0, 0);
}

uint64_t sub_100004FB8()
{
  uint64_t v0;
  _BYTE *v1;

  v1 = *(_BYTE **)(v0 + 16);
  *v1 = sub_100005D84() & 1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100004FF4(uint64_t a1)
{
  return sub_100005018(a1, qword_100012A70, 0xD000000000000010, 0x800000010000A110);
}

uint64_t sub_100005018(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for LocalizedStringResource(0);
  sub_100002688(v7, a2);
  sub_1000026C8(v7, (uint64_t)a2);
  return LocalizedStringResource.init(stringLiteral:)(a3, a4);
}

uint64_t sub_100005074@<X0>(uint64_t a1@<X8>)
{
  return sub_100005090(&qword_100010348, (uint64_t)qword_100012A70, (uint64_t)sub_100004FF4, a1);
}

uint64_t sub_100005090@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  if (*a1 != -1)
    swift_once(a1, a3);
  v6 = type metadata accessor for LocalizedStringResource(0);
  v7 = sub_1000026C8(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a4, v7, v6);
}

uint64_t sub_100005100(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to ControlConfigurationIntent.perform()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = sub_100005264();
  *v4 = v2;
  v4[1] = sub_100002BA8;
  return ControlConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_100005164(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100004E68();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t type metadata accessor for ToggleControlStateProvider()
{
  return objc_opt_self(_TtC27TranslationWidgetsExtension26ToggleControlStateProvider);
}

ValueMetadata *type metadata accessor for ToggleSpeechTranslationIntentConfiguration()
{
  return &type metadata for ToggleSpeechTranslationIntentConfiguration;
}

ValueMetadata *type metadata accessor for ToggleSpeechTranslationIntent()
{
  return &type metadata for ToggleSpeechTranslationIntent;
}

unint64_t sub_1000051D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000106A8;
  if (!qword_1000106A8)
  {
    v1 = sub_10000521C(&qword_1000106B0);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_1000106A8);
  }
  return result;
}

uint64_t sub_10000521C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005264()
{
  unint64_t result;

  result = qword_1000106B8;
  if (!qword_1000106B8)
  {
    result = swift_getWitnessTable(&unk_10000980C, &type metadata for ToggleSpeechTranslationIntentConfiguration);
    atomic_store(result, (unint64_t *)&qword_1000106B8);
  }
  return result;
}

uint64_t sub_1000052A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[15];
  char v21;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = &v20[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_100002588(&qword_1000103E8);
  __chkstk_darwin(v4);
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_100002588(&qword_1000106D0);
  __chkstk_darwin(v7);
  v9 = &v20[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_100002588(&qword_1000103F0);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v20[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002588(&qword_1000106D8);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000015, 0x800000010000A130);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v21 = 2;
  v17 = type metadata accessor for Bool.IntentDisplayName(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 1, 1, v17);
  v18 = type metadata accessor for IntentDialog(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v6, 1, 1, v18);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v16, v12, &v21, v9, v6, v3);
}

void *sub_1000054D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  id v9;
  NSString v10;
  id v11;
  id v12;
  NSString v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  const char *v20;
  uint64_t v22;
  uint64_t v23;

  v0 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100002588(&qword_1000106C8);
  __chkstk_darwin(v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (void *)qword_100010578;
  if (qword_100010578)
    goto LABEL_2;
  v9 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  v10 = String._bridgeToObjectiveC()();
  v11 = objc_msgSend(v9, "containerURLForSecurityApplicationGroupIdentifier:", v10);

  if (!v11)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v6, 1, 1, v0);
    goto LABEL_8;
  }
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v11);

  (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v6, v3, v0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v1 + 56))(v6, 0, 1, v0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0) == 1)
  {
LABEL_8:
    sub_100005F44((uint64_t)v6, &qword_1000106C8);
    if (qword_100010328 != -1)
      swift_once(&qword_100010328, sub_10000260C);
    v16 = type metadata accessor for Logger(0);
    sub_1000026C8(v16, (uint64_t)qword_100012A10);
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v17, v18))
      goto LABEL_13;
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    v20 = "Failed to obtain application group container directory to load translation group defaults";
    goto LABEL_12;
  }
  sub_100005F44((uint64_t)v6, &qword_1000106C8);
  v12 = objc_allocWithZone((Class)NSUserDefaults);
  v13 = String._bridgeToObjectiveC()();
  v14 = objc_msgSend(v12, "initWithSuiteName:", v13);

  if (!v14)
  {
    if (qword_100010328 != -1)
      swift_once(&qword_100010328, sub_10000260C);
    v22 = type metadata accessor for Logger(0);
    sub_1000026C8(v22, (uint64_t)qword_100012A10);
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v17, v18))
      goto LABEL_13;
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    v20 = "Failed to load translation group defaults";
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v17, v18, v20, v19, 2u);
    swift_slowDealloc(v19, -1, -1);
LABEL_13:

    return 0;
  }
  v15 = (void *)qword_100010578;
  qword_100010578 = (uint64_t)v14;

  v7 = (void *)qword_100010578;
LABEL_2:
  v8 = v7;
  return v7;
}

uint64_t sub_100005828(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(uint64_t, uint64_t, uint64_t);
  uint64_t countAndFlagsBits;
  uint64_t v31;
  void *v32;
  void *v33;
  void (*v34)(char *, uint64_t);
  Swift::String v35;
  Swift::String_optional v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  Swift::String v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t (*v56)(char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  char *v62;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  Swift::String_optional v72;

  v71 = a3;
  v5 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v5);
  v66 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Locale.Language(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v67 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v64 - v11;
  v13 = sub_100002588(&qword_1000106E8);
  v14 = __chkstk_darwin(v13);
  v68 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v64 - v16;
  v18 = type metadata accessor for Locale(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = __chkstk_darwin(v18);
  v70 = (char *)&v64 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v23 = (char *)&v64 - v22;
  swift_bridgeObjectRetain(a2);
  v24 = Locale.init(identifier:)(a1, a2);
  v25 = Locale.language.getter(v24);
  Locale.Language.languageCode.getter(v25);
  v26 = *(void (**)(char *, uint64_t))(v8 + 8);
  v69 = v7;
  v26(v12, v7);
  v27 = type metadata accessor for Locale.LanguageCode(0);
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48);
  if (v29((uint64_t)v17, 1, v27) != 1)
  {
    v64 = v18;
    v65 = v19;
    v31 = Locale.LanguageCode.identifier.getter();
    v33 = v32;
    v34 = *(void (**)(char *, uint64_t))(v28 + 8);
    v34(v17, v27);
    v35._countAndFlagsBits = v31;
    v35._object = v33;
    v36 = Locale.localizedString(forLanguageCode:)(v35);
    countAndFlagsBits = v36.value._countAndFlagsBits;
    v37 = swift_bridgeObjectRelease(v33);
    if (v36.value._object)
    {
      v72 = v36;
      v38 = sub_100005F80();
      countAndFlagsBits = StringProtocol.capitalized.getter(&type metadata for String, v38);
      v40 = v39;
      v37 = swift_bridgeObjectRelease(v36.value._object);
    }
    else
    {
      v40 = 0;
    }
    v41 = v67;
    v42 = (uint64_t)v68;
    v43 = Locale.language.getter(v37);
    Locale.Language.languageCode.getter(v43);
    v26(v41, v69);
    if (v29(v42, 1, v27) == 1)
    {
      v44 = sub_100005F44(v42, &qword_1000106E8);
      v45 = 0;
    }
    else
    {
      Locale.LanguageCode.identifier.getter();
      v47 = v46;
      v34((char *)v42, v27);
      v48._countAndFlagsBits = 2975866;
      v48._object = (void *)0xE300000000000000;
      v45 = String.hasPrefix(_:)(v48);
      v44 = swift_bridgeObjectRelease(v47);
    }
    v50 = v64;
    v49 = v65;
    v51 = v70;
    v52 = static Locale.current.getter(v44);
    v53 = Locale.identifier.getter(v52);
    v55 = v54;
    v56 = *(uint64_t (**)(char *, uint64_t))(v49 + 8);
    v57 = v56(v51, v50);
    v59 = Locale.identifier.getter(v57);
    v60 = v58;
    if (v53 == v59 && v55 == v58)
    {
      swift_bridgeObjectRelease_n(v55, 2, v59);
      if (!v45)
        goto LABEL_15;
    }
    else
    {
      v61 = _stringCompareWithSmolCheck(_:_:expecting:)(v53, v55, v59, v58, 0);
      swift_bridgeObjectRelease(v55);
      swift_bridgeObjectRelease(v60);
      if ((v61 & v45 & 1) == 0)
      {
LABEL_15:
        v56(v23, v50);
        return countAndFlagsBits;
      }
    }
    swift_bridgeObjectRelease(v40);
    v62 = v66;
    LocalizedStringResource.init(stringLiteral:)(0x4E495241444E414DLL, 0xEE00454C5449545FLL);
    countAndFlagsBits = String.init(localized:)(v62);
    goto LABEL_15;
  }
  sub_100005F44((uint64_t)v17, &qword_1000106E8);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v23, v18);
  return 0;
}

uint64_t sub_100005C50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  NSString v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v0 = 0x53455F7365;
  v1 = type metadata accessor for Locale(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000054D4();
  if (v5
    && (v6 = v5,
        v7 = String._bridgeToObjectiveC()(),
        v8 = objc_msgSend(v6, "stringForKey:", v7),
        v6,
        v7,
        v8))
  {
    v0 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v10 = v9;

  }
  else
  {
    v10 = 0xE500000000000000;
  }
  static Locale.current.getter(v5);
  v11 = sub_100005828(v0, v10, (uint64_t)v4);
  v13 = v12;
  swift_bridgeObjectRelease(v10);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if (v13)
    return v11;
  else
    return 0;
}

uint64_t sub_100005D84()
{
  void *v0;
  void *v1;
  NSString v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v0 = sub_1000054D4();
  if (v0
    && (v1 = v0,
        v2 = String._bridgeToObjectiveC()(),
        v3 = objc_msgSend(v1, "BOOLForKey:", v2),
        v1,
        v2,
        v3))
  {
    if (qword_100010328 != -1)
      swift_once(&qword_100010328, sub_10000260C);
    v4 = type metadata accessor for Logger(0);
    sub_1000026C8(v4, (uint64_t)qword_100012A10);
    v5 = Logger.logObject.getter();
    v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "AssumeIsLiveActivityListening is on. Skip checking IsLiveActivityListening", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }
    v8 = 1;
  }
  else
  {
    v9 = sub_1000054D4();
    if (!v9)
      return 0;
    v10 = v9;
    v5 = String._bridgeToObjectiveC()();
    v8 = (uint64_t)objc_msgSend(v10, "BOOLForKey:", v5);

  }
  return v8;
}

uint64_t sub_100005EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100002588(&qword_1000106E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005F44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100002588(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100005F80()
{
  unint64_t result;

  result = qword_1000106F0;
  if (!qword_1000106F0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000106F0);
  }
  return result;
}

uint64_t sub_100005FC4(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = 8 * a1;
  v3 = *(_QWORD *)&aRoot_1[v2];
  v4 = *(_QWORD *)&aManagelaondevi[v2 + 16];
  v5 = 8 * a2;
  v6 = *(_QWORD *)&aRoot_1[v5];
  v7 = *(_QWORD *)&aManagelaondevi[v5 + 16];
  if (v3 == v6 && v4 == v7)
    v9 = 1;
  else
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, *(_QWORD *)&aManagelaondevi[8 * a2 + 16], 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

uint64_t sub_100006048()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v0 = sub_100002588(&qword_100010788);
  sub_100002688(v0, qword_100012A88);
  sub_1000026C8(v0, (uint64_t)qword_100012A88);
  v1 = sub_100002588(&qword_100010790);
  v2 = *(_QWORD *)(sub_100002588(&qword_100010798) - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = *(unsigned __int8 *)(v2 + 80);
  v5 = (v4 + 32) & ~v4;
  v6 = swift_allocObject(v1, v5 + 3 * v3, v4 | 7);
  *(_OWORD *)(v6 + 16) = xmmword_100008CA0;
  v7 = v6 + v5;
  *(_BYTE *)(v6 + v5) = 0;
  v8 = sub_100002F74();
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000042, 0x800000010000A260, &type metadata for TranslationDeepLinks, v8);
  *(_BYTE *)(v7 + v3) = 1;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD000000000000060, 0x800000010000A2B0, &type metadata for TranslationDeepLinks, v8);
  *(_BYTE *)(v7 + 2 * v3) = 2;
  _EnumURLRepresentation.EnumSingleURLRepresentation.init(stringLiteral:)(0xD00000000000004FLL, 0x800000010000A320, &type metadata for TranslationDeepLinks, v8);
  v9 = sub_1000061E0(v6);
  return _EnumURLRepresentation.init(_:)(v9, &type metadata for TranslationDeepLinks, v8);
}

unint64_t sub_1000061E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = sub_100002588(&qword_100010798);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v25 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v25);
    return (unint64_t)v8;
  }
  sub_100002588(&qword_1000107A0);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v27 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1000074A8(v13, (uint64_t)v5, &qword_100010798);
    v15 = *v5;
    result = sub_100006E58(*v5);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v8[6] + result) = v15;
    v19 = v8[7];
    v20 = sub_100002588(&qword_1000107A8);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v10, v20);
    v22 = v8[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_12;
    v8[2] = v24;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8, v21);
      v25 = v27;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_100006380(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  unint64_t result;
  char v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = sub_100002588(&qword_100010770);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
  {
    v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v25 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v25);
    return (unint64_t)v8;
  }
  sub_100002588(&qword_100010780);
  v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
    goto LABEL_9;
  v10 = &v5[*(int *)(v2 + 48)];
  v11 = v7 + 64;
  v12 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v27 = a1;
  v13 = a1 + v12;
  v14 = *(_QWORD *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1000074A8(v13, (uint64_t)v5, &qword_100010770);
    v15 = *v5;
    result = sub_100006E58(*v5);
    if ((v17 & 1) != 0)
      break;
    v18 = result;
    *(_QWORD *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v8[6] + result) = v15;
    v19 = v8[7];
    v20 = type metadata accessor for DisplayRepresentation(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v18, v10, v20);
    v22 = v8[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_12;
    v8[2] = v24;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8, v21);
      v25 = v27;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100006518()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_100002588(&qword_1000103F0);
  __chkstk_darwin(v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for LocalizedStringResource(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_100002688(v7, qword_100012AA0);
  sub_1000026C8(v7, (uint64_t)qword_100012AA0);
  LocalizedStringResource.init(stringLiteral:)(0x74616C736E617254, 0xE900000000000065);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v6, v2);
}

uint64_t sub_100006628(char a1)
{
  return *(_QWORD *)&aRoot_1[8 * a1];
}

uint64_t sub_100006648(char *a1, char *a2)
{
  return sub_100005FC4(*a1, *a2);
}

unint64_t sub_100006658()
{
  unint64_t result;

  result = qword_1000106F8;
  if (!qword_1000106F8)
  {
    result = swift_getWitnessTable(&unk_1000099DC, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_1000106F8);
  }
  return result;
}

Swift::Int sub_10000669C()
{
  char *v0;

  return sub_1000066A4(*v0);
}

Swift::Int sub_1000066A4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, 0);
  v2 = 8 * a1;
  v3 = *(_QWORD *)&aManagelaondevi[v2 + 16];
  String.hash(into:)(v5, *(_QWORD *)&aRoot_1[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10000670C(uint64_t a1)
{
  char *v1;

  return sub_100006714(a1, *v1);
}

uint64_t sub_100006714(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8 * a2;
  v3 = *(_QWORD *)&aManagelaondevi[v2 + 16];
  String.hash(into:)(a1, *(_QWORD *)&aRoot_1[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_100006754(uint64_t a1)
{
  char *v1;

  return sub_10000675C(a1, *v1);
}

Swift::Int sub_10000675C(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  v3 = 8 * a2;
  v4 = *(_QWORD *)&aManagelaondevi[v3 + 16];
  String.hash(into:)(v6, *(_QWORD *)&aRoot_1[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

unint64_t sub_1000067C0@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1000074EC(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000067EC@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100006628(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_10000681C()
{
  unint64_t result;

  result = qword_100010700;
  if (!qword_100010700)
  {
    result = swift_getWitnessTable(&unk_100009AF4, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010700);
  }
  return result;
}

uint64_t sub_100006860@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100010350 != -1)
    swift_once(&qword_100010350, sub_100006048);
  v2 = sub_100002588(&qword_100010788);
  v3 = sub_1000026C8(v2, (uint64_t)qword_100012A88);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_1000068D8()
{
  unint64_t result;

  result = qword_100010708;
  if (!qword_100010708)
  {
    result = swift_getWitnessTable(&unk_100009B54, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010708);
  }
  return result;
}

unint64_t sub_100006920()
{
  unint64_t result;

  result = qword_100010710;
  if (!qword_100010710)
  {
    result = swift_getWitnessTable(&unk_100009A44, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010710);
  }
  return result;
}

void *sub_100006964()
{
  return &protocol witness table for String;
}

uint64_t sub_100006970(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_100003040();
  v4 = _URLRepresentableEnum.urlRepresentationParameter.getter(a1, v3);
  return sub_100007494(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8), v1, v4, v5);
}

unint64_t sub_1000069BC()
{
  unint64_t result;

  result = qword_100010720;
  if (!qword_100010720)
  {
    result = swift_getWitnessTable(&unk_100009B84, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010720);
  }
  return result;
}

unint64_t sub_100006A04()
{
  unint64_t result;

  result = qword_100010728;
  if (!qword_100010728)
  {
    result = swift_getWitnessTable(&unk_100009BAC, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010728);
  }
  return result;
}

unint64_t sub_100006A50()
{
  unint64_t result;

  result = qword_100010730;
  if (!qword_100010730)
  {
    result = swift_getWitnessTable(&unk_100009C2C, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010730);
  }
  return result;
}

uint64_t sub_100006A98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100010358 != -1)
    swift_once(&qword_100010358, sub_100006518);
  v2 = type metadata accessor for TypeDisplayRepresentation(0);
  v3 = sub_1000026C8(v2, (uint64_t)qword_100012AA0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100006B08(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100002F74();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>, 1);
}

uint64_t sub_100006B48(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100002F74();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100006B84()
{
  unint64_t result;

  result = qword_100010738;
  if (!qword_100010738)
  {
    result = swift_getWitnessTable(&unk_100009C6C, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010738);
  }
  return result;
}

unint64_t sub_100006BCC()
{
  unint64_t result;

  result = qword_100010740;
  if (!qword_100010740)
  {
    result = swift_getWitnessTable(&unk_100009C94, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010740);
  }
  return result;
}

unint64_t sub_100006C14()
{
  unint64_t result;

  result = qword_100010748;
  if (!qword_100010748)
  {
    result = swift_getWitnessTable(&unk_100009A04, &type metadata for TranslationDeepLinks);
    atomic_store(result, (unint64_t *)&qword_100010748);
  }
  return result;
}

uint64_t sub_100006C5C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100006A50();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100006C98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010750;
  if (!qword_100010750)
  {
    v1 = sub_10000521C(&qword_100010758);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100010750);
  }
  return result;
}

void sub_100006CE4(_QWORD *a1@<X8>)
{
  *a1 = &off_10000C7D8;
}

uint64_t getEnumTagSinglePayload for TranslationDeepLinks(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TranslationDeepLinks(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100006DD0 + 4 * byte_1000099D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100006E04 + 4 * byte_1000099D0[v4]))();
}

uint64_t sub_100006E04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006E0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100006E14);
  return result;
}

uint64_t sub_100006E20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100006E28);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100006E2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100006E34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100006E40(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TranslationDeepLinks()
{
  return &type metadata for TranslationDeepLinks;
}

unint64_t sub_100006E58(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v1 + 40));
  v3 = 8 * a1;
  v4 = *(_QWORD *)&aManagelaondevi[v3 + 16];
  String.hash(into:)(v7, *(_QWORD *)&aRoot_1[v3], v4);
  swift_bridgeObjectRelease(v4);
  v5 = Hasher._finalize()();
  return sub_100006ED4(a1, v5);
}

unint64_t sub_100006ED4(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    v6 = 8 * a1;
    v7 = *(_QWORD *)&aRoot_1[v6];
    v8 = *(_QWORD *)&aManagelaondevi[v6 + 16];
    while (1)
    {
      v9 = 8 * *(char *)(*(_QWORD *)(v2 + 48) + v4);
      v10 = *(_QWORD *)&aRoot_1[v9];
      v11 = *(_QWORD *)&aManagelaondevi[v9 + 16];
      if (v10 == v7 && v11 == v8)
        break;
      v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, *(_QWORD *)&aManagelaondevi[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4) + 16], v7, v8, 0);
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v8);
      if ((v13 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease(*(_QWORD *)&aManagelaondevi[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4) + 16]);
    swift_bridgeObjectRelease(v8);
  }
  return v4;
}

unint64_t sub_100006FE4()
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  char *v50;

  v0 = sub_100002588(&qword_100010760);
  v1 = __chkstk_darwin(v0);
  v49 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __chkstk_darwin(v1);
  v46 = (char *)&v39 - v4;
  __chkstk_darwin(v3);
  v42 = (char *)&v39 - v5;
  v6 = sub_100002588(&qword_1000103F0);
  v7 = __chkstk_darwin(v6);
  v48 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v50 = (char *)&v39 - v10;
  __chkstk_darwin(v9);
  v12 = (char *)&v39 - v11;
  v13 = type metadata accessor for LocalizedStringResource(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v47 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __chkstk_darwin(v15);
  v41 = (char *)&v39 - v18;
  __chkstk_darwin(v17);
  v20 = (char *)&v39 - v19;
  v21 = sub_100002588(&qword_100010768);
  v22 = *(_QWORD *)(sub_100002588(&qword_100010770) - 8);
  v23 = *(_QWORD *)(v22 + 72);
  v24 = *(unsigned __int8 *)(v22 + 80);
  v25 = (v24 + 32) & ~v24;
  v44 = 2 * v23;
  v26 = swift_allocObject(v21, v25 + 3 * v23, v24 | 7);
  v45 = v26;
  *(_OWORD *)(v26 + 16) = xmmword_100008CA0;
  v27 = v26 + v25;
  *(_BYTE *)(v26 + v25) = 0;
  LocalizedStringResource.init(stringLiteral:)(0x74616C736E617254, 0xE900000000000065);
  v43 = 0x800000010000A1E0;
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000016, 0x800000010000A1E0);
  v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56);
  v40 = v13;
  v28(v12, 0, 1, v13);
  v29 = v42;
  DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)(0x74616C736E617274, 0xE900000000000065, 0, 0);
  DisplayRepresentation.init(title:subtitle:image:)(v20, v12, v29);
  *(_BYTE *)(v27 + v23) = 1;
  v30 = v41;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000010, 0x8000000100009E70);
  v31 = v50;
  LocalizedStringResource.init(stringLiteral:)(0x100000000000002FLL, 0x800000010000A200);
  v28(v31, 0, 1, v13);
  v32 = v46;
  DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)(0x74616C736E617274, 0xE900000000000065, 0, 0);
  v33 = sub_100002588(&qword_100010778);
  v34 = swift_allocObject(v33, ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ 2 * *(_QWORD *)(v14 + 72), *(unsigned __int8 *)(v14 + 80) | 7);
  *(_OWORD *)(v34 + 16) = xmmword_100008CC0;
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000014, 0x8000000100009E50);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000020, 0x800000010000A230);
  DisplayRepresentation.init(title:subtitle:image:synonyms:)(v30, v50, v32, v34);
  *(_BYTE *)(v27 + v44) = 2;
  v35 = v47;
  LocalizedStringResource.init(stringLiteral:)(0x63697665442D6E4FLL, 0xEE0065646F4D2065);
  v36 = v48;
  LocalizedStringResource.init(stringLiteral:)(0x1000000000000016, v43);
  v28(v36, 0, 1, v40);
  v37 = v49;
  DisplayRepresentation.Image.init(systemName:tintColor:symbolConfiguration:)(0x74616C736E617274, 0xE900000000000065, 0, 0);
  DisplayRepresentation.init(title:subtitle:image:)(v35, v36, v37);
  return sub_100006380(v45);
}

uint64_t sub_100007494(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_1000074A8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100002588(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000074EC(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10000C770, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

ValueMetadata *type metadata accessor for TranslationLiveActivityControl()
{
  return &type metadata for TranslationLiveActivityControl;
}

uint64_t sub_100007544(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000A808, 1);
}

uint64_t sub_100007554()
{
  uint64_t v0;
  uint64_t result;

  v0 = type metadata accessor for ToggleControlStateProvider();
  result = swift_allocObject(v0, 16, 7);
  qword_100012AB8 = result;
  return result;
}

uint64_t sub_100007580@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t OpaqueTypeConformance2;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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

  v34 = a1;
  v33 = type metadata accessor for LocalizedStringResource(0);
  v28 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_100002588(&qword_1000107C0);
  v27 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_100002588(&qword_1000107C8);
  v29 = *(_QWORD *)(v31 - 8);
  __chkstk_darwin(v31);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_100002588(&qword_1000107D0);
  v30 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = off_1000107B8;
  v26 = qword_1000107B0;
  v11 = qword_100010360;
  swift_bridgeObjectRetain(off_1000107B8);
  if (v11 != -1)
    swift_once(&qword_100010360, sub_100007554);
  v37 = qword_100012AB8;
  swift_retain(qword_100012AB8);
  v12 = sub_100002588(&qword_1000107D8);
  v13 = type metadata accessor for ToggleControlStateProvider();
  v14 = sub_10000521C(&qword_1000107E0);
  v15 = sub_1000080B8(&qword_1000107E8, &qword_1000107E0, (uint64_t)&protocol conformance descriptor for ControlWidgetToggle<A, B, C>);
  v35 = v14;
  v36 = v15;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v35, &opaque type descriptor for <<opaque return type of ControlWidgetTemplate.tint(_:)>>, 1);
  v17 = sub_10000813C(&qword_1000107F0, (uint64_t (*)(uint64_t))type metadata accessor for ToggleControlStateProvider, (uint64_t)&unk_100009980);
  AppIntentControlConfiguration.init<A>(kind:provider:content:)(v26, v10, &v37, sub_100007908, 0, &type metadata for ToggleSpeechTranslationIntentConfiguration, v12, v13, OpaqueTypeConformance2, v17);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000011, 0x800000010000A3B0);
  v18 = sub_1000080B8(&qword_1000107F8, &qword_1000107C0, (uint64_t)&protocol conformance descriptor for AppIntentControlConfiguration<A, B>);
  ControlWidgetConfiguration.displayName(_:)(v2, v3, v18);
  v19 = *(void (**)(char *, uint64_t))(v28 + 8);
  v20 = v33;
  v19(v2, v33);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v5, v3);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001DLL, 0x800000010000A3D0);
  v35 = v3;
  v36 = v18;
  v21 = swift_getOpaqueTypeConformance2(&v35, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v22 = v31;
  ControlWidgetConfiguration.description(_:)(v2, v31, v21);
  v19(v2, v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v22);
  v35 = v22;
  v36 = v21;
  v23 = swift_getOpaqueTypeConformance2(&v35, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v24 = v32;
  ControlWidgetConfiguration.showsInControlCenter()(v32, v23);
  return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v9, v24);
}

uint64_t sub_100007908@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t OpaqueTypeConformance2;
  uint64_t v22;
  unint64_t v23;
  NSString v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;

  v36 = a2;
  v3 = sub_100002588(&qword_1000107E0);
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100002588(&qword_1000107D8);
  v32 = *(_QWORD *)(v6 - 8);
  v33 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v10 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000011, 0x800000010000A3B0);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v39 = sub_1000052A8();
  v17 = sub_100002588(&qword_100010800);
  v18 = sub_10000521C(&qword_100010808);
  v19 = sub_10000521C(&qword_100010810);
  v20 = sub_10000801C();
  v37 = v19;
  v38 = v20;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v37, &opaque type descriptor for <<opaque return type of View.controlWidgetStatus(_:)>>, 1);
  v37 = v18;
  v38 = OpaqueTypeConformance2;
  v22 = swift_getOpaqueTypeConformance2(&v37, &opaque type descriptor for <<opaque return type of View.controlWidgetActionHint(_:)>>, 1);
  v23 = sub_1000080F8();
  ControlWidgetToggle<>.init<>(_:isOn:action:valueLabel:)(v10, v12, v14 & 1, v16, v9, &v39, sub_100007B94, 0, v17, &type metadata for ToggleSpeechTranslationIntent, v22, v23);
  v24 = String._bridgeToObjectiveC()();
  v25 = (void *)objc_opt_self(UIColor);
  v26 = objc_msgSend(v25, "colorNamed:", v24);

  if (!v26)
    v26 = objc_msgSend(v25, "clearColor");
  v27 = Color.init(_:)(v26);
  v28 = sub_1000080B8(&qword_1000107E8, &qword_1000107E0, (uint64_t)&protocol conformance descriptor for ControlWidgetToggle<A, B, C>);
  v29 = v35;
  ControlWidgetTemplate.tint(_:)(v27, v35, v28);
  swift_release(v27, v30);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v29);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v32 + 32))(v36, v8, v33);
}

uint64_t sub_100007B94@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t);
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(void);
  char v39;
  unint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t OpaqueTypeConformance2;
  char *v64;
  uint64_t v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;

  v72 = a1;
  v80 = a2;
  v71 = type metadata accessor for SymbolEffectOptions(0);
  v2 = *(_QWORD *)(v71 - 8);
  __chkstk_darwin(v71);
  v4 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for BreatheSymbolEffect(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v67 - v10;
  v12 = sub_100002588(&qword_100010828);
  v69 = *(_QWORD *)(v12 - 8);
  v70 = v12;
  __chkstk_darwin(v12);
  v14 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100002588(&qword_100010810);
  __chkstk_darwin(v15);
  v17 = (char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100002588(&qword_100010808);
  v78 = *(_QWORD *)(v18 - 8);
  v79 = v18;
  __chkstk_darwin(v18);
  v77 = (char *)&v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100002588(&qword_100010800);
  v75 = *(_QWORD *)(v20 - 8);
  v76 = v20;
  __chkstk_darwin(v20);
  v73 = (char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100010360 != -1)
    swift_once(&qword_100010360, sub_100007554);
  v81 = sub_100005C50();
  v82 = v22;
  v23 = sub_100005F80();
  v24 = Label<>.init<A>(_:systemImage:)(&v81, 0x74616C736E617274, 0xE900000000000065, &type metadata for String, v23);
  v25 = BreatheSymbolEffect.init()(v24);
  BreatheSymbolEffect.plain.getter(v25);
  v26 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  v27 = v26(v11, v5);
  static SymbolEffectOptions.default.getter(v27);
  v74 = v15;
  v28 = &v17[*(int *)(v15 + 36)];
  v29 = sub_10000813C(&qword_100010840, (uint64_t (*)(uint64_t))&type metadata accessor for BreatheSymbolEffect, (uint64_t)&protocol conformance descriptor for BreatheSymbolEffect);
  dispatch thunk of SymbolEffect.configuration.getter(v5, v29);
  v30 = type metadata accessor for _IndefiniteSymbolEffectModifier(0);
  v31 = v71;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(&v28[*(int *)(v30 + 20)], v4, v71);
  v32 = *(int *)(v30 + 24);
  LOBYTE(v30) = v72;
  v28[v32] = v72 & 1;
  v33 = v17;
  v34 = v5;
  v35 = v4;
  v36 = v69;
  v37 = v70;
  v38 = *(void (**)(void))(v69 + 16);
  v68 = (uint64_t)v33;
  v38();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v35, v31);
  v26(v9, v34);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v14, v37);
  v39 = v30;
  if ((v30 & 1) != 0)
  {
    v40 = 0xD000000000000020;
    v41 = "TRANSLATE_CONTROL_TRANSLATION_ON";
  }
  else
  {
    v40 = 0xD000000000000021;
    v41 = "TRANSLATE_CONTROL_TRANSLATION_OFF";
  }
  v42 = LocalizedStringKey.init(stringLiteral:)(v40, (unint64_t)(v41 - 32) | 0x8000000000000000);
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v49 = v77;
  v50 = sub_10000801C();
  v51 = v42;
  v52 = v74;
  v53 = v68;
  View.controlWidgetStatus(_:)(v51, v44, v46 & 1, v48, v74, v50);
  swift_bridgeObjectRelease(v48);
  swift_bridgeObjectRelease(v44);
  sub_10000817C(v53);
  if ((v39 & 1) != 0)
  {
    v54 = 0x5F4F545F444C4F48;
    v55 = 0xEE004C45434E4143;
  }
  else
  {
    v55 = 0x800000010000A440;
    v54 = 0xD000000000000011;
  }
  v56 = LocalizedStringKey.init(stringLiteral:)(v54, v55);
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v81 = v52;
  v82 = v50;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v81, &opaque type descriptor for <<opaque return type of View.controlWidgetStatus(_:)>>, 1);
  v64 = v73;
  v65 = v79;
  View.controlWidgetActionHint(_:)(v56, v58, v60 & 1, v62, v79, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v62);
  swift_bridgeObjectRelease(v58);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v49, v65);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v75 + 32))(v80, v64, v76);
}

unint64_t sub_10000801C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010818;
  if (!qword_100010818)
  {
    v1 = sub_10000521C(&qword_100010810);
    sub_1000080B8(&qword_100010820, &qword_100010828, (uint64_t)&protocol conformance descriptor for Label<A, B>);
    sub_10000813C(&qword_100010830, (uint64_t (*)(uint64_t))&type metadata accessor for _IndefiniteSymbolEffectModifier, (uint64_t)&protocol conformance descriptor for _IndefiniteSymbolEffectModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100010818);
  }
  return result;
}

uint64_t sub_1000080B8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000521C(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000080F8()
{
  unint64_t result;

  result = qword_100010838;
  if (!qword_100010838)
  {
    result = swift_getWitnessTable(&unk_100009750, &type metadata for ToggleSpeechTranslationIntent);
    atomic_store(result, (unint64_t *)&qword_100010838);
  }
  return result;
}

uint64_t sub_10000813C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000817C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100002588(&qword_100010810);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000081BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t OpaqueTypeConformance2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_10000521C(&qword_1000107D0);
  v1 = sub_10000521C(&qword_1000107C8);
  v5 = sub_10000521C(&qword_1000107C0);
  v6 = sub_1000080B8(&qword_1000107F8, &qword_1000107C0, (uint64_t)&protocol conformance descriptor for AppIntentControlConfiguration<A, B>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.displayName(_:)>>, 1);
  v5 = v1;
  v6 = OpaqueTypeConformance2;
  v3 = swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.description(_:)>>, 1);
  v5 = v0;
  v6 = v3;
  return swift_getOpaqueTypeConformance2(&v5, &opaque type descriptor for <<opaque return type of ControlWidgetConfiguration.showsInControlCenter()>>, 1);
}

uint64_t sub_100008278()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;

  v0 = sub_100002588(&qword_100010850);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000083B4();
  _ControlWidgetAdaptor.init(_:)(v4, &type metadata for TranslationLiveActivityControl, v4);
  v5 = sub_1000083F8();
  static WidgetBundleBuilder.buildBlock<A>(_:)(v3, v0, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100008350();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100008350()
{
  unint64_t result;

  result = qword_100010848;
  if (!qword_100010848)
  {
    result = swift_getWitnessTable(&unk_100009D9C, &type metadata for TranslationWidgetsBundle);
    atomic_store(result, (unint64_t *)&qword_100010848);
  }
  return result;
}

ValueMetadata *type metadata accessor for TranslationWidgetsBundle()
{
  return &type metadata for TranslationWidgetsBundle;
}

uint64_t sub_1000083A4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000A84C, 1);
}

unint64_t sub_1000083B4()
{
  unint64_t result;

  result = qword_100010858;
  if (!qword_100010858)
  {
    result = swift_getWitnessTable(&unk_100009D40, &type metadata for TranslationLiveActivityControl);
    atomic_store(result, (unint64_t *)&qword_100010858);
  }
  return result;
}

unint64_t sub_1000083F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100010860;
  if (!qword_100010860)
  {
    v1 = sub_10000521C(&qword_100010850);
    result = swift_getWitnessTable(&protocol conformance descriptor for _ControlWidgetAdaptor<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100010860);
  }
  return result;
}

uint64_t sub_100008444()
{
  _QWORD v1[2];

  v1[0] = sub_10000521C(&qword_100010850);
  v1[1] = sub_1000083F8();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC27TranslationWidgetsExtensionP33_8EC176E3E4A0DC2A4CA26EBEAE2651FD19ResourceBundleClass);
}
