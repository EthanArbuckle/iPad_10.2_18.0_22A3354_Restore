uint64_t sub_100001A94(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100001BB0();
  return AppIntentsExtension.configuration.getter(a1, v2);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100001B28();
  static AppExtension.main()();
  return 0;
}

unint64_t sub_100001B28()
{
  unint64_t result;

  result = qword_100008028;
  if (!qword_100008028)
  {
    result = swift_getWitnessTable(&unk_100003688, &type metadata for MusicFocusFiltersExtension);
    atomic_store(result, (unint64_t *)&qword_100008028);
  }
  return result;
}

uint64_t sub_100001B70(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100001BB0();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of AppIntentsExtension.configuration>>, 1);
}

unint64_t sub_100001BB0()
{
  unint64_t result;

  result = qword_100008030;
  if (!qword_100008030)
  {
    result = swift_getWitnessTable(&unk_100003660, &type metadata for MusicFocusFiltersExtension);
    atomic_store(result, (unint64_t *)&qword_100008030);
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicFocusFiltersExtension()
{
  return &type metadata for MusicFocusFiltersExtension;
}

unint64_t sub_100001C08()
{
  unint64_t result;

  result = qword_100008038;
  if (!qword_100008038)
  {
    result = swift_getWitnessTable(&unk_100003760, &type metadata for MusicPrivacyFocusFilter);
    atomic_store(result, (unint64_t *)&qword_100008038);
  }
  return result;
}

unint64_t sub_100001C50()
{
  unint64_t result;

  result = qword_100008040;
  if (!qword_100008040)
  {
    result = swift_getWitnessTable(&unk_1000037F0, &type metadata for MusicPrivacyFocusFilter);
    atomic_store(result, (unint64_t *)&qword_100008040);
  }
  return result;
}

uint64_t sub_100001C94()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_100003204(v0, qword_1000084C0);
  sub_10000318C(v0, (uint64_t)qword_1000084C0);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000019, 0x8000000100003D20);
}

uint64_t sub_100001CF4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[3] = a1;
  v2[4] = a2;
  v3 = type metadata accessor for Logger(0);
  v2[5] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v2[6] = v4;
  v2[7] = swift_task_alloc((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for MainActor(0);
  v2[8] = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_100001D88, v6, v7);
}

uint64_t sub_100001D88()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;

  v1 = swift_release(*(_QWORD *)(v0 + 64));
  IntentParameter.wrappedValue.getter(v1);
  v2 = *(unsigned __int8 *)(v0 + 72);
  if (v2 == 2)
  {
    v3 = objc_msgSend((id)objc_opt_self(MPPlaybackUserDefaults), "standardUserDefaults");
    objc_msgSend(v3, "setFocusModePrivateListeningEnabled:", 0);

    if (qword_100008020 != -1)
      swift_once(&qword_100008020, sub_1000028A0);
    v4 = sub_10000318C(*(_QWORD *)(v0 + 40), (uint64_t)qword_1000084D8);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Privacy focus filter disabled.", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }

  }
  else
  {
    v9 = objc_msgSend((id)objc_opt_self(MPPlaybackUserDefaults), "standardUserDefaults");
    v10 = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithBool:", (v2 & 1) == 0);
    objc_msgSend(v9, "setFocusModePrivateListeningEnabled:", v10);

    if (qword_100008020 != -1)
      swift_once(&qword_100008020, sub_1000028A0);
    v12 = *(_QWORD *)(v0 + 48);
    v11 = *(_QWORD *)(v0 + 56);
    v13 = *(_QWORD *)(v0 + 40);
    v14 = sub_10000318C(v13, (uint64_t)qword_1000084D8);
    v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v11, v14, v13);
    v16 = Logger.logObject.getter(v15);
    v17 = static os_log_type_t.default.getter();
    v18 = os_log_type_enabled(v16, v17);
    v19 = *(_QWORD *)(v0 + 48);
    v20 = *(_QWORD *)(v0 + 56);
    v21 = *(_QWORD *)(v0 + 40);
    if (v18)
    {
      v28 = *(_QWORD *)(v0 + 56);
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = swift_slowAlloc(32, -1);
      *(_DWORD *)v22 = 136446210;
      v29 = v23;
      if ((v2 & 1) != 0)
        v24 = 1702195828;
      else
        v24 = 0x65736C6166;
      if ((v2 & 1) != 0)
        v25 = 0xE400000000000000;
      else
        v25 = 0xE500000000000000;
      *(_QWORD *)(v0 + 16) = sub_100002920(v24, v25, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 16, v0 + 24, v22 + 4, v22 + 12);
      swift_bridgeObjectRelease(v25);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Privacy focus filter enabled, useListeningHistory = %{public}s", v22, 0xCu);
      swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v23, -1, -1);
      swift_slowDealloc(v22, -1, -1);

      v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v28, v21);
    }
    else
    {

      v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
    }
  }
  v26 = *(_QWORD *)(v0 + 56);
  static IntentResult.result<>()(v8);
  swift_task_dealloc(v26);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000020F0()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v18;
  void (*v19)(_BYTE *, uint64_t);
  _BYTE v21[16];

  sub_100002860(&qword_100008080);
  ((void (*)(void))__chkstk_darwin)();
  v1 = &v21[-((v0 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002860(&qword_100008088);
  ((void (*)(void))__chkstk_darwin)();
  v3 = &v21[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for LocalizedStringResource(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __chkstk_darwin(v6);
  v11 = &v21[-v10];
  __chkstk_darwin(v9);
  v13 = &v21[-v12];
  v14 = LocalizedStringResource.init(stringLiteral:)(0xD000000000000015, 0x8000000100003A00);
  IntentParameter.wrappedValue.getter(v14);
  if ((v21[15] & 1) != 0)
  {
    v15 = 0x6E4F206E727554;
    v16 = 0xE700000000000000;
  }
  else
  {
    v15 = 0x66664F206E727554;
    v16 = 0xE800000000000000;
  }
  LocalizedStringResource.init(stringLiteral:)(v15, v16);
  v17 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16);
  v17(v8, v13, v4);
  v17(v3, v11, v4);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  v18 = type metadata accessor for DisplayRepresentation.Image(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v1, 1, 1, v18);
  DisplayRepresentation.init(title:subtitle:image:)(v8, v3, v1);
  v19 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v19(v11, v4);
  return ((uint64_t (*)(_BYTE *, uint64_t))v19)(v13, v4);
}

uint64_t sub_100002310()
{
  return FocusFilterAppContext.init(notificationFilterPredicate:)(0);
}

uint64_t sub_100002318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to static SetFocusFilterIntent.suggestedFocusFilters(for:)[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100002380;
  return static SetFocusFilterIntent.suggestedFocusFilters(for:)(a1, a2, a3);
}

uint64_t sub_100002380(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v6 = *v1;
  v3 = *(_QWORD *)(v6 + 16);
  v4 = *v1;
  v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

unint64_t sub_1000023D4()
{
  unint64_t result;

  result = qword_100008050;
  if (!qword_100008050)
  {
    result = swift_getWitnessTable(&unk_100003820, &type metadata for MusicPrivacyFocusFilter);
    atomic_store(result, (unint64_t *)&qword_100008050);
  }
  return result;
}

unint64_t sub_10000241C()
{
  unint64_t result;

  result = qword_100008058;
  if (!qword_100008058)
  {
    result = swift_getWitnessTable(&unk_100003848, &type metadata for MusicPrivacyFocusFilter);
    atomic_store(result, (unint64_t *)&qword_100008058);
  }
  return result;
}

uint64_t sub_100002460(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000399C, 1);
}

uint64_t sub_100002470(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_100001C08();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

uint64_t sub_1000024B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_100008018 != -1)
    swift_once(&qword_100008018, sub_100001C94);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000318C(v2, (uint64_t)qword_1000084C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100002520()
{
  return 0;
}

uint64_t sub_100002534@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  sub_100002860(&qword_100008088);
  __chkstk_darwin();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for LocalizedStringResource(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000081, 0x8000000100003C90);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  IntentDescription.init(_:categoryName:searchKeywords:)(v7, v3, &_swiftEmptyArrayStorage);
  v8 = type metadata accessor for IntentDescription(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a1, 0, 1, v8);
}

uint64_t sub_100002648(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc(dword_1000080AC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000026A0;
  return sub_100001CF4(a1, v4);
}

uint64_t sub_1000026A0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000026E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_100002F60();
  *a1 = result;
  return result;
}

unint64_t sub_100002710()
{
  unint64_t result;

  result = qword_100008068;
  if (!qword_100008068)
  {
    result = swift_getWitnessTable(&unk_100003864, &type metadata for MusicPrivacyFocusFilter);
    atomic_store(result, (unint64_t *)&qword_100008068);
  }
  return result;
}

uint64_t sub_100002754()
{
  return sub_1000020F0();
}

uint64_t sub_10000275C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100001C08();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_100002784(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100001C50();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

ValueMetadata *type metadata accessor for MusicPrivacyFocusFilter()
{
  return &type metadata for MusicPrivacyFocusFilter;
}

unint64_t sub_1000027D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100008070;
  if (!qword_100008070)
  {
    v1 = sub_10000281C(&qword_100008078);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_100008070);
  }
  return result;
}

uint64_t sub_10000281C(uint64_t *a1)
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

uint64_t sub_100002860(uint64_t *a1)
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

uint64_t sub_1000028A0()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100003204(v0, qword_1000084D8);
  sub_10000318C(v0, (uint64_t)qword_1000084D8);
  return Logger.init(subsystem:category:)(0xD00000000000001CLL, 0x8000000100003C70, 0xD000000000000017, 0x8000000100003890);
}

uint64_t sub_100002920(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000029F0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1000031C4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1000031C4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000031A4(v12);
  return v7;
}

uint64_t sub_1000029F0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100002BA8(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_100002BA8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100002C3C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100002E14(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100002E14(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100002C3C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100002DB0(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100002DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100002860((uint64_t *)&unk_1000080B0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100002E14(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100002860((uint64_t *)&unk_1000080B0);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100002F60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v17[15];
  char v18;

  v0 = type metadata accessor for InputConnectionBehavior(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = &v17[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002860(&qword_100008090);
  __chkstk_darwin();
  v5 = &v17[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002860(&qword_100008098);
  __chkstk_darwin();
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002860(&qword_100008088);
  __chkstk_darwin();
  v9 = &v17[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for LocalizedStringResource(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v13 = &v17[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100002860(&qword_1000080A0);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000015, 0x8000000100003A00);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  v18 = 2;
  v14 = type metadata accessor for Bool.IntentDisplayName(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v7, 1, 1, v14);
  v15 = type metadata accessor for IntentDialog(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v5, 1, 1, v15);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for InputConnectionBehavior.default(_:), v0);
  return IntentParameter<>.init(title:description:default:displayName:requestValueDialog:inputConnectionBehavior:)(v13, v9, &v18, v7, v5, v3);
}

uint64_t sub_10000318C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1000031A4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1000031C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_100003204(uint64_t a1, uint64_t *a2)
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
