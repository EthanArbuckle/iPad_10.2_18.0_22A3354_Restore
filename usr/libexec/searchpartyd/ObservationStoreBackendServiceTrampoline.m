@implementation ObservationStoreBackendServiceTrampoline

- (_TtC12searchpartyd40ObservationStoreBackendServiceTrampoline)init
{
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *result;

  result = (_TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.ObservationStoreBackendServiceTrampoline", 53, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd40ObservationStoreBackendServiceTrampoline_implementation));
}

- (void)insertWithAdvertisementData:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = swift_allocObject(&unk_1010BF288, 24, 7);
  *(_QWORD *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0);
  v13 = (_QWORD *)swift_allocObject(&unk_1010BF2B0, 56, 7);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_10001D1EC;
  v13[6] = v12;
  v14 = v8;
  sub_10001BBBC(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("insert(payload:)", 16, 2, &unk_10111F100, v13);
  swift_release();
  swift_release();
  sub_10001BC14(v9, v11);

}

- (void)deleteObservedAdvertisementsWithAdvertisementsData:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = swift_allocObject(&unk_1010BF238, 24, 7);
  *(_QWORD *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0);
  v13 = (_QWORD *)swift_allocObject(&unk_1010BF260, 56, 7);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100CA2D80;
  v13[6] = v12;
  v14 = v8;
  sub_10001BBBC(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("deleteObservedAdvertisements(advertisementsData:)", 49, 2, &unk_10111F0F0, v13);
  swift_release();
  swift_release();
  sub_10001BC14(v9, v11);

}

- (void)markObservedAdvertisementsPublishedWithAdvertisementsData:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = swift_allocObject(&unk_1010BF1E8, 24, 7);
  *(_QWORD *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0);
  v13 = (_QWORD *)swift_allocObject(&unk_1010BF210, 56, 7);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100CA2D80;
  v13[6] = v12;
  v14 = v8;
  sub_10001BBBC(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("markObservedAdvertisementsPublished(advertisementsData:)", 56, 2, &unk_10111F0E0, v13);
  swift_release();
  swift_release();
  sub_10001BC14(v9, v11);

}

- (void)deleteAllAnonymousObservedAdvertisementsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010BF198, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  type metadata accessor for Transaction(0);
  v6 = (_QWORD *)swift_allocObject(&unk_1010BF1C0, 40, 7);
  v6[2] = self;
  v6[3] = sub_100CA2D80;
  v6[4] = v5;
  v7 = self;
  swift_retain(v5);
  static Transaction.asyncTask(name:block:)("deleteAllAnonymousObservedAdvertisements(completion:)", 53, 2, &unk_10111F0D0, v6);

  swift_release(v5);
  swift_release(v6);
}

- (void)reverseChronologicalObservationsWithIdentifierData:(id)a3 limit:(int64_t)a4 isPublished:(BOOL)a5 completion:(id)a6
{
  void *v10;
  id v11;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v18;

  v10 = _Block_copy(a6);
  v11 = a3;
  v12 = self;
  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;

  v16 = swift_allocObject(&unk_1010BF148, 24, 7);
  *(_QWORD *)(v16 + 16) = v10;
  type metadata accessor for Transaction(0);
  v17 = swift_allocObject(&unk_1010BF170, 72, 7);
  *(_QWORD *)(v17 + 16) = v13;
  *(_QWORD *)(v17 + 24) = v15;
  *(_QWORD *)(v17 + 32) = v12;
  *(_QWORD *)(v17 + 40) = a4;
  *(_BYTE *)(v17 + 48) = a5;
  *(_QWORD *)(v17 + 56) = sub_100CA2D80;
  *(_QWORD *)(v17 + 64) = v16;
  v18 = v12;
  sub_10001BBBC(v13, v15);
  swift_retain();
  static Transaction.asyncTask(name:block:)("observations(reverseChronologicalObservations(identifierData:limit:)", 68, 2, &unk_10111F0B8, v17);
  swift_release();
  swift_release();
  sub_10001BC14(v13, v15);

}

- (void)observationsWithAdvertisementsData:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = swift_allocObject(&unk_1010BF0F8, 24, 7);
  *(_QWORD *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0);
  v13 = (_QWORD *)swift_allocObject(&unk_1010BF120, 56, 7);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100CA2D80;
  v13[6] = v12;
  v14 = v8;
  sub_10001BBBC(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("observations(advertisementsData:)", 33, 2, &unk_10111F0A8, v13);
  swift_release();
  swift_release();
  sub_10001BC14(v9, v11);

}

- (void)locationsWithAdvertisementsData:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = swift_allocObject(&unk_1010BF0A8, 24, 7);
  *(_QWORD *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0);
  v13 = (_QWORD *)swift_allocObject(&unk_1010BF0D0, 56, 7);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100CA2D80;
  v13[6] = v12;
  v14 = v8;
  sub_10001BBBC(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("locations(advertisementsData:)", 30, 2, &unk_10111F088, v13);
  swift_release();
  swift_release();
  sub_10001BC14(v9, v11);

}

- (void)latestStatusWithIdentifierData:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = swift_allocObject(&unk_1010BF058, 24, 7);
  *(_QWORD *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0);
  v13 = (_QWORD *)swift_allocObject(&unk_1010BF080, 56, 7);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100CA2D80;
  v13[6] = v12;
  v14 = v8;
  sub_10001BBBC(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("latestStatus", 12, 2, &unk_10111F058, v13);
  swift_release();
  swift_release();
  sub_10001BC14(v9, v11);

}

- (void)latestObservedAdvertisementWithIdentifierData:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = swift_allocObject(&unk_1010BF008, 24, 7);
  *(_QWORD *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0);
  v13 = (_QWORD *)swift_allocObject(&unk_1010BF030, 56, 7);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_100CA2D80;
  v13[6] = v12;
  v14 = v8;
  sub_10001BBBC(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("latestObservedAdvertisement", 27, 2, &unk_10111F048, v13);
  swift_release();
  swift_release();
  sub_10001BC14(v9, v11);

}

- (void)latestAnonymousObservationsWithLimit:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1010BEFB8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  type metadata accessor for Transaction(0);
  v8 = (_QWORD *)swift_allocObject(&unk_1010BEFE0, 48, 7);
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_100CA2D80;
  v8[5] = v7;
  v9 = self;
  swift_retain(v7);
  static Transaction.asyncTask(name:block:)("latestAnonymousObservations", 27, 2, &unk_10111F038, v8);

  swift_release(v7);
  swift_release(v8);
}

- (void)latestDeviceEventWithIdentifierData:(id)a3 source:(id)a4 attachedDevice:(id)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  void *v31;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v32;
  _QWORD *v33;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v34;
  id v35;
  _QWORD v36[2];
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v37;
  uint64_t v38;

  v11 = sub_10001A9A8(&qword_1010ED860);
  v38 = *(_QWORD *)(v11 - 8);
  v12 = *(_QWORD *)(v38 + 64);
  v13 = __chkstk_darwin(v11);
  v14 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)v36 - v15;
  v17 = _Block_copy(a6);
  v18 = a3;
  v37 = self;
  v19 = a4;
  v20 = a5;
  v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v23 = v22;

  if (v20)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v20);

    v24 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v16, 0, 1, v24);
  }
  else
  {
    v25 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v16, 1, 1, v25);
  }
  v26 = swift_allocObject(&unk_1010BEF68, 24, 7);
  *(_QWORD *)(v26 + 16) = v17;
  v36[1] = type metadata accessor for Transaction(0);
  sub_1002A380C((uint64_t)v16, (uint64_t)v14);
  v27 = *(unsigned __int8 *)(v38 + 80);
  v28 = (v27 + 48) & ~v27;
  v29 = (v12 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = (_QWORD *)swift_allocObject(&unk_1010BEF90, v29 + 16, v27 | 7);
  v30[2] = v21;
  v30[3] = v23;
  v30[4] = v19;
  v31 = v19;
  v32 = v37;
  v30[5] = v37;
  sub_1001C0884((uint64_t)v14, (uint64_t)v30 + v28);
  v33 = (_QWORD *)((char *)v30 + v29);
  *v33 = sub_100CA2D80;
  v33[1] = v26;
  v34 = v32;
  v35 = v31;
  sub_10001BBBC(v21, v23);
  swift_retain();
  static Transaction.asyncTask(name:block:)("latestDeviceEvent", 17, 2, &unk_10111F028, v30);
  swift_release();
  swift_release();
  sub_10001BC14(v21, v23);

  sub_100004048((uint64_t)v16, &qword_1010ED860);
}

- (void)attachedEventsWithIdentifierData:(id)a3 attachedDevice:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v30;
  uint64_t v31;
  uint64_t v32;

  v9 = sub_10001A9A8(&qword_1010ED860);
  v32 = *(_QWORD *)(v9 - 8);
  v10 = *(_QWORD *)(v32 + 64);
  v11 = __chkstk_darwin(v9);
  v12 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v14 = (char *)&v31 - v13;
  v15 = _Block_copy(a5);
  v16 = a3;
  v17 = self;
  v18 = a4;
  v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v21 = v20;

  if (v18)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(v18);

    v22 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v14, 0, 1, v22);
  }
  else
  {
    v23 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v14, 1, 1, v23);
  }
  v24 = swift_allocObject(&unk_1010BEF18, 24, 7);
  *(_QWORD *)(v24 + 16) = v15;
  type metadata accessor for Transaction(0);
  sub_1002A380C((uint64_t)v14, (uint64_t)v12);
  v25 = *(unsigned __int8 *)(v32 + 80);
  v26 = (v25 + 40) & ~v25;
  v27 = (v10 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  v28 = (_QWORD *)swift_allocObject(&unk_1010BEF40, v27 + 16, v25 | 7);
  v28[2] = v19;
  v28[3] = v21;
  v28[4] = v17;
  sub_1001C0884((uint64_t)v12, (uint64_t)v28 + v26);
  v29 = (_QWORD *)((char *)v28 + v27);
  *v29 = sub_100CA2D80;
  v29[1] = v24;
  v30 = v17;
  sub_10001BBBC(v19, v21);
  swift_retain();
  static Transaction.asyncTask(name:block:)("attachedEvents", 14, 2, &unk_10111F008, v28);
  swift_release();
  swift_release();
  sub_10001BC14(v19, v21);

  sub_100004048((uint64_t)v14, &qword_1010ED860);
}

- (void)storeDeviceEventWithDeviceEvent:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = swift_allocObject(&unk_1010BEEC8, 24, 7);
  *(_QWORD *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0);
  v13 = (_QWORD *)swift_allocObject(&unk_1010BEEF0, 56, 7);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_10001D1EC;
  v13[6] = v12;
  v14 = v8;
  sub_10001BBBC(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("storeDeviceEvent", 16, 2, &unk_10111EFF8, v13);
  swift_release();
  swift_release();
  sub_10001BC14(v9, v11);

}

- (void)anonymousObservationCountWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010BEE78, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  type metadata accessor for Transaction(0);
  v6 = (_QWORD *)swift_allocObject(&unk_1010BEEA0, 40, 7);
  v6[2] = self;
  v6[3] = sub_10015A53C;
  v6[4] = v5;
  v7 = self;
  swift_retain();
  static Transaction.asyncTask(name:block:)("anonymousObservationCount", 25, 2, &unk_10111EFE8, v6);

  swift_release();
  swift_release();
}

- (void)decimateLowValueObservationsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010BEE28, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  type metadata accessor for Transaction(0);
  v6 = (_QWORD *)swift_allocObject(&unk_1010BEE50, 40, 7);
  v6[2] = self;
  v6[3] = sub_100CA2D80;
  v6[4] = v5;
  v7 = self;
  swift_retain(v5);
  static Transaction.asyncTask(name:block:)("latestAnonymousObservations", 27, 2, &unk_10111EFD8, v6);

  swift_release(v5);
  swift_release(v6);
}

- (void)storeWithKeySyncMetadataData:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v14;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;

  v12 = swift_allocObject(&unk_1010BEDD8, 24, 7);
  *(_QWORD *)(v12 + 16) = v6;
  type metadata accessor for Transaction(0);
  v13 = (_QWORD *)swift_allocObject(&unk_1010BEE00, 56, 7);
  v13[2] = v9;
  v13[3] = v11;
  v13[4] = v8;
  v13[5] = sub_10001D1F0;
  v13[6] = v12;
  v14 = v8;
  sub_10001BBBC(v9, v11);
  swift_retain();
  static Transaction.asyncTask(name:block:)("store(keySyncMetadata)", 22, 2, &unk_10111EFC8, v13);
  swift_release();
  swift_release();
  sub_10001BC14(v9, v11);

}

- (void)metadataWithBeaconIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v21;
  uint64_t v22;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v22 - v12;
  v14 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = swift_allocObject(&unk_1010BED88, 24, 7);
  *(_QWORD *)(v15 + 16) = v14;
  type metadata accessor for Transaction(0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v16 = *(unsigned __int8 *)(v8 + 80);
  v17 = (v16 + 24) & ~v16;
  v18 = (v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject(&unk_1010BEDB0, v18 + 16, v16 | 7);
  *(_QWORD *)(v19 + 16) = self;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v19 + v17, v11, v7);
  v20 = (_QWORD *)(v19 + v18);
  *v20 = sub_100CA2D80;
  v20[1] = v15;
  v21 = self;
  swift_retain(v15);
  static Transaction.asyncTask(name:block:)("metadata(beaconIdentifier)", 26, 2, &unk_10111EFB8, v19);

  swift_release(v15);
  swift_release(v19);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)metadataWithBeaconIdentifier:(id)a3 typesData:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  id v17;
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  void (**v27)(uint64_t, unint64_t, uint64_t);
  _TtC12searchpartyd40ObservationStoreBackendServiceTrampoline *v28;
  uint64_t v29;
  char *v30;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v29 - v14;
  v16 = _Block_copy(a5);
  v30 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = a4;
  v18 = self;
  v19 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v21 = v20;

  v22 = swift_allocObject(&unk_1010BED38, 24, 7);
  *(_QWORD *)(v22 + 16) = v16;
  v29 = type metadata accessor for Transaction(0);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v23 = *(unsigned __int8 *)(v10 + 80);
  v24 = (v23 + 40) & ~v23;
  v25 = (v11 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = (char *)swift_allocObject(&unk_1010BED60, v25 + 16, v23 | 7);
  *((_QWORD *)v26 + 2) = v19;
  *((_QWORD *)v26 + 3) = v21;
  *((_QWORD *)v26 + 4) = v18;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v26[v24], v13, v9);
  v27 = (void (**)(uint64_t, unint64_t, uint64_t))&v26[v25];
  *v27 = sub_100B97EE0;
  v27[1] = (void (*)(uint64_t, unint64_t, uint64_t))v22;
  v28 = v18;
  sub_10001BBBC(v19, v21);
  swift_retain();
  static Transaction.asyncTask(name:block:)("metadata(beaconIdentifier, types)", 33, 2, &unk_10111EF98, v26);
  swift_release();
  swift_release();
  sub_10001BC14(v19, v21);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v30, v9);
}

@end
