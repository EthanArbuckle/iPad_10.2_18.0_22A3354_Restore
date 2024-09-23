@implementation SecureLocationsTrampoline

- (void)startMonitoringStewieStateWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd25SecureLocationsTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10108F3C0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  v6 = self;
  sub_10000E7F0((uint64_t)sub_10001D1EC, v5, "Daemon API: liteloc startMonitoringState", (uint64_t)&unk_10108F3E8, (uint64_t)sub_10001E1C0, (uint64_t)&unk_10108F400);

  swift_release(v5);
}

- (void)subscribeAndFetchLocationForIds:(id)a3 context:(id)a4 completion:(id)a5
{
  sub_10074B800((char *)self, (int)a2, (uint64_t)a3, a4, a5, (void (*)(uint64_t, id, uint64_t, void *))sub_10074FFF0);
}

- (void)unsubscribeForIds:(id)a3 context:(id)a4 completion:(id)a5
{
  sub_10074B800((char *)self, (int)a2, (uint64_t)a3, a4, a5, (void (*)(uint64_t, id, uint64_t, void *))sub_100750430);
}

- (void)publishLocation:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC12searchpartyd25SecureLocationsTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = *(_QWORD *)(*sub_10001AA44((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation+ 16])+ 96);
  _Block_copy(v6);
  v8 = a3;
  v9 = self;
  swift_retain();
  sub_10054E868(v8, v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  swift_release();
  _Block_release(v6);

}

- (void)receivedLocationPayload:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _TtC12searchpartyd25SecureLocationsTrampoline *v12;

  v6 = _Block_copy(a4);
  v7 = a3;
  v12 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  v11 = *(_QWORD **)(*sub_10001AA44((Class *)((char *)&v12->super.isa+ OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&v12->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation+ 16])+ 96);
  _Block_copy(v6);
  swift_retain();
  sub_1005515A8(v8, v10, v11, (uint64_t)v6);
  _Block_release(v6);
  swift_release();
  _Block_release(v6);
  sub_10001BC14(v8, v10);

}

- (void)receivedLocationCommand:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC12searchpartyd25SecureLocationsTrampoline *v12;

  v6 = _Block_copy(a4);
  v7 = a3;
  v12 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  v11 = swift_allocObject(&unk_10108F550, 24, 7);
  *(_QWORD *)(v11 + 16) = v6;
  sub_10001AA44((Class *)((char *)&v12->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&v12->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  swift_retain();
  sub_100539728(v8, v10, (uint64_t)sub_10001D1EC, v11);
  swift_release();
  swift_release();
  sub_10001BC14(v8, v10);

}

- (void)latestLocationFromCacheForId:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC12searchpartyd25SecureLocationsTrampoline *v12;
  _QWORD v13[8];

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_10108F528, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = *(_QWORD *)(*sub_10001AA44((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation+ 16])+ 96);
  type metadata accessor for Transaction(0);
  v13[2] = v11;
  v13[3] = v7;
  v13[4] = v9;
  v13[5] = sub_10059A058;
  v13[6] = v10;
  v12 = self;
  swift_retain();
  static Transaction.named<A>(_:with:)("com.apple.icloud.searchpartyd.secureLocationsLatestLocationFromCache", 68, 2, sub_100750E74, v13, &type metadata for () + 1);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)updateLocationCacheWith:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12searchpartyd25SecureLocationsTrampoline *v10;

  v6 = _Block_copy(a4);
  v7 = sub_10000F4A0(0, (unint64_t *)&qword_1010F1598, SPSecureLocation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  _Block_copy(v6);
  v10 = self;
  sub_1007509B4(v8, v9, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)shareCurrentKeyWithId:(id)a3 idsHandles:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC12searchpartyd25SecureLocationsTrampoline *v14;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v13 = swift_allocObject(&unk_10108F4B0, 24, 7);
  *(_QWORD *)(v13 + 16) = v8;
  v14 = self;
  sub_10074BCC8(v9, v11, v12, (uint64_t)sub_10001D1EC, v13);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)shareCurrentKeyWithId:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC12searchpartyd25SecureLocationsTrampoline *v13;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_10108F488, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  v11 = sub_10001A9A8(&qword_101106C20);
  v12 = swift_allocObject(v11, 48, 7);
  *(_OWORD *)(v12 + 16) = xmmword_100E22B00;
  *(_QWORD *)(v12 + 32) = v7;
  *(_QWORD *)(v12 + 40) = v9;
  v13 = self;
  swift_retain();
  swift_bridgeObjectRetain(v9);
  sub_1008B601C(v12, (uint64_t)_swiftEmptyDictionarySingleton, 0, (uint64_t)sub_10001D1EC, v10);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)performKeyRollWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12searchpartyd25SecureLocationsTrampoline *v7;
  _QWORD v8[6];

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10108F460, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(_QWORD *)(*sub_10001AA44((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation+ 16])+ 80);
  type metadata accessor for Transaction(0);
  v8[2] = v6;
  v8[3] = sub_10001D1EC;
  v8[4] = v5;
  v7 = self;
  swift_retain();
  static Transaction.named<A>(_:with:)("com.apple.icloud.searchpartyd.secureLocations.performKeyroll", 60, 2, sub_100750DE8, v8, &type metadata for () + 1);

  swift_release();
  swift_release();
}

- (void)shouldStartLocationMonitorWithCompletion:(id)a3
{
  _QWORD *v4;
  void (*v5)(_QWORD *, uint64_t, _QWORD);
  _TtC12searchpartyd25SecureLocationsTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = (void (*)(_QWORD *, uint64_t, _QWORD))v4[2];
  v6 = self;
  v5(v4, 1, 0);
  _Block_release(v4);

}

- (void)isLocationPublishingDeviceWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  char v6;
  _TtC12searchpartyd25SecureLocationsTrampoline *v7;

  v4 = _Block_copy(a3);
  v5 = qword_1010EA0A8;
  v7 = self;
  if (v5 != -1)
    swift_once(&qword_1010EA0A8, sub_10098F82C);
  swift_retain();
  v6 = sub_10000D338();
  swift_release();
  (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, v6 & 1, 0);
  _Block_release(v4);

}

- (void)fetchConfigFromServerWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd25SecureLocationsTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10108F438, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  v6 = self;
  swift_retain();
  sub_100521DA8((uint64_t)sub_10001D1EC, v5);

  swift_release();
  swift_release();
}

- (void)simulateFeatureDisabled:(BOOL)a3 completion:(id)a4
{
  void *v6;
  _TtC12searchpartyd25SecureLocationsTrampoline *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_100750C64(a3, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)stopMonitoringStewieStateWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd25SecureLocationsTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10108F2D0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  v6 = self;
  sub_10000E7F0((uint64_t)sub_10001D1F0, v5, "Daemon API: liteloc stopMonitoringState", (uint64_t)&unk_10108F2F8, (uint64_t)sub_100750D60, (uint64_t)&unk_10108F310);

  swift_release();
}

- (void)publishCurrentLocationToStewieWithReason:(int64_t)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC12searchpartyd25SecureLocationsTrampoline *v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject(&unk_10108F258, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  v7 = self;
  sub_10074F890((uint64_t)sub_10059A5E4, v6, "Daemon API: liteloc publishCurrentLocationTo", (uint64_t)&unk_10108F280, (uint64_t)sub_100750D50, (uint64_t)&unk_10108F298);

  swift_release();
}

- (void)currentStewieStateWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd25SecureLocationsTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10108F1E0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  v6 = self;
  sub_10074F890((uint64_t)sub_10059A058, v5, "Daemon API: liteloc currentStateWithCompletion", (uint64_t)&unk_10108F208, (uint64_t)sub_10074FF38, (uint64_t)&unk_10108F220);

  swift_release();
}

- (void)stewiePublishStateWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd25SecureLocationsTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10108F168, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  v6 = self;
  sub_10074F890((uint64_t)sub_10059A5E4, v5, "Daemon API: publishState", (uint64_t)&unk_10108F190, (uint64_t)sub_10074FF10, (uint64_t)&unk_10108F1A8);

  swift_release();
}

- (void)triggerStewieProactiveNotification
{
  _TtC12searchpartyd25SecureLocationsTrampoline *v3;

  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation + 16]);
  v3 = self;
  sub_10074FBC0();

}

- (_TtC12searchpartyd25SecureLocationsTrampoline)init
{
  _TtC12searchpartyd25SecureLocationsTrampoline *result;

  result = (_TtC12searchpartyd25SecureLocationsTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.SecureLocationsTrampoline", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd25SecureLocationsTrampoline_implementation));
}

@end
