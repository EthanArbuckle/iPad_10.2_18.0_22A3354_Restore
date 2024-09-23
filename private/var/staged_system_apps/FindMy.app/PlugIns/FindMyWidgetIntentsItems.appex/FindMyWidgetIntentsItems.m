uint64_t sub_100003054()
{
  uint64_t *v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  Swift::String v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  Swift::String v15;
  Swift::String v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  Swift::String v20;
  Swift::String v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  Swift::String v25;
  Swift::String v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  Swift::String v30;
  Swift::String v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  Swift::String v35;
  Swift::String v36;

  _StringGuts.grow(_:)(103);
  v1._countAndFlagsBits = 0x73736572646441;
  v1._object = (void *)0xE700000000000000;
  String.append(_:)(v1);
  v2 = v0[13];
  if (v2)
    v3 = v0[12];
  else
    v3 = 0;
  if (v2)
    v4 = (void *)v0[13];
  else
    v4 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain();
  v5._countAndFlagsBits = v3;
  v5._object = v4;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(v4);
  v6._object = (void *)0xEC000000223D7974;
  v6._countAndFlagsBits = 0x696C61636F6C203ALL;
  String.append(_:)(v6);
  v7 = v0[1];
  if (v7)
    v8 = *v0;
  else
    v8 = 0;
  if (v7)
    v9 = (void *)v0[1];
  else
    v9 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain();
  v10._countAndFlagsBits = v8;
  v10._object = v9;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v9);
  v11._countAndFlagsBits = 0x746E756F63202C22;
  v11._object = (void *)0xEB00000000223D79;
  String.append(_:)(v11);
  v12 = v0[3];
  if (v12)
    v13 = v0[2];
  else
    v13 = 0;
  if (v12)
    v14 = (void *)v0[3];
  else
    v14 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain();
  v15._countAndFlagsBits = v13;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(v14);
  v16._countAndFlagsBits = 0x746E756F63202C22;
  v16._object = (void *)0xEC000000223D7972;
  String.append(_:)(v16);
  v17 = v0[5];
  if (v17)
    v18 = v0[4];
  else
    v18 = 0;
  if (v17)
    v19 = (void *)v0[5];
  else
    v19 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain();
  v20._countAndFlagsBits = v18;
  v20._object = v19;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v19);
  v21._countAndFlagsBits = 0x6D646E616C202C22;
  v21._object = (void *)0xED0000223D6B7261;
  String.append(_:)(v21);
  v22 = v0[7];
  if (v22)
    v23 = v0[6];
  else
    v23 = 0;
  if (v22)
    v24 = (void *)v0[7];
  else
    v24 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain();
  v25._countAndFlagsBits = v23;
  v25._object = v24;
  String.append(_:)(v25);
  swift_bridgeObjectRelease(v24);
  v26._countAndFlagsBits = 0xD000000000000011;
  v26._object = (void *)0x80000001000147A0;
  String.append(_:)(v26);
  v27 = v0[9];
  if (v27)
    v28 = v0[8];
  else
    v28 = 0;
  if (v27)
    v29 = (void *)v0[9];
  else
    v29 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain();
  v30._countAndFlagsBits = v28;
  v30._object = v29;
  String.append(_:)(v30);
  swift_bridgeObjectRelease(v29);
  v31._object = (void *)0x80000001000147C0;
  v31._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v31);
  v32 = v0[11];
  if (v32)
    v33 = v0[10];
  else
    v33 = 0;
  if (v32)
    v34 = (void *)v0[11];
  else
    v34 = (void *)0xE000000000000000;
  swift_bridgeObjectRetain();
  v35._countAndFlagsBits = v33;
  v35._object = v34;
  String.append(_:)(v35);
  swift_bridgeObjectRelease(v34);
  v36._countAndFlagsBits = 34;
  v36._object = (void *)0xE100000000000000;
  String.append(_:)(v36);
  return 0;
}

uint64_t variable initialization expression of ItemSelectorIntentResponse.code()
{
  return 0;
}

void sub_1000032F0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t initializeBufferWithCopyOfBuffer for Address(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for Address(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[9]);
  swift_bridgeObjectRelease(a1[11]);
  return swift_bridgeObjectRelease(a1[13]);
}

_QWORD *initializeWithCopy for Address(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  v9 = a2[13];
  a1[12] = a2[12];
  a1[13] = v9;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  return a1;
}

_QWORD *assignWithCopy for Address(_QWORD *a1, _QWORD *a2)
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

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[6] = a2[6];
  v10 = a2[7];
  v11 = a1[7];
  a1[7] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  a1[8] = a2[8];
  v12 = a2[9];
  v13 = a1[9];
  a1[9] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  a1[10] = a2[10];
  v14 = a2[11];
  v15 = a1[11];
  a1[11] = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  a1[12] = a2[12];
  v16 = a2[13];
  v17 = a1[13];
  a1[13] = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  return a1;
}

__n128 initializeWithTake for Address(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

_QWORD *assignWithTake for Address(_QWORD *a1, _QWORD *a2)
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

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[5];
  v9 = a1[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  v10 = a2[7];
  v11 = a1[7];
  a1[6] = a2[6];
  a1[7] = v10;
  swift_bridgeObjectRelease(v11);
  v12 = a2[9];
  v13 = a1[9];
  a1[8] = a2[8];
  a1[9] = v12;
  swift_bridgeObjectRelease(v13);
  v14 = a2[11];
  v15 = a1[11];
  a1[10] = a2[10];
  a1[11] = v14;
  swift_bridgeObjectRelease(v15);
  v16 = a2[13];
  v17 = a1[13];
  a1[12] = a2[12];
  a1[13] = v16;
  swift_bridgeObjectRelease(v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for Address(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 112))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Address(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 112) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 112) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Address()
{
  return &type metadata for Address;
}

__n128 sub_1000036C0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000036D0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000036F0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGPoint()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10001D240)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100018DF0);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001D240);
  }
}

Swift::String *itemsWidgetBundleId.unsafeMutableAddressor()
{
  return &itemsWidgetBundleId;
}

void sub_100003778()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));

}

uint64_t sub_100003794()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v2 = type metadata accessor for Logger(0);
  sub_100005148(v2, (uint64_t)qword_10001E4D8);
  v3 = swift_retain(v0);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v12 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = *(_QWORD *)(v1 + 16);
    v9 = *(_QWORD *)(v1 + 24);
    swift_bridgeObjectRetain(v9);
    v11 = sub_100010D74(v8, v9, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v11, &v12, v6 + 4, v6 + 12);
    swift_release(v1);
    swift_bridgeObjectRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "🥑 ItemsDataService%s: deinit", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

    swift_release(v1);
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v1 + 64));

  return v1;
}

uint64_t sub_100003968()
{
  uint64_t v0;

  sub_100003794();
  return swift_deallocClassInstance(v0, 80, 7);
}

uint64_t type metadata accessor for ItemsDataService()
{
  return objc_opt_self(_TtC24FindMyWidgetIntentsItems16ItemsDataService);
}

uint64_t sub_1000039A8()
{
  return 0x736D657449;
}

uint64_t sub_1000039BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t result;
  _QWORD aBlock[5];
  uint64_t v31;

  v3 = v2;
  v6 = type metadata accessor for Locale(0);
  __chkstk_darwin(v6);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for FMIPManagerSubsystem(0);
  __chkstk_darwin(v9);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)swift_allocObject(&unk_100018E88, 40, 7);
  v12[2] = v3;
  v12[3] = a1;
  v12[4] = a2;
  v13 = type metadata accessor for FMIPSnapshotHandlers(0);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  swift_retain(v3);
  swift_retain(a2);
  swift_retain(v12);
  v14 = FMIPSnapshotHandlers.init(devicesResponseFilter:devicesResponseHandler:itemsResponseFilter:itemsResponseHandler:)(0, 0, 0, 0, 0, 0, sub_100007710, v12);
  type metadata accessor for FMIPManagerConfiguration(0);
  static FMIPManagerSubsystem.items.getter();
  v15 = swift_retain(v14);
  v16 = static FMIPManagerConfiguration.default.getter(v15);
  FMIPManagerConfiguration.preferredLocale.getter();
  v17 = swift_release(v16);
  v18 = static FMIPManagerConfiguration.default.getter(v17);
  FMIPManagerConfiguration.authenticationUIProvider.getter(aBlock);
  swift_release(v18);
  v19 = FMIPManagerConfiguration.__allocating_init(enabledSubsystems:preferredLocale:authenticationUIProvider:snapshotHandlers:)(v11, v8, aBlock, v14);
  v20 = objc_allocWithZone((Class)SPOwnerSession);
  swift_retain(v19);
  v21 = objc_msgSend(v20, "init");
  v22 = type metadata accessor for FMIPManager(0);
  swift_allocObject(v22, *(unsigned int *)(v22 + 48), *(unsigned __int16 *)(v22 + 52));
  v23 = FMIPManager.init(configuration:ownerSession:)(v19, v21);
  FMIPManager.initialize()();
  FMIPManager.startRefreshing()();
  v24 = *(NSObject **)(v3 + 40);
  v25 = swift_allocObject(&unk_100018EB0, 32, 7);
  *(_QWORD *)(v25 + 16) = v3;
  *(_QWORD *)(v25 + 24) = v23;
  v26 = swift_allocObject(&unk_100018ED8, 32, 7);
  *(_QWORD *)(v26 + 16) = sub_100007720;
  *(_QWORD *)(v26 + 24) = v25;
  aBlock[4] = sub_100007738;
  v31 = v26;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100004440;
  aBlock[3] = &unk_100018EF0;
  v27 = _Block_copy(aBlock);
  v28 = v31;
  swift_retain(v3);
  swift_retain(v23);
  swift_retain(v26);
  swift_release(v28);
  dispatch_sync(v24, v27);
  swift_release(v23);
  swift_release(v19);
  swift_release(v14);
  swift_release(v12);
  _Block_release(v27);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation(v26, "", 102, 94, 34, 1);
  swift_release(v25);
  result = swift_release(v26);
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_100003CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t);
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t aBlock[5];
  uint64_t v47;

  v41 = a7;
  v42 = a6;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for DispatchQoS(0);
  v44 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v43 = (char *)&v37 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v16 = type metadata accessor for Logger(0);
  sub_100005148(v16, (uint64_t)qword_10001E4D8);
  swift_retain(a5);
  v17 = swift_bridgeObjectRetain(a3);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc(22, -1);
    v39 = v14;
    v21 = v20;
    v22 = swift_slowAlloc(32, -1);
    v40 = v10;
    v37 = v22;
    aBlock[0] = v22;
    *(_DWORD *)v21 = 136315394;
    v38 = a1;
    v23 = *(_QWORD *)(a5 + 16);
    v24 = *(_QWORD *)(a5 + 24);
    swift_bridgeObjectRetain(v24);
    v45 = (_QWORD *)sub_100010D74(v23, v24, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, aBlock, v21 + 4, v21 + 12);
    swift_release(a5);
    v25 = v24;
    a1 = v38;
    swift_bridgeObjectRelease(v25);
    *(_WORD *)(v21 + 12) = 2048;
    v45 = *(_QWORD **)(a3 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, aBlock, v21 + 14, v21 + 22);
    swift_bridgeObjectRelease(a3);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "🥑 ItemsDataService%s: provided %ld records", (uint8_t *)v21, 0x16u);
    v26 = v37;
    swift_arrayDestroy(v37, 1, (char *)&type metadata for Any + 8);
    v10 = v40;
    swift_slowDealloc(v26, -1, -1);
    v27 = v21;
    v14 = v39;
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease(a3);
    swift_release(a5);
  }
  FMIPManager.stopRefreshing()();
  aBlock[0] = a3;
  swift_bridgeObjectRetain(a3);
  sub_1000053A8(aBlock);
  v28 = aBlock[0];
  v42(aBlock[0]);
  swift_release(v28);
  v29 = swift_allocObject(&unk_100018F28, 32, 7);
  *(_QWORD *)(v29 + 16) = a5;
  *(_QWORD *)(v29 + 24) = a1;
  aBlock[4] = (uint64_t)sub_1000077A0;
  v47 = v29;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000EEA8;
  aBlock[3] = (uint64_t)&unk_100018F40;
  v30 = _Block_copy(aBlock);
  swift_retain(a5);
  v31 = swift_retain(a1);
  v32 = v43;
  static DispatchQoS.unspecified.getter(v31);
  v45 = _swiftEmptyArrayStorage;
  v33 = sub_100007838((unint64_t *)&qword_10001D3D0, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v34 = sub_1000075DC(&qword_10001D3D8);
  v35 = sub_1000077A8();
  dispatch thunk of SetAlgebra.init<A>(_:)(&v45, v34, v35, v10, v33);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v32, v13, v30);
  _Block_release(v30);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v44 + 8))(v32, v14);
  return swift_release(v47);
}

uint64_t sub_1000040DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  _BYTE v11[24];
  _BYTE v12[24];

  v4 = a1 + 64;
  swift_beginAccess(a1 + 64, v12, 0, 0);
  v5 = *(_QWORD *)(a1 + 64);
  swift_bridgeObjectRetain(v5);
  v6 = sub_100004180(a2, v5);
  v8 = v7;
  result = swift_bridgeObjectRelease(v5);
  if ((v8 & 1) == 0)
  {
    swift_beginAccess(v4, v11, 33, 0);
    v10 = sub_1000042C8(v6);
    swift_endAccess(v11);
    return swift_release(v10);
  }
  return result;
}

uint64_t sub_100004180(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v13 = a1;
  if (!((unint64_t)a2 >> 62))
  {
    v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
    return 0;
  }
LABEL_13:
  if (a2 < 0)
    v10 = a2;
  else
    v10 = a2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a2);
  v3 = _CocoaArrayWrapper.endIndex.getter(v10);
  swift_bridgeObjectRelease(a2);
  if (!v3)
    return 0;
LABEL_3:
  v4 = type metadata accessor for FMIPManager(0);
  for (i = 0; ; ++i)
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(i, a2);
    }
    else
    {
      v6 = *(_QWORD *)(a2 + 8 * i + 32);
      swift_retain(v6);
    }
    v12 = v6;
    v7 = sub_100007838(&qword_10001D3E8, (uint64_t (*)(uint64_t))&type metadata accessor for FMIPManager, (uint64_t)&protocol conformance descriptor for FMIPManager);
    v8 = dispatch thunk of static Equatable.== infix(_:_:)(&v12, &v13, v4, v7);
    swift_release(v6);
    if ((v8 & 1) != 0)
      break;
    v9 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_13;
    }
    if (v9 == v3)
      return 0;
  }
  return i;
}

uint64_t sub_1000042C8(unint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t result;
  char v13;

  v3 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v3;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v3 < 0 || (v3 & 0x4000000000000000) != 0)
  {
    v3 = sub_100006C30(v3);
    *v1 = v3;
  }
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    if (v8 >= 0)
    {
      v9 = v5 + 8 * a1;
      v10 = *(_QWORD *)(v9 + 32);
      v11 = memmove((void *)(v9 + 32), (const void *)(v9 + 40), 8 * v8);
      *(_QWORD *)(v5 + 16) = v7;
      specialized Array._endMutation()(v11);
      return v10;
    }
  }
  v13 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v13, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000043A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE v10[24];

  swift_beginAccess(a1 + 64, v10, 33, 0);
  v4 = swift_retain(a2);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v4);
  v5 = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v5 + 0x10);
  v6 = *(_QWORD *)(v5 + 24);
  if (v7 >= v6 >> 1)
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v6 > 1, v7 + 1, 1);
  v8 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, a2);
  specialized Array._endMutation()(v8);
  return swift_endAccess(v10);
}

uint64_t sub_100004440(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100004460()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[16];
  uint64_t v29[3];

  v1 = v0;
  v2 = swift_allocObject(&unk_100018E38, 24, 7);
  *(_QWORD *)(v2 + 16) = _swiftEmptyArrayStorage;
  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v4 = type metadata accessor for Logger(0);
  sub_100005148(v4, (uint64_t)qword_10001E4D8);
  v5 = swift_retain(v0);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v29[0] = v9;
    *(_DWORD *)v8 = 136315138;
    v25 = v3;
    v11 = *(_QWORD *)(v1 + 16);
    v10 = *(_QWORD *)(v1 + 24);
    swift_bridgeObjectRetain(v10);
    v27 = sub_100010D74(v11, v10, v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, v28, v8 + 4, v8 + 12);
    swift_release(v1);
    v12 = v10;
    v3 = v25;
    swift_bridgeObjectRelease(v12);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "🥑 ItemsDataService%s: fetching all items…", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

    swift_release(v1);
  }
  v13 = (_QWORD *)swift_allocObject(&unk_100018E60, 40, 7);
  v13[2] = v1;
  v13[3] = v3;
  v13[4] = v2;
  swift_retain(v1);
  v14 = v3;
  swift_retain(v2);
  sub_1000039BC((uint64_t)sub_100005194, (uint64_t)v13);
  swift_release(v13);
  OS_dispatch_group.wait()();
  swift_retain(v1);
  v15 = swift_retain(v2);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc(22, -1);
    v19 = swift_slowAlloc(32, -1);
    v29[0] = v19;
    *(_DWORD *)v18 = 136315394;
    v20 = *(_QWORD *)(v1 + 16);
    v21 = *(_QWORD *)(v1 + 24);
    swift_bridgeObjectRetain(v21);
    v27 = sub_100010D74(v20, v21, v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, v28, v18 + 4, v18 + 12);
    swift_release(v1);
    swift_bridgeObjectRelease(v21);
    *(_WORD *)(v18 + 12) = 2048;
    v22 = v2 + 16;
    swift_beginAccess(v2 + 16, &v27, 0, 0);
    v26 = *(_QWORD *)(*(_QWORD *)(v2 + 16) + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v18 + 14, v18 + 22);
    swift_release(v2);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "🥑 ItemsDataService%s: returned %ld light models", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v18, -1, -1);

  }
  else
  {

    swift_release(v2);
    swift_release(v1);

    v22 = v2 + 16;
  }
  swift_beginAccess(v22, v29, 0, 0);
  v23 = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain(v23);
  swift_release(v2);
  return v23;
}

uint64_t sub_100004858()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000487C(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21[2];

  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v8 = type metadata accessor for Logger(0);
  sub_100005148(v8, (uint64_t)qword_10001E4D8);
  swift_retain(a2);
  v9 = swift_bridgeObjectRetain(a1);
  v10 = Logger.logObject.getter(v9);
  v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc(22, -1);
    v19 = swift_slowAlloc(32, -1);
    v21[0] = v19;
    *(_DWORD *)v12 = 136315394;
    v14 = *(_QWORD *)(a2 + 16);
    v13 = *(_QWORD *)(a2 + 24);
    swift_bridgeObjectRetain(v13);
    v20 = sub_100010D74(v14, v13, v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, v21, v12 + 4, v12 + 12);
    swift_release(a2);
    swift_bridgeObjectRelease(v13);
    *(_WORD *)(v12 + 12) = 2048;
    v20 = *(_QWORD *)(a1 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, v21, v12 + 14, v12 + 22);
    swift_bridgeObjectRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "🥑 ItemsDataService%s: fetched %ld items", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy(v19, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v19, -1, -1);
    swift_slowDealloc(v12, -1, -1);

    v15 = *(_QWORD *)(a1 + 16);
    if (!v15)
      goto LABEL_10;
  }
  else
  {

    swift_bridgeObjectRelease(a1);
    swift_release(a2);
    v15 = *(_QWORD *)(a1 + 16);
    if (!v15)
      goto LABEL_10;
  }
  v16 = *(_QWORD *)(type metadata accessor for FMIPItem(0) - 8);
  v17 = a1 + ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80));
  v18 = *(_QWORD *)(v16 + 72);
  swift_bridgeObjectRetain(a1);
  do
  {
    sub_100004AD0(v17, a3, a2, a4);
    v17 += v18;
    --v15;
  }
  while (v15);
  swift_bridgeObjectRelease(a1);
LABEL_10:
  dispatch_group_leave(a3);
}

uint64_t sub_100004AD0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v28;
  NSObject *v29;
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

  v33 = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v36 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_group_enter(a2);
  v35 = a1;
  v34 = FMIPItem.identifier.getter();
  v12 = v11;
  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v13 = type metadata accessor for Logger(0);
  sub_100005148(v13, (uint64_t)qword_10001E4D8);
  swift_retain_n(a3, 2);
  v14 = swift_bridgeObjectRetain_n(v12, 2);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc(22, -1);
    v29 = a2;
    v18 = v17;
    v28 = swift_slowAlloc(64, -1);
    v39 = v28;
    *(_DWORD *)v18 = 136315394;
    v32 = v4;
    v19 = *(_QWORD *)(a3 + 16);
    v20 = *(_QWORD *)(a3 + 24);
    v30 = v9;
    swift_bridgeObjectRetain(v20);
    v37 = sub_100010D74(v19, v20, &v39);
    v31 = a4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v18 + 4, v18 + 12);
    swift_release_n(a3, 2);
    v9 = v30;
    swift_bridgeObjectRelease(v20);
    *(_WORD *)(v18 + 12) = 2080;
    swift_bridgeObjectRetain(v12);
    v21 = v34;
    v37 = sub_100010D74(v34, v12, &v39);
    a4 = v31;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v18 + 14, v18 + 22);
    swift_bridgeObjectRelease_n(v12, 3);
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "🥑 ItemsDataService%s: building %s light model…", (uint8_t *)v18, 0x16u);
    v22 = v28;
    swift_arrayDestroy(v28, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1, -1);
    v23 = v18;
    a2 = v29;
    swift_slowDealloc(v23, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v12, 2);
    swift_release_n(a3, 2);
    v21 = v34;
  }
  v24 = (uint64_t)v36;
  v25 = v33;
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v36, enum case for WidgetFamily.systemSmall(_:), v33);
  swift_retain(a3);
  swift_bridgeObjectRetain(v12);
  swift_retain(a4);
  v26 = a2;
  sub_100006FA4(v35, v24, 0, a3, a3, v21, v12, a4, v26);
  swift_release(a3);
  swift_bridgeObjectRelease_n(v12, 2);
  swift_release(a4);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v24, v25);
}

void sub_100004E08(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, NSObject *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[3];

  v35 = a3;
  v11 = type metadata accessor for ItemModel(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v15 = (unint64_t *)(a5 + 16);
  v16 = type metadata accessor for Logger(0);
  sub_100005148(v16, (uint64_t)qword_10001E4D8);
  swift_retain_n(a2, 2);
  v17 = swift_bridgeObjectRetain_n(a4, 2);
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc(22, -1);
    v33 = (unint64_t *)(a5 + 16);
    v21 = v20;
    v31 = swift_slowAlloc(64, -1);
    v37[0] = v31;
    *(_DWORD *)v21 = 136315394;
    v34 = v14;
    v32 = a1;
    v23 = *(_QWORD *)(a2 + 16);
    v22 = *(_QWORD *)(a2 + 24);
    swift_bridgeObjectRetain(v22);
    v36 = sub_100010D74(v23, v22, v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v21 + 4, v21 + 12);
    swift_release_n(a2, 2);
    swift_bridgeObjectRelease(v22);
    *(_WORD *)(v21 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    v36 = sub_100010D74(v35, a4, v37);
    v14 = v34;
    a1 = v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, v37, v21 + 14, v21 + 22);
    swift_bridgeObjectRelease_n(a4, 3);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "🥑 ItemsDataService%s: built %s light model", (uint8_t *)v21, 0x16u);
    v24 = v31;
    swift_arrayDestroy(v31, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v24, -1, -1);
    v25 = v21;
    v15 = v33;
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a4, 2);
    swift_release_n(a2, 2);
  }
  sub_100007658(a1, (uint64_t)v14);
  swift_beginAccess(v15, v37, 33, 0);
  v26 = *v15;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v15);
  *v15 = v26;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v26 = sub_1000051A0(0, *(_QWORD *)(v26 + 16) + 1, 1, v26);
    *v15 = v26;
  }
  v29 = *(_QWORD *)(v26 + 16);
  v28 = *(_QWORD *)(v26 + 24);
  if (v29 >= v28 >> 1)
  {
    v26 = sub_1000051A0(v28 > 1, v29 + 1, 1, v26);
    *v15 = v26;
  }
  *(_QWORD *)(v26 + 16) = v29 + 1;
  sub_10000769C((uint64_t)v14, v26+ ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))+ *(_QWORD *)(v12 + 72) * v29);
  swift_endAccess(v37);
  dispatch_group_leave(a6);
}

uint64_t sub_100005148(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100005160()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_100005194(uint64_t a1)
{
  uint64_t v1;

  sub_10000487C(a1, *(_QWORD *)(v1 + 16), *(NSObject **)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1000051A0(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
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
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000075DC(&qword_10001D3C8);
  v11 = *(_QWORD *)(type metadata accessor for ItemModel(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = *(_QWORD *)(type metadata accessor for ItemModel(0) - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (unint64_t)v15 + v19;
  if ((a1 & 1) != 0)
  {
    v21 = a4 + v19;
    if ((unint64_t)v15 < a4 || v20 >= v21 + *(_QWORD *)(v18 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v19, v21);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v19, v21);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100006E8C(0, v8, v20, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

Swift::Int sub_1000053A8(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  Swift::Int result;
  _QWORD v6[2];

  v2 = *(_QWORD *)(type metadata accessor for FMIPItem(0) - 8);
  v3 = (_QWORD *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
    v3 = (_QWORD *)sub_100006E78(v3);
  v4 = v3[2];
  v6[0] = (char *)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_100005428(v6);
  *a1 = v3;
  return result;
}

Swift::Int sub_100005428(_QWORD *a1)
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
  Swift::Int v14;
  Swift::Int result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  Swift::Int v22;
  unint64_t v23;
  Swift::Int v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_QWORD, _QWORD, _QWORD);
  char *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  Swift::Int v39;
  uint64_t v40;
  Swift::Int v41;
  char *v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t (*v45)(char *, uint64_t, uint64_t);
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  Swift::Int v55;
  Swift::Int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD));
  char *v64;
  Swift::Int v65;
  Swift::Int v66;
  uint64_t v67;
  Swift::Int v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t (*v72)(char *, uint64_t, uint64_t);
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t);
  uint64_t v83;
  char *v84;
  char *v85;
  void (*v86)(char *, char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  unint64_t v88;
  unint64_t v89;
  char *v90;
  char *v91;
  Swift::Int v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  BOOL v104;
  unint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  BOOL v114;
  uint64_t v115;
  char v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  BOOL v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  char *v134;
  char *v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  unint64_t v146;
  _QWORD *v147;
  _QWORD *v148;
  Swift::Int v149;
  char *v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  void (*v157)(char *, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD));
  Swift::Int v158;
  unint64_t v159;
  uint64_t (*v160)(char *, uint64_t, uint64_t);
  char *v161;
  char *v162;
  char *v163;
  char *v164;
  char *v165;
  Swift::Int v166;
  uint64_t v167;
  char *v168;
  uint64_t v169;
  _QWORD *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;

  v2 = v1;
  v4 = sub_1000075DC(&qword_10001D3F0);
  __chkstk_darwin(v4);
  v165 = (char *)&v148 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for FMIPItem(0);
  v175 = *(_QWORD *)(v6 - 8);
  v7 = __chkstk_darwin(v6);
  v152 = (char *)&v148 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v168 = (char *)&v148 - v10;
  v11 = __chkstk_darwin(v9);
  v164 = (char *)&v148 - v12;
  __chkstk_darwin(v11);
  v163 = (char *)&v148 - v13;
  v14 = a1[1];
  result = _minimumMergeRunLength(_:)(v14);
  if (result >= v14)
  {
    if (v14 < 0)
      goto LABEL_140;
    if (v14)
      return sub_10000609C(0, v14, 1, a1);
    return result;
  }
  if (v14 >= 0)
    v16 = v14;
  else
    v16 = v14 + 1;
  if (v14 < -1)
    goto LABEL_148;
  v149 = result;
  if (v14 < 2)
  {
    v21 = (char *)_swiftEmptyArrayStorage;
    v159 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v175 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v175 + 80));
    v148 = _swiftEmptyArrayStorage;
    if (v14 != 1)
    {
      v23 = _swiftEmptyArrayStorage[2];
LABEL_106:
      v140 = v159;
      if (v23 >= 2)
      {
        v141 = *a1;
        do
        {
          v142 = v23 - 2;
          if (v23 < 2)
            goto LABEL_135;
          if (!v141)
            goto LABEL_147;
          v143 = *(_QWORD *)&v21[16 * v142 + 32];
          v144 = *(_QWORD *)&v21[16 * v23 + 24];
          sub_1000063BC(v141 + *(_QWORD *)(v175 + 72) * v143, v141 + *(_QWORD *)(v175 + 72) * *(_QWORD *)&v21[16 * v23 + 16], v141 + *(_QWORD *)(v175 + 72) * v144, v140);
          if (v2)
            break;
          if (v144 < v143)
            goto LABEL_136;
          if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0)
            v21 = sub_100006C1C((uint64_t)v21);
          if (v142 >= *((_QWORD *)v21 + 2))
            goto LABEL_137;
          v145 = &v21[16 * v142 + 32];
          *(_QWORD *)v145 = v143;
          *((_QWORD *)v145 + 1) = v144;
          v146 = *((_QWORD *)v21 + 2);
          if (v23 > v146)
            goto LABEL_138;
          memmove(&v21[16 * v23 + 16], &v21[16 * v23 + 32], 16 * (v146 - v23));
          *((_QWORD *)v21 + 2) = v146 - 1;
          v23 = v146 - 1;
        }
        while (v146 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease(v21);
      v147 = v148;
      v148[2] = 0;
      return swift_bridgeObjectRelease(v147);
    }
    v20 = v159;
  }
  else
  {
    v17 = v16 >> 1;
    v18 = static Array._allocateBufferUninitialized(minimumCapacity:)(v16 >> 1, v6);
    *(_QWORD *)(v18 + 16) = v17;
    v19 = (*(unsigned __int8 *)(v175 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v175 + 80);
    v148 = (_QWORD *)v18;
    v20 = v18 + v19;
  }
  v22 = 0;
  v21 = (char *)_swiftEmptyArrayStorage;
  v170 = a1;
  v159 = v20;
  v167 = v6;
  while (1)
  {
    v24 = v22 + 1;
    v158 = v22;
    if (v22 + 1 >= v14)
    {
      v39 = v22 + 1;
    }
    else
    {
      v153 = v2;
      v25 = *a1;
      v26 = *(_QWORD *)(v175 + 72);
      v151 = v25;
      v27 = *(void (**)(char *, uint64_t, uint64_t))(v175 + 16);
      v28 = v163;
      v27(v163, v25 + v26 * v24, v6);
      v166 = v14;
      v29 = v164;
      v161 = (char *)v27;
      v30 = ((uint64_t (*)(char *, uint64_t, uint64_t))v27)(v164, v25 + v26 * v22, v6);
      v173 = FMIPItem.name.getter(v30);
      v174 = v31;
      v171 = FMIPItem.name.getter(v173);
      v172 = v32;
      v33 = type metadata accessor for Locale(0);
      v34 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v33 - 8) + 56);
      v35 = v165;
      v160 = (uint64_t (*)(char *, uint64_t, uint64_t))v33;
      v157 = (void (*)(char *, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))v34;
      v34(v165, 1, 1);
      v156 = sub_100007878();
      v162 = (char *)StringProtocol.compare<A>(_:options:range:locale:)(&v171, 1, 0, 0, 1, v35, &type metadata for String, &type metadata for String, v156, v156);
      v36 = (uint64_t)v35;
      v6 = v167;
      sub_1000078BC(v36, &qword_10001D3F0);
      swift_bridgeObjectRelease(v172);
      swift_bridgeObjectRelease(v174);
      v37 = *(void (**)(char *, uint64_t))(v175 + 8);
      v38 = v29;
      v14 = v166;
      v37(v38, v6);
      v37(v28, v6);
      v39 = v158 + 2;
      v169 = v26;
      if (v158 + 2 >= v14)
      {
        v2 = v153;
        v52 = v26;
      }
      else
      {
        v150 = v21;
        v40 = v151;
        v154 = v26 * v39;
        v155 = v26 * v24;
        while (1)
        {
          v41 = v39;
          v42 = v163;
          v43 = v162 == (char *)-1;
          v44 = v167;
          v45 = (uint64_t (*)(char *, uint64_t, uint64_t))v161;
          ((void (*)(char *, uint64_t, uint64_t))v161)(v163, v40 + v154, v167);
          v46 = v164;
          v47 = v45(v164, v40 + v155, v44);
          v173 = FMIPItem.name.getter(v47);
          v174 = v48;
          v171 = FMIPItem.name.getter(v173);
          v172 = v49;
          v50 = (uint64_t)v165;
          v157(v165, 1, 1, (void (*)(_QWORD, _QWORD, _QWORD))v160);
          v51 = StringProtocol.compare<A>(_:options:range:locale:)(&v171, 1, 0, 0, 1, v50, &type metadata for String, &type metadata for String, v156, v156);
          sub_1000078BC(v50, &qword_10001D3F0);
          swift_bridgeObjectRelease(v172);
          swift_bridgeObjectRelease(v174);
          v37(v46, v44);
          v37(v42, v44);
          if (v43 == (v51 != -1))
            break;
          v39 = v41 + 1;
          v52 = v169;
          v40 += v169;
          v14 = v166;
          if (v166 == v41 + 1)
          {
            v39 = v166;
            v2 = v153;
            v21 = v150;
            v6 = v167;
            goto LABEL_25;
          }
        }
        v2 = v153;
        v21 = v150;
        v14 = v166;
        v6 = v167;
        v39 = v41;
        v52 = v169;
      }
LABEL_25:
      a1 = v170;
      v22 = v158;
      if (v162 == (char *)-1)
      {
        if (v39 < v158)
          goto LABEL_143;
        if (v158 < v39)
        {
          v150 = v21;
          v53 = 0;
          v54 = v52 * (v39 - 1);
          v55 = v39 * v52;
          v56 = v158;
          v57 = v158 * v52;
          do
          {
            if (v56 != v39 + v53 - 1)
            {
              v153 = v2;
              v60 = v151;
              if (!v151)
                goto LABEL_146;
              v61 = v151 + v57;
              v62 = v151 + v54;
              v162 = *(char **)(v175 + 32);
              ((void (*)(char *, uint64_t, uint64_t))v162)(v152, v151 + v57, v167);
              if (v57 < v54 || v61 >= v60 + v55)
              {
                v58 = v60 + v57;
                v59 = v60 + v54;
                v6 = v167;
                swift_arrayInitWithTakeFrontToBack(v58, v59);
              }
              else
              {
                v6 = v167;
                if (v57 != v54)
                  swift_arrayInitWithTakeBackToFront(v61, v62);
              }
              ((void (*)(uint64_t, char *, uint64_t))v162)(v62, v152, v6);
              v52 = v169;
              a1 = v170;
              v2 = v153;
            }
            ++v56;
            --v53;
            v54 -= v52;
            v55 -= v52;
            v57 += v52;
          }
          while (v56 < v39 + v53);
          v21 = v150;
          v22 = v158;
          v14 = v166;
        }
      }
    }
    if (v39 < v14)
    {
      if (__OFSUB__(v39, v22))
        goto LABEL_139;
      if (v39 - v22 < v149)
        break;
    }
LABEL_57:
    if (v39 < v22)
      goto LABEL_134;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v21);
    v166 = v39;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v21 = sub_100006A18(0, *((_QWORD *)v21 + 2) + 1, 1, v21);
    v89 = *((_QWORD *)v21 + 2);
    v88 = *((_QWORD *)v21 + 3);
    v23 = v89 + 1;
    if (v89 >= v88 >> 1)
      v21 = sub_100006A18((char *)(v88 > 1), v89 + 1, 1, v21);
    *((_QWORD *)v21 + 2) = v23;
    v90 = v21 + 32;
    v91 = &v21[16 * v89 + 32];
    v92 = v166;
    *(_QWORD *)v91 = v22;
    *((_QWORD *)v91 + 1) = v92;
    if (v89)
    {
      while (1)
      {
        v93 = v23 - 1;
        if (v23 >= 4)
        {
          v98 = &v90[16 * v23];
          v99 = *((_QWORD *)v98 - 8);
          v100 = *((_QWORD *)v98 - 7);
          v104 = __OFSUB__(v100, v99);
          v101 = v100 - v99;
          if (v104)
            goto LABEL_123;
          v103 = *((_QWORD *)v98 - 6);
          v102 = *((_QWORD *)v98 - 5);
          v104 = __OFSUB__(v102, v103);
          v96 = v102 - v103;
          v97 = v104;
          if (v104)
            goto LABEL_124;
          v105 = v23 - 2;
          v106 = &v90[16 * v23 - 32];
          v108 = *(_QWORD *)v106;
          v107 = *((_QWORD *)v106 + 1);
          v104 = __OFSUB__(v107, v108);
          v109 = v107 - v108;
          if (v104)
            goto LABEL_126;
          v104 = __OFADD__(v96, v109);
          v110 = v96 + v109;
          if (v104)
            goto LABEL_129;
          if (v110 >= v101)
          {
            v128 = &v90[16 * v93];
            v130 = *(_QWORD *)v128;
            v129 = *((_QWORD *)v128 + 1);
            v104 = __OFSUB__(v129, v130);
            v131 = v129 - v130;
            if (v104)
              goto LABEL_133;
            v121 = v96 < v131;
            goto LABEL_94;
          }
        }
        else
        {
          if (v23 != 3)
          {
            v122 = *((_QWORD *)v21 + 4);
            v123 = *((_QWORD *)v21 + 5);
            v104 = __OFSUB__(v123, v122);
            v115 = v123 - v122;
            v116 = v104;
            goto LABEL_88;
          }
          v95 = *((_QWORD *)v21 + 4);
          v94 = *((_QWORD *)v21 + 5);
          v104 = __OFSUB__(v94, v95);
          v96 = v94 - v95;
          v97 = v104;
        }
        if ((v97 & 1) != 0)
          goto LABEL_125;
        v105 = v23 - 2;
        v111 = &v90[16 * v23 - 32];
        v113 = *(_QWORD *)v111;
        v112 = *((_QWORD *)v111 + 1);
        v114 = __OFSUB__(v112, v113);
        v115 = v112 - v113;
        v116 = v114;
        if (v114)
          goto LABEL_128;
        v117 = &v90[16 * v93];
        v119 = *(_QWORD *)v117;
        v118 = *((_QWORD *)v117 + 1);
        v104 = __OFSUB__(v118, v119);
        v120 = v118 - v119;
        if (v104)
          goto LABEL_131;
        if (__OFADD__(v115, v120))
          goto LABEL_132;
        if (v115 + v120 >= v96)
        {
          v121 = v96 < v120;
LABEL_94:
          if (v121)
            v93 = v105;
          goto LABEL_96;
        }
LABEL_88:
        if ((v116 & 1) != 0)
          goto LABEL_127;
        v124 = &v90[16 * v93];
        v126 = *(_QWORD *)v124;
        v125 = *((_QWORD *)v124 + 1);
        v104 = __OFSUB__(v125, v126);
        v127 = v125 - v126;
        if (v104)
          goto LABEL_130;
        if (v127 < v115)
          goto LABEL_15;
LABEL_96:
        v132 = v93 - 1;
        if (v93 - 1 >= v23)
        {
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
        v133 = *a1;
        if (!*a1)
          goto LABEL_145;
        v134 = v21;
        v135 = &v90[16 * v132];
        v136 = *(_QWORD *)v135;
        v137 = &v90[16 * v93];
        v138 = *((_QWORD *)v137 + 1);
        sub_1000063BC(v133 + *(_QWORD *)(v175 + 72) * *(_QWORD *)v135, v133 + *(_QWORD *)(v175 + 72) * *(_QWORD *)v137, v133 + *(_QWORD *)(v175 + 72) * v138, v159);
        if (v2)
        {
          v21 = v134;
          goto LABEL_117;
        }
        if (v138 < v136)
          goto LABEL_120;
        if (v93 > *((_QWORD *)v134 + 2))
          goto LABEL_121;
        *(_QWORD *)v135 = v136;
        *(_QWORD *)&v90[16 * v132 + 8] = v138;
        v139 = *((_QWORD *)v134 + 2);
        if (v93 >= v139)
          goto LABEL_122;
        v21 = v134;
        v23 = v139 - 1;
        memmove(&v90[16 * v93], v137 + 16, 16 * (v139 - 1 - v93));
        *((_QWORD *)v134 + 2) = v139 - 1;
        a1 = v170;
        v6 = v167;
        if (v139 <= 2)
          goto LABEL_15;
      }
    }
    v23 = 1;
LABEL_15:
    v14 = a1[1];
    v22 = v166;
    if (v166 >= v14)
      goto LABEL_106;
  }
  if (__OFADD__(v22, v149))
    goto LABEL_141;
  if (v22 + v149 >= v14)
    v63 = (void (*)(char *, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))v14;
  else
    v63 = (void (*)(char *, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))(v22 + v149);
  if ((uint64_t)v63 >= v22)
  {
    if ((void (*)(char *, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))v39 != v63)
    {
      v150 = v21;
      v153 = v2;
      v64 = *(char **)(v175 + 72);
      v160 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v175 + 16);
      v161 = v64;
      v169 = (_QWORD)v64 * (v39 - 1);
      v65 = v39 * (_QWORD)v64;
      v157 = v63;
      do
      {
        v67 = 0;
        v68 = v22;
        v166 = v39;
        v162 = (char *)v65;
        while (1)
        {
          v69 = *a1;
          v70 = (char *)(v65 + v67 + *a1);
          v71 = v163;
          v72 = v160;
          v160(v163, (uint64_t)v70, v6);
          v73 = v6;
          v74 = v164;
          v75 = v72(v164, v169 + v67 + v69, v73);
          v173 = FMIPItem.name.getter(v75);
          v174 = v76;
          v171 = FMIPItem.name.getter(v173);
          v172 = v77;
          v78 = type metadata accessor for Locale(0);
          v79 = (uint64_t)v165;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 56))(v165, 1, 1, v78);
          v80 = sub_100007878();
          v81 = StringProtocol.compare<A>(_:options:range:locale:)(&v171, 1, 0, 0, 1, v79, &type metadata for String, &type metadata for String, v80, v80);
          sub_1000078BC(v79, &qword_10001D3F0);
          swift_bridgeObjectRelease(v172);
          swift_bridgeObjectRelease(v174);
          v82 = *(void (**)(char *, uint64_t))(v175 + 8);
          v82(v74, v73);
          v82(v71, v73);
          if (v81 != -1)
            break;
          v83 = *v170;
          if (!*v170)
            goto LABEL_144;
          v65 = (Swift::Int)v162;
          v84 = &v162[v83 + v67];
          v85 = (char *)(v83 + v169 + v67);
          v86 = *(void (**)(char *, char *, uint64_t))(v175 + 32);
          v6 = v167;
          v86(v168, v84, v167);
          swift_arrayInitWithTakeFrontToBack(v84, v85);
          v86(v85, v168, v6);
          v67 -= (uint64_t)v161;
          ++v68;
          v66 = v166;
          a1 = v170;
          if (v166 == v68)
            goto LABEL_50;
        }
        v66 = v166;
        v6 = v167;
        a1 = v170;
        v65 = (Swift::Int)v162;
LABEL_50:
        v39 = v66 + 1;
        v169 += (uint64_t)v161;
        v65 += (Swift::Int)v161;
        v22 = v158;
      }
      while ((void (*)(char *, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))v39 != v157);
      v39 = (Swift::Int)v157;
      v2 = v153;
      v21 = v150;
    }
    goto LABEL_57;
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
  __break(1u);
LABEL_148:
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000609C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
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
  uint64_t v18;
  char *v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(char *, uint64_t, uint64_t);
  _QWORD *v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v37 = a1;
  sub_1000075DC(&qword_10001D3F0);
  ((void (*)(void))__chkstk_darwin)();
  v42 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for FMIPItem(0);
  v46 = *(_QWORD **)(v8 - 8);
  v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v45 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v41 = (char *)&v35 - v12;
  result = __chkstk_darwin(v11);
  v40 = (char *)&v35 - v14;
  v44 = a3;
  v36 = a2;
  if (a3 != a2)
  {
    v15 = v46[9];
    v38 = (uint64_t (*)(char *, uint64_t, uint64_t))v46[2];
    v39 = a4;
    v52 = v15 * (v44 - 1);
    v43 = v15;
    v47 = v15 * v44;
LABEL_5:
    v16 = 0;
    v17 = v37;
    while (1)
    {
      v18 = *a4;
      v19 = v40;
      v20 = v38;
      v38(v40, v47 + v16 + *a4, v8);
      v21 = v41;
      v22 = v20(v41, v52 + v16 + v18, v8);
      v50 = FMIPItem.name.getter(v22);
      v51 = v23;
      v48 = FMIPItem.name.getter(v50);
      v49 = v24;
      v25 = type metadata accessor for Locale(0);
      v26 = (uint64_t)v42;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v42, 1, 1, v25);
      v27 = sub_100007878();
      v28 = StringProtocol.compare<A>(_:options:range:locale:)(&v48, 1, 0, 0, 1, v26, &type metadata for String, &type metadata for String, v27, v27);
      sub_1000078BC(v26, &qword_10001D3F0);
      swift_bridgeObjectRelease(v49);
      swift_bridgeObjectRelease(v51);
      v29 = (void (*)(char *, uint64_t))v46[1];
      v30 = v21;
      a4 = v39;
      v29(v30, v8);
      result = ((uint64_t (*)(char *, uint64_t))v29)(v19, v8);
      if (v28 != -1)
      {
LABEL_4:
        v52 += v43;
        v47 += v43;
        if (++v44 == v36)
          return result;
        goto LABEL_5;
      }
      v31 = *a4;
      if (!*a4)
        break;
      v32 = v31 + v47 + v16;
      v33 = v31 + v52 + v16;
      v34 = (void (*)(char *, uint64_t, uint64_t))v46[4];
      v34(v45, v32, v8);
      swift_arrayInitWithTakeFrontToBack(v32, v33);
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v34)(v33, v45, v8);
      v16 -= v43;
      if (v44 == ++v17)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1000063BC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t);
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  BOOL v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(char *, unint64_t, uint64_t);
  unint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  char *v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t result;
  uint64_t v62;
  uint64_t (*v63)(char *, unint64_t, uint64_t);
  char *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;

  v66 = a4;
  v67 = a3;
  v6 = sub_1000075DC(&qword_10001D3F0);
  __chkstk_darwin(v6);
  v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = type metadata accessor for FMIPItem(0);
  v9 = __chkstk_darwin(v70);
  v68 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v62 - v11;
  v69 = v13;
  v14 = *(_QWORD *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1)
    goto LABEL_62;
  v15 = v67 - a2;
  if (v67 - a2 == 0x8000000000000000 && v14 == -1)
    goto LABEL_63;
  v16 = (uint64_t)(a2 - a1) / v14;
  v77 = a1;
  v76 = v66;
  v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      v20 = v17 * v14;
      v21 = v66;
      if (v66 < a2 || a2 + v20 <= v66)
      {
        swift_arrayInitWithTakeFrontToBack(v66, a2);
      }
      else if (v66 != a2)
      {
        swift_arrayInitWithTakeBackToFront(v66, a2);
      }
      v38 = v21 + v20;
      v75 = v21 + v20;
      v77 = a2;
      v39 = v20 < 1 || a1 >= a2;
      v40 = v67;
      if (!v39)
      {
        v41 = -v14;
        v63 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v69 + 16);
        v64 = v8;
        v65 = a1;
        do
        {
          v67 = v40 + v41;
          v42 = v70;
          v43 = v63;
          v63(v12, v38 + v41, v70);
          v44 = a2 + v41;
          v45 = v12;
          v46 = v68;
          v47 = v43(v68, a2 + v41, v42);
          v48 = v41;
          v73 = FMIPItem.name.getter(v47);
          v74 = v49;
          v71 = FMIPItem.name.getter(v73);
          v72 = v50;
          v51 = type metadata accessor for Locale(0);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v8, 1, 1, v51);
          v52 = sub_100007878();
          v53 = StringProtocol.compare<A>(_:options:range:locale:)(&v71, 1, 0, 0, 1, v8, &type metadata for String, &type metadata for String, v52, v52);
          sub_1000078BC((uint64_t)v8, &qword_10001D3F0);
          swift_bridgeObjectRelease(v72);
          swift_bridgeObjectRelease(v74);
          v54 = *(void (**)(char *, uint64_t))(v69 + 8);
          v55 = v46;
          v12 = v45;
          v54(v55, v42);
          v54(v45, v42);
          if (v53 == -1)
          {
            v41 = v48;
            v58 = v67;
            if (v40 < a2 || v67 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack(v67, v44);
              v8 = v64;
              v59 = v65;
              v60 = v66;
            }
            else
            {
              v8 = v64;
              v59 = v65;
              v60 = v66;
              if (v40 != a2)
                swift_arrayInitWithTakeBackToFront(v67, v44);
            }
            v77 += v41;
          }
          else
          {
            v56 = v75;
            v57 = v75 + v48;
            v75 += v48;
            v41 = v48;
            v58 = v67;
            if (v40 < v56 || v67 >= v56)
            {
              swift_arrayInitWithTakeFrontToBack(v67, v57);
              v44 = a2;
              v8 = v64;
              v59 = v65;
              v60 = v66;
            }
            else
            {
              v8 = v64;
              v59 = v65;
              v60 = v66;
              if (v40 != v56)
                swift_arrayInitWithTakeBackToFront(v67, v57);
              v44 = a2;
            }
          }
          v38 = v75;
          if (v75 <= v60)
            break;
          a2 = v44;
          v40 = v58;
        }
        while (v44 > v59);
      }
      goto LABEL_60;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    v18 = v16 * v14;
    v19 = v66;
    if (v66 < a1 || a1 + v18 <= v66)
    {
      swift_arrayInitWithTakeFrontToBack(v66, a1);
    }
    else if (v66 != a1)
    {
      swift_arrayInitWithTakeBackToFront(v66, a1);
    }
    v65 = v19 + v18;
    v75 = v19 + v18;
    if (v18 >= 1 && a2 < v67)
    {
      v23 = v19;
      v24 = v70;
      v25 = *(void (**)(char *, unint64_t, uint64_t))(v69 + 16);
      v26 = v68;
      do
      {
        v27 = v14;
        v25(v12, a2, v24);
        v28 = ((uint64_t (*)(char *, unint64_t, uint64_t))v25)(v26, v23, v24);
        v73 = FMIPItem.name.getter(v28);
        v74 = v29;
        v71 = FMIPItem.name.getter(v73);
        v72 = v30;
        v31 = type metadata accessor for Locale(0);
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v8, 1, 1, v31);
        v32 = sub_100007878();
        v33 = StringProtocol.compare<A>(_:options:range:locale:)(&v71, 1, 0, 0, 1, v8, &type metadata for String, &type metadata for String, v32, v32);
        sub_1000078BC((uint64_t)v8, &qword_10001D3F0);
        swift_bridgeObjectRelease(v72);
        swift_bridgeObjectRelease(v74);
        v34 = *(void (**)(char *, uint64_t))(v69 + 8);
        v34(v26, v24);
        v34(v12, v24);
        v35 = v77;
        if (v33 == -1)
        {
          v14 = v27;
          v37 = a2 + v27;
          if (v77 < a2 || v77 >= v37)
          {
            swift_arrayInitWithTakeFrontToBack(v77, a2);
          }
          else if (v77 == a2)
          {
            v35 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront(v77, a2);
          }
        }
        else
        {
          v14 = v27;
          v36 = v76 + v27;
          if (v77 < v76 || v77 >= v36)
          {
            swift_arrayInitWithTakeFrontToBack(v77, v76);
          }
          else if (v77 != v76)
          {
            swift_arrayInitWithTakeBackToFront(v77, v76);
          }
          v76 = v36;
          v37 = a2;
        }
        v77 = v35 + v14;
        v23 = v76;
        if (v76 >= v65)
          break;
        a2 = v37;
      }
      while (v37 < v67);
    }
LABEL_60:
    sub_100006B10(&v77, &v76, (uint64_t *)&v75);
    return 1;
  }
LABEL_64:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_100006A18(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

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
    v10 = sub_1000075DC(&qword_10001D400);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_100006B10(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for FMIPItem(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack(v3, v4);
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront(v3, v4);
  return result;
}

char *sub_100006C1C(uint64_t a1)
{
  return sub_100006A18(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100006C30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v4 = a1;
    else
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v4);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v2, 0, a1);
}

uint64_t sub_100006C98(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
    v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000075DC(&qword_10001D408);
  v11 = *(_QWORD *)(type metadata accessor for FMIPItem(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = *(_QWORD *)(type metadata accessor for FMIPItem(0) - 8);
  v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v20 = (char *)v15 + v19;
  v21 = (char *)a4 + v19;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v20 >= &v21[*(_QWORD *)(v18 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v20, v21);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v20, v21);
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v22 = *(_QWORD *)(v18 + 72) * v8;
  v23 = &v20[v22];
  v24 = (unint64_t)&v21[v22];
  if (v21 >= v23 || (unint64_t)v20 >= v24)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100006E78(_QWORD *a1)
{
  return sub_100006C98(0, a1[2], 0, a1);
}

uint64_t sub_100006E8C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for ItemModel(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100006FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, NSObject *a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _OWORD v62[7];

  v58 = a7;
  v59 = a8;
  v56 = a5;
  v57 = a6;
  v53 = type metadata accessor for FMIPItem(0);
  v52 = *(_QWORD *)(v53 - 8);
  __chkstk_darwin(v53);
  v54 = ((char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = type metadata accessor for ItemModel(0);
  __chkstk_darwin(v13);
  v15 = (char *)&v48 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1000075DC(&qword_10001D3C0);
  v17 = __chkstk_darwin(v16);
  v19 = (char *)&v48 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = FMIPItem.name.getter(v17);
  v21 = v20;
  FMIPItem.location.getter();
  v22 = type metadata accessor for FMIPLocation(0);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v19, 1, v22) == 1)
  {
    sub_1000078BC((uint64_t)v19, &qword_10001D3C0);
  }
  else
  {
    v24 = (void *)FMIPLocation.location.getter();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v19, v22);

  }
  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v25 = type metadata accessor for Logger(0);
  v26 = sub_100005148(v25, (uint64_t)qword_10001E4D8);
  swift_retain_n(a4, 2);
  v27 = swift_bridgeObjectRetain_n(v21, 2);
  v51 = v26;
  v28 = Logger.logObject.getter(v27);
  v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc(22, -1);
    v50 = a3;
    v31 = v30;
    v32 = swift_slowAlloc(64, -1);
    *(_QWORD *)&v62[0] = v32;
    *(_DWORD *)v31 = 136315394;
    v49 = a1;
    v33 = *(_QWORD *)(a4 + 16);
    v34 = *(_QWORD *)(a4 + 24);
    swift_bridgeObjectRetain(v34);
    v61 = sub_100010D74(v33, v34, (uint64_t *)v62);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, v62, v31 + 4, v31 + 12);
    swift_release_n(a4, 2);
    swift_bridgeObjectRelease(v34);
    *(_WORD *)(v31 + 12) = 2080;
    swift_bridgeObjectRetain(v21);
    v61 = sub_100010D74(v55, v21, (uint64_t *)v62);
    a1 = v49;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, v62, v31 + 14, v31 + 22);
    swift_bridgeObjectRelease_n(v21, 3);
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "🥑 ItemsDataService%s: parsing \"%s\" (has no location)", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy(v32, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1, -1);
    v35 = v31;
    a3 = v50;
    swift_slowDealloc(v35, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v21, 2);
    swift_release_n(a4, 2);
  }
  v36 = (uint64_t)v54;
  v37 = a9;
  (*(void (**)(NSObject *, uint64_t, uint64_t))(v52 + 16))(v54, a1, v53);
  v38 = objc_msgSend(*(id *)(a4 + 56), "aa_primaryAppleAccount");
  v39 = v38;
  if (v38)

  v62[0] = xmmword_1000152B0;
  memset(&v62[1], 0, 96);
  swift_errorRetain(a3);
  sub_100008220(v36, (uint64_t *)v62, 2, v39 != 0, 0, 0, 255, 0.0, (unint64_t)v15, 1, 0, 0, 0xFFu, a3);
  swift_retain_n(a4, 2);
  v40 = swift_bridgeObjectRetain(v21);
  v41 = Logger.logObject.getter(v40);
  v42 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = swift_slowAlloc(22, -1);
    v44 = swift_slowAlloc(64, -1);
    v61 = v44;
    *(_DWORD *)v43 = 136315394;
    v54 = a9;
    v45 = *(_QWORD *)(a4 + 16);
    v46 = *(_QWORD *)(a4 + 24);
    swift_bridgeObjectRetain(v46);
    v60 = sub_100010D74(v45, v46, &v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v43 + 4, v43 + 12);
    swift_release_n(a4, 2);
    swift_bridgeObjectRelease(v46);
    *(_WORD *)(v43 + 12) = 2080;
    swift_bridgeObjectRetain(v21);
    v60 = sub_100010D74(v55, v21, &v61);
    v37 = v54;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v60, &v61, v43 + 14, v43 + 22);
    swift_bridgeObjectRelease_n(v21, 3);
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "🥑 ItemsDataService%s: generated no map for \"%s\"", (uint8_t *)v43, 0x16u);
    swift_arrayDestroy(v44, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v44, -1, -1);
    swift_slowDealloc(v43, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v21, 2);
    swift_release_n(a4, 2);
  }
  sub_100004E08((uint64_t)v15, v56, v57, v58, v59, v37);
  return sub_10000761C((uint64_t)v15);
}

uint64_t sub_1000075DC(uint64_t *a1)
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

uint64_t sub_10000761C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ItemModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007658(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ItemModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000769C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ItemModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000076E4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100007710(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_100003CE4(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(void (**)(uint64_t))(v4 + 24), *(_QWORD *)(v4 + 32));
}

uint64_t sub_100007720()
{
  uint64_t v0;

  return sub_1000043A8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100007728()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007738()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100007758(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100007768(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100007774()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000077A0()
{
  uint64_t v0;

  return sub_1000040DC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

unint64_t sub_1000077A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D3E0;
  if (!qword_10001D3E0)
  {
    v1 = sub_1000077F4(&qword_10001D3D8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001D3E0);
  }
  return result;
}

uint64_t sub_1000077F4(uint64_t *a1)
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

uint64_t sub_100007838(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_100007878()
{
  unint64_t result;

  result = qword_10001D3F8;
  if (!qword_10001D3F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001D3F8);
  }
  return result;
}

uint64_t sub_1000078BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000075DC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100007900(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  Swift::String v13;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  swift_bridgeObjectRetain(a2);
  v4 = sub_100011480(9uLL, a1, a2);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  swift_bridgeObjectRelease(a2);
  v19 = 7876668;
  v20 = 0xE300000000000000;
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  v11 = sub_1000079D0();
  String.append<A>(contentsOf:)(&v15, &type metadata for Substring, v11);
  swift_bridgeObjectRelease(v10);
  v12 = v20;
  v15 = v19;
  v16 = v20;
  swift_bridgeObjectRetain(v20);
  v13._countAndFlagsBits = 15971;
  v13._object = (void *)0xE200000000000000;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v12);
  return v15;
}

unint64_t sub_1000079D0()
{
  unint64_t result;

  result = qword_10001D410;
  if (!qword_10001D410)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Substring, &type metadata for Substring);
    atomic_store(result, (unint64_t *)&qword_10001D410);
  }
  return result;
}

id sub_100007A18(void *a1, void *a2, char a3)
{
  id v3;
  id v5;

  if ((a3 & 1) != 0)
  {
    v5 = a1;
    v3 = a2;
    a1 = v5;
  }
  return a1;
}

void destroy for ColorSchemeImageSet(uint64_t a1)
{
  sub_100007A50(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_100007A50(void *a1, void *a2, char a3)
{

  if ((a3 & 1) != 0)
}

uint64_t _s24FindMyWidgetIntentsItems19ColorSchemeImageSetOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100007A18(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ColorSchemeImageSet(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100007A18(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_100007A50(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ColorSchemeImageSet(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ColorSchemeImageSet(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_100007A50(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ColorSchemeImageSet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ColorSchemeImageSet(uint64_t result, unsigned int a2, unsigned int a3)
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
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_100007C14(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_100007C20(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ColorSchemeImageSet()
{
  return &type metadata for ColorSchemeImageSet;
}

void *sub_100007C3C(uint64_t a1, void *a2, void *a3, char a4)
{
  void *v4;
  id v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v4 = a2;
  if ((a4 & 1) == 0)
    goto LABEL_2;
  if (!a2)
  {
    v12 = a3;
    return a3;
  }
  if (a3)
  {
    v7 = a2;
    v8 = a3;
    v9 = objc_msgSend(v7, "imageAsset");
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend((id)objc_opt_self(UITraitCollection), "traitCollectionWithUserInterfaceStyle:", 2);
      objc_msgSend(v10, "registerImage:withTraitCollection:", v8, v11);

    }
  }
  else
  {
LABEL_2:
    v5 = a2;
  }
  return v4;
}

uint64_t sub_100007D14()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for UserDefaultsManager()
{
  return objc_opt_self(_TtC24FindMyWidgetIntentsItems19UserDefaultsManager);
}

uint64_t sub_100007D44(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(char *, _QWORD, uint64_t);
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;

  v4 = v3;
  v33 = a1;
  v34 = a2;
  v6 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin();
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS(0);
  __chkstk_darwin();
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008150();
  static DispatchQoS.userInitiated.getter();
  v36 = &_swiftEmptyArrayStorage;
  v15 = sub_10000818C();
  v16 = sub_1000075DC(&qword_10001D5C0);
  v17 = sub_1000081D4();
  v18 = v15;
  v19 = v33;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v36, v16, v17, v10, v18);
  v20 = *(void (**)(char *, _QWORD, uint64_t))(v7 + 104);
  v21 = v34;
  v20(v9, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v6);
  *(_QWORD *)(v4 + 40) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000015, 0x8000000100014AB0, v14, v12, v9, 0);
  *(_QWORD *)(v4 + 48) = &_swiftEmptyArrayStorage;
  *(_QWORD *)(v4 + 56) = objc_msgSend(objc_allocWithZone((Class)ACAccountStore), "init");
  *(_QWORD *)(v4 + 16) = v19;
  *(_QWORD *)(v4 + 24) = v21;
  *(double *)(v4 + 32) = a3;
  v22 = qword_10001D228;
  swift_bridgeObjectRetain(v21);
  if (v22 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v23 = type metadata accessor for Logger(0);
  sub_100005148(v23, (uint64_t)qword_10001E4D8);
  swift_retain_n(v4, 2);
  v24 = swift_bridgeObjectRetain(v21);
  v25 = Logger.logObject.getter(v24);
  v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc(22, -1);
    v28 = (void *)swift_slowAlloc(64, -1);
    v36 = v28;
    *(_DWORD *)v27 = 136315394;
    v29 = (*(uint64_t (**)(void))(*(_QWORD *)v4 + 152))();
    v31 = v30;
    v35 = sub_100010D74(v29, v30, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v27 + 4, v27 + 12);
    swift_release_n(v4, 2);
    swift_bridgeObjectRelease(v31);
    *(_WORD *)(v27 + 12) = 2080;
    swift_bridgeObjectRetain(v21);
    v35 = sub_100010D74(v19, v21, (uint64_t *)&v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v35, &v36, v27 + 14, v27 + 22);
    swift_bridgeObjectRelease_n(v21, 3);
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "🥑 %sDataService%s: init (v6)", (uint8_t *)v27, 0x16u);
    swift_arrayDestroy(v28, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1, -1);
    swift_slowDealloc(v27, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(v21, 2);
    swift_release_n(v4, 2);
  }
  return v4;
}

uint64_t sub_1000080E8()
{
  return 0;
}

uint64_t sub_1000080F4()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for DataService()
{
  return objc_opt_self(_TtC24FindMyWidgetIntentsItems11DataService);
}

unint64_t sub_100008150()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D5B0;
  if (!qword_10001D5B0)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001D5B0);
  }
  return result;
}

unint64_t sub_10000818C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D5B8;
  if (!qword_10001D5B8)
  {
    v1 = type metadata accessor for OS_dispatch_queue.Attributes(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for OS_dispatch_queue.Attributes, v1);
    atomic_store(result, (unint64_t *)&qword_10001D5B8);
  }
  return result;
}

unint64_t sub_1000081D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D5C8;
  if (!qword_10001D5C8)
  {
    v1 = sub_1000077F4(&qword_10001D5C0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10001D5C8);
  }
  return result;
}

uint64_t sub_100008220@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, int a3@<W2>, unsigned int a4@<W3>, void *a5@<X4>, void *a6@<X5>, int a7@<W6>, double a8@<X7>, unint64_t a9@<X8>, char a10, void *a11, void *a12, unsigned __int8 a13, uint64_t a14)
{
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
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  int *v44;
  _QWORD *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  void (*v61)(char *, uint64_t);
  int v62;
  id v63;
  Swift::String v64;
  Swift::String v65;
  Swift::String v66;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v69;
  uint64_t v70;
  int v71;
  char v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v79;
  char *v80;
  void (*v81)(char *, char *, uint64_t);
  uint64_t v82;
  id v83;
  Swift::String v84;
  Swift::String v85;
  Swift::String v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  void *v92;
  id v93;
  Swift::String v94;
  Swift::String v95;
  Swift::String v96;
  uint64_t *v97;
  _QWORD *v98;
  uint64_t v99;
  char v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int (*v106)(uint64_t, uint64_t, uint64_t);
  id v107;
  void *v108;
  uint64_t v109;
  uint64_t *v110;
  void *v111;
  char *v112;
  uint64_t v113;
  uint64_t (*v114)(char *, uint64_t, uint64_t);
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  id v130;
  Swift::String v131;
  Swift::String v132;
  Swift::String v133;
  uint64_t *v134;
  void *v135;
  uint64_t v136;
  id v137;
  Swift::String v138;
  Swift::String v139;
  Swift::String v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;
  void *v144;
  void *v145;
  uint64_t *v146;
  BOOL v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t *v156;
  char *v157;
  uint64_t v158;
  int v159;
  _QWORD *v160;
  void *v161;
  void *v162;
  char v163;
  double v164;
  unsigned __int8 v165;
  unint64_t v166;
  double v167;
  unint64_t v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  unint64_t v177;
  uint64_t v178;
  unint64_t v179;
  unint64_t v180;
  Swift::String v181;
  unint64_t v182;
  unint64_t v183;
  unint64_t *v184;
  unint64_t v185;
  _QWORD *v187;
  uint64_t v188;
  unsigned int v189;
  unint64_t *v190;
  unint64_t v191;
  unint64_t v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  char *v196;
  _BOOL4 v197;
  unsigned int (*v198)(char *, uint64_t, uint64_t);
  uint64_t v199;
  char *v200;
  char *v201;
  char *v202;
  char *v203;
  int v204;
  char *v205;
  _BOOL4 v206;
  uint64_t v207;
  char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  int *v212;
  uint64_t v213;
  double v214;
  uint64_t v215;
  uint64_t v216;
  char *v217;
  uint64_t v218;
  uint64_t v219;
  char *v220;
  uint64_t v221;
  unint64_t *v222;
  void *v223;
  uint64_t v224;
  uint64_t *v225;
  int v226;
  int v227;
  uint64_t v228;
  _BOOL4 v229;
  void *v230;
  unsigned int v231;
  id v232;
  uint64_t v233;
  uint64_t v234;
  unint64_t v235;
  unint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  unint64_t v240;
  _QWORD v241[14];
  _QWORD v242[5];
  void *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  uint64_t v248;
  void *v249;
  uint64_t v250;
  void *v251;
  Swift::String v252;
  Swift::String v253;
  Swift::String v254;
  Swift::String v255;
  Swift::String v256;

  v214 = a8;
  v226 = a7;
  v230 = a6;
  v223 = a5;
  v204 = a3;
  v225 = a2;
  sub_10000CB00((uint64_t)a2, (uint64_t)v241, &qword_10001D5D0);
  v193 = (void *)v241[11];
  v194 = v241[10];
  v211 = type metadata accessor for FMIPItemBatteryStatus(0);
  v221 = *(_QWORD *)(v211 - 8);
  __chkstk_darwin(v211);
  v220 = (char *)&v193 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for FMIPItemRole(0);
  v218 = *(_QWORD *)(v18 - 8);
  v219 = v18;
  __chkstk_darwin(v18);
  v217 = (char *)&v193 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1000075DC(&qword_10001D5D8);
  v21 = __chkstk_darwin(v20);
  v208 = (char *)&v193 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v203 = (char *)&v193 - v23;
  v224 = type metadata accessor for FMIPItem(0);
  v228 = *(_QWORD *)(v224 - 8);
  __chkstk_darwin(v224);
  v205 = (char *)&v193 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for Date(0);
  v209 = *(_QWORD *)(v25 - 8);
  v210 = v25;
  v26 = __chkstk_darwin(v25);
  v201 = (char *)&v193 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v26);
  v196 = (char *)&v193 - v28;
  v29 = sub_1000075DC(&qword_10001D5E0);
  v30 = __chkstk_darwin(v29);
  v202 = (char *)&v193 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v30);
  v207 = (uint64_t)&v193 - v32;
  v33 = type metadata accessor for FMIPItemState(0);
  v213 = *(_QWORD *)(v33 - 8);
  v34 = __chkstk_darwin(v33);
  v36 = (char *)&v193 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v34);
  v38 = (char *)&v193 - v37;
  v39 = sub_1000075DC(&qword_10001D3C0);
  v40 = __chkstk_darwin(v39);
  v200 = (char *)&v193 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v40);
  v43 = (char *)&v193 - v42;
  v44 = (int *)type metadata accessor for ItemModel(0);
  v45 = (_QWORD *)(a9 + v44[17]);
  *v45 = 0;
  v45[1] = 0;
  v46 = a9 + v44[18];
  *(_QWORD *)v46 = 0;
  *(_BYTE *)(v46 + 8) = 1;
  v47 = a9 + v44[19];
  *(_QWORD *)v47 = 0;
  *(_QWORD *)(v47 + 8) = 0;
  *(_BYTE *)(v47 + 16) = 1;
  *(_BYTE *)(a9 + v44[28]) = 0;
  *(_OWORD *)(a9 + v44[29]) = xmmword_100015420;
  v212 = v44;
  v48 = (unint64_t *)(a9 + v44[30]);
  v229 = a4 != 2;
  v206 = a4 == 2;
  v231 = a4;
  if (a4 == 2)
    v49 = 0;
  else
    v49 = (a4 >> 8) & 1;
  v227 = v49;
  v233 = a14;
  v197 = a14 != 0;
  *v48 = 0;
  v48[1] = 0;
  v222 = v48;
  v50 = FMIPItem.name.getter(v44);
  v215 = v51;
  v216 = v50;
  v234 = a1;
  FMIPItem.location.getter();
  v52 = type metadata accessor for FMIPLocation(0);
  v53 = *(_QWORD *)(v52 - 8);
  v198 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48);
  v54 = v198(v43, 1, v52);
  v199 = v52;
  v195 = v53;
  if (v54 == 1)
  {
    v55 = sub_1000078BC((uint64_t)v43, &qword_10001D3C0);
    v232 = 0;
  }
  else
  {
    v232 = (id)FMIPLocation.location.getter();
    v55 = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v43, v52);
  }
  v57 = v212;
  v56 = v213;
  v58 = FMIPItem.state.getter(v55);
  static FMIPItemState.isBTConnected.getter(v58);
  v59 = sub_100007838(&qword_10001D5E8, (uint64_t (*)(uint64_t))&type metadata accessor for FMIPItemState, (uint64_t)&protocol conformance descriptor for FMIPItemState);
  v60 = dispatch thunk of SetAlgebra.isSuperset(of:)(v36, v33, v59);
  v61 = *(void (**)(char *, uint64_t))(v56 + 8);
  v61(v36, v33);
  v61(v38, v33);
  if ((v231 & 1) != 0)
    v62 = (a4 >> 8) & 1;
  else
    v62 = 1;
  if ((v229 & v62 & 1) == 0 && !v233 && v232)
  {
    *(_BYTE *)(a9 + 37) = 1;
    if ((v60 & 1) != 0)
    {
      (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v209 + 56))(a9 + v57[12], 1, 1, v210);
      v63 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
      v252._object = (void *)0xE000000000000000;
      v64._countAndFlagsBits = 0x756F5968746957;
      v64._object = (void *)0xE700000000000000;
      v65._countAndFlagsBits = 0;
      v65._object = (void *)0xE000000000000000;
      v252._countAndFlagsBits = 0;
      v66 = NSLocalizedString(_:tableName:bundle:value:comment:)(v64, (Swift::String_optional)0, (NSBundle)v63, v65, v252);
      countAndFlagsBits = v66._countAndFlagsBits;
      object = v66._object;

      v69 = v234;
      v70 = v224;
    }
    else
    {
      v77 = v209;
      v76 = v210;
      v78 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v209 + 56);
      v78(v207, 1, 1, v210);
      v79 = objc_msgSend(v232, "timestamp");
      v80 = v201;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v81 = *(void (**)(char *, char *, uint64_t))(v77 + 32);
      v82 = (uint64_t)v202;
      v81(v202, v80, v76);
      v78(v82, 0, 1, v76);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v77 + 48))(v82, 1, v76) == 1)
      {
        sub_1000078BC(v82, &qword_10001D5E0);
      }
      else
      {
        v101 = v196;
        v102 = ((uint64_t (*)(char *, uint64_t, uint64_t))v81)(v196, v82, v76);
        if (fabs(Date.timeIntervalSinceNow.getter(v102)) >= 7200.0)
        {
          (*(void (**)(char *, uint64_t))(v77 + 8))(v101, v76);
        }
        else
        {
          v103 = v207;
          sub_1000078BC(v207, &qword_10001D5E0);
          v81((char *)v103, v101, v76);
          v78(v103, 0, 1, v76);
        }
      }
      v69 = v234;
      v70 = v224;
      v105 = v199;
      v104 = (uint64_t)v200;
      v106 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v198;
      sub_10000B4BC(v207, a9 + v57[12]);
      v107 = v232;
      FMIPItem.location.getter();
      if (v106(v104, 1, v105) == 1)
      {
        sub_1000078BC(v104, &qword_10001D3C0);
      }
      else
      {
        FMIPLocation.isOld.getter();
        (*(void (**)(uint64_t, uint64_t))(v195 + 8))(v104, v105);
      }
      countAndFlagsBits = sub_10000E4C0(v107);
      object = v108;

      sub_1000078BC(v207, &qword_10001D5E0);
    }
    v109 = (uint64_t)v208;
    v110 = (uint64_t *)(a9 + v57[13]);
    *v110 = countAndFlagsBits;
    v110[1] = (uint64_t)object;
    *(_BYTE *)(a9 + v57[14]) = 0;
    sub_10000CB00((uint64_t)v225, (uint64_t)&v250, &qword_10001D5D0);
    v111 = v251;
    if (v251 == (void *)1)
    {
      v112 = v205;
      v113 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v228 + 16))(v205, v69, v70);
      v88 = v223;
    }
    else
    {
      v213 = v250;
      v114 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v228 + 16);
      swift_bridgeObjectRetain(v251);
      v112 = v205;
      v113 = v114(v205, v69, v70);
      v87 = v230;
      v88 = v223;
      if (v111)
      {
        v115 = (*(uint64_t (**)(char *, uint64_t))(v228 + 8))(v112, v70);
        goto LABEL_46;
      }
    }
    v116 = v88;
    v117 = (uint64_t)v203;
    FMIPItem.address.getter(v113);
    v118 = type metadata accessor for FMIPAddress(0);
    v119 = v112;
    v120 = *(_QWORD *)(v118 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v120 + 48))(v117, 1, v118) == 1)
    {
      (*(void (**)(char *, uint64_t))(v228 + 8))(v119, v70);
      v115 = sub_1000078BC(v117, &qword_10001D5D8);
      v213 = 0;
      v111 = 0;
    }
    else
    {
      v121 = v117;
      v213 = FMIPAddress.locality.getter();
      v111 = v122;
      (*(void (**)(char *, uint64_t))(v228 + 8))(v119, v70);
      v115 = (*(uint64_t (**)(uint64_t, uint64_t))(v120 + 8))(v121, v118);
    }
    v109 = (uint64_t)v208;
    v88 = v116;
    v87 = v230;
LABEL_46:
    FMIPItem.address.getter(v115);
    v123 = type metadata accessor for FMIPAddress(0);
    v124 = *(_QWORD *)(v123 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v124 + 48))(v109, 1, v123) == 1)
    {
      sub_1000078BC(v109, &qword_10001D5D8);
      v125 = v225;
    }
    else
    {
      v126 = FMIPAddress.label.getter();
      v127 = v109;
      v129 = v128;
      (*(void (**)(uint64_t, uint64_t))(v124 + 8))(v127, v123);
      v125 = v225;
      if (v129)
        goto LABEL_56;
    }
    if ((v204 & 1) != 0)
    {
      swift_bridgeObjectRelease(0);
      sub_10000CB00((uint64_t)v125, (uint64_t)&v244, &qword_10001D5D0);
      if (v245 == 1)
        goto LABEL_62;
      v126 = v248;
      v129 = v249;
      if (!v249)
        goto LABEL_62;
    }
    else
    {
      sub_10000CB00((uint64_t)v125, (uint64_t)&v244, &qword_10001D5D0);
      if (v245 == 1)
      {
        swift_bridgeObjectRelease(0);
LABEL_62:
        v130 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
        v255._object = (void *)0xE000000000000000;
        v131._countAndFlagsBits = 0x7365726464416F4ELL;
        v131._object = (void *)0xEE00646E756F4673;
        v132._countAndFlagsBits = 0;
        v132._object = (void *)0xE000000000000000;
        v255._countAndFlagsBits = 0;
        v133 = NSLocalizedString(_:tableName:bundle:value:comment:)(v131, (Swift::String_optional)0, (NSBundle)v130, v132, v255);
        v126 = v133._countAndFlagsBits;
        v129 = v133._object;
        swift_bridgeObjectRelease(0);

        goto LABEL_63;
      }
      v126 = v246;
      v129 = v247;
      swift_bridgeObjectRetain(v247);
      swift_bridgeObjectRelease(0);
      if (v129)
      {
LABEL_56:
        if (v111
          && (v213 == v126 && v111 == v129
           || (_stringCompareWithSmolCheck(_:_:expecting:)(v213, v111, v126, v129, 0) & 1) != 0))
        {
          swift_bridgeObjectRelease(v129);
          v126 = 0;
          v129 = 0;
        }
LABEL_63:
        v134 = (uint64_t *)(a9 + v57[15]);
        *v134 = v126;
        v134[1] = (uint64_t)v129;
        sub_10000CB00((uint64_t)v125, (uint64_t)v242, &qword_10001D5D0);
        if (v242[1] == 1)
        {
          if (!v111)
          {
            v135 = 0;
            goto LABEL_73;
          }
        }
        else
        {
          v136 = v242[4];
          v135 = v243;
          swift_bridgeObjectRetain(v243);
          sub_10000B0A8(v125);
          if (!v111)
            goto LABEL_73;
          if (v135)
          {
            if ((v136 != v213 || v135 != v111)
              && (_stringCompareWithSmolCheck(_:_:expecting:)(v136, v135, v213, v111, 0) & 1) == 0
              && (v204 & 1) == 0)
            {
              v137 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
              v256._object = (void *)0xEE007972746E756FLL;
              v138._countAndFlagsBits = 0x43646E4179746943;
              v138._object = (void *)0xEE007972746E756FLL;
              v139._countAndFlagsBits = 0;
              v139._object = (void *)0xE000000000000000;
              v256._countAndFlagsBits = 0x43646E4179746943;
              v140 = NSLocalizedString(_:tableName:bundle:value:comment:)(v138, (Swift::String_optional)0, (NSBundle)v137, v139, v256);

              v141 = sub_1000075DC(&qword_10001D600);
              v142 = swift_allocObject(v141, 112, 7);
              *(_OWORD *)(v142 + 16) = xmmword_100015430;
              *(_QWORD *)(v142 + 56) = &type metadata for String;
              v143 = sub_10000B504();
              *(_QWORD *)(v142 + 32) = v213;
              *(_QWORD *)(v142 + 40) = v111;
              *(_QWORD *)(v142 + 96) = &type metadata for String;
              *(_QWORD *)(v142 + 104) = v143;
              v88 = v223;
              *(_QWORD *)(v142 + 64) = v143;
              *(_QWORD *)(v142 + 72) = v136;
              *(_QWORD *)(v142 + 80) = v135;
              v213 = String.init(format:_:)(v140._countAndFlagsBits, v140._object, v142);
              v111 = v144;
              v145 = v140._object;
              v87 = v230;
LABEL_74:
              swift_bridgeObjectRelease(v145);
              goto LABEL_75;
            }
LABEL_73:
            v145 = v135;
            goto LABEL_74;
          }
        }
LABEL_75:
        v146 = (uint64_t *)(a9 + v57[16]);
        *v146 = v213;
        v146[1] = (uint64_t)v111;
        *(_BYTE *)(a9 + v57[23]) = 0;
        v100 = (_BYTE)v226 == 0xFF;
        v89 = v211;
        goto LABEL_76;
      }
      v129 = v193;
      v126 = v194;
      if (!v193)
        goto LABEL_62;
    }
    swift_bridgeObjectRetain(v129);
    goto LABEL_63;
  }
  v71 = v206 | v231;
  v72 = v233 != 0;
  sub_10000B0A8(v225);
  *(_BYTE *)(a9 + 37) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t))(v209 + 56))(a9 + v57[12], 1, 1, v210);
  v74 = sub_10000B1D0(v71 & 1, v227, v72, 0, 0, 0);
  if (v73)
  {
    v75 = v73;
  }
  else
  {
    v83 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v253._object = (void *)0xE000000000000000;
    v84._countAndFlagsBits = 0x697461636F4C6F4ELL;
    v84._object = (void *)0xEF646E756F466E6FLL;
    v85._countAndFlagsBits = 0;
    v85._object = (void *)0xE000000000000000;
    v253._countAndFlagsBits = 0;
    v86 = NSLocalizedString(_:tableName:bundle:value:comment:)(v84, (Swift::String_optional)(unint64_t)v74, (NSBundle)v83, v85, v253);
    v74 = v86._countAndFlagsBits;
    v75 = v86._object;

  }
  v87 = v230;
  v88 = v223;
  v89 = v211;
  v90 = (uint64_t *)(a9 + v57[15]);
  *v90 = v74;
  v90[1] = (uint64_t)v75;
  if ((v71 & 1) != 0)
  {
    v91 = 0;
    v92 = 0;
  }
  else
  {
    v93 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v254._object = (void *)0xE000000000000000;
    v94._object = (void *)0x8000000100014AD0;
    v94._countAndFlagsBits = 0xD000000000000013;
    v95._countAndFlagsBits = 0;
    v95._object = (void *)0xE000000000000000;
    v254._countAndFlagsBits = 0;
    v96 = NSLocalizedString(_:tableName:bundle:value:comment:)(v94, (Swift::String_optional)0, (NSBundle)v93, v95, v254);
    v91 = v96._countAndFlagsBits;
    v92 = v96._object;

  }
  v97 = (uint64_t *)(a9 + v57[16]);
  *v97 = v91;
  v97[1] = (uint64_t)v92;
  v98 = (_QWORD *)(a9 + v57[13]);
  *v98 = 0;
  v98[1] = 0;
  *(_BYTE *)(a9 + v57[14]) = 0;
  v99 = v57[23];
  if (v232)
  {
    if ((v71 & 1) != 0)
    {
      if (v227)
      {
        v100 = 0;
        *(_BYTE *)(a9 + v99) = 1;
      }
      else
      {
        *(_BYTE *)(a9 + v99) = 0;
        v100 = v197;
      }
    }
    else
    {
      *(_BYTE *)(a9 + v99) = 0;
      v100 = 1;
    }
  }
  else
  {
    *(_BYTE *)(a9 + v99) = 1;
    v100 = v71 ^ 1;
    if (((v71 ^ 1 | v227) & 1) == 0)
      v100 = v197;
  }
LABEL_76:
  v147 = v233 != 0;
  *(_BYTE *)(a9 + v57[24]) = v100 & 1;
  *(_QWORD *)a9 = FMIPItem.identifier.getter();
  *(_QWORD *)(a9 + 8) = v148;
  v149 = v217;
  v150 = v215;
  *(_QWORD *)(a9 + 16) = v216;
  *(_QWORD *)(a9 + 24) = v150;
  *(_BYTE *)(a9 + 32) = 0;
  *(_BYTE *)(a9 + 33) = v229 & v231;
  *(_BYTE *)(a9 + 34) = 0;
  *(_BYTE *)(a9 + 35) = v147;
  *(_BYTE *)(a9 + 36) = 0;
  v151 = FMIPItem.role.getter();
  v152 = FMIPItemRole.emoji.getter(v151);
  v154 = v153;
  v155 = (*(uint64_t (**)(char *, uint64_t))(v218 + 8))(v149, v219);
  v156 = (uint64_t *)(a9 + v57[20]);
  *v156 = v152;
  v156[1] = v154;
  v157 = v220;
  FMIPItem.batteryStatus.getter(v155);
  v158 = v221;
  v159 = (*(uint64_t (**)(char *, uint64_t))(v221 + 88))(v157, v89);
  if (v159 == enum case for FMIPItemBatteryStatus.unknown(_:)
    || v159 == enum case for FMIPItemBatteryStatus.highPower(_:)
    || v159 == enum case for FMIPItemBatteryStatus.fresh(_:)
    || v159 == enum case for FMIPItemBatteryStatus.earlyLife(_:)
    || v159 == enum case for FMIPItemBatteryStatus.lateLife(_:))
  {
    v160 = (_QWORD *)(a9 + v57[21]);
    *v160 = 0;
    v160[1] = 0;
    v160[2] = 1;
  }
  else if (v159 == enum case for FMIPItemBatteryStatus.replace(_:)
         || v159 == enum case for FMIPItemBatteryStatus.dead(_:))
  {
    v188 = sub_10000D74C(0, 0, 1, 0.0);
    v190 = (unint64_t *)(a9 + v57[21]);
    *v190 = v189 | ((unint64_t)(v188 & 0x10101) << 32);
    v190[1] = v191;
    v190[2] = v192;
  }
  else
  {
    v187 = (_QWORD *)(a9 + v57[21]);
    *v187 = 0;
    v187[1] = 0;
    v187[2] = 1;
    (*(void (**)(char *, uint64_t))(v158 + 8))(v157, v89);
  }
  if ((v227 & 1) != 0)
  {
    v161 = 0;
    v162 = 0;
    v163 = -1;
    v164 = v214;
    v165 = v226;
  }
  else
  {
    v165 = v226;
    sub_10000B440(v88, v87, v226);
    v161 = v88;
    v162 = v87;
    v163 = v165;
    v164 = v214;
  }
  v166 = a9 + v57[22];
  *(_QWORD *)v166 = v161;
  *(_QWORD *)(v166 + 8) = v162;
  *(_BYTE *)(v166 + 16) = v163;
  v167 = v164;
  if ((a10 & 1) != 0)
    v167 = 0.0;
  *(double *)(a9 + v57[25]) = v167;
  v168 = a9 + v57[26];
  *(_QWORD *)v168 = a11;
  *(_QWORD *)(v168 + 8) = a12;
  *(_BYTE *)(v168 + 16) = a13;
  *(_BYTE *)(a9 + v57[27]) = 0;
  v235 = a9;
  sub_10000B440(a11, a12, a13);
  v169 = sub_1000075DC(&qword_10001D5F0);
  v170 = sub_10000B458();
  v171 = _Pointer.debugDescription.getter(v169, v170);
  v173 = v172;
  v174 = sub_100011480(9uLL, v171, v172);
  v176 = v175;
  v239 = 7876668;
  v240 = 0xE300000000000000;
  v235 = v174;
  v236 = v177;
  v237 = v178;
  v238 = v175;
  v179 = sub_1000079D0();
  String.append<A>(contentsOf:)(&v235, &type metadata for Substring, v179);
  swift_bridgeObjectRelease(v176);
  v180 = v240;
  v235 = v239;
  v236 = v240;
  swift_bridgeObjectRetain(v240);
  v181._countAndFlagsBits = 15987;
  v181._object = (void *)0xE200000000000000;
  String.append(_:)(v181);
  swift_bridgeObjectRelease(v173);
  swift_bridgeObjectRelease(v180);
  swift_errorRelease(v233);
  sub_10000B4A4(a11, a12, a13);
  sub_10000B4A4(v88, v230, v165);
  v182 = v235;
  v183 = v236;

  (*(void (**)(uint64_t, uint64_t))(v228 + 8))(v234, v224);
  v184 = v222;
  v185 = v222[1];
  *v222 = v182;
  v184[1] = v183;
  return swift_bridgeObjectRelease(v185);
}

uint64_t sub_10000939C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1000093D8 + 4 * byte_100015440[a1]))(0x696669746E656469, 0xEA00000000007265);
}

uint64_t sub_1000093D8()
{
  return 1701667182;
}

uint64_t sub_1000093E8()
{
  return 0x686563616C507369;
}

uint64_t sub_10000940C()
{
  return 0x64656E6769537369;
}

uint64_t sub_100009428()
{
  return 0x4C7974706D457369;
}

uint64_t sub_100009448()
{
  return 0x6576726553736168;
}

uint64_t sub_10000946C()
{
  return 0x64656D6954736168;
}

uint64_t sub_100009490()
{
  return 0x7461636F4C736168;
}

unint64_t sub_1000094B0()
{
  return 0xD000000000000010;
}

uint64_t sub_100009628()
{
  return 0x7963617275636361;
}

uint64_t sub_10000964C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = sub_10000939C(*a1);
  v5 = v4;
  v6 = sub_10000939C(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

Swift::Int sub_1000096D4()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  v2 = sub_10000939C(v1);
  v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100009734(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000939C(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100009774(uint64_t a1)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  v3 = sub_10000939C(v2);
  v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_1000097D0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_10000D0C0(*a1, a1[1]);
  *a2 = result;
  return result;
}

uint64_t sub_1000097FC@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10000939C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100009824()
{
  unsigned __int8 *v0;

  return sub_10000939C(*v0);
}

uint64_t sub_10000982C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000D0C0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100009850()
{
  return 0;
}

void sub_10000985C(_BYTE *a1@<X8>)
{
  *a1 = 23;
}

uint64_t sub_100009868(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000CA88();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100009890(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000CA88();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000098B8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  uint64_t *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  int *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  unint64_t v50;
  const mach_header_64 *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  unint64_t v58;
  id v59;
  Class isa;
  id v61;
  uint64_t v62;
  unint64_t v63;
  id v64;
  Class v65;
  id v66;
  char *v67;
  char v68;
  char v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  id v73;
  Class v74;
  id v75;
  uint64_t v76;
  unint64_t v77;
  id v78;
  Class v79;
  id v80;
  char *v81;
  id v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  Swift::String v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  id v102;
  id v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  char *v107;
  char *v108;
  char *v109;
  _QWORD *v110;
  uint64_t *v111;
  int *v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  __int128 v116;
  uint64_t v117;

  sub_1000075DC(&qword_10001D5E0);
  __chkstk_darwin();
  v6 = (char *)&v102 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000075DC(&qword_10001D710);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v102 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ItemModel(0);
  v11 = (int *)__chkstk_darwin();
  v13 = (uint64_t *)((char *)&v102 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = (char *)v13 + v11[17];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v107 = v14;
  v15 = (char *)v13 + v11[18];
  *(_QWORD *)v15 = 0;
  v15[8] = 1;
  v16 = (char *)v13 + v11[19];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v16[16] = 1;
  *((_BYTE *)v13 + v11[28]) = 0;
  v17 = (char *)v13 + v11[29];
  *(_OWORD *)v17 = xmmword_100015420;
  v111 = v13;
  v112 = v11;
  v18 = (char *)v13 + v11[30];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  v108 = v17;
  v109 = v18;
  v20 = a1[3];
  v19 = a1[4];
  v110 = a1;
  sub_10000CA64(a1, v20);
  v21 = sub_10000CA88();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for ItemModel.CodingKeys, &type metadata for ItemModel.CodingKeys, v21, v20, v19);
  if (v2)
  {
    sub_10000CACC(v110);
    v24 = v108;
    v25 = v109;
    swift_bridgeObjectRelease(*((_QWORD *)v107 + 1));
    swift_bridgeObjectRelease(*((_QWORD *)v24 + 1));
    return swift_bridgeObjectRelease(*((_QWORD *)v25 + 1));
  }
  else
  {
    v104 = a2;
    v105 = v6;
    v106 = v8;
    LOBYTE(v115) = 0;
    v22 = KeyedDecodingContainer.decode(_:forKey:)(&v115, v7);
    v23 = v7;
    v27 = v111;
    *v111 = v22;
    v27[1] = v28;
    LOBYTE(v115) = 1;
    v29 = KeyedDecodingContainer.decode(_:forKey:)(&v115, v7);
    v30 = v112;
    v27[2] = v29;
    v27[3] = v31;
    LOBYTE(v115) = 2;
    *((_BYTE *)v27 + 32) = KeyedDecodingContainer.decode(_:forKey:)(&v115, v7) & 1;
    LOBYTE(v115) = 3;
    *((_BYTE *)v27 + 33) = KeyedDecodingContainer.decode(_:forKey:)(&v115, v7) & 1;
    LOBYTE(v115) = 4;
    *((_BYTE *)v27 + 34) = KeyedDecodingContainer.decode(_:forKey:)(&v115, v7) & 1;
    LOBYTE(v115) = 5;
    *((_BYTE *)v27 + 35) = KeyedDecodingContainer.decode(_:forKey:)(&v115, v7) & 1;
    LOBYTE(v115) = 6;
    *((_BYTE *)v27 + 36) = KeyedDecodingContainer.decode(_:forKey:)(&v115, v7) & 1;
    LOBYTE(v115) = 7;
    *((_BYTE *)v27 + 37) = KeyedDecodingContainer.decode(_:forKey:)(&v115, v7) & 1;
    v32 = type metadata accessor for Date(0);
    LOBYTE(v115) = 8;
    v33 = sub_100007838(&qword_10001D720, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    v34 = v105;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v32, &v115, v23, v32, v33);
    (*(void (**)(id, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v34, 0, 1, v32);
    sub_10000CB00((uint64_t)v34, (uint64_t)v27 + v30[12], &qword_10001D5E0);
    LOBYTE(v115) = 9;
    v35 = v23;
    v36 = v10;
    v37 = KeyedDecodingContainer.decode(_:forKey:)(&v115, v23);
    v38 = (uint64_t *)((char *)v111 + v112[13]);
    *v38 = v37;
    v38[1] = v39;
    LOBYTE(v115) = 10;
    v40 = KeyedDecodingContainer.decode(_:forKey:)(&v115, v23);
    *((_BYTE *)v111 + v112[14]) = v40 & 1;
    LOBYTE(v115) = 11;
    v41 = KeyedDecodingContainer.decode(_:forKey:)(&v115, v23);
    v42 = (uint64_t *)((char *)v111 + v112[15]);
    *v42 = v41;
    v42[1] = v43;
    LOBYTE(v115) = 12;
    v44 = KeyedDecodingContainer.decode(_:forKey:)(&v115, v23);
    v45 = (uint64_t *)((char *)v111 + v112[16]);
    *v45 = v44;
    v45[1] = v46;
    LOBYTE(v115) = 13;
    v47 = KeyedDecodingContainer.decode(_:forKey:)(&v115, v23);
    v48 = (uint64_t *)((char *)v111 + v112[20]);
    *v48 = v47;
    v48[1] = v49;
    LOBYTE(v113) = 14;
    v50 = sub_10000CB44();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for BatteryInfo, &v113, v23, &type metadata for BatteryInfo, v50);
    v51 = &_mh_execute_header;
    if (!BYTE4(v115))
      v51 = 0;
    v52 = (unint64_t)v51 | v115;
    v53 = 0x10000000000;
    if (!BYTE5(v115))
      v53 = 0;
    v54 = 0x1000000000000;
    if (!BYTE6(v115))
      v54 = 0;
    v55 = v52 | v53 | v54;
    v56 = (char *)v111 + v112[21];
    *(_QWORD *)v56 = v55;
    *(_OWORD *)(v56 + 8) = v116;
    LOBYTE(v113) = 15;
    v105 = (id)sub_10000CB88();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v113, v23, &type metadata for Data, v105);
    v57 = v115;
    v58 = v116;
    v59 = objc_allocWithZone((Class)UIImage);
    isa = Data._bridgeToObjectiveC()().super.isa;
    v61 = objc_msgSend(v59, "initWithData:", isa);
    sub_10000CC10(v57, v58);

    LOBYTE(v113) = 16;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v113, v35, &type metadata for Data, v105);
    v62 = v115;
    v63 = v116;
    v64 = objc_allocWithZone((Class)UIImage);
    v65 = Data._bridgeToObjectiveC()().super.isa;
    v66 = objc_msgSend(v64, "initWithData:", v65);
    sub_10000CC10(v62, v63);

    v67 = (char *)v111 + v112[22];
    *(_QWORD *)v67 = v61;
    *((_QWORD *)v67 + 1) = v66;
    v67[16] = 1;
    LOBYTE(v115) = 17;
    v103 = v66;
    v102 = v61;
    v68 = KeyedDecodingContainer.decode(_:forKey:)(&v115, v35);
    *((_BYTE *)v111 + v112[23]) = v68 & 1;
    LOBYTE(v115) = 18;
    v69 = KeyedDecodingContainer.decode(_:forKey:)(&v115, v35);
    *((_BYTE *)v111 + v112[24]) = v69 & 1;
    LOBYTE(v113) = 19;
    v70 = sub_10000CBCC();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for CGFloat, &v113, v35, &type metadata for CGFloat, v70);
    *(uint64_t *)((char *)v111 + v112[25]) = v115;
    LOBYTE(v113) = 20;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v113, v35, &type metadata for Data, v105);
    v71 = v115;
    v72 = v116;
    v73 = objc_allocWithZone((Class)UIImage);
    v74 = Data._bridgeToObjectiveC()().super.isa;
    v75 = objc_msgSend(v73, "initWithData:", v74);
    sub_10000CC10(v71, v72);

    LOBYTE(v113) = 21;
    KeyedDecodingContainer.decode<A>(_:forKey:)(&type metadata for Data, &v113, v35, &type metadata for Data, v105);
    v76 = v115;
    v77 = v116;
    v78 = objc_allocWithZone((Class)UIImage);
    v79 = Data._bridgeToObjectiveC()().super.isa;
    v80 = objc_msgSend(v78, "initWithData:", v79);
    sub_10000CC10(v76, v77);

    v81 = (char *)v111 + v112[26];
    *(_QWORD *)v81 = v75;
    *((_QWORD *)v81 + 1) = v80;
    v81[16] = 1;
    LOBYTE(v115) = 22;
    v82 = v80;
    v105 = v75;
    v83 = KeyedDecodingContainer.decode(_:forKey:)(&v115, v35);
    v84 = (uint64_t)v111;
    *((_BYTE *)v111 + v112[27]) = v83 & 1;
    v115 = v84;
    v85 = sub_1000075DC(&qword_10001D5F0);
    v86 = sub_10000B458();
    v87 = _Pointer.debugDescription.getter(v85, v86);
    v89 = v88;
    v90 = sub_100011480(9uLL, v87, v88);
    v92 = v91;
    v113 = 7876668;
    v114 = 0xE300000000000000;
    v115 = v90;
    *(_QWORD *)&v116 = v93;
    *((_QWORD *)&v116 + 1) = v94;
    v117 = v91;
    v95 = sub_1000079D0();
    String.append<A>(contentsOf:)(&v115, &type metadata for Substring, v95);
    swift_bridgeObjectRelease(v92);
    v96 = v114;
    v115 = v113;
    *(_QWORD *)&v116 = v114;
    swift_bridgeObjectRetain(v114);
    v97._countAndFlagsBits = 15987;
    v97._object = (void *)0xE200000000000000;
    String.append(_:)(v97);

    swift_bridgeObjectRelease(v89);
    swift_bridgeObjectRelease(v96);
    v98 = v115;
    v99 = v116;

    (*(void (**)(char *, uint64_t))(v106 + 8))(v36, v35);
    v100 = v109;
    v101 = *((_QWORD *)v109 + 1);
    *(_QWORD *)v109 = v98;
    *((_QWORD *)v100 + 1) = v99;
    swift_bridgeObjectRelease(v101);
    sub_100007658(v84, v104);
    sub_10000CACC(v110);
    return sub_10000761C(v84);
  }
}

uint64_t sub_10000A5EC(_QWORD *a1)
{
  uint64_t v2;
  UIImage *v3;
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
  uint64_t v14;
  uint64_t *v15;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  __int128 *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  void *v46;
  UIImage *v47;
  UIImage *v48;
  void (*v49)(char *, uint64_t);
  NSData *v50;
  NSData *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  void *v57;
  UIImage *v58;
  NSData *v59;
  NSData *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  int v68;
  void *v69;
  UIImage *v70;
  UIImage *v71;
  void (*v72)(char *, uint64_t);
  NSData *v73;
  NSData *v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  void *v80;
  UIImage *v81;
  char *v82;
  UIImage *v83;
  NSData *v84;
  NSData *v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  Class isa;
  UIImage *v93;
  UIImage *v94;
  uint64_t v95;
  int *v96;
  UIImage *v97;
  uint64_t v98;
  uint64_t *v99;
  __int128 v100;
  uint64_t v101;
  char v102;

  v2 = type metadata accessor for ColorScheme(0);
  v3 = *(UIImage **)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&isa - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000075DC(&qword_10001D740);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&isa - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[3];
  v11 = a1[4];
  sub_10000CA64(a1, v10);
  v12 = sub_10000CA88();
  v13 = v10;
  v14 = v6;
  v15 = v99;
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for ItemModel.CodingKeys, &type metadata for ItemModel.CodingKeys, v12, v13, v11);
  v16 = *v15;
  v17 = v15[1];
  LOBYTE(v100) = 0;
  v18 = v98;
  KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v100, v14);
  if (v18)
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v14);
  v97 = v3;
  v98 = v7;
  v19 = v2;
  v20 = v15[2];
  v21 = v15[3];
  LOBYTE(v100) = 1;
  KeyedEncodingContainer.encode(_:forKey:)(v20, v21, &v100, v14);
  v22 = *((unsigned __int8 *)v15 + 32);
  LOBYTE(v100) = 2;
  KeyedEncodingContainer.encode(_:forKey:)(v22, &v100, v14);
  v23 = *((unsigned __int8 *)v15 + 33);
  LOBYTE(v100) = 3;
  KeyedEncodingContainer.encode(_:forKey:)(v23, &v100, v14);
  v24 = *((unsigned __int8 *)v15 + 34);
  LOBYTE(v100) = 4;
  KeyedEncodingContainer.encode(_:forKey:)(v24, &v100, v14);
  v25 = *((unsigned __int8 *)v15 + 35);
  LOBYTE(v100) = 5;
  KeyedEncodingContainer.encode(_:forKey:)(v25, &v100, v14);
  v26 = *((unsigned __int8 *)v15 + 36);
  LOBYTE(v100) = 6;
  KeyedEncodingContainer.encode(_:forKey:)(v26, &v100, v14);
  v27 = *((unsigned __int8 *)v15 + 37);
  LOBYTE(v100) = 7;
  KeyedEncodingContainer.encode(_:forKey:)(v27, &v100, v14);
  v96 = (int *)type metadata accessor for ItemModel(0);
  v29 = (uint64_t)v15 + v96[12];
  LOBYTE(v100) = 8;
  v30 = v14;
  v31 = sub_1000075DC(&qword_10001D5E0);
  v32 = sub_10000CC54();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v29, &v100, v30, v31, v32);
  v100 = *(_OWORD *)((char *)v15 + v96[13]);
  v102 = 9;
  v33 = sub_1000075DC(&qword_10001D758);
  v34 = sub_10000CCD0();
  v95 = v33;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v100, &v102, v30, v33, v34);
  v35 = *((unsigned __int8 *)v15 + v96[14]);
  LOBYTE(v100) = 10;
  v36 = v30;
  v37 = v9;
  KeyedEncodingContainer.encode(_:forKey:)(v35, &v100, v30);
  v100 = *(_OWORD *)((char *)v99 + v96[15]);
  v102 = 11;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v100, &v102, v30, v95, v34);
  v100 = *(_OWORD *)((char *)v99 + v96[16]);
  v102 = 12;
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v100, &v102, v30, v95, v34);
  v38 = (uint64_t *)((char *)v99 + v96[20]);
  v39 = *v38;
  v40 = v38[1];
  LOBYTE(v100) = 13;
  KeyedEncodingContainer.encode(_:forKey:)(v39, v40, &v100, v30);
  v41 = (__int128 *)((char *)v99 + v96[21]);
  v42 = *((_QWORD *)v41 + 2);
  v100 = *v41;
  v101 = v42;
  v102 = 14;
  v43 = sub_1000075DC(&qword_10001D768);
  v44 = sub_10000CD2C(&qword_10001D770, &qword_10001D768, (void (*)(void))sub_10000CD90);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v100, &v102, v30, v43, v44);
  v95 = (uint64_t)v99 + v96[22];
  v45 = *(unsigned __int8 *)(v95 + 16);
  if (v45 != 255)
  {
    v46 = *(void **)(v95 + 8);
    v93 = *(UIImage **)v95;
    LODWORD(v94) = v45 & 1;
    v47 = v97;
    isa = v97[13].super.isa;
    ((void (*)(char *, _QWORD, uint64_t))isa)(v5, enum case for ColorScheme.light(_:), v19);
    v48 = (UIImage *)sub_100007C3C((uint64_t)v5, v93, v46, (char)v94);
    v49 = (void (*)(char *, uint64_t))v47[1].super.isa;
    v49(v5, v19);
    v94 = v48;
    if (v48)
    {
      v50 = UIImagePNGRepresentation(v94);
      if (v50)
      {
        v51 = v50;
        v93 = (UIImage *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v53 = v52;

      }
      else
      {
        v93 = 0;
        v53 = 0xF000000000000000;
      }
      *(_QWORD *)&v100 = v93;
      *((_QWORD *)&v100 + 1) = v53;
      v102 = 15;
      v54 = sub_1000075DC(&qword_10001D788);
      v55 = sub_10000CD2C(&qword_10001D790, &qword_10001D788, (void (*)(void))sub_10000CE18);
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v100, &v102, v36, v54, v55);
      sub_10000CE5C((uint64_t)v93, v53);

    }
    v56 = *(unsigned __int8 *)(v95 + 16);
    if (v56 != 255)
    {
      v57 = *(void **)(v95 + 8);
      v94 = *(UIImage **)v95;
      LODWORD(v95) = v56 & 1;
      ((void (*)(char *, _QWORD, uint64_t))isa)(v5, enum case for ColorScheme.dark(_:), v19);
      v58 = (UIImage *)sub_100007C3C((uint64_t)v5, v94, v57, v95);
      v49(v5, v19);
      if (v58)
      {
        v59 = UIImagePNGRepresentation(v58);
        if (v59)
        {
          v60 = v59;
          v95 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v62 = v61;

        }
        else
        {
          v95 = 0;
          v62 = 0xF000000000000000;
        }
        *(_QWORD *)&v100 = v95;
        *((_QWORD *)&v100 + 1) = v62;
        v102 = 16;
        v63 = sub_1000075DC(&qword_10001D788);
        v64 = sub_10000CD2C(&qword_10001D790, &qword_10001D788, (void (*)(void))sub_10000CE18);
        KeyedEncodingContainer.encode<A>(_:forKey:)(&v100, &v102, v36, v63, v64);
        sub_10000CE5C(v95, v62);

      }
    }
  }
  v65 = *((unsigned __int8 *)v99 + v96[23]);
  LOBYTE(v100) = 17;
  KeyedEncodingContainer.encode(_:forKey:)(v65, &v100, v36);
  v66 = *((unsigned __int8 *)v99 + v96[24]);
  LOBYTE(v100) = 18;
  KeyedEncodingContainer.encode(_:forKey:)(v66, &v100, v36);
  *(_QWORD *)&v100 = *(uint64_t *)((char *)v99 + v96[25]);
  v102 = 19;
  v67 = sub_10000CDD4();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v100, &v102, v36, &type metadata for CGFloat, v67);
  v95 = (uint64_t)v99 + v96[26];
  v68 = *(unsigned __int8 *)(v95 + 16);
  if (v68 != 255)
  {
    v69 = *(void **)(v95 + 8);
    v93 = *(UIImage **)v95;
    LODWORD(v94) = v68 & 1;
    v70 = v97;
    isa = v97[13].super.isa;
    ((void (*)(char *, _QWORD, uint64_t))isa)(v5, enum case for ColorScheme.light(_:), v19);
    v71 = (UIImage *)sub_100007C3C((uint64_t)v5, v93, v69, (char)v94);
    v72 = (void (*)(char *, uint64_t))v70[1].super.isa;
    v72(v5, v19);
    v97 = v71;
    if (v71)
    {
      v73 = UIImagePNGRepresentation(v97);
      if (v73)
      {
        v74 = v73;
        v94 = (UIImage *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
        v76 = v75;

      }
      else
      {
        v94 = 0;
        v76 = 0xF000000000000000;
      }
      *(_QWORD *)&v100 = v94;
      *((_QWORD *)&v100 + 1) = v76;
      v102 = 20;
      v77 = sub_1000075DC(&qword_10001D788);
      v78 = sub_10000CD2C(&qword_10001D790, &qword_10001D788, (void (*)(void))sub_10000CE18);
      KeyedEncodingContainer.encode<A>(_:forKey:)(&v100, &v102, v36, v77, v78);
      sub_10000CE5C((uint64_t)v94, v76);

    }
    v79 = *(unsigned __int8 *)(v95 + 16);
    if (v79 != 255)
    {
      v81 = *(UIImage **)v95;
      v80 = *(void **)(v95 + 8);
      LODWORD(v97) = v79 & 1;
      v82 = v5;
      ((void (*)(char *, _QWORD, uint64_t))isa)(v5, enum case for ColorScheme.dark(_:), v19);
      v83 = (UIImage *)sub_100007C3C((uint64_t)v5, v81, v80, (char)v97);
      v72(v82, v19);
      if (v83)
      {
        v84 = UIImagePNGRepresentation(v83);
        if (v84)
        {
          v85 = v84;
          v86 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
          v88 = v87;

        }
        else
        {
          v86 = 0;
          v88 = 0xF000000000000000;
        }
        *(_QWORD *)&v100 = v86;
        *((_QWORD *)&v100 + 1) = v88;
        v102 = 21;
        v89 = sub_1000075DC(&qword_10001D788);
        v90 = sub_10000CD2C(&qword_10001D790, &qword_10001D788, (void (*)(void))sub_10000CE18);
        KeyedEncodingContainer.encode<A>(_:forKey:)(&v100, &v102, v36, v89, v90);
        sub_10000CE5C(v86, v88);

      }
    }
  }
  v91 = *((unsigned __int8 *)v99 + v96[27]);
  LOBYTE(v100) = 22;
  KeyedEncodingContainer.encode(_:forKey:)(v91, &v100, v36);
  return (*(uint64_t (**)(char *, uint64_t))(v98 + 8))(v37, v36);
}

uint64_t type metadata accessor for ItemModel(uint64_t a1)
{
  uint64_t result;

  result = qword_10001D668;
  if (!qword_10001D668)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ItemModel);
  return result;
}

uint64_t *sub_10000B0A8(uint64_t *a1)
{
  sub_10000B0F8(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13]);
  return a1;
}

uint64_t sub_10000B0F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t result;

  if (a2 != 1)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a6);
    swift_bridgeObjectRelease(a8);
    swift_bridgeObjectRelease(a10);
    swift_bridgeObjectRelease(a12);
    return swift_bridgeObjectRelease(a14);
  }
  return result;
}

uint64_t sub_10000B178(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000B1A8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000098B8(a1, a2);
}

uint64_t sub_10000B1BC(_QWORD *a1)
{
  return sub_10000A5EC(a1);
}

uint64_t sub_10000B1D0(char a1, char a2, char a3, char a4, char a5, char a6)
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Swift::String v11;
  uint64_t v12;
  uint64_t countAndFlagsBits;
  unint64_t v15;

  if ((a1 & 1) == 0)
  {
    v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v15 = 0xE000000000000000;
    v7 = 0x4C746F4E72657355;
    v8 = 0xEF6E49646567676FLL;
    goto LABEL_5;
  }
  if ((a2 & 1) != 0)
  {
    v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v15 = 0xE000000000000000;
    v7 = 0x656E616C70726941;
    v8 = 0xEE006E4F65646F4DLL;
LABEL_5:
    v9 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  if ((a3 & 1) != 0)
  {
    v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v15 = 0xE000000000000000;
    v7 = 0x6576726553796E41;
    v8 = 0xEE00726F72724572;
    goto LABEL_5;
  }
  if ((a4 & 1) != 0)
  {
    v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v15 = 0xE000000000000000;
    v7 = 0x74754F64656D6954;
    v8 = 0xED0000726F727245;
    goto LABEL_5;
  }
  if ((a5 & 1) != 0)
  {
    v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v15 = 0xE000000000000000;
    v10 = 0x8000000100014AF0;
    v7 = 0x6F6D65526D657449;
    v8 = 0xEB00000000646576;
  }
  else
  {
    if ((a6 & 1) == 0)
      return 0;
    v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v15 = 0xE000000000000000;
    v10 = 0x8000000100014AF0;
    v7 = 0x736D6574496F4ELL;
    v8 = 0xE700000000000000;
  }
  v9 = 0xD000000000000010;
LABEL_6:
  v11._countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v12 = 0;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v7, *(Swift::String_optional *)&v9, (NSBundle)v6, v11, *(Swift::String *)(&v15 - 1))._countAndFlagsBits;

  return countAndFlagsBits;
}

id sub_10000B440(id result, void *a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_100007A18(result, a2, a3 & 1);
  return result;
}

unint64_t sub_10000B458()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D5F8;
  if (!qword_10001D5F8)
  {
    v1 = sub_1000077F4(&qword_10001D5F0);
    result = swift_getWitnessTable(&protocol conformance descriptor for UnsafePointer<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10001D5F8);
  }
  return result;
}

void sub_10000B4A4(void *a1, void *a2, unsigned __int8 a3)
{
  if (a3 != 255)
    sub_100007A50(a1, a2, a3 & 1);
}

uint64_t sub_10000B4BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000075DC(&qword_10001D5E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B504()
{
  unint64_t result;

  result = qword_10001D608;
  if (!qword_10001D608)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10001D608);
  }
  return result;
}

_QWORD *sub_10000B548(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t *v50;
  int v51;
  char v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t *v58;
  int v59;
  char v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  uint64_t v71;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v16);
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    *(_DWORD *)(a1 + 32) = *((_DWORD *)a2 + 8);
    *(_WORD *)(a1 + 36) = *((_WORD *)a2 + 18);
    v9 = a3[12];
    v10 = (void *)(a1 + v9);
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for Date(0);
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    if (v14(v11, 1, v12))
    {
      v15 = sub_1000075DC(&qword_10001D5E0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    v17 = a3[13];
    v18 = a3[14];
    v19 = (_QWORD *)((char *)v4 + v17);
    v20 = (uint64_t *)((char *)a2 + v17);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    *((_BYTE *)v4 + v18) = *((_BYTE *)a2 + v18);
    v22 = a3[15];
    v23 = a3[16];
    v24 = (_QWORD *)((char *)v4 + v22);
    v25 = (uint64_t *)((char *)a2 + v22);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    v27 = (_QWORD *)((char *)v4 + v23);
    v28 = (uint64_t *)((char *)a2 + v23);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v30 = a3[17];
    v31 = a3[18];
    v32 = (_QWORD *)((char *)v4 + v30);
    v33 = (uint64_t *)((char *)a2 + v30);
    v34 = v33[1];
    *v32 = *v33;
    v32[1] = v34;
    v35 = (char *)v4 + v31;
    v36 = (uint64_t)a2 + v31;
    *(_QWORD *)v35 = *(_QWORD *)v36;
    v35[8] = *(_BYTE *)(v36 + 8);
    v37 = a3[19];
    v38 = a3[20];
    v39 = (char *)v4 + v37;
    v40 = (uint64_t)a2 + v37;
    *(_OWORD *)v39 = *(_OWORD *)v40;
    v39[16] = *(_BYTE *)(v40 + 16);
    v41 = (_QWORD *)((char *)v4 + v38);
    v42 = (uint64_t *)((char *)a2 + v38);
    v43 = v42[1];
    *v41 = *v42;
    v41[1] = v43;
    v44 = a3[21];
    v45 = (char *)v4 + v44;
    v46 = (uint64_t)a2 + v44;
    v47 = *(uint64_t *)((char *)a2 + v44 + 16);
    swift_bridgeObjectRetain(v21);
    swift_bridgeObjectRetain(v26);
    swift_bridgeObjectRetain(v29);
    swift_bridgeObjectRetain(v34);
    swift_bridgeObjectRetain(v43);
    if (v47 == 1)
    {
      *(_OWORD *)v45 = *(_OWORD *)v46;
      *((_QWORD *)v45 + 2) = *(_QWORD *)(v46 + 16);
    }
    else
    {
      *(_DWORD *)v45 = *(_DWORD *)v46;
      v45[4] = *(_BYTE *)(v46 + 4);
      *(_WORD *)(v45 + 5) = *(_WORD *)(v46 + 5);
      *((_QWORD *)v45 + 1) = *(_QWORD *)(v46 + 8);
      *((_QWORD *)v45 + 2) = v47;
      swift_bridgeObjectRetain(v47);
    }
    v48 = a3[22];
    v49 = (char *)v4 + v48;
    v50 = (uint64_t *)((char *)a2 + v48);
    v51 = *((unsigned __int8 *)v50 + 16);
    if (v51 == 255)
    {
      *(_OWORD *)v49 = *(_OWORD *)v50;
      v49[16] = *((_BYTE *)v50 + 16);
    }
    else
    {
      v52 = v51 & 1;
      v53 = *v50;
      v54 = (void *)v50[1];
      sub_100007A18((void *)*v50, v54, v51 & 1);
      *(_QWORD *)v49 = v53;
      *((_QWORD *)v49 + 1) = v54;
      v49[16] = v52;
    }
    v55 = a3[24];
    *((_BYTE *)v4 + a3[23]) = *((_BYTE *)a2 + a3[23]);
    *((_BYTE *)v4 + v55) = *((_BYTE *)a2 + v55);
    v56 = a3[26];
    *(_QWORD *)((char *)v4 + a3[25]) = *(uint64_t *)((char *)a2 + a3[25]);
    v57 = (char *)v4 + v56;
    v58 = (uint64_t *)((char *)a2 + v56);
    v59 = *((unsigned __int8 *)a2 + v56 + 16);
    if (v59 == 255)
    {
      *(_OWORD *)v57 = *(_OWORD *)v58;
      v57[16] = *((_BYTE *)v58 + 16);
    }
    else
    {
      v60 = v59 & 1;
      v61 = *v58;
      v62 = (void *)v58[1];
      sub_100007A18((void *)*v58, v62, v59 & 1);
      *(_QWORD *)v57 = v61;
      *((_QWORD *)v57 + 1) = v62;
      v57[16] = v60;
    }
    v63 = a3[28];
    *((_BYTE *)v4 + a3[27]) = *((_BYTE *)a2 + a3[27]);
    *((_BYTE *)v4 + v63) = *((_BYTE *)a2 + v63);
    v64 = a3[29];
    v65 = a3[30];
    v66 = (_QWORD *)((char *)v4 + v64);
    v67 = (uint64_t *)((char *)a2 + v64);
    v68 = v67[1];
    *v66 = *v67;
    v66[1] = v68;
    v69 = (_QWORD *)((char *)v4 + v65);
    v70 = (uint64_t *)((char *)a2 + v65);
    v71 = v70[1];
    *v69 = *v70;
    v69[1] = v71;
    swift_bridgeObjectRetain(v68);
    swift_bridgeObjectRetain(v71);
  }
  return v4;
}

uint64_t sub_10000B878(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  v4 = a1 + a2[12];
  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[13] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[15] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[16] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[17] + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[20] + 8));
  v7 = *(_QWORD *)(a1 + a2[21] + 16);
  if (v7 != 1)
    swift_bridgeObjectRelease(v7);
  v8 = a1 + a2[22];
  v9 = *(unsigned __int8 *)(v8 + 16);
  if (v9 != 255)
    sub_100007A50(*(void **)v8, *(void **)(v8 + 8), v9 & 1);
  v10 = a1 + a2[26];
  v11 = *(unsigned __int8 *)(v10 + 16);
  if (v11 != 255)
    sub_100007A50(*(void **)v10, *(void **)(v10 + 8), v11 & 1);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[29] + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + a2[30] + 8));
}

uint64_t sub_10000B9BC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(const void *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
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
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  int v49;
  char v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  int v57;
  char v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_WORD *)(a1 + 36) = *(_WORD *)(a2 + 36);
  v8 = a3[12];
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  if (v13(v10, 1, v11))
  {
    v14 = sub_1000075DC(&qword_10001D5E0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  v15 = a3[13];
  v16 = a3[14];
  v17 = (_QWORD *)(a1 + v15);
  v18 = (_QWORD *)(a2 + v15);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  v20 = a3[15];
  v21 = a3[16];
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
  v28 = a3[17];
  v29 = a3[18];
  v30 = (_QWORD *)(a1 + v28);
  v31 = (_QWORD *)(a2 + v28);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  v33 = a1 + v29;
  v34 = a2 + v29;
  *(_QWORD *)v33 = *(_QWORD *)v34;
  *(_BYTE *)(v33 + 8) = *(_BYTE *)(v34 + 8);
  v35 = a3[19];
  v36 = a3[20];
  v37 = a1 + v35;
  v38 = a2 + v35;
  *(_OWORD *)v37 = *(_OWORD *)v38;
  *(_BYTE *)(v37 + 16) = *(_BYTE *)(v38 + 16);
  v39 = (_QWORD *)(a1 + v36);
  v40 = (_QWORD *)(a2 + v36);
  v41 = v40[1];
  *v39 = *v40;
  v39[1] = v41;
  v42 = a3[21];
  v43 = a1 + v42;
  v44 = a2 + v42;
  v45 = *(_QWORD *)(a2 + v42 + 16);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRetain(v41);
  if (v45 == 1)
  {
    *(_OWORD *)v43 = *(_OWORD *)v44;
    *(_QWORD *)(v43 + 16) = *(_QWORD *)(v44 + 16);
  }
  else
  {
    *(_DWORD *)v43 = *(_DWORD *)v44;
    *(_BYTE *)(v43 + 4) = *(_BYTE *)(v44 + 4);
    *(_WORD *)(v43 + 5) = *(_WORD *)(v44 + 5);
    *(_QWORD *)(v43 + 8) = *(_QWORD *)(v44 + 8);
    *(_QWORD *)(v43 + 16) = v45;
    swift_bridgeObjectRetain(v45);
  }
  v46 = a3[22];
  v47 = a1 + v46;
  v48 = (uint64_t *)(a2 + v46);
  v49 = *((unsigned __int8 *)v48 + 16);
  if (v49 == 255)
  {
    *(_OWORD *)v47 = *(_OWORD *)v48;
    *(_BYTE *)(v47 + 16) = *((_BYTE *)v48 + 16);
  }
  else
  {
    v50 = v49 & 1;
    v51 = *v48;
    v52 = (void *)v48[1];
    sub_100007A18((void *)*v48, v52, v49 & 1);
    *(_QWORD *)v47 = v51;
    *(_QWORD *)(v47 + 8) = v52;
    *(_BYTE *)(v47 + 16) = v50;
  }
  v53 = a3[24];
  *(_BYTE *)(a1 + a3[23]) = *(_BYTE *)(a2 + a3[23]);
  *(_BYTE *)(a1 + v53) = *(_BYTE *)(a2 + v53);
  v54 = a3[26];
  *(_QWORD *)(a1 + a3[25]) = *(_QWORD *)(a2 + a3[25]);
  v55 = a1 + v54;
  v56 = (uint64_t *)(a2 + v54);
  v57 = *(unsigned __int8 *)(a2 + v54 + 16);
  if (v57 == 255)
  {
    *(_OWORD *)v55 = *(_OWORD *)v56;
    *(_BYTE *)(v55 + 16) = *((_BYTE *)v56 + 16);
  }
  else
  {
    v58 = v57 & 1;
    v59 = *v56;
    v60 = (void *)v56[1];
    sub_100007A18((void *)*v56, v60, v57 & 1);
    *(_QWORD *)v55 = v59;
    *(_QWORD *)(v55 + 8) = v60;
    *(_BYTE *)(v55 + 16) = v58;
  }
  v61 = a3[28];
  *(_BYTE *)(a1 + a3[27]) = *(_BYTE *)(a2 + a3[27]);
  *(_BYTE *)(a1 + v61) = *(_BYTE *)(a2 + v61);
  v62 = a3[29];
  v63 = a3[30];
  v64 = (_QWORD *)(a1 + v62);
  v65 = (_QWORD *)(a2 + v62);
  v66 = v65[1];
  *v64 = *v65;
  v64[1] = v66;
  v67 = (_QWORD *)(a1 + v63);
  v68 = (_QWORD *)(a2 + v63);
  v69 = v68[1];
  *v67 = *v68;
  v67[1] = v69;
  swift_bridgeObjectRetain(v66);
  swift_bridgeObjectRetain(v69);
  return a1;
}

uint64_t sub_10000BCC0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 *v45;
  __int128 v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  __int128 *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  __int128 *v63;
  int v64;
  int v65;
  char v66;
  __int128 v67;
  char v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  char v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  __int128 *v79;
  int v80;
  int v81;
  char v82;
  __int128 v83;
  char v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  char v89;
  char v90;
  void *v91;
  void *v92;
  uint64_t v93;
  _QWORD *v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  *(_BYTE *)(a1 + 35) = *(_BYTE *)(a2 + 35);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_BYTE *)(a1 + 37) = *(_BYTE *)(a2 + 37);
  v10 = a3[12];
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    v18 = sub_1000075DC(&qword_10001D5E0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
LABEL_7:
  v19 = a3[13];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  *v20 = *v21;
  v22 = v21[1];
  v23 = v20[1];
  v20[1] = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  v24 = a3[15];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (_QWORD *)(a2 + v24);
  *v25 = *v26;
  v27 = v26[1];
  v28 = v25[1];
  v25[1] = v27;
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRelease(v28);
  v29 = a3[16];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (_QWORD *)(a2 + v29);
  *v30 = *v31;
  v32 = v31[1];
  v33 = v30[1];
  v30[1] = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  v34 = a3[17];
  v35 = (_QWORD *)(a1 + v34);
  v36 = (_QWORD *)(a2 + v34);
  *v35 = *v36;
  v37 = v36[1];
  v38 = v35[1];
  v35[1] = v37;
  swift_bridgeObjectRetain(v37);
  swift_bridgeObjectRelease(v38);
  v39 = a3[18];
  v40 = a1 + v39;
  v41 = (uint64_t *)(a2 + v39);
  v42 = *v41;
  *(_BYTE *)(v40 + 8) = *((_BYTE *)v41 + 8);
  *(_QWORD *)v40 = v42;
  v43 = a3[19];
  v44 = a1 + v43;
  v45 = (__int128 *)(a2 + v43);
  v46 = *v45;
  *(_BYTE *)(v44 + 16) = *((_BYTE *)v45 + 16);
  *(_OWORD *)v44 = v46;
  v47 = a3[20];
  v48 = (_QWORD *)(a1 + v47);
  v49 = (_QWORD *)(a2 + v47);
  *v48 = *v49;
  v50 = v49[1];
  v51 = v48[1];
  v48[1] = v50;
  swift_bridgeObjectRetain(v50);
  swift_bridgeObjectRelease(v51);
  v52 = a3[21];
  v53 = a1 + v52;
  v54 = (__int128 *)(a2 + v52);
  v55 = *(_QWORD *)(a1 + v52 + 16);
  v56 = *(_QWORD *)(a2 + v52 + 16);
  if (v55 == 1)
  {
    if (v56 == 1)
    {
      v57 = *v54;
      *(_QWORD *)(v53 + 16) = *((_QWORD *)v54 + 2);
      *(_OWORD *)v53 = v57;
    }
    else
    {
      *(_DWORD *)v53 = *(_DWORD *)v54;
      *(_BYTE *)(v53 + 4) = *((_BYTE *)v54 + 4);
      *(_BYTE *)(v53 + 5) = *((_BYTE *)v54 + 5);
      *(_BYTE *)(v53 + 6) = *((_BYTE *)v54 + 6);
      *(_QWORD *)(v53 + 8) = *((_QWORD *)v54 + 1);
      v59 = *((_QWORD *)v54 + 2);
      *(_QWORD *)(v53 + 16) = v59;
      swift_bridgeObjectRetain(v59);
    }
  }
  else if (v56 == 1)
  {
    sub_10000C21C(v53);
    v58 = *((_QWORD *)v54 + 2);
    *(_OWORD *)v53 = *v54;
    *(_QWORD *)(v53 + 16) = v58;
  }
  else
  {
    *(_DWORD *)v53 = *(_DWORD *)v54;
    *(_BYTE *)(v53 + 4) = *((_BYTE *)v54 + 4);
    *(_BYTE *)(v53 + 5) = *((_BYTE *)v54 + 5);
    *(_BYTE *)(v53 + 6) = *((_BYTE *)v54 + 6);
    *(_QWORD *)(v53 + 8) = *((_QWORD *)v54 + 1);
    v60 = *((_QWORD *)v54 + 2);
    *(_QWORD *)(v53 + 16) = v60;
    swift_bridgeObjectRetain(v60);
    swift_bridgeObjectRelease(v55);
  }
  v61 = a3[22];
  v62 = a1 + v61;
  v63 = (__int128 *)(a2 + v61);
  v64 = *(unsigned __int8 *)(a1 + v61 + 16);
  v65 = *(unsigned __int8 *)(a2 + v61 + 16);
  if (v64 == 255)
  {
    if (v65 == 255)
    {
      v67 = *v63;
      *(_BYTE *)(v62 + 16) = *((_BYTE *)v63 + 16);
      *(_OWORD *)v62 = v67;
    }
    else
    {
      v74 = v65 & 1;
      v75 = *(void **)v63;
      v76 = (void *)*((_QWORD *)v63 + 1);
      sub_100007A18(v75, v76, v65 & 1);
      *(_QWORD *)v62 = v75;
      *(_QWORD *)(v62 + 8) = v76;
      *(_BYTE *)(v62 + 16) = v74;
    }
  }
  else if (v65 == 255)
  {
    sub_10000C250(v62);
    v66 = *((_BYTE *)v63 + 16);
    *(_OWORD *)v62 = *v63;
    *(_BYTE *)(v62 + 16) = v66;
  }
  else
  {
    v68 = v65 & 1;
    v69 = *(void **)v63;
    v70 = (void *)*((_QWORD *)v63 + 1);
    sub_100007A18(v69, v70, v65 & 1);
    v71 = *(void **)v62;
    v72 = *(void **)(v62 + 8);
    v73 = *(_BYTE *)(v62 + 16);
    *(_QWORD *)v62 = v69;
    *(_QWORD *)(v62 + 8) = v70;
    *(_BYTE *)(v62 + 16) = v68;
    sub_100007A50(v71, v72, v73);
  }
  *(_BYTE *)(a1 + a3[23]) = *(_BYTE *)(a2 + a3[23]);
  *(_BYTE *)(a1 + a3[24]) = *(_BYTE *)(a2 + a3[24]);
  *(_QWORD *)(a1 + a3[25]) = *(_QWORD *)(a2 + a3[25]);
  v77 = a3[26];
  v78 = a1 + v77;
  v79 = (__int128 *)(a2 + v77);
  v80 = *(unsigned __int8 *)(a1 + v77 + 16);
  v81 = *(unsigned __int8 *)(a2 + v77 + 16);
  if (v80 == 255)
  {
    if (v81 == 255)
    {
      v83 = *v79;
      *(_BYTE *)(v78 + 16) = *((_BYTE *)v79 + 16);
      *(_OWORD *)v78 = v83;
    }
    else
    {
      v90 = v81 & 1;
      v91 = *(void **)v79;
      v92 = (void *)*((_QWORD *)v79 + 1);
      sub_100007A18(v91, v92, v81 & 1);
      *(_QWORD *)v78 = v91;
      *(_QWORD *)(v78 + 8) = v92;
      *(_BYTE *)(v78 + 16) = v90;
    }
  }
  else if (v81 == 255)
  {
    sub_10000C250(v78);
    v82 = *((_BYTE *)v79 + 16);
    *(_OWORD *)v78 = *v79;
    *(_BYTE *)(v78 + 16) = v82;
  }
  else
  {
    v84 = v81 & 1;
    v85 = *(void **)v79;
    v86 = (void *)*((_QWORD *)v79 + 1);
    sub_100007A18(v85, v86, v81 & 1);
    v87 = *(void **)v78;
    v88 = *(void **)(v78 + 8);
    v89 = *(_BYTE *)(v78 + 16);
    *(_QWORD *)v78 = v85;
    *(_QWORD *)(v78 + 8) = v86;
    *(_BYTE *)(v78 + 16) = v84;
    sub_100007A50(v87, v88, v89);
  }
  *(_BYTE *)(a1 + a3[27]) = *(_BYTE *)(a2 + a3[27]);
  *(_BYTE *)(a1 + a3[28]) = *(_BYTE *)(a2 + a3[28]);
  v93 = a3[29];
  v94 = (_QWORD *)(a1 + v93);
  v95 = (_QWORD *)(a2 + v93);
  *v94 = *v95;
  v96 = v95[1];
  v97 = v94[1];
  v94[1] = v96;
  swift_bridgeObjectRetain(v96);
  swift_bridgeObjectRelease(v97);
  v98 = a3[30];
  v99 = (_QWORD *)(a1 + v98);
  v100 = (_QWORD *)(a2 + v98);
  *v99 = *v100;
  v101 = v100[1];
  v102 = v99[1];
  v99[1] = v101;
  swift_bridgeObjectRetain(v101);
  swift_bridgeObjectRelease(v102);
  return a1;
}

uint64_t sub_10000C21C(uint64_t a1)
{
  destroy for BatteryInfo(a1);
  return a1;
}

uint64_t sub_10000C250(uint64_t a1)
{
  destroy for ColorSchemeImageSet(a1);
  return a1;
}

uint64_t sub_10000C284(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_WORD *)(a1 + 36) = *(_WORD *)(a2 + 36);
  v7 = a3[12];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_1000075DC(&qword_10001D5E0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[14];
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  *(_BYTE *)(a1 + v13) = *(_BYTE *)(a2 + v13);
  v14 = a3[16];
  *(_OWORD *)(a1 + a3[15]) = *(_OWORD *)(a2 + a3[15]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  v15 = a3[18];
  *(_OWORD *)(a1 + a3[17]) = *(_OWORD *)(a2 + a3[17]);
  v16 = a1 + v15;
  v17 = a2 + v15;
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  v18 = a3[19];
  v19 = a3[20];
  v20 = a1 + v18;
  v21 = a2 + v18;
  *(_BYTE *)(v20 + 16) = *(_BYTE *)(v21 + 16);
  *(_OWORD *)v20 = *(_OWORD *)v21;
  *(_OWORD *)(a1 + v19) = *(_OWORD *)(a2 + v19);
  v22 = a3[21];
  v23 = a3[22];
  v24 = a1 + v22;
  v25 = a2 + v22;
  *(_OWORD *)v24 = *(_OWORD *)v25;
  *(_QWORD *)(v24 + 16) = *(_QWORD *)(v25 + 16);
  v26 = a1 + v23;
  v27 = a2 + v23;
  *(_OWORD *)v26 = *(_OWORD *)v27;
  *(_BYTE *)(v26 + 16) = *(_BYTE *)(v27 + 16);
  v28 = a3[24];
  *(_BYTE *)(a1 + a3[23]) = *(_BYTE *)(a2 + a3[23]);
  *(_BYTE *)(a1 + v28) = *(_BYTE *)(a2 + v28);
  v29 = a3[26];
  *(_QWORD *)(a1 + a3[25]) = *(_QWORD *)(a2 + a3[25]);
  v30 = a1 + v29;
  v31 = a2 + v29;
  *(_OWORD *)v30 = *(_OWORD *)v31;
  *(_BYTE *)(v30 + 16) = *(_BYTE *)(v31 + 16);
  v32 = a3[28];
  *(_BYTE *)(a1 + a3[27]) = *(_BYTE *)(a2 + a3[27]);
  *(_BYTE *)(a1 + v32) = *(_BYTE *)(a2 + v32);
  v33 = a3[30];
  *(_OWORD *)(a1 + a3[29]) = *(_OWORD *)(a2 + a3[29]);
  *(_OWORD *)(a1 + v33) = *(_OWORD *)(a2 + v33);
  return a1;
}

uint64_t sub_10000C464(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(void *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
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
  _QWORD *v50;
  uint64_t *v51;
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
  int v63;
  int v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  int v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v6 = *(_QWORD *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v8;
  swift_bridgeObjectRelease(v9);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_BYTE *)(a1 + 33) = *(_BYTE *)(a2 + 33);
  *(_BYTE *)(a1 + 34) = *(_BYTE *)(a2 + 34);
  *(_BYTE *)(a1 + 35) = *(_BYTE *)(a2 + 35);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_BYTE *)(a1 + 37) = *(_BYTE *)(a2 + 37);
  v10 = a3[12];
  v11 = (void *)(a1 + v10);
  v12 = (void *)(a2 + v10);
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    v18 = sub_1000075DC(&qword_10001D5E0);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 40))(v11, v12, v13);
LABEL_7:
  v19 = a3[13];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (uint64_t *)(a2 + v19);
  v23 = *v21;
  v22 = v21[1];
  v24 = v20[1];
  *v20 = v23;
  v20[1] = v22;
  swift_bridgeObjectRelease(v24);
  v25 = a3[15];
  *(_BYTE *)(a1 + a3[14]) = *(_BYTE *)(a2 + a3[14]);
  v26 = (_QWORD *)(a1 + v25);
  v27 = (uint64_t *)(a2 + v25);
  v29 = *v27;
  v28 = v27[1];
  v30 = v26[1];
  *v26 = v29;
  v26[1] = v28;
  swift_bridgeObjectRelease(v30);
  v31 = a3[16];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (uint64_t *)(a2 + v31);
  v35 = *v33;
  v34 = v33[1];
  v36 = v32[1];
  *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease(v36);
  v37 = a3[17];
  v38 = (_QWORD *)(a1 + v37);
  v39 = (uint64_t *)(a2 + v37);
  v41 = *v39;
  v40 = v39[1];
  v42 = v38[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease(v42);
  v43 = a3[18];
  v44 = a3[19];
  v45 = a1 + v43;
  v46 = a2 + v43;
  *(_QWORD *)v45 = *(_QWORD *)v46;
  *(_BYTE *)(v45 + 8) = *(_BYTE *)(v46 + 8);
  v47 = a1 + v44;
  v48 = a2 + v44;
  *(_OWORD *)v47 = *(_OWORD *)v48;
  *(_BYTE *)(v47 + 16) = *(_BYTE *)(v48 + 16);
  v49 = a3[20];
  v50 = (_QWORD *)(a1 + v49);
  v51 = (uint64_t *)(a2 + v49);
  v53 = *v51;
  v52 = v51[1];
  v54 = v50[1];
  *v50 = v53;
  v50[1] = v52;
  swift_bridgeObjectRelease(v54);
  v55 = a3[21];
  v56 = a1 + v55;
  v57 = a2 + v55;
  v58 = *(_QWORD *)(a1 + v55 + 16);
  if (v58 == 1)
  {
LABEL_10:
    *(_OWORD *)v56 = *(_OWORD *)v57;
    *(_QWORD *)(v56 + 16) = *(_QWORD *)(v57 + 16);
    goto LABEL_12;
  }
  v59 = *(_QWORD *)(v57 + 16);
  if (v59 == 1)
  {
    sub_10000C21C(v56);
    goto LABEL_10;
  }
  *(_DWORD *)v56 = *(_DWORD *)v57;
  *(_BYTE *)(v56 + 4) = *(_BYTE *)(v57 + 4);
  *(_BYTE *)(v56 + 5) = *(_BYTE *)(v57 + 5);
  *(_BYTE *)(v56 + 6) = *(_BYTE *)(v57 + 6);
  *(_QWORD *)(v56 + 8) = *(_QWORD *)(v57 + 8);
  *(_QWORD *)(v56 + 16) = v59;
  swift_bridgeObjectRelease(v58);
LABEL_12:
  v60 = a3[22];
  v61 = a1 + v60;
  v62 = a2 + v60;
  v63 = *(unsigned __int8 *)(a1 + v60 + 16);
  if (v63 == 255)
  {
LABEL_15:
    *(_OWORD *)v61 = *(_OWORD *)v62;
    *(_BYTE *)(v61 + 16) = *(_BYTE *)(v62 + 16);
    goto LABEL_17;
  }
  v64 = *(unsigned __int8 *)(v62 + 16);
  if (v64 == 255)
  {
    sub_10000C250(v61);
    goto LABEL_15;
  }
  v65 = *(void **)v61;
  v66 = *(void **)(v61 + 8);
  *(_OWORD *)v61 = *(_OWORD *)v62;
  *(_BYTE *)(v61 + 16) = v64 & 1;
  sub_100007A50(v65, v66, v63 & 1);
LABEL_17:
  v67 = a3[24];
  *(_BYTE *)(a1 + a3[23]) = *(_BYTE *)(a2 + a3[23]);
  *(_BYTE *)(a1 + v67) = *(_BYTE *)(a2 + v67);
  v68 = a3[26];
  *(_QWORD *)(a1 + a3[25]) = *(_QWORD *)(a2 + a3[25]);
  v69 = a1 + v68;
  v70 = a2 + v68;
  v71 = *(unsigned __int8 *)(a1 + v68 + 16);
  if (v71 != 255)
  {
    v72 = *(unsigned __int8 *)(v70 + 16);
    if (v72 != 255)
    {
      v73 = *(void **)v69;
      v74 = *(void **)(v69 + 8);
      *(_OWORD *)v69 = *(_OWORD *)v70;
      *(_BYTE *)(v69 + 16) = v72 & 1;
      sub_100007A50(v73, v74, v71 & 1);
      goto LABEL_22;
    }
    sub_10000C250(v69);
  }
  *(_OWORD *)v69 = *(_OWORD *)v70;
  *(_BYTE *)(v69 + 16) = *(_BYTE *)(v70 + 16);
LABEL_22:
  v75 = a3[28];
  *(_BYTE *)(a1 + a3[27]) = *(_BYTE *)(a2 + a3[27]);
  *(_BYTE *)(a1 + v75) = *(_BYTE *)(a2 + v75);
  v76 = a3[29];
  v77 = (_QWORD *)(a1 + v76);
  v78 = (uint64_t *)(a2 + v76);
  v80 = *v78;
  v79 = v78[1];
  v81 = v77[1];
  *v77 = v80;
  v77[1] = v79;
  swift_bridgeObjectRelease(v81);
  v82 = a3[30];
  v83 = (_QWORD *)(a1 + v82);
  v84 = (uint64_t *)(a2 + v82);
  v86 = *v84;
  v85 = v84[1];
  v87 = v83[1];
  *v83 = v86;
  v83[1] = v85;
  swift_bridgeObjectRelease(v87);
  return a1;
}

uint64_t sub_10000C818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000C824);
}

uint64_t sub_10000C824(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_1000075DC(&qword_10001D5E0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 48), a2, v8);
  }
}

uint64_t sub_10000C8A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000C8B0);
}

uint64_t sub_10000C8B0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_1000075DC(&qword_10001D5E0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 48), a2, a2, v7);
  }
  return result;
}

void sub_10000C928(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[27];

  v4[0] = &unk_100015498;
  v4[1] = &unk_100015498;
  v4[2] = &unk_1000154B0;
  v4[3] = &unk_1000154B0;
  v4[4] = &unk_1000154B0;
  v4[5] = &unk_1000154B0;
  v4[6] = &unk_1000154B0;
  v4[7] = &unk_1000154B0;
  sub_10000CA10(319);
  if (v3 <= 0x3F)
  {
    v4[8] = *(_QWORD *)(v2 - 8) + 64;
    v4[9] = &unk_1000154C8;
    v4[10] = &unk_1000154B0;
    v4[11] = &unk_1000154C8;
    v4[12] = &unk_1000154C8;
    v4[13] = &unk_1000154C8;
    v4[14] = &unk_1000154E0;
    v4[15] = &unk_1000154F8;
    v4[16] = &unk_100015498;
    v4[17] = &unk_100015510;
    v4[18] = &unk_100015528;
    v4[19] = &unk_1000154B0;
    v4[20] = &unk_1000154B0;
    v4[21] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[22] = &unk_100015528;
    v4[23] = &unk_1000154B0;
    v4[24] = &unk_1000154B0;
    v4[25] = &unk_1000154C8;
    v4[26] = &unk_1000154C8;
    swift_initStructMetadata(a1, 256, 27, v4, a1 + 16);
  }
}

void sub_10000CA10(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10001D678)
  {
    v2 = type metadata accessor for Date(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10001D678);
  }
}

_QWORD *sub_10000CA64(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000CA88()
{
  unint64_t result;

  result = qword_10001D718;
  if (!qword_10001D718)
  {
    result = swift_getWitnessTable(&unk_1000156C4, &type metadata for ItemModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001D718);
  }
  return result;
}

uint64_t sub_10000CACC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000CAEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_bridgeObjectRelease(a3);
  return result;
}

uint64_t sub_10000CB00(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000075DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10000CB44()
{
  unint64_t result;

  result = qword_10001D728;
  if (!qword_10001D728)
  {
    result = swift_getWitnessTable(&unk_100015780, &type metadata for BatteryInfo);
    atomic_store(result, (unint64_t *)&qword_10001D728);
  }
  return result;
}

unint64_t sub_10000CB88()
{
  unint64_t result;

  result = qword_10001D730;
  if (!qword_10001D730)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10001D730);
  }
  return result;
}

unint64_t sub_10000CBCC()
{
  unint64_t result;

  result = qword_10001D738;
  if (!qword_10001D738)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_10001D738);
  }
  return result;
}

uint64_t sub_10000CC10(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_10000CC54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D748;
  if (!qword_10001D748)
  {
    v1 = sub_1000077F4(&qword_10001D5E0);
    sub_100007838(&qword_10001D750, (uint64_t (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_10001D748);
  }
  return result;
}

unint64_t sub_10000CCD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D760;
  if (!qword_10001D760)
  {
    v1 = sub_1000077F4(&qword_10001D758);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_10001D760);
  }
  return result;
}

uint64_t sub_10000CD2C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_1000077F4(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000CD90()
{
  unint64_t result;

  result = qword_10001D778;
  if (!qword_10001D778)
  {
    result = swift_getWitnessTable(&unk_100015758, &type metadata for BatteryInfo);
    atomic_store(result, (unint64_t *)&qword_10001D778);
  }
  return result;
}

unint64_t sub_10000CDD4()
{
  unint64_t result;

  result = qword_10001D780;
  if (!qword_10001D780)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for CGFloat, &type metadata for CGFloat);
    atomic_store(result, (unint64_t *)&qword_10001D780);
  }
  return result;
}

unint64_t sub_10000CE18()
{
  unint64_t result;

  result = qword_10001D798;
  if (!qword_10001D798)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_10001D798);
  }
  return result;
}

uint64_t sub_10000CE5C(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_10000CC10(result, a2);
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for ItemModel.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ItemModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEA)
    goto LABEL_17;
  if (a2 + 22 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 22) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 22;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 22;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 22;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x17;
  v8 = v6 - 23;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ItemModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 22 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 22) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE9)
    return ((uint64_t (*)(void))((char *)&loc_10000CF58 + 4 * byte_10001545C[v4]))();
  *a1 = a2 + 22;
  return ((uint64_t (*)(void))((char *)sub_10000CF8C + 4 * byte_100015457[v4]))();
}

uint64_t sub_10000CF8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CF94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000CF9CLL);
  return result;
}

uint64_t sub_10000CFA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000CFB0);
  *(_BYTE *)result = a2 + 22;
  return result;
}

uint64_t sub_10000CFB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CFBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CFC8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000CFD0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ItemModel.CodingKeys()
{
  return &type metadata for ItemModel.CodingKeys;
}

unint64_t sub_10000CFEC()
{
  unint64_t result;

  result = qword_10001D7A0;
  if (!qword_10001D7A0)
  {
    result = swift_getWitnessTable(&unk_10001569C, &type metadata for ItemModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001D7A0);
  }
  return result;
}

unint64_t sub_10000D034()
{
  unint64_t result;

  result = qword_10001D7A8;
  if (!qword_10001D7A8)
  {
    result = swift_getWitnessTable(&unk_1000155D4, &type metadata for ItemModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001D7A8);
  }
  return result;
}

unint64_t sub_10000D07C()
{
  unint64_t result;

  result = qword_10001D7B0;
  if (!qword_10001D7B0)
  {
    result = swift_getWitnessTable(&unk_1000155FC, &type metadata for ItemModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001D7B0);
  }
  return result;
}

uint64_t sub_10000D0C0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = _findStringSwitchCaseWithCache(cases:string:cache:)(&off_1000189B0, a1, a2, &unk_10001D230);
  swift_bridgeObjectRelease(a2);
  if (v3 >= 0x17)
    return 23;
  else
    return v3;
}

uint64_t sub_10000D110(int a1, uint64_t a2, void *a3, float a4)
{
  void *v8;
  Swift::String v9;
  Swift::String v10;
  Swift::String v11;
  Swift::String v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  Swift::String v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  Swift::String v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];

  v8 = (void *)0xE000000000000000;
  v25[0] = 0;
  v25[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(90);
  v9._countAndFlagsBits = 0x4979726574746142;
  v9._object = (void *)0xEB000000006F666ELL;
  String.append(_:)(v9);
  if (a3)
    v8 = a3;
  else
    a2 = 0;
  swift_bridgeObjectRetain(a3);
  v10._countAndFlagsBits = a2;
  v10._object = v8;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v8);
  v11._countAndFlagsBits = 0x3D6C6576656C203ALL;
  v11._object = (void *)0xE800000000000000;
  String.append(_:)(v11);
  Float.write<A>(to:)(v25, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, a4);
  v12._countAndFlagsBits = 0x726168437369202CLL;
  v12._object = (void *)0xED00003D676E6967;
  String.append(_:)(v12);
  if ((a1 & 1) != 0)
    v13 = 1702195828;
  else
    v13 = 0x65736C6166;
  if ((a1 & 1) != 0)
    v14 = 0xE400000000000000;
  else
    v14 = 0xE500000000000000;
  v15 = v14;
  String.append(_:)(*(Swift::String *)&v13);
  swift_bridgeObjectRelease(v14);
  v16._object = (void *)0x8000000100014B10;
  v16._countAndFlagsBits = 0xD000000000000014;
  String.append(_:)(v16);
  if ((a1 & 0x100) != 0)
    v17 = 1702195828;
  else
    v17 = 0x65736C6166;
  if ((a1 & 0x100) != 0)
    v18 = 0xE400000000000000;
  else
    v18 = 0xE500000000000000;
  v19 = v18;
  String.append(_:)(*(Swift::String *)&v17);
  swift_bridgeObjectRelease(v18);
  v20._countAndFlagsBits = 0xD00000000000001CLL;
  v20._object = (void *)0x8000000100014B30;
  String.append(_:)(v20);
  if ((a1 & 0x10000) != 0)
    v21 = 1702195828;
  else
    v21 = 0x65736C6166;
  if ((a1 & 0x10000) != 0)
    v22 = 0xE400000000000000;
  else
    v22 = 0xE500000000000000;
  v23 = v22;
  String.append(_:)(*(Swift::String *)&v21);
  swift_bridgeObjectRelease(v22);
  return v25[0];
}

uint64_t sub_10000D2F0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10000D320 + 4 * byte_100015720[a1]))(0x6C6576656CLL, 0xE500000000000000);
}

uint64_t sub_10000D320()
{
  return 0x6967726168437369;
}

unint64_t sub_10000D33C()
{
  return 0xD000000000000011;
}

unint64_t sub_10000D358()
{
  return 0xD000000000000019;
}

uint64_t sub_10000D390(_QWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4, float a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v19 = a4;
  v10 = sub_1000075DC(&qword_10001D7D8);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v15 = a1[4];
  sub_10000CA64(a1, v14);
  v16 = sub_10000DED4();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for BatteryInfo.CodingKeys, &type metadata for BatteryInfo.CodingKeys, v16, v14, v15);
  v24 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(&v24, v10, a5);
  if (!v5)
  {
    v17 = v19;
    v23 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(a2 & 1, &v23, v10);
    v22 = 2;
    KeyedEncodingContainer.encode(_:forKey:)((a2 >> 8) & 1, &v22, v10);
    v21 = 3;
    KeyedEncodingContainer.encode(_:forKey:)(HIWORD(a2) & 1, &v21, v10);
    v20 = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(a3, v17, &v20, v10);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

BOOL sub_10000D540(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000D554()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000D598()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000D5C0(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000D600()
{
  unsigned __int8 *v0;

  return sub_10000D2F0(*v0);
}

uint64_t sub_10000D608@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000DACC(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000D62C(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10000D638(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DED4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000D660(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000DED4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000D688()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;

  if (*(_BYTE *)(v0 + 5))
    v1 = 256;
  else
    v1 = 0;
  v2 = v1 | *(unsigned __int8 *)(v0 + 4);
  if (*(_BYTE *)(v0 + 6))
    v3 = 0x10000;
  else
    v3 = 0;
  return sub_10000D110(v2 | v3, *(_QWORD *)(v0 + 8), *(void **)(v0 + 16), *(float *)v0);
}

void sub_10000D6C0(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t v6;
  float v7;

  v7 = sub_10000DCD4(a1);
  if (!v2)
  {
    *(float *)a2 = v7;
    *(_BYTE *)(a2 + 4) = v4 & 1;
    *(_BYTE *)(a2 + 5) = BYTE1(v4) & 1;
    *(_BYTE *)(a2 + 6) = BYTE2(v4) & 1;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
  }
}

uint64_t sub_10000D704(_QWORD *a1)
{
  uint64_t v1;
  int v2;
  int v3;
  int v4;

  if (*(_BYTE *)(v1 + 5))
    v2 = 256;
  else
    v2 = 0;
  v3 = v2 | *(unsigned __int8 *)(v1 + 4);
  if (*(_BYTE *)(v1 + 6))
    v4 = 0x10000;
  else
    v4 = 0;
  return sub_10000D390(a1, v3 | v4, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(float *)v1);
}

uint64_t sub_10000D74C(unsigned __int8 a1, char a2, char a3, float a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  Swift::String v16;
  unint64_t v17;
  int v18;
  int v19;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  float v27;
  unsigned __int8 v28;
  char v29;
  char v30;
  unint64_t v31;
  unint64_t v32;

  v31 = 0;
  v32 = 0;
  v27 = a4;
  v28 = a1;
  v29 = a2;
  v30 = a3;
  v4 = sub_1000075DC(&qword_10001D7B8);
  v5 = sub_10000D8AC();
  v6 = _Pointer.debugDescription.getter(v4, v5);
  v8 = v7;
  v9 = sub_100011480(9uLL, v6, v7);
  v11 = v10;
  v25 = 7876668;
  v26 = 0xE300000000000000;
  v21 = v9;
  v22 = v12;
  v23 = v13;
  v24 = v10;
  v14 = sub_1000079D0();
  String.append<A>(contentsOf:)(&v21, &type metadata for Substring, v14);
  swift_bridgeObjectRelease(v11);
  v15 = v26;
  v21 = v25;
  v22 = v26;
  swift_bridgeObjectRetain(v26);
  v16._countAndFlagsBits = 15987;
  v16._object = (void *)0xE200000000000000;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v15);
  v17 = v32;
  v31 = v21;
  v32 = v22;
  swift_bridgeObjectRelease(v17);
  if (v29)
    v18 = 256;
  else
    v18 = 0;
  if (v30)
    v19 = 0x10000;
  else
    v19 = 0;
  return v18 | v28 | v19;
}

unint64_t sub_10000D8AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D7C0;
  if (!qword_10001D7C0)
  {
    v1 = sub_1000077F4(&qword_10001D7B8);
    result = swift_getWitnessTable(&protocol conformance descriptor for UnsafePointer<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10001D7C0);
  }
  return result;
}

uint64_t destroy for BatteryInfo(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 16));
}

uint64_t _s24FindMyWidgetIntentsItems11BatteryInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_WORD *)(a1 + 5) = *(_WORD *)(a2 + 5);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for BatteryInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_BYTE *)(a1 + 5) = *(_BYTE *)(a2 + 5);
  *(_BYTE *)(a1 + 6) = *(_BYTE *)(a2 + 6);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for BatteryInfo(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BatteryInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(_BYTE *)(a1 + 5) = *(_BYTE *)(a2 + 5);
  *(_BYTE *)(a1 + 6) = *(_BYTE *)(a2 + 6);
  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BatteryInfo(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BatteryInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for BatteryInfo()
{
  return &type metadata for BatteryInfo;
}

uint64_t sub_10000DACC(uint64_t a1, unint64_t a2)
{
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;

  if (a1 == 0x6C6576656CLL && a2 == 0xE500000000000000)
  {
    v5 = 0xE500000000000000;
    goto LABEL_8;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6C6576656CLL, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0;
  }
  if (a1 == 0x6967726168437369 && a2 == 0xEA0000000000676ELL)
  {
    v7 = 0xEA0000000000676ELL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6967726168437369, 0xEA0000000000676ELL, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_14;
  }
  if (a1 == 0xD000000000000011)
  {
    v8 = 0x8000000100014B50;
    if (a2 == 0x8000000100014B50)
      goto LABEL_19;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011, 0x8000000100014B50, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
LABEL_19:
    swift_bridgeObjectRelease(v8);
    return 2;
  }
  if (a1 == 0xD000000000000019 && a2 == 0x8000000100014B70)
  {
    v9 = 0x8000000100014B70;
LABEL_25:
    swift_bridgeObjectRelease(v9);
    return 3;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000019, 0x8000000100014B70, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
    goto LABEL_25;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x8000000100014B90)
  {
    swift_bridgeObjectRelease(0x8000000100014B90);
    return 4;
  }
  else
  {
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012, 0x8000000100014B90, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v10 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

float sub_10000DCD4(_QWORD *a1)
{
  uint64_t v1;
  float v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  float v11;
  _DWORD v13[2];
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;

  v4 = sub_1000075DC(&qword_10001D7C8);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_10000CA64(a1, v8);
  v10 = sub_10000DED4();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for BatteryInfo.CodingKeys, &type metadata for BatteryInfo.CodingKeys, v10, v8, v9);
  if (!v1)
  {
    v18 = 0;
    KeyedDecodingContainer.decode(_:forKey:)(&v18, v4);
    v2 = v11;
    v17 = 1;
    KeyedDecodingContainer.decode(_:forKey:)(&v17, v4);
    v16 = 2;
    KeyedDecodingContainer.decode(_:forKey:)(&v16, v4);
    v15 = 3;
    v13[1] = KeyedDecodingContainer.decode(_:forKey:)(&v15, v4);
    v14 = 4;
    KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v14, v4);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  sub_10000CACC(a1);
  return v2;
}

unint64_t sub_10000DED4()
{
  unint64_t result;

  result = qword_10001D7D0;
  if (!qword_10001D7D0)
  {
    result = swift_getWitnessTable(&unk_100015894, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001D7D0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for BatteryInfo.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for BatteryInfo.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000DFF4 + 4 * byte_10001572A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000E028 + 4 * byte_100015725[v4]))();
}

uint64_t sub_10000E028(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E030(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000E038);
  return result;
}

uint64_t sub_10000E044(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000E04CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10000E050(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E058(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BatteryInfo.CodingKeys()
{
  return &type metadata for BatteryInfo.CodingKeys;
}

unint64_t sub_10000E078()
{
  unint64_t result;

  result = qword_10001D7E0;
  if (!qword_10001D7E0)
  {
    result = swift_getWitnessTable(&unk_10001586C, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001D7E0);
  }
  return result;
}

unint64_t sub_10000E0C0()
{
  unint64_t result;

  result = qword_10001D7E8;
  if (!qword_10001D7E8)
  {
    result = swift_getWitnessTable(&unk_1000157DC, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001D7E8);
  }
  return result;
}

unint64_t sub_10000E108()
{
  unint64_t result;

  result = qword_10001D7F0;
  if (!qword_10001D7F0)
  {
    result = swift_getWitnessTable(&unk_100015804, &type metadata for BatteryInfo.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10001D7F0);
  }
  return result;
}

Swift::String __swiftcall String.deletingPrefix(_:)(Swift::String a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void *object;
  uint64_t countAndFlagsBits;
  Swift::Bool v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  Swift::String result;

  v3 = v2;
  v4 = v1;
  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v7 = String.hasPrefix(_:)(a1);
  swift_bridgeObjectRetain(v3);
  if (v7)
  {
    v8 = String.count.getter(countAndFlagsBits, object);
    v9 = sub_10000EDCC(v8, v4, v3);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    swift_bridgeObjectRelease(v3);
    v4 = static String._fromSubstring(_:)(v9, v11, v13, v15);
    v3 = v16;
    swift_bridgeObjectRelease(v15);
  }
  v17 = v4;
  v18 = (void *)v3;
  result._object = v18;
  result._countAndFlagsBits = v17;
  return result;
}

uint64_t String.nonBreaking.getter(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  _QWORD v4[2];
  _QWORD v5[4];

  v5[2] = a1;
  v5[3] = a2;
  v5[0] = 32;
  v5[1] = 0xE100000000000000;
  v4[0] = 41154;
  v4[1] = 0xA200000000000000;
  v2 = sub_100007878();
  return ((uint64_t (*)(_QWORD *, _QWORD *, _QWORD, _QWORD, _QWORD, uint64_t, void *, void *, void *, unint64_t, unint64_t, unint64_t))StringProtocol.replacingOccurrences<A, B>(of:with:options:range:))(v5, v4, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v2, v2, v2);
}

void *sub_10000E268(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  void *result;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;

  v2 = type metadata accessor for Calendar.Component(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v30 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    sub_1000075DC(&qword_10001D800);
    v10 = static _SetStorage.allocate(capacity:)(v9);
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v31 = v9;
    v32 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v35 = v10 + 56;
    while (1)
    {
      v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      v14 = *(_QWORD *)(v10 + 40);
      v15 = sub_10000EE68(&qword_10001D808, (uint64_t)&protocol conformance descriptor for Calendar.Component);
      v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      v17 = ~(-1 << *(_BYTE *)(v10 + 32));
      v18 = v16 & v17;
      v19 = (v16 & (unint64_t)v17) >> 6;
      v20 = *(_QWORD *)(v35 + 8 * v19);
      v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(_QWORD *)(v10 + 48) + v18 * v13, v2);
          v22 = sub_10000EE68(&qword_10001D810, (uint64_t)&protocol conformance descriptor for Calendar.Component);
          v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          v24 = v3;
          v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            v3 = v24;
            v9 = v31;
            goto LABEL_4;
          }
          v18 = (v18 + 1) & v17;
          v19 = v18 >> 6;
          v20 = *(_QWORD *)(v35 + 8 * (v18 >> 6));
          v21 = 1 << v18;
          v3 = v24;
        }
        while ((v20 & (1 << v18)) != 0);
        v9 = v31;
      }
      *(_QWORD *)(v35 + 8 * v19) = v21 | v20;
      result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v18 * v13, v8, v2);
      v27 = *(_QWORD *)(v10 + 16);
      v28 = __OFADD__(v27, 1);
      v29 = v27 + 1;
      if (v28)
        break;
      *(_QWORD *)(v10 + 16) = v29;
LABEL_4:
      v11 = v33 + 1;
      if (v33 + 1 == v9)
        return (void *)v10;
    }
    __break(1u);
  }
  else
  {
    return &_swiftEmptySetSingleton;
  }
  return result;
}

uint64_t sub_10000E4C0(void *a1)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  id v27;
  uint64_t (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(void);
  char *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char v52;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  char *v58;
  id v59;
  char *v60;
  Class isa;
  id v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  NSString v74;
  void *v75;
  id v76;
  NSDate v77;
  id v78;
  id v79;
  NSString v80;
  void *v81;
  id v82;
  NSString v83;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  id v94;
  Class v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  Swift::String v101;
  Swift::String v102;
  Swift::String v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v108;
  uint64_t v109;
  uint64_t (*v110)(char *, _QWORD, uint64_t);
  char *v111;
  uint64_t v112;
  char *v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  char *v122;
  char *v123;
  Swift::String v124;

  v2 = type metadata accessor for Calendar.Component(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v111 = (char *)&v108 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DateComponents(0);
  v115 = *(_QWORD *)(v5 - 8);
  v116 = v5;
  __chkstk_darwin(v5);
  v123 = (char *)&v108 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Calendar(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = type metadata accessor for Date(0);
  v117 = *(_QWORD *)(v121 - 8);
  v11 = __chkstk_darwin(v121);
  v113 = (char *)&v108 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v11);
  v118 = (char *)&v108 - v14;
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v108 - v16;
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v108 - v19;
  v21 = __chkstk_darwin(v18);
  v23 = (char *)&v108 - v22;
  v24 = __chkstk_darwin(v21);
  v26 = (char *)&v108 - v25;
  Date.init()(v24);
  v27 = objc_msgSend(a1, "timestamp");
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  ((void (*)(void))static Calendar.current.getter)();
  Calendar.startOfDay(for:)(v23);
  v28 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
  v29 = v28(v10, v7);
  static Calendar.current.getter(v29);
  v119 = v26;
  Calendar.startOfDay(for:)(v26);
  v30 = v28(v10, v7);
  static Calendar.current.getter(v30);
  v31 = sub_1000075DC(&qword_10001D7F8);
  v32 = *(unsigned __int8 *)(v3 + 80);
  v33 = (v32 + 32) & ~v32;
  v34 = swift_allocObject(v31, v33 + *(_QWORD *)(v3 + 72), v32 | 7);
  *(_OWORD *)(v34 + 16) = xmmword_1000158F0;
  v35 = v34 + v33;
  v112 = v3;
  v110 = *(uint64_t (**)(char *, _QWORD, uint64_t))(v3 + 104);
  v110((char *)v35, enum case for Calendar.Component.day(_:), v2);
  v36 = sub_10000E268(v34);
  swift_setDeallocating(v34);
  v37 = v35;
  v38 = v2;
  v39 = v2;
  v40 = v117;
  swift_arrayDestroy(v37, 1, v39);
  swift_deallocClassInstance(v34, 32, 7);
  v120 = v20;
  v114 = v17;
  Calendar.dateComponents(_:from:to:)(v36, v20, v17);
  v41 = v36;
  v42 = v121;
  swift_bridgeObjectRelease(v41);
  v43 = v28(v10, v7);
  static Calendar.current.getter(v43);
  LOBYTE(v34) = Calendar.isDateInToday(_:)(v23);
  v28(v10, v7);
  v44 = *(uint64_t (**)(void))(v40 + 16);
  v45 = v118;
  v122 = v23;
  v46 = v44();
  if ((v34 & 1) != 0)
  {
    v47 = *(void (**)(char *, uint64_t))(v40 + 8);
    v47(v45, v42);
    v49 = v115;
    v48 = v116;
    v50 = v114;
LABEL_5:
    v54 = (void *)qword_10001E4B0;
    if (qword_10001E4B0)
    {
      v55 = (id)qword_10001E4B0;
    }
    else
    {
      v56 = objc_msgSend(objc_allocWithZone((Class)FMRelativeDateFormatter), "init");
      objc_msgSend(v56, "setFormattingContext:", 2);
      v57 = (void *)qword_10001E4B0;
      qword_10001E4B0 = (uint64_t)v56;
      v55 = v56;

      v54 = 0;
    }
    v58 = v123;
    v59 = v54;
    v60 = v122;
    isa = Date._bridgeToObjectiveC()().super.isa;
    v62 = objc_msgSend(v55, "stringFromDate:", isa);

    v63 = static String._unconditionallyBridgeFromObjectiveC(_:)(v62);
    goto LABEL_27;
  }
  v51 = v113;
  v109 = v38;
  static Calendar.current.getter(v46);
  v52 = Calendar.isDateInYesterday(_:)(v45);
  v28(v10, v7);
  v118 = *(char **)(v40 + 8);
  v53 = ((uint64_t (*)(char *, uint64_t))v118)(v45, v42);
  if ((v52 & 1) != 0)
  {
    v49 = v115;
    v48 = v116;
    v50 = v114;
    v47 = (void (*)(char *, uint64_t))v118;
    goto LABEL_5;
  }
  v58 = v123;
  v64 = DateComponents.day.getter(v53);
  if ((v65 & 1) != 0 || v64 <= 7)
  {
    v72 = (void *)qword_10001E4B8;
    if (qword_10001E4B8)
    {
      v71 = (id)qword_10001E4B8;
    }
    else
    {
      v73 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
      v74 = String._bridgeToObjectiveC()();
      objc_msgSend(v73, "setLocalizedDateFormatFromTemplate:", v74);

      v75 = (void *)qword_10001E4B8;
      qword_10001E4B8 = (uint64_t)v73;
      v71 = v73;

      v72 = 0;
    }
    v47 = (void (*)(char *, uint64_t))v118;
    v76 = v72;
    v77.super.isa = Date._bridgeToObjectiveC()().super.isa;
    v78 = objc_msgSend(v71, "stringFromDate:", v77.super.isa);
  }
  else
  {
    Date.init()(v64);
    v66 = v111;
    v67 = v109;
    v68 = v110(v111, enum case for Calendar.Component.year(_:), v109);
    static Calendar.current.getter(v68);
    v69 = Calendar.isDate(_:equalTo:toGranularity:)(v122, v51, v66);
    v28(v10, v7);
    (*(void (**)(char *, uint64_t))(v112 + 8))(v66, v67);
    v47 = (void (*)(char *, uint64_t))v118;
    ((void (*)(char *, uint64_t))v118)(v51, v42);
    if ((v69 & 1) != 0)
    {
      v70 = (void *)qword_10001E4C8;
      if (qword_10001E4C8)
      {
        v71 = (id)qword_10001E4C8;
      }
      else
      {
        v79 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
        v80 = String._bridgeToObjectiveC()();
        objc_msgSend(v79, "setLocalizedDateFormatFromTemplate:", v80);

        v81 = (void *)qword_10001E4C8;
        qword_10001E4C8 = (uint64_t)v79;
        v71 = v79;

        v70 = 0;
      }
    }
    else
    {
      v70 = (void *)qword_10001E4D0;
      if (qword_10001E4D0)
      {
        v71 = (id)qword_10001E4D0;
      }
      else
      {
        v82 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
        v83 = String._bridgeToObjectiveC()();
        objc_msgSend(v82, "setLocalizedDateFormatFromTemplate:", v83);

        v84 = (void *)qword_10001E4D0;
        qword_10001E4D0 = (uint64_t)v82;
        v71 = v82;

        v70 = 0;
      }
    }
    v58 = v123;
    v85 = v70;
    v77.super.isa = Date._bridgeToObjectiveC()().super.isa;
    v78 = objc_msgSend(v71, "stringFromDate:", v77.super.isa);
  }
  v86 = v78;

  v87 = static String._unconditionallyBridgeFromObjectiveC(_:)(v86);
  v89 = v88;

  v90 = (void *)qword_10001E4C0;
  if (qword_10001E4C0)
  {
    v91 = (id)qword_10001E4C0;
  }
  else
  {
    v92 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
    objc_msgSend(v92, "setTimeStyle:", 1);
    v93 = (void *)qword_10001E4C0;
    qword_10001E4C0 = (uint64_t)v92;
    v91 = v92;

    v90 = 0;
  }
  v94 = v90;
  v95 = Date._bridgeToObjectiveC()().super.isa;
  v96 = objc_msgSend(v91, "stringFromDate:", v95);

  v97 = static String._unconditionallyBridgeFromObjectiveC(_:)(v96);
  v99 = v98;

  v100 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v101._object = (void *)0x8000000100014BB0;
  v124._object = (void *)0x8000000100014BB0;
  v101._countAndFlagsBits = 0xD000000000000011;
  v102._countAndFlagsBits = 0;
  v102._object = (void *)0xE000000000000000;
  v124._countAndFlagsBits = 0xD000000000000011;
  v103 = NSLocalizedString(_:tableName:bundle:value:comment:)(v101, (Swift::String_optional)0, (NSBundle)v100, v102, v124);

  v104 = sub_1000075DC(&qword_10001D600);
  v105 = swift_allocObject(v104, 112, 7);
  *(_OWORD *)(v105 + 16) = xmmword_100015430;
  *(_QWORD *)(v105 + 56) = &type metadata for String;
  v106 = sub_10000B504();
  *(_QWORD *)(v105 + 32) = v87;
  *(_QWORD *)(v105 + 40) = v89;
  *(_QWORD *)(v105 + 96) = &type metadata for String;
  *(_QWORD *)(v105 + 104) = v106;
  *(_QWORD *)(v105 + 64) = v106;
  *(_QWORD *)(v105 + 72) = v97;
  *(_QWORD *)(v105 + 80) = v99;
  v63 = String.init(format:_:)(v103._countAndFlagsBits, v103._object, v105);
  swift_bridgeObjectRelease(v103._object);
  v49 = v115;
  v48 = v116;
  v42 = v121;
  v60 = v122;
  v50 = v114;
LABEL_27:
  (*(void (**)(char *, uint64_t))(v49 + 8))(v58, v48);
  v47(v50, v42);
  v47(v120, v42);
  v47(v60, v42);
  v47(v119, v42);
  return v63;
}

unint64_t sub_10000EDCC(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

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
    result = String.index(_:offsetBy:limitedBy:)(15, result, v5, a2, a3);
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

uint64_t sub_10000EE68(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for Calendar.Component(255);
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000EEAC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_10000EED8()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001214C(v0, qword_10001E4D8);
  sub_100005148(v0, (uint64_t)qword_10001E4D8);
  return Logger.init(subsystem:category:)(0xD000000000000010, 0x8000000100014EF0, 0xD000000000000018, 0x8000000100015900);
}

id sub_10000EF54()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Swift::String v17;
  unint64_t v18;
  Swift::String v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  Swift::String v48;
  unint64_t v49;
  objc_class *ObjectType;
  uint64_t v52;
  unint64_t v53[3];
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  objc_super v57;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v1 = type metadata accessor for Date(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&ObjectType - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&ObjectType - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = &v0[OBJC_IVAR____TtC24FindMyWidgetIntentsItems18ItemIntentsHandler_instanceId];
  v10 = v0;
  v11 = UUID.init()();
  v12 = UUID.uuidString.getter(v11);
  v14 = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_100011480(8uLL, v12, v14);
  v16 = v15;
  swift_bridgeObjectRelease(v14);
  v17 = Substring.lowercased()();
  swift_bridgeObjectRelease(v16);
  v52 = 60;
  v53[0] = 0xE100000000000000;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v17._object);
  v18 = v53[0];
  swift_bridgeObjectRetain(v53[0]);
  v19._countAndFlagsBits = 62;
  v19._object = (void *)0xE100000000000000;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v18);
  v20 = v52;
  v21 = v53[0];
  *(_QWORD *)v9 = v52;
  *((_QWORD *)v9 + 1) = v21;
  v22 = swift_bridgeObjectRetain(v21);
  v23 = Date.init()(v22);
  v24 = Date.timeIntervalSinceReferenceDate.getter(v23);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v25 = type metadata accessor for ItemsDataService();
  v26 = swift_allocObject(v25, 80, 7);
  *(_QWORD *)(v26 + 64) = &_swiftEmptyArrayStorage;
  v27 = objc_allocWithZone((Class)NSDateFormatter);
  swift_retain(v26);
  *(_QWORD *)(v26 + 72) = objc_msgSend(v27, "init");
  swift_release(v26);
  *(_QWORD *)&v10[OBJC_IVAR____TtC24FindMyWidgetIntentsItems18ItemIntentsHandler_itemDataService] = sub_100007D44(v20, v21, v24);

  v57.receiver = v10;
  v57.super_class = ObjectType;
  v28 = objc_msgSendSuper2(&v57, "init");
  v29 = qword_10001D228;
  v30 = v28;
  if (v29 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v31 = type metadata accessor for Logger(0);
  sub_100005148(v31, (uint64_t)qword_10001E4D8);
  v32 = v30;
  v33 = Logger.logObject.getter(v32);
  v34 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(12, -1);
    v36 = swift_slowAlloc(32, -1);
    v56 = v36;
    *(_DWORD *)v35 = 136315138;
    ObjectType = (objc_class *)(v35 + 4);
    v52 = (uint64_t)v32;
    v37 = sub_100012098();
    v38 = String.init<A>(_:radix:uppercase:)(&v52, 16, 0, &type metadata for Int, v37);
    v40 = v39;
    v41 = sub_100011480(9uLL, v38, v39);
    v43 = v42;
    v54 = 7876668;
    v55 = 0xE300000000000000;
    v52 = v41;
    v53[0] = v44;
    v53[1] = v45;
    v53[2] = v42;
    v46 = sub_1000079D0();
    String.append<A>(contentsOf:)(&v52, &type metadata for Substring, v46);
    swift_bridgeObjectRelease(v43);
    v47 = v55;
    v52 = v54;
    v53[0] = v55;
    swift_bridgeObjectRetain(v55);
    v48._countAndFlagsBits = 15971;
    v48._object = (void *)0xE200000000000000;
    String.append(_:)(v48);
    swift_bridgeObjectRelease(v40);
    swift_bridgeObjectRelease(v47);
    v49 = v53[0];
    v52 = sub_100010D74(v52, v53[0], &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v52, v53, ObjectType, v35 + 12);

    swift_bridgeObjectRelease(v49);
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "🥑 ItemIntentsHandler%s: init", v35, 0xCu);
    swift_arrayDestroy(v36, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1, -1);
    swift_slowDealloc(v35, -1, -1);

  }
  else
  {

  }
  return v32;
}

unint64_t sub_10000F3B8()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Swift::String v11;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v0 = sub_100012098();
  v1 = String.init<A>(_:radix:uppercase:)(&v13, 16, 0, &type metadata for Int, v0);
  v3 = v2;
  v4 = sub_100011480(9uLL, v1, v2);
  v6 = v5;
  v17 = 7876668;
  v18 = 0xE300000000000000;
  v13 = v4;
  v14 = v7;
  v15 = v8;
  v16 = v5;
  v9 = sub_1000079D0();
  String.append<A>(contentsOf:)(&v13, &type metadata for Substring, v9);
  swift_bridgeObjectRelease(v6);
  v10 = v18;
  v13 = v17;
  v14 = v18;
  swift_bridgeObjectRetain(v18);
  v11._countAndFlagsBits = 15971;
  v11._object = (void *)0xE200000000000000;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v10);
  return v13;
}

id sub_10000F4B0()
{
  void *v0;
  objc_class *ObjectType;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  Swift::String v19;
  unint64_t v20;
  unint64_t v21;
  objc_class *v23;
  uint64_t v24;
  unint64_t v25[3];
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  objc_super v29;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v2 = type metadata accessor for Logger(0);
  sub_100005148(v2, (uint64_t)qword_10001E4D8);
  v3 = v0;
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v23 = ObjectType;
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v28 = v7;
    *(_DWORD *)v6 = 136315138;
    v24 = (uint64_t)v3;
    v8 = sub_100012098();
    v9 = String.init<A>(_:radix:uppercase:)(&v24, 16, 0, &type metadata for Int, v8);
    v11 = v10;
    v12 = sub_100011480(9uLL, v9, v10);
    v14 = v13;
    v26 = 7876668;
    v27 = 0xE300000000000000;
    v24 = v12;
    v25[0] = v15;
    v25[1] = v16;
    v25[2] = v13;
    v17 = sub_1000079D0();
    String.append<A>(contentsOf:)(&v24, &type metadata for Substring, v17);
    swift_bridgeObjectRelease(v14);
    v18 = v27;
    v24 = v26;
    v25[0] = v27;
    swift_bridgeObjectRetain(v27);
    v19._countAndFlagsBits = 15971;
    v19._object = (void *)0xE200000000000000;
    String.append(_:)(v19);
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease(v18);
    v20 = v25[0];
    v24 = sub_100010D74(v24, v25[0], &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, v25, v6 + 4, v6 + 12);

    v21 = v20;
    ObjectType = v23;
    swift_bridgeObjectRelease(v21);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "🥑 ItemIntentsHandler%s: deinit", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

  }
  v29.receiver = v3;
  v29.super_class = ObjectType;
  return objc_msgSendSuper2(&v29, "dealloc");
}

id sub_10000F78C(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSString v37;
  NSString v38;
  id v39;
  NSString v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  int v47;
  unint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  id v60;
  os_log_type_t v61;
  uint64_t v62;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  _BYTE v71[16];
  uint64_t v72[3];
  id v73;

  v2 = v1;
  v4 = sub_1000075DC(&qword_10001D878);
  __chkstk_darwin(v4);
  v6 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ItemModel(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = 0;
  v11 = sub_100004460();
  v12 = v11;
  if (*(_QWORD *)(v11 + 16))
  {
    sub_100007658(v11 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80)), (uint64_t)v6);
    v13 = 0;
  }
  else
  {
    v13 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, v13, 1, v7);
  swift_bridgeObjectRelease(v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1000121C0((uint64_t)v6);
    if (qword_10001D228 != -1)
      swift_once(&qword_10001D228, sub_10000EED8);
    v14 = type metadata accessor for Logger(0);
    sub_100005148(v14, (uint64_t)qword_10001E4D8);
    v15 = v2;
    v16 = a1;
    v17 = v15;
    v18 = v16;
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc(22, -1);
      v22 = swift_slowAlloc(64, -1);
      v72[0] = v22;
      *(_DWORD *)v21 = 136315394;
      v23 = objc_msgSend(v17, "description");
      v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
      v26 = v25;

      v70 = sub_100010D74(v24, v26, v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, v71, v21 + 4, v21 + 12);

      swift_bridgeObjectRelease(v26);
      *(_WORD *)(v21 + 12) = 2080;
      v27 = objc_msgSend(v18, "source");
      if (v27
        && (v28 = v27,
            v29 = objc_msgSend(v27, "itemIdentifier"),
            v28,
            v29))
      {
        v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
        v32 = v31;

      }
      else
      {
        v32 = 0xEA0000000000746ELL;
        v30 = 0x65746E69206C696ELL;
      }
      v70 = sub_100010D74(v30, v32, v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, v71, v21 + 14, v21 + 22);

      swift_bridgeObjectRelease(v32);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s: default source for %s: nil", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy(v22, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v21, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    sub_10000769C((uint64_t)v6, (uint64_t)v10);
    v33 = type metadata accessor for ItemSource();
    v34 = *((_QWORD *)v10 + 1);
    v35 = *((_QWORD *)v10 + 3);
    v36 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v33));
    swift_bridgeObjectRetain(v34);
    swift_bridgeObjectRetain(v35);
    v37 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v34);
    v38 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v35);
    v39 = objc_msgSend(v36, "initWithIdentifier:displayString:", v37, v38);

    v40 = String._bridgeToObjectiveC()();
    objc_msgSend(v39, "setItemIdentifier:", v40);

    v73 = v39;
    if (qword_10001D228 != -1)
      swift_once(&qword_10001D228, sub_10000EED8);
    v41 = type metadata accessor for Logger(0);
    sub_100005148(v41, (uint64_t)qword_10001E4D8);
    v42 = v2;
    v43 = a1;
    v44 = v42;
    v45 = v43;
    v46 = Logger.logObject.getter(v45);
    v47 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v46, (os_log_type_t)v47))
    {
      v68 = v47;
      v48 = 0xEA0000000000746ELL;
      v49 = swift_slowAlloc(32, -1);
      v67 = swift_slowAlloc(96, -1);
      v72[0] = v67;
      *(_DWORD *)v49 = 136315650;
      v50 = objc_msgSend(v44, "description");
      v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(v50);
      v53 = v52;

      v70 = sub_100010D74(v51, v53, v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, v71, v49 + 4, v49 + 12);

      swift_bridgeObjectRelease(v53);
      *(_WORD *)(v49 + 12) = 2080;
      v54 = objc_msgSend(v45, "source");
      if (v54)
      {
        v55 = v54;
        v56 = objc_msgSend(v54, "itemIdentifier");

        if (v56)
        {
          v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
          v48 = v58;

        }
        else
        {
          v57 = 0x65746E69206C696ELL;
        }
      }
      else
      {
        v57 = 0x65746E69206C696ELL;
      }
      v59 = 7104878;
      v70 = sub_100010D74(v57, v48, v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v70, v71, v49 + 14, v49 + 22);

      swift_bridgeObjectRelease(v48);
      *(_WORD *)(v49 + 22) = 2080;
      swift_beginAccess(&v73, &v70, 0, 0);
      if (v73)
      {
        v60 = objc_msgSend(v73, "itemIdentifier");
        v61 = v68;
        v62 = v67;
        if (v60)
        {
          v63 = v60;
          v59 = static String._unconditionallyBridgeFromObjectiveC(_:)(v60);
          v65 = v64;

        }
        else
        {
          v65 = 0xE300000000000000;
        }
      }
      else
      {
        v65 = 0xE300000000000000;
        v61 = v68;
        v62 = v67;
      }
      v69 = sub_100010D74(v59, v65, v72);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70, v49 + 24, v49 + 32);
      swift_bridgeObjectRelease(v65);
      _os_log_impl((void *)&_mh_execute_header, v46, v61, "%s: default source for %s: %s", (uint8_t *)v49, 0x20u);
      swift_arrayDestroy(v62, 3, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v62, -1, -1);
      swift_slowDealloc(v49, -1, -1);
    }
    else
    {

    }
    sub_10000761C((uint64_t)v10);
  }
  swift_beginAccess(&v73, v72, 0, 0);
  return v73;
}

void sub_10000FF58(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  void *v8;
  id v9;
  id v10;

  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  v9 = a3;
  v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);

}

uint64_t sub_10000FFD4(void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  if (a1)
  {
    v5 = objc_msgSend(a1, "allItems");
    v6 = type metadata accessor for ItemSource();
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);

  }
  else
  {
    v7 = 0;
  }
  a3(v7, a2);
  return swift_bridgeObjectRelease(v7);
}

void sub_10001010C(objc_class *a1, uint64_t a2, uint64_t a3)
{
  Class isa;
  uint64_t v6;
  id v7;

  isa = a1;
  if (a1)
  {
    type metadata accessor for ItemSource();
    isa = Array._bridgeToObjectiveC()().super.isa;
  }
  if (a2)
    v6 = _convertErrorToNSError(_:)(a2);
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, isa);

}

uint64_t sub_100010190(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSString v20;
  NSString v21;
  id v22;
  NSString v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  Swift::String_optional v29;
  Swift::String v30;
  Swift::String v31;
  void *object;
  uint64_t v33;
  id v34;
  NSString v35;
  Class isa;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  Class v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  _QWORD *v58;
  uint64_t v59;
  void *v60;
  _QWORD *v61;
  id v62;
  id v63;
  uint64_t v64;
  char *v65;
  unint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  uint64_t v74;
  id v75;
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
  Class ObjCClassFromMetadata;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t aBlock[5];
  _QWORD *v91;
  Swift::String v92;

  v76 = a2;
  v77 = a3;
  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v83 = *(_QWORD *)(v4 - 8);
  v84 = v4;
  __chkstk_darwin(v4);
  v82 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v80 = *(_QWORD *)(v6 - 8);
  v81 = v6;
  __chkstk_darwin(v6);
  v79 = (char *)&v74 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = a1;
  v8 = sub_100004460();
  v9 = swift_allocObject(&unk_1000194A8, 24, 7);
  v78 = v9;
  *(_QWORD *)(v9 + 16) = _swiftEmptyArrayStorage;
  v10 = (uint64_t *)(v9 + 16);
  v85 = v8;
  v11 = *(_QWORD *)(v8 + 16);
  if (v11)
  {
    v12 = *(_QWORD *)(type metadata accessor for ItemModel(0) - 8);
    v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
    v14 = type metadata accessor for ItemSource();
    ObjCClassFromMetadata = (Class)swift_getObjCClassFromMetadata(v14);
    v15 = *(_QWORD *)(v12 + 72);
    v16 = v13 + v85 + 16;
    do
    {
      v17 = *(_QWORD *)(v16 - 8);
      v18 = *(_QWORD *)(v16 + 8);
      v19 = objc_allocWithZone(ObjCClassFromMetadata);
      swift_bridgeObjectRetain(v17);
      swift_bridgeObjectRetain(v18);
      v20 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v17);
      v21 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v18);
      v22 = objc_msgSend(v19, "initWithIdentifier:displayString:", v20, v21);

      v23 = String._bridgeToObjectiveC()();
      objc_msgSend(v22, "setItemIdentifier:", v23);

      v24 = v22;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v24);
      v26 = *(_QWORD *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      v25 = *(_QWORD *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v26 >= v25 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v25 > 1, v26 + 1, 1);
      v27 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v26, v24);
      specialized Array._endMutation()(v27);

      v16 += v15;
      --v11;
    }
    while (v11);
  }
  swift_bridgeObjectRelease(v85);
  v28 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v92._countAndFlagsBits = 0xD00000000000001CLL;
  v92._object = (void *)0x8000000100014E50;
  v29.value._object = (void *)0x8000000100014AF0;
  v30._countAndFlagsBits = 0x736D657449;
  v30._object = (void *)0xE500000000000000;
  v29.value._countAndFlagsBits = 0xD000000000000010;
  v31._countAndFlagsBits = 0;
  v31._object = (void *)0xE000000000000000;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v30, v29, (NSBundle)v28, v31, v92)._object;

  v33 = *v10;
  v34 = objc_allocWithZone((Class)INObjectSection);
  swift_bridgeObjectRetain(v33);
  v35 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  type metadata accessor for ItemSource();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v33);
  v37 = objc_msgSend(v34, "initWithTitle:items:", v35, isa);

  v38 = sub_1000075DC(&qword_10001D860);
  v39 = swift_allocObject(v38, 40, 7);
  *(_OWORD *)(v39 + 16) = xmmword_100015910;
  *(_QWORD *)(v39 + 32) = v37;
  aBlock[0] = v39;
  specialized Array._endMutation()(v39);
  v40 = aBlock[0];
  v41 = objc_allocWithZone((Class)INObjectCollection);
  ObjCClassFromMetadata = (Class)v37;
  sub_1000075DC(&qword_10001D868);
  v42 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v40);
  v43 = objc_msgSend(v41, "initWithSections:", v42);

  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v44 = type metadata accessor for Logger(0);
  sub_100005148(v44, (uint64_t)qword_10001E4D8);
  v45 = v75;
  v46 = v78;
  swift_retain_n(v78, 2);
  v47 = v45;
  v48 = Logger.logObject.getter(v47);
  v49 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = swift_slowAlloc(22, -1);
    v51 = swift_slowAlloc(32, -1);
    aBlock[0] = v51;
    *(_DWORD *)v50 = 136315394;
    v52 = sub_10000F3B8();
    v54 = v53;
    v88 = sub_100010D74(v52, v53, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v88, &v89, v50 + 4, v50 + 12);

    swift_bridgeObjectRelease(v54);
    *(_WORD *)(v50 + 12) = 2048;
    swift_beginAccess(v10, &v88, 0, 0);
    v55 = *v10;
    if ((unint64_t)*v10 >> 62)
    {
      if (v55 < 0)
        v73 = *v10;
      else
        v73 = v55 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*v10);
      v56 = _CocoaArrayWrapper.endIndex.getter(v73);
      swift_release(v46);
      swift_bridgeObjectRelease(v55);
    }
    else
    {
      v56 = *(_QWORD *)((v55 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_release(v46);
    }
    v87 = v56;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v50 + 14, v50 + 22);
    swift_release(v46);
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "🥑 ItemIntentsHandler%s: provided %ld options for intent", (uint8_t *)v50, 0x16u);
    swift_arrayDestroy(v51, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v51, -1, -1);
    swift_slowDealloc(v50, -1, -1);

  }
  else
  {

    swift_release_n(v46, 2);
  }
  sub_100008150();
  v57 = (void *)static OS_dispatch_queue.main.getter();
  v58 = (_QWORD *)swift_allocObject(&unk_1000194D0, 56, 7);
  v58[2] = v47;
  v58[3] = v46;
  v59 = v77;
  v58[4] = v76;
  v58[5] = v59;
  v58[6] = v43;
  aBlock[4] = (uint64_t)sub_10001213C;
  v91 = v58;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000EEA8;
  aBlock[3] = (uint64_t)&unk_1000194E8;
  v60 = _Block_copy(aBlock);
  v61 = v91;
  v62 = v47;
  swift_retain(v46);
  swift_retain(v59);
  v63 = v43;
  v64 = swift_release(v61);
  v65 = v79;
  static DispatchQoS.unspecified.getter(v64);
  aBlock[0] = (uint64_t)_swiftEmptyArrayStorage;
  v66 = sub_100012014();
  v67 = sub_1000075DC(&qword_10001D3D8);
  v68 = sub_1000077A8();
  v69 = v82;
  v70 = v46;
  v71 = v84;
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v67, v68, v84, v66);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v65, v69, v60);
  _Block_release(v60);

  (*(void (**)(char *, uint64_t))(v83 + 8))(v69, v71);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v65, v81);
  return swift_release(v70);
}

uint64_t sub_1000108E4(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD), uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t (*v14)(_QWORD, _QWORD);
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v9 = type metadata accessor for Logger(0);
  sub_100005148(v9, (uint64_t)qword_10001E4D8);
  v10 = a1;
  swift_retain_n(a2, 2);
  v11 = v10;
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = a3;
    v15 = swift_slowAlloc(22, -1);
    v16 = swift_slowAlloc(32, -1);
    v27 = v16;
    *(_DWORD *)v15 = 136315394;
    v17 = sub_10000F3B8();
    v19 = v18;
    v25 = sub_100010D74(v17, v18, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v15 + 4, v15 + 12);

    swift_bridgeObjectRelease(v19);
    *(_WORD *)(v15 + 12) = 2048;
    swift_beginAccess(a2 + 16, &v25, 0, 0);
    v20 = *(_QWORD *)(a2 + 16);
    if ((unint64_t)v20 >> 62)
    {
      if (v20 < 0)
        v23 = *(_QWORD *)(a2 + 16);
      else
        v23 = v20 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(*(_QWORD *)(a2 + 16));
      v21 = _CocoaArrayWrapper.endIndex.getter(v23);
      swift_release(a2);
      swift_bridgeObjectRelease(v20);
    }
    else
    {
      v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_release(a2);
    }
    a3 = v14;
    v24 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, &v25, v15 + 14, v15 + 22);
    swift_release(a2);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "🥑 ItemIntentsHandler%s: returning %ld options for intent", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v16, -1, -1);
    swift_slowDealloc(v15, -1, -1);

  }
  else
  {

    swift_release_n(a2, 2);
  }
  return a3(a5, 0);
}

uint64_t type metadata accessor for ItemIntentsHandler()
{
  return objc_opt_self(_TtC24FindMyWidgetIntentsItems18ItemIntentsHandler);
}

void sub_100010C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)(a2);
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_100010C74()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100010C98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100010C1C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100010CA0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100010CB0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100010CE4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100010D04(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v6 = a4();
  v8 = v7;
  v9 = sub_100010D74(v6, v7, a3);
  v10 = *a1;
  v11 = *a1 + 8;
  v13 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v10, v11);
  result = swift_bridgeObjectRelease(v8);
  *a1 = v11;
  return result;
}

uint64_t sub_100010D74(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100010E44(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10001205C((uint64_t)v12, *a3);
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
      sub_10001205C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000CACC(v12);
  return v7;
}

uint64_t sub_100010E44(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_100010FFC(a5, a6);
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

uint64_t sub_100010FFC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100011090(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100011268(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100011268(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100011090(uint64_t a1, unint64_t a2)
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
      v5 = sub_100011204(v4, 0);
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

_QWORD *sub_100011204(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000075DC(&qword_10001D850);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100011268(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_1000075DC(&qword_10001D850);
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

_BYTE **sub_1000113B4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_1000113C4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawBufferPointer.copyMemory source has too many elements", 69, 2, "Swift/UnsafeRawBufferPointer.swift", 34, 2, 487, 0);
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_100011458@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_100011480(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

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
    result = String.index(_:offsetBy:limitedBy:)(v4 | (v3 << 16), -(uint64_t)result, 15, a2, a3);
    if ((v5 & 1) != 0)
      result = 15;
    if (4 * v3 >= result >> 14)
      return String.subscript.getter();
  }
  __break(1u);
  return result;
}

void sub_100011528(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[3];

  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v6 = type metadata accessor for Logger(0);
  sub_100005148(v6, (uint64_t)qword_10001E4D8);
  v7 = a2;
  v8 = a1;
  v9 = v7;
  v10 = v8;
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc(22, -1);
    v14 = (_QWORD *)swift_slowAlloc(8, -1);
    v24 = a3;
    v15 = swift_slowAlloc(32, -1);
    v26[0] = v15;
    *(_DWORD *)v13 = 136315394;
    v16 = sub_10000F3B8();
    v18 = v17;
    v25 = sub_100010D74(v16, v17, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26, v13 + 4, v13 + 12);

    swift_bridgeObjectRelease(v18);
    *(_WORD *)(v13 + 12) = 2112;
    v25 = (uint64_t)v10;
    v19 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, v26, v13 + 14, v13 + 22);
    *v14 = v10;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "🥑 ItemIntentsHandler%s: handle intent %@", (uint8_t *)v13, 0x16u);
    v20 = sub_1000075DC(&qword_10001D870);
    swift_arrayDestroy(v14, 1, v20);
    swift_slowDealloc(v14, -1, -1);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    v21 = v15;
    a3 = v24;
    swift_slowDealloc(v21, -1, -1);
    swift_slowDealloc(v13, -1, -1);

  }
  else
  {

  }
  v22 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ItemSelectorIntentResponse()), "init");
  v23 = &v22[OBJC_IVAR___ItemSelectorIntentResponse_code];
  swift_beginAccess(&v22[OBJC_IVAR___ItemSelectorIntentResponse_code], v26, 1, 0);
  *(_QWORD *)v23 = 2;
  objc_msgSend(v22, "setUserActivity:", 0);
  (*(void (**)(uint64_t, char *))(a3 + 16))(a3, v22);

}

void sub_1000117D8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSString v14;
  NSString v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v36 = a3;
  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for ItemSource();
  v10 = UUID.init()();
  UUID.uuidString.getter(v10);
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v9));
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  v15 = String._bridgeToObjectiveC()();
  v16 = objc_msgSend(v13, "initWithIdentifier:displayString:", v14, v15);

  type metadata accessor for ItemSourceResolutionResult();
  v17 = static ItemSourceResolutionResult.success(with:)((uint64_t)v16);
  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v18 = type metadata accessor for Logger(0);
  sub_100005148(v18, (uint64_t)qword_10001E4D8);
  v19 = a2;
  v20 = a1;
  v21 = v19;
  v22 = v20;
  v23 = Logger.logObject.getter(v22);
  v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc(22, -1);
    v26 = (_QWORD *)swift_slowAlloc(8, -1);
    v34 = swift_slowAlloc(32, -1);
    v38 = v34;
    *(_DWORD *)v25 = 136315394;
    v35 = v16;
    v27 = sub_10000F3B8();
    v29 = v28;
    v37 = sub_100010D74(v27, v28, &v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v25 + 4, v25 + 12);

    swift_bridgeObjectRelease(v29);
    *(_WORD *)(v25 + 12) = 2112;
    v37 = (uint64_t)v22;
    v30 = v22;
    v16 = v35;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38, v25 + 14, v25 + 22);
    *v26 = v22;

    _os_log_impl((void *)&_mh_execute_header, v23, v24, "🥑 ItemIntentsHandler%s: resolved source for %@: success", (uint8_t *)v25, 0x16u);
    v31 = sub_1000075DC(&qword_10001D870);
    swift_arrayDestroy(v26, 1, v31);
    swift_slowDealloc(v26, -1, -1);
    v32 = v34;
    swift_arrayDestroy(v34, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v25, -1, -1);

  }
  else
  {

  }
  (*(void (**)(uint64_t, id))(v36 + 16))(v36, v17);

}

uint64_t sub_100011B24(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
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
  _QWORD *v58;
  uint64_t aBlock[5];
  _QWORD *v60;

  v52 = a2;
  v53 = a3;
  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v57 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v55 = *(_QWORD *)(v8 - 8);
  v56 = v8;
  __chkstk_darwin(v8);
  v54 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = type metadata accessor for DispatchQoS.QoSClass(0);
  v10 = *(_QWORD *)(v51 - 8);
  __chkstk_darwin(v51);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10001D228 != -1)
    swift_once(&qword_10001D228, sub_10000EED8);
  v13 = type metadata accessor for Logger(0);
  sub_100005148(v13, (uint64_t)qword_10001E4D8);
  v14 = v3;
  v15 = a1;
  v16 = v14;
  v17 = v15;
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v50 = v6;
    v47 = v5;
    v20 = swift_slowAlloc(22, -1);
    v49 = swift_slowAlloc(64, -1);
    aBlock[0] = v49;
    *(_DWORD *)v20 = 136315394;
    v21 = sub_10000F3B8();
    v23 = v22;
    v58 = (_QWORD *)sub_100010D74(v21, v22, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, aBlock, v20 + 4, v20 + 12);

    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v20 + 12) = 2080;
    v24 = objc_msgSend(v17, "source");
    v48 = v10;
    if (v24
      && (v25 = v24,
          v26 = objc_msgSend(v24, "itemIdentifier"),
          v25,
          v26))
    {
      v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
      v29 = v28;

      v30 = v27;
      v31 = v29;
      v5 = v47;
    }
    else
    {
      v5 = v47;
      v31 = 0xEA0000000000746ELL;
      v30 = 0x65746E69206C696ELL;
    }
    v58 = (_QWORD *)sub_100010D74(v30, v31, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, aBlock, v20 + 14, v20 + 22);

    swift_bridgeObjectRelease(v31);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "🥑 ItemIntentsHandler%s: providing sources for %s…", (uint8_t *)v20, 0x16u);
    v32 = v49;
    swift_arrayDestroy(v49, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v32, -1, -1);
    swift_slowDealloc(v20, -1, -1);

    v6 = v50;
    v10 = v48;
  }
  else
  {

  }
  sub_100008150();
  v33 = v51;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for DispatchQoS.QoSClass.default(_:), v51);
  v34 = (void *)static OS_dispatch_queue.global(qos:)(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v33);
  v35 = (_QWORD *)swift_allocObject(&unk_100019458, 40, 7);
  v36 = v52;
  v37 = v53;
  v35[2] = v16;
  v35[3] = v36;
  v35[4] = v37;
  aBlock[4] = (uint64_t)sub_100011FF0;
  v60 = v35;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000EEA8;
  aBlock[3] = (uint64_t)&unk_100019470;
  v38 = _Block_copy(aBlock);
  v39 = v16;
  v40 = swift_retain(v37);
  v41 = v54;
  static DispatchQoS.unspecified.getter(v40);
  v58 = _swiftEmptyArrayStorage;
  v42 = sub_100012014();
  v43 = sub_1000075DC(&qword_10001D3D8);
  v44 = sub_1000077A8();
  v45 = v57;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v58, v43, v44, v5, v42);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v41, v45, v38);
  _Block_release(v38);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v45, v5);
  (*(void (**)(char *, uint64_t))(v55 + 8))(v41, v56);
  return swift_release(v60);
}

uint64_t sub_100011FC4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100011FF0()
{
  uint64_t v0;

  return sub_100010190(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_100011FFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001200C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100012014()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D3D0;
  if (!qword_10001D3D0)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_10001D3D0);
  }
  return result;
}

uint64_t sub_10001205C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100012098()
{
  unint64_t result;

  result = qword_10001D858;
  if (!qword_10001D858)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_10001D858);
  }
  return result;
}

uint64_t sub_1000120DC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100012100()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));

  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10001213C()
{
  uint64_t v0;

  return sub_1000108E4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(_QWORD, _QWORD))(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t *sub_10001214C(uint64_t a1, uint64_t *a2)
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

void sub_10001218C(objc_class *a1, uint64_t a2)
{
  uint64_t v2;

  sub_10001010C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100012194()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000121B8(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000FFD4(a1, a2, *(void (**)(uint64_t, uint64_t))(v2 + 16));
}

uint64_t sub_1000121C0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000075DC(&qword_10001D878);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *ItemSelectorIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), "init");
  v6 = &v5[OBJC_IVAR___ItemSelectorIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___ItemSelectorIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

id ItemSelectorIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id ItemSelectorIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ItemSelectorIntent();
  return objc_msgSendSuper2(&v2, "init");
}

id ItemSelectorIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithCoder:", a1);

  return v3;
}

id ItemSelectorIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ItemSelectorIntent();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ItemSelectorIntent.__allocating_init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  NSString v7;
  id v8;

  v4 = v3;
  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(objc_allocWithZone(v4), "initWithIdentifier:backingStore:", v7, a3);

  return v8;
}

id ItemSelectorIntent.init(identifier:backingStore:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  NSString v6;
  id v7;
  objc_super v9;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for ItemSelectorIntent();
  v7 = objc_msgSendSuper2(&v9, "initWithIdentifier:backingStore:", v6, a3);

  return v7;
}

id ItemSelectorIntent.__allocating_init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v12 = objc_msgSend(objc_allocWithZone(v5), "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id ItemSelectorIntent.init(domain:verb:parametersByName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  NSString v9;
  NSString v10;
  NSDictionary v11;
  id v12;
  objc_super v14;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a5)
  {
    v11.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }
  else
  {
    v11.super.isa = 0;
  }
  v14.receiver = v5;
  v14.super_class = (Class)type metadata accessor for ItemSelectorIntent();
  v12 = objc_msgSendSuper2(&v14, "initWithDomain:verb:parametersByName:", v9, v10, v11.super.isa);

  return v12;
}

id ItemSelectorIntent.__deallocating_deinit()
{
  return sub_100012EF0(type metadata accessor for ItemSelectorIntent);
}

unint64_t ItemSelectorIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_100012F20(a1);
}

BOOL sub_100012884(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100012898()
{
  Swift::UInt *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000128DC()
{
  Swift::UInt *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100012904(uint64_t a1)
{
  Swift::UInt *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_100012944@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_100012F20(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t ItemSelectorIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[24];

  v1 = v0 + OBJC_IVAR___ItemSelectorIntentResponse_code;
  swift_beginAccess(v0 + OBJC_IVAR___ItemSelectorIntentResponse_code, v3, 0, 0);
  return *(_QWORD *)v1;
}

char *ItemSelectorIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;
  char v9[24];

  v5 = (char *)objc_msgSend(v2, "init");
  v6 = &v5[OBJC_IVAR___ItemSelectorIntentResponse_code];
  swift_beginAccess(&v5[OBJC_IVAR___ItemSelectorIntentResponse_code], v9, 1, 0);
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, "setUserActivity:", a2);

  return v7;
}

uint64_t type metadata accessor for ItemSelectorIntent()
{
  return objc_opt_self(ItemSelectorIntent);
}

id ItemSelectorIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___ItemSelectorIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ItemSelectorIntentResponse();
  return objc_msgSendSuper2(&v2, "init");
}

id ItemSelectorIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___ItemSelectorIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ItemSelectorIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ItemSelectorIntentResponse.__allocating_init(backingStore:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), "initWithBackingStore:", a1);

  return v3;
}

id ItemSelectorIntentResponse.init(backingStore:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___ItemSelectorIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ItemSelectorIntentResponse();
  v3 = objc_msgSendSuper2(&v5, "initWithBackingStore:", a1);

  return v3;
}

id sub_100012D14(char *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  *(_QWORD *)&a1[OBJC_IVAR___ItemSelectorIntentResponse_code] = 0;
  v7.receiver = a1;
  v7.super_class = (Class)type metadata accessor for ItemSelectorIntentResponse();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id ItemSelectorIntentResponse.__allocating_init(propertiesByName:)(uint64_t a1)
{
  objc_class *v1;
  NSDictionary v3;
  id v4;

  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v4 = objc_msgSend(objc_allocWithZone(v1), "initWithPropertiesByName:", v3.super.isa);

  return v4;
}

id ItemSelectorIntentResponse.init(propertiesByName:)(uint64_t a1)
{
  char *v1;
  NSDictionary v3;
  id v4;
  objc_super v6;

  *(_QWORD *)&v1[OBJC_IVAR___ItemSelectorIntentResponse_code] = 0;
  if (a1)
  {
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3.super.isa = 0;
  }
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for ItemSelectorIntentResponse();
  v4 = objc_msgSendSuper2(&v6, "initWithPropertiesByName:", v3.super.isa);

  if (v4)
  return v4;
}

id ItemSelectorIntentResponse.__deallocating_deinit()
{
  return sub_100012EF0(type metadata accessor for ItemSelectorIntentResponse);
}

id sub_100012EF0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

unint64_t sub_100012F20(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for ItemSelectorIntentResponse()
{
  return objc_opt_self(ItemSelectorIntentResponse);
}

unint64_t sub_100012F54()
{
  unint64_t result;

  result = qword_10001D8E8;
  if (!qword_10001D8E8)
  {
    result = swift_getWitnessTable("1<", &type metadata for ItemSelectorIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_10001D8E8);
  }
  return result;
}

uint64_t sub_100012F98@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___ItemSelectorIntentResponse_code);
  result = swift_beginAccess(v3, v5, 0, 0);
  *a2 = *v3;
  return result;
}

uint64_t sub_100012FE8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  _BYTE v5[24];

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___ItemSelectorIntentResponse_code);
  result = swift_beginAccess(v3, v5, 1, 0);
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ItemSelectorIntentResponseCode()
{
  return &type metadata for ItemSelectorIntentResponseCode;
}

uint64_t static ItemSource.supportsSecureCoding.getter()
{
  return 1;
}

id ItemSource.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(objc_allocWithZone(v6), "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

id ItemSource.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  NSString v10;
  NSString v11;
  NSString v12;
  id v13;
  objc_super v15;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  if (a6)
  {
    v12 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a6);
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v6;
  v15.super_class = (Class)type metadata accessor for ItemSource();
  v13 = objc_msgSendSuper2(&v15, "initWithIdentifier:displayString:pronunciationHint:", v10, v11, v12);

  return v13;
}

uint64_t type metadata accessor for ItemSource()
{
  return objc_opt_self(ItemSource);
}

id ItemSource.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ItemSource();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id ItemSource.__deallocating_deinit()
{
  return sub_100012EF0(type metadata accessor for ItemSource);
}

id static ItemSourceResolutionResult.success(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___ItemSourceResolutionResult;
  return objc_msgSendSuper2(&v4, "successWithResolvedObject:", a1);
}

id static ItemSourceResolutionResult.disambiguation(with:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *ObjCClassFromMetadata;
  Class isa;
  id v7;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  objc_super v12;

  v2 = v1;
  v3 = a1;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v9 = a1;
    else
      v9 = a1 & 0xFFFFFFFFFFFFFF8;
    v10 = sub_1000134DC();
    swift_bridgeObjectRetain(v3);
    v11 = _bridgeCocoaArray<A>(_:)(v9, v10);
    swift_bridgeObjectRelease(v3);
    v3 = v11;
  }
  else
  {
    v4 = swift_bridgeObjectRetain(a1);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v4);
    sub_1000134DC();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v2);
  sub_1000134DC();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  v12.receiver = ObjCClassFromMetadata;
  v12.super_class = (Class)&OBJC_METACLASS___ItemSourceResolutionResult;
  v7 = objc_msgSendSuper2(&v12, "disambiguationWithObjectsToDisambiguate:", isa);

  return v7;
}

unint64_t sub_1000134DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001D968;
  if (!qword_10001D968)
  {
    v1 = objc_opt_self(INObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001D968);
  }
  return result;
}

id static ItemSourceResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v4;

  v4.receiver = (id)swift_getObjCClassFromMetadata(v1);
  v4.super_class = (Class)&OBJC_METACLASS___ItemSourceResolutionResult;
  return objc_msgSendSuper2(&v4, "confirmationRequiredWithObjectToConfirm:", a1);
}

void static ItemSourceResolutionResult.success(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetIntentsItems/ItemSource.swift", 41, 2, 47, 0);
  __break(1u);
}

void static ItemSourceResolutionResult.disambiguation(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetIntentsItems/ItemSource.swift", 41, 2, 52, 0);
  __break(1u);
}

void static ItemSourceResolutionResult.confirmationRequired(with:)()
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "FindMyWidgetIntentsItems/ItemSource.swift", 41, 2, 57, 0);
  __break(1u);
}

id ItemSourceResolutionResult.__allocating_init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v5;
  Class isa;
  id v7;

  v5 = objc_allocWithZone(v2);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v7 = objc_msgSend(v5, "initWithJSONDictionary:forIntent:", isa, a2);

  return v7;
}

id ItemSourceResolutionResult.init(JSONDictionary:intent:)(uint64_t a1, void *a2)
{
  void *v2;
  Class isa;
  id v6;
  id v7;
  objc_super v9;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for ItemSourceResolutionResult();
  v6 = objc_msgSendSuper2(&v9, "initWithJSONDictionary:forIntent:", isa, a2);

  v7 = v6;
  if (v7)

  return v7;
}

uint64_t type metadata accessor for ItemSourceResolutionResult()
{
  return objc_opt_self(ItemSourceResolutionResult);
}

id ItemSourceResolutionResult.__deallocating_deinit()
{
  return sub_100012EF0(type metadata accessor for ItemSourceResolutionResult);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC24FindMyWidgetIntentsItemsP33_3E7B48F322DC5820F8BCBD213FF67E6B19ResourceBundleClass);
}
