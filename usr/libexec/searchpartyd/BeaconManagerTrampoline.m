@implementation BeaconManagerTrampoline

- (void)unknownBeaconsForUUIDs:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12searchpartyd23BeaconManagerTrampoline *v10;

  v6 = _Block_copy(a4);
  v7 = type metadata accessor for UUID(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = swift_allocObject(&unk_10107FEC8, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v10 = self;
  sub_10000BF40(v8, (uint64_t)sub_10001D2A0, v9);

  swift_bridgeObjectRelease();
  swift_release(v9);
}

- (void)clientConfigurationWithCompletion:(id)a3
{
  void *v4;
  _TtC12searchpartyd23BeaconManagerTrampoline *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10032FFA4((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)startUpdatingSimpleBeaconsWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd23BeaconManagerTrampoline *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10000E580(v7, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)isUTAppAlertDisabled:(id)a3
{
  void (**v4)(void *, id);
  uint64_t v5;
  _QWORD *v6;
  id v7;
  NSString v8;
  id v9;
  _TtC12searchpartyd23BeaconManagerTrampoline *v10;

  v4 = (void (**)(void *, id))_Block_copy(a3);
  v5 = qword_1010E9D08;
  v10 = self;
  if (v5 != -1)
    swift_once(&qword_1010E9D08, sub_10059A6E0);
  v6 = sub_100013B60();
  v7 = sub_100013BD0();
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v7, "BOOLForKey:", v8);
  swift_release(v6);

  v4[2](v4, v9);
  _Block_release(v4);

}

- (void)beaconGroupsForUUIDs:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12searchpartyd23BeaconManagerTrampoline *v10;

  v6 = _Block_copy(a4);
  v7 = type metadata accessor for UUID(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = swift_allocObject(&unk_10107FF90, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v10 = self;
  sub_10001ADAC(v8, (uint64_t)sub_10001700C, v9);

  swift_bridgeObjectRelease();
  swift_release(v9);
}

- (void)fetchSeparationMonitoringStatus:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_100004B3C);
}

- (void)safeLocationsWithCompletion:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_10000EEA4);
}

- (void)firmwareUpdateCandidateBeaconsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd23BeaconManagerTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10105DE30, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1001CAE98((uint64_t)sub_1001D32FC, v5);

  swift_release();
}

- (void)updateBeaconUUID:(id)a3 firmwareUpdateState:(int64_t)a4 systemVersion:(id)a5 error:(id)a6 completion:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _TtC12searchpartyd23BeaconManagerTrampoline *v20;
  id v21;
  uint64_t v22;

  v13 = type metadata accessor for UUID(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a5)
  {
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    a5 = v19;
  }
  else
  {
    v18 = 0;
  }
  _Block_copy(v17);
  v20 = self;
  v21 = a6;
  sub_1001D14FC((uint64_t)v16, a4, v18, (uint64_t)a5, (uint64_t)a6, (uint64_t)v20, (void (**)(_QWORD, _QWORD))v17);
  _Block_release(v17);
  _Block_release(v17);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)beaconsInFirmwareUpdateState:(int64_t)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _TtC12searchpartyd23BeaconManagerTrampoline *v14;
  uint64_t v15;

  v9 = type metadata accessor for DateInterval(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v13);
  v14 = self;
  sub_1001D16E8(a3, (uint64_t)v12, (char *)v14, (uint64_t)v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)initiateFirmwareUpdateForAllEligibleBeaconsWithCompletion:(id)a3
{
  void *v4;
  _TtC12searchpartyd23BeaconManagerTrampoline *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1001D19EC((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)firmwareUpdateStateForBeaconUUID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC12searchpartyd23BeaconManagerTrampoline *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_10105DAC0, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_1001CB50C((unint64_t)v10, (uint64_t)sub_10001D390, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)didObserveUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12searchpartyd23BeaconManagerTrampoline *v10;
  void (*v11)(uint64_t, void *);

  v6 = _Block_copy(a4);
  v7 = sub_10000F4A0(0, &qword_1010F4B10, SPUnauthorizedTrackingObservation_ptr);
  v8 = sub_1000170AC(&qword_1010FF860, &qword_1010F4B10, SPUnauthorizedTrackingObservation_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v6);
  v10 = self;
  v11 = (void (*)(uint64_t, void *))sub_1007928C0();
  sub_100582FD0(v9, v11, v6);
  _Block_release(v6);
  swift_release();
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)standaloneBeaconsForUUIDs:(NSArray *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSArray *v15;
  _TtC12searchpartyd23BeaconManagerTrampoline *v16;
  uint64_t v17;

  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_101080148, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_101080170, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1010FF838;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_101080198, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1010FF840;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_100665F70((uint64_t)v9, (uint64_t)&unk_1010FF848, (uint64_t)v14);
  swift_release();
}

- (void)beaconingIdentifierForMACAddress:(id)a3 completion:(id)a4
{
  sub_100591A28(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_100594ADC);
}

- (void)fetchFindMyNetworkStatusForMACAddress:(id)a3 completion:(id)a4
{
  sub_100591A28(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_100594EE0);
}

- (void)connectUsingMACAddress:(id)a3 longTermKey:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _TtC12searchpartyd23BeaconManagerTrampoline *v17;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v17 = self;
  v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;

  v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v16 = v15;

  _Block_copy(v8);
  sub_100595448(v11, v13, v14, v16, (uint64_t)v17, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_10001BC14(v14, v16);
  sub_10001BC14(v11, v13);

}

- (void)disconnectFromMACAddress:(id)a3 completion:(id)a4
{
  sub_100591A28(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_1005957FC);
}

- (void)setFindMyNetworkStatusForMACAddress:(id)a3 status:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC12searchpartyd23BeaconManagerTrampoline *v13;

  v5 = a4;
  v8 = _Block_copy(a5);
  v9 = a3;
  v13 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  _Block_copy(v8);
  sub_100595B7C(v10, v12, v5, (uint64_t)v13, v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_10001BC14(v10, v12);

}

- (void)beaconForIdentifier:(id)a3 completion:(id)a4
{
  sub_100590FF0((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, uint64_t, void *))sub_100332CF0);
}

- (void)beaconGroupForIdentifier:(id)a3 completion:(id)a4
{
  sub_100590FF0((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, uint64_t, void *))sub_100332F6C);
}

- (void)ownerSessionStateWithCompletion:(id)a3
{
  void *v4;
  _TtC12searchpartyd23BeaconManagerTrampoline *v5;
  char v6;

  v4 = _Block_copy(a3);
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v5 = self;
  _Block_copy(v4);
  sub_1007FDEC4();
  QueueSynchronizer.conditionalSync<A>(_:)(sub_100293CD4);
  swift_release();
  sub_1005960F0(v6, (uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);

  _Block_release(v4);
}

- (void)simulateAccessoryPairing:(id)a3 name:(id)a4 isAirPods:(BOOL)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  _TtC12searchpartyd23BeaconManagerTrampoline *v16;

  v10 = _Block_copy(a6);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  v14 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v10);
  v15 = a3;
  v16 = self;
  sub_1004C27B4(v15, v11, v13, a5, v14, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

- (void)fetchUnauthorizedEncryptedPayload:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC12searchpartyd23BeaconManagerTrampoline *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_10107FF68, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  v14 = static os_log_type_t.default.getter(v13);
  if (qword_1010EA2F8 != -1)
    swift_once(&qword_1010EA2F8, sub_100B5E19C);
  v15 = qword_1011B7DD8;
  v16 = sub_10001A9A8((uint64_t *)&unk_1010ED710);
  v17 = swift_allocObject(v16, 72, 7);
  *(_OWORD *)(v17 + 16) = xmmword_100E22B00;
  v18 = UUID.uuidString.getter(v17);
  v20 = v19;
  *(_QWORD *)(v17 + 56) = &type metadata for String;
  *(_QWORD *)(v17 + 64) = sub_10001AA00();
  *(_QWORD *)(v17 + 32) = v18;
  *(_QWORD *)(v17 + 40) = v20;
  os_log(_:dso:log:_:_:)(v14, &_mh_execute_header, v15, "fetchUnauthorizedEncryptedPayload %@", 36, 2, v17);
  swift_bridgeObjectRelease();
  sub_10001AA44((Class *)((char *)&v13->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&v13->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  sub_100483D60((uint64_t)v10, (uint64_t)sub_10059A098, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)stopFetchingUnauthorizedEncryptedPayloadWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd23BeaconManagerTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10107FF40, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10059143C((uint64_t)sub_10001D1EC, v5);

  swift_release();
}

- (void)beaconStoreStatusWithCompletion:(id)a3
{
  void (**v4)(void *, _QWORD);
  _TtC12searchpartyd23BeaconManagerTrampoline *v5;
  unsigned __int8 v6;

  v4 = (void (**)(void *, _QWORD))_Block_copy(a3);
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v5 = self;
  sub_1007FDEC4();
  QueueSynchronizer.conditionalSync<A>(_:)(sub_100293CD4);
  swift_release();
  v4[2](v4, v6);
  _Block_release(v4);

}

- (void)hintBasedIndexSearchForBeacon:(id)a3 baseIndex:(id)a4 hint:(unsigned __int8)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _TtC12searchpartyd23BeaconManagerTrampoline *v18;
  uint64_t v19;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  *(_QWORD *)(swift_allocObject(&unk_10107FF18, 24, 7) + 16) = v15;
  v16 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v17 = a4;
  v18 = self;
  sub_1003340CC((uint64_t)v14, v17, a5, v16, (void (*)(_QWORD *, void *))sub_10059A090);

  swift_release();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)forceKeySyncForBeaconUUID:(id)a3 lastObservationDate:(id)a4 lastObservationIndex:(unint64_t)a5 completion:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  _TtC12searchpartyd23BeaconManagerTrampoline *v20;
  uint64_t v21;
  unint64_t v22;

  v22 = a5;
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for UUID(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v19 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v18);
  v20 = self;
  sub_100335064((uint64_t)v17, (uint64_t)v13, v22, v19, (uint64_t)v18);
  _Block_release(v18);
  _Block_release(v18);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)fakeClassicPairingWithMACAddress:(id)a3 completion:(id)a4
{
  sub_100591A28(self, (int)a2, a3, a4, (void (*)(uint64_t, unint64_t, id, void *))sub_100596510);
}

- (void)forceRePairingWithUUID:(id)a3 partIds:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char **v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _TtC12searchpartyd23BeaconManagerTrampoline *v16;
  uint64_t v17;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char **)((char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = sub_10000F4A0(0, (unint64_t *)&qword_101103A90, NSNumber_ptr);
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v14);
  _Block_copy(v13);
  v16 = self;
  sub_1005967DC(v12, v15, (uint64_t)v16, v13);
  _Block_release(v13);
  _Block_release(v13);

  swift_bridgeObjectRelease();
  (*(void (**)(char **, uint64_t))(v10 + 8))(v12, v9);
}

- (void)waitForBeaconStoreAvailableWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12searchpartyd23BeaconManagerTrampoline *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10107FEF0, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(_QWORD *)(*sub_10001AA44((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation+ 16])+ 280);
  v7 = self;
  sub_10086B3DC(v6, (void (*)(uint64_t))sub_1004D47C0, v5);

  swift_release();
}

- (void)beaconsToMaintainWithCompletion:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_100596C94);
}

- (void)beaconsToMaintainPersistentConnection:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd23BeaconManagerTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v4);
  v6 = self;
  sub_100334388(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)ignoreBeaconByUUID:(id)a3 until:(unint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC12searchpartyd23BeaconManagerTrampoline *v11;
  uint64_t v12;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = self;
  sub_100591CFC((uint64_t)v10, a4);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)didDetectUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12searchpartyd23BeaconManagerTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = sub_10000F4A0(0, &qword_1010F4B10, SPUnauthorizedTrackingObservation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  v9 = self;
  sub_100596F24(v8, (uint64_t)v9, (uint64_t)v6, "detected unauthorized tracking", 30, 0x8000000100EDB460, (uint64_t)sub_100583DC4);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)didUpdateUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC12searchpartyd23BeaconManagerTrampoline *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_100596F24((uint64_t)v7, (uint64_t)v8, (uint64_t)v6, "update unauthorized tracking", 28, 0x8000000100EDAFE0, (uint64_t)sub_100587A90);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)didWithdrawUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12searchpartyd23BeaconManagerTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = sub_10000F4A0(0, &qword_1010F4B10, SPUnauthorizedTrackingObservation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  v9 = self;
  sub_100597100(v8, (uint64_t)v9, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)ignoringUnauthorizedTrackingWithCompletion:(id)a3 completion:(id)a4
{
  sub_100593588(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1005972DC);
}

- (void)unauthorizedTrackingTypeWithCompletion:(id)a3 completion:(id)a4
{
  sub_100593588(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100597530);
}

- (void)acceptUTForBeaconUUID:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12searchpartyd23BeaconManagerTrampoline *v9;
  uint64_t v10;

  v5 = type metadata accessor for UUID(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1005920D0((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)playUnauthorizedSoundOnBeaconUUID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC12searchpartyd23BeaconManagerTrampoline *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_1005976AC((uint64_t)v10, (uint64_t)v12, v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)ignoreTrackingForUUID:(id)a3 until:(unint64_t)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(uint64_t);
  uint64_t v14;
  _TtC12searchpartyd23BeaconManagerTrampoline *v15;
  uint64_t v16;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (void (*)(uint64_t))_Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (v13)
  {
    v14 = swift_allocObject(&unk_10107FEA0, 24, 7);
    *(_QWORD *)(v14 + 16) = v13;
    v13 = (void (*)(uint64_t))sub_10001D1EC;
  }
  else
  {
    v14 = 0;
  }
  v15 = self;
  sub_10059235C((uint64_t)v12, a4, v13, v14);
  sub_10001D8A8((uint64_t)v13, v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)ignoreBeaconByUUID:(id)a3 untilDate:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  _TtC12searchpartyd23BeaconManagerTrampoline *v18;
  uint64_t v19;
  uint64_t v20;

  v20 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (void (*)(uint64_t))_Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  if (v16)
  {
    v17 = swift_allocObject(&unk_10107FE78, 24, 7);
    *(_QWORD *)(v17 + 16) = v16;
    v16 = (void (*)(uint64_t))sub_10001D1EC;
  }
  else
  {
    v17 = 0;
  }
  v18 = self;
  sub_1005925E4((uint64_t)v15, (uint64_t)v11, v16, v17);
  sub_10001D8A8((uint64_t)v16, v17);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v20);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

- (void)ignoreTrackingFor:(id)a3 until:(unint64_t)a4 completion:(id)a5
{
  void (*v8)(uint64_t);
  uint64_t v9;
  id v10;
  _TtC12searchpartyd23BeaconManagerTrampoline *v11;

  v8 = (void (*)(uint64_t))_Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_10107FE50, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = (void (*)(uint64_t))sub_10001D1EC;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_1005928C8(v10, a4, v8, v9);
  sub_10001D8A8((uint64_t)v8, v9);

}

- (void)disableUTAppAlert:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void (*v8)(_QWORD);
  uint64_t v9;
  _TtC12searchpartyd23BeaconManagerTrampoline *v10;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10107FE28, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = (void (*)(_QWORD))sub_10001D1EC;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = qword_1010E9D08;
  v10 = self;
  if (v9 != -1)
    swift_once(&qword_1010E9D08, sub_10059A6E0);
  sub_100013B60();
  sub_100B0518C(a3);
  swift_release();
  if (v6)
  {
    v8(0);
    sub_10001D8A8((uint64_t)v8, v7);
  }

}

- (void)updateBatteryStatus:(unsigned __int8)a3 beaconUUID:(id)a4 completion:(id)a5
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  _TtC12searchpartyd23BeaconManagerTrampoline *v15;
  uint64_t v16;

  v7 = a3;
  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = swift_allocObject(&unk_10107FE00, 24, 7);
  *(_QWORD *)(v14 + 16) = v13;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v15 = self;
  sub_10031A1F4(v7, (uint64_t)v12, (uint64_t)sub_10001D1EC, v14);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)latestLocationsForIdentifiers:(id)a3 fetchLimit:(id)a4 sources:(id)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _TtC12searchpartyd23BeaconManagerTrampoline *v24;
  uint64_t v25;

  v11 = sub_10001A9A8((uint64_t *)&unk_1010EA690);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = type metadata accessor for UUID(0);
  v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v15);
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v17 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 0, 1, v17);
  }
  else
  {
    v18 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v13, 1, 1, v18);
  }
  type metadata accessor for SPBeaconLocationSource(0);
  v20 = v19;
  v21 = sub_100006204(&qword_1010EB580, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconLocationSource, (uint64_t)&unk_100E20D48);
  v22 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a5, v20, v21);
  v23 = swift_allocObject(&unk_10107FDD8, 24, 7);
  *(_QWORD *)(v23 + 16) = v14;
  v24 = self;
  sub_100592CF4(v16, (uint64_t)v13, v22, (uint64_t)sub_10059A070, v23);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_100004048((uint64_t)v13, (uint64_t *)&unk_1010EA690);
}

- (void)locationForContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC12searchpartyd23BeaconManagerTrampoline *v9;
  int64_t v10;
  _QWORD v11[12];

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10107FDB0, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_100C92E68(v8, (uint64_t)v11);
  v10 = *sub_10001AA44((Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&v9->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  swift_retain();
  sub_100330DA8((char *)v11, v10, (void (*)(id, _QWORD))sub_10059A058, v7);
  swift_release();
  sub_1000122FC(v11);

  swift_release();
}

- (void)rawSearchResultsForIdentifier:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _TtC12searchpartyd23BeaconManagerTrampoline *v20;
  _BYTE v21[16];
  uint64_t v22;
  _BYTE *v23;
  void (*v24)(uint64_t);
  uint64_t v25;

  v9 = type metadata accessor for DateInterval(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = type metadata accessor for UUID(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = &v21[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = swift_allocObject(&unk_10107FD88, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  type metadata accessor for Transaction(0);
  v22 = v19;
  v23 = v16;
  v24 = sub_10059A014;
  v25 = v18;
  v20 = self;
  static Transaction.named<A>(_:with:)("com.apple.icloud.searchpartyd.BeaconManagerService.rawSearchResults", 67, 2, sub_10059A03C, v21);

  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)forceDistributeKeysWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd23BeaconManagerTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10107FD60, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  if (*(_QWORD *)(*sub_10001AA44((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation+ 16])+ 40))
  {
    v6 = self;
    swift_retain();
    sub_100382A1C((uint64_t)sub_10001D1EC, v5);

    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)forceUpdateKeyMapsForUUID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC12searchpartyd23BeaconManagerTrampoline *v14;
  uint64_t v15;

  v7 = sub_10001A9A8(&qword_1010ED860);
  __chkstk_darwin(v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v11 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    v12 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  v13 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v10);
  v14 = self;
  sub_1003335BC((uint64_t)v9, v13, (uint64_t)v10);
  _Block_release(v10);
  _Block_release(v10);

  sub_100004048((uint64_t)v9, &qword_1010ED860);
}

- (void)forceUpdateKeyAlignmentRecordForUUID:(id)a3 completion:(id)a4
{
  sub_100590FF0((char *)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, uint64_t, void *))sub_100333B40);
}

- (void)removeBeacon:(id)a3 completion:(id)a4
{
  sub_100593588(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100597874);
}

- (void)executeCommand:(id)a3 completion:(id)a4
{
  sub_100593588(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100597D7C);
}

- (void)sendRegisterIntentWithCompletion:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_10059904C);
}

- (void)sendUnregisterIntentWithCompletion:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_100599368);
}

- (void)requestLiveLocationForUUID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC12searchpartyd23BeaconManagerTrampoline *v15;
  _BYTE v16[16];
  uint64_t v17;
  _BYTE *v18;
  uint64_t (*v19)();
  uint64_t v20;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v16[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_10107FBA8, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  type metadata accessor for Transaction(0);
  v14 = swift_allocObject(&unk_10107FBD0, 24, 7);
  swift_weakInit(v14 + 16, v13);
  v17 = v14;
  v18 = v10;
  v19 = sub_10059A5E8;
  v20 = v12;
  v15 = self;
  static Transaction.named<A>(_:with:)("requestLiveLocationForUUID", 26, 2, sub_100599E68, v16);

  swift_release();
  swift_release();
  (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)requestLiveLocationForFriend:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _TtC12searchpartyd23BeaconManagerTrampoline *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_10107FB80, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v11 = self;
  sub_1003221AC(v7, v9, (uint64_t)sub_100599E3C, v10);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)allObservationsForBeacon:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC12searchpartyd23BeaconManagerTrampoline *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_1007B8078((uint64_t)v10, (uint64_t)v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)peripheralConnectionMaterialForAccessoryIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  void (**v27)(void *, char);
  _TtC12searchpartyd23BeaconManagerTrampoline *v28;
  char *v29;
  _TtC12searchpartyd23BeaconManagerTrampoline *v30;

  v30 = self;
  v7 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v7);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = v9;
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = __chkstk_darwin(v10);
  v14 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v16 = (char *)&v29 - v15;
  v17 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = swift_allocObject(&unk_10107FB08, 24, 7);
  *(_QWORD *)(v18 + 16) = v17;
  v19 = sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v20 = swift_allocObject(&unk_10107FB30, 32, 7);
  *(_QWORD *)(v20 + 16) = sub_10015A53C;
  *(_QWORD *)(v20 + 24) = v18;
  v21 = *v19;
  v22 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 1, 1, v22);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  v23 = *(unsigned __int8 *)(v11 + 80);
  v24 = (v23 + 40) & ~v23;
  v25 = (v12 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
  v26 = (char *)swift_allocObject(&unk_10107FB58, v25 + 16, v23 | 7);
  *((_QWORD *)v26 + 2) = 0;
  *((_QWORD *)v26 + 3) = 0;
  *((_QWORD *)v26 + 4) = v21;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v26[v24], v14, v10);
  v27 = (void (**)(void *, char))&v26[v25];
  *v27 = sub_100599CD8;
  v27[1] = (void (*)(void *, char))v20;
  v28 = v30;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100691AC0((uint64_t)v29, (uint64_t)&unk_1010FF7B8, (uint64_t)v26);

  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void)readRawAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5
{
  sub_100593DE8(self, (int)a2, a3, a4, a5, (void (*)(uint64_t, unint64_t, uint64_t, void *))sub_10059957C);
}

- (void)readAISMetadataFromMACAddress:(id)a3 useOwnerControlPoint:(BOOL)a4 completion:(id)a5
{
  sub_100593DE8(self, (int)a2, a3, a4, a5, (void (*)(uint64_t, unint64_t, uint64_t, void *))sub_1005997F0);
}

- (void)readRawAISMetadataForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC12searchpartyd23BeaconManagerTrampoline *v14;
  uint64_t v15;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_10107F9F0, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v14 = self;
  sub_1004D4A48((uint64_t)v10, v13, (void (*)(void *, uint64_t))sub_10059A5E4, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)readAISMetadataForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC12searchpartyd23BeaconManagerTrampoline *v14;
  uint64_t v15;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_10107F9C8, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v14 = self;
  sub_1004D52FC((uint64_t)v10, v13, (void (*)(void *, uint64_t))sub_10059A5E4, v12);

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)publishWildModeRecordsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC12searchpartyd23BeaconManagerTrampoline *v8;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10107F950, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = swift_allocObject(&unk_10107F978, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_10001D1F0;
  *(_QWORD *)(v6 + 24) = v5;
  type metadata accessor for Transaction(0);
  v7 = swift_allocObject(&unk_10107F9A0, 32, 7);
  *(_QWORD *)(v7 + 16) = sub_100594240;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  static Transaction.asyncTask(name:block:)("BeaconManagerService.publishWildModeRecords", 43, 2, &unk_1010FF7A0, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (void)enableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4
{
  sub_10075B5E4(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id, void *))sub_1007799C0);
}

- (void)disableSeparationMonitoringForBeacons:(id)a3 completion:(id)a4
{
  sub_10075B5E4(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id, void *))sub_100779BD4);
}

- (void)addSafeLocation:(id)a3 completion:(id)a4
{
  sub_100593588(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100779DAC);
}

- (void)removeSafeLocation:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC12searchpartyd23BeaconManagerTrampoline *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_100779FC0((uint64_t)v10, (uint64_t)v12, (void (**)(_QWORD, _QWORD, _QWORD))v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)updateSafeLocation:(id)a3 completion:(id)a4
{
  sub_100593588(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_10077A180);
}

- (void)assignSafeLocation:(id)a3 to:(id)a4 completion:(id)a5
{
  sub_10075C1BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (void (*)(char *, uint64_t, id, void *))sub_10077A390);
}

- (void)unassignSafeLocation:(id)a3 from:(id)a4 completion:(id)a5
{
  sub_10075C1BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, (void (*)(char *, uint64_t, id, void *))sub_10077A578);
}

- (void)beaconsToMonitorForSeparation:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_10077B3E0);
}

- (void)publishSeparationEventForBeacons:(id)a3 eventType:(int64_t)a4 region:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _TtC12searchpartyd23BeaconManagerTrampoline *v17;

  v10 = _Block_copy(a6);
  v11 = type metadata accessor for UUID(0);
  v12 = sub_100006204(&qword_1010F98B0, (uint64_t (*)(uint64_t))&type metadata accessor for UUID, (uint64_t)&protocol conformance descriptor for UUID);
  v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v11, v12);
  v14 = swift_allocObject(&unk_101090BA0, 24, 7);
  *(_QWORD *)(v14 + 16) = v10;
  v15 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v16 = a5;
  v17 = self;
  sub_10077B86C(v13, a4, v16, v15, (void (*)(_QWORD, _QWORD))sub_10001EEDC, v14);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)forceLOIBasedSafeLocationRefresh:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd23BeaconManagerTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_101090B50, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_10075C910((uint64_t)sub_1001D1C04, v5);

  swift_release();
}

- (void)activeCompanionWithCompletion:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_10077C2CC);
}

- (void)updateObfuscatedIdentifierWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd23BeaconManagerTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010B0670, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v6 = self;
  sub_100C35DBC((uint64_t)sub_10001D1EC, v5);

  swift_release();
}

- (void)primaryAccountModified
{
  _TtC12searchpartyd23BeaconManagerTrampoline *v3;

  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v3 = self;
  sub_100271FBC();

}

- (void)removeLocalAccountDataWithCompletion:(id)a3
{
  sub_100B950C0(self, (int)a2, a3, (uint64_t)&unk_1010B0648, (uint64_t)sub_100B981AC, (void (*)(uint64_t, uint64_t))sub_100B8F36C);
}

- (void)beaconingStateWithCompletion:(id)a3
{
  sub_100B950C0(self, (int)a2, a3, (uint64_t)&unk_1010B0620, (uint64_t)sub_10001D390, (void (*)(uint64_t, uint64_t))sub_100B8F5B8);
}

- (void)beaconForUUID:(id)a3 completion:(id)a4
{
  sub_100B902F8(self, (uint64_t)a2, (uint64_t)a3, a4, 0xD000000000000017, 0x8000000100ED85D0, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_1004BE878);
}

- (void)ownedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4
{
  sub_100B902F8(self, (uint64_t)a2, (uint64_t)a3, a4, 0xD000000000000026, 0x8000000100EF0590, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_1004C2D90);
}

- (void)createOwnedDeviceKeyRecordForUUID:(id)a3 completion:(id)a4
{
  sub_100B902F8(self, (uint64_t)a2, (uint64_t)a3, a4, 0xD00000000000002BLL, 0x8000000100EF0560, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_1004C4194);
}

- (void)purgeOwnedDeviceKeyRecordsForUUID:(id)a3 completion:(id)a4
{
  sub_100B902F8(self, (uint64_t)a2, (uint64_t)a3, a4, 0xD00000000000002BLL, 0x8000000100EF0530, (uint64_t (*)(uint64_t, _QWORD, uint64_t))sub_1004C4DA0);
}

- (void)notificationBeaconForSubscriptionId:(id)a3 completion:(id)a4
{
  sub_100B902F8(self, (uint64_t)a2, (uint64_t)a3, a4, 0xD000000000000031, 0x8000000100EF04F0, sub_1004C62B4);
}

- (void)allBeaconsWithCompletion:(id)a3
{
  sub_100B950C0(self, (int)a2, a3, (uint64_t)&unk_1010B05F8, (uint64_t)sub_100B982D8, (void (*)(uint64_t, uint64_t))sub_100B8F820);
}

- (void)allBeaconsOfTypes:(id)a3 includeDupes:(BOOL)a4 includeHidden:(BOOL)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _TtC12searchpartyd23BeaconManagerTrampoline *v16;

  v10 = _Block_copy(a6);
  type metadata accessor for SPBeaconType(0);
  v12 = v11;
  v13 = sub_100006204(&qword_101116A20, (uint64_t (*)(uint64_t))type metadata accessor for SPBeaconType, (uint64_t)&unk_100E1DEEC);
  v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v12, v13);
  v15 = swift_allocObject(&unk_1010B05D0, 24, 7);
  *(_QWORD *)(v15 + 16) = v10;
  v16 = self;
  sub_100B8FA64(v14, a4, a5, (uint64_t)sub_100B982D8, v15);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)unacceptedBeaconsWithCompletion:(id)a3
{
  sub_100B950C0(self, (int)a2, a3, (uint64_t)&unk_1010B05A8, (uint64_t)sub_100B982D8, (void (*)(uint64_t, uint64_t))sub_100B8FCAC);
}

- (void)beaconingKeysOfType:(int64_t)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC12searchpartyd23BeaconManagerTrampoline *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1010B0580, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_100B8FCEC(a3, (uint64_t)sub_100B981A4, v7);

  swift_release();
}

- (void)beaconingKeysForUUID:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _TtC12searchpartyd23BeaconManagerTrampoline *v18;
  uint64_t v19;

  v9 = type metadata accessor for DateInterval(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UUID(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v17);
  v18 = self;
  sub_100B95A50((uint64_t)v16, (uint64_t)v12, (uint64_t)v18, (void (**)(_QWORD, _QWORD))v17);
  _Block_release(v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)setServiceState:(id)a3 completion:(id)a4
{
  void (**v6)(void *, _QWORD);
  uint64_t v7;
  id v8;
  id v9;
  _TtC12searchpartyd23BeaconManagerTrampoline *v10;

  v6 = (void (**)(void *, _QWORD))_Block_copy(a4);
  v7 = qword_1010E9D08;
  v8 = a3;
  v10 = self;
  if (v7 != -1)
    swift_once(&qword_1010E9D08, sub_10059A6E0);
  v9 = v8;
  sub_100013B60();
  sub_100B04380(v9);
  swift_release();
  v6[2](v6, 0);
  _Block_release(v6);

}

- (void)getMacBeaconConfigWithCompletion:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_100B95BC0);
}

- (void)bluetoothPowerStateUpdated:(int64_t)a3
{
  _TtC12searchpartyd23BeaconManagerTrampoline *v5;

  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v5 = self;
  sub_100B12B70(a3);

}

- (void)isLPEMModeSupportedWithCompletion:(id)a3
{
  sub_100B90250((char *)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1004C6EB0);
}

- (void)userHasAcknowledgeFindMyWithCompletion:(id)a3
{
  void (**v4)(void *, id);
  void *v5;
  id v6;
  id v7;
  _TtC12searchpartyd23BeaconManagerTrampoline *v8;

  v4 = (void (**)(void *, id))_Block_copy(a3);
  v5 = (void *)objc_opt_self(NSUserDefaults);
  v8 = self;
  v6 = objc_msgSend(v5, "standardUserDefaults");
  v7 = objc_msgSend(v6, "userHasAcknowledgedFindMy");

  v4[2](v4, v7);
  _Block_release(v4);

}

- (void)setUserHasAcknowledgedFindMy:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC12searchpartyd23BeaconManagerTrampoline *v8;

  v6 = _Block_copy(a4);
  v7 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v6);
  v8 = self;
  sub_1004C6F4C(a3, v7, (void (**)(_QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)setSuppressLPEMBeaconing:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC12searchpartyd23BeaconManagerTrampoline *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1010B0558, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v8 = self;
  sub_10048B95C(a3, (uint64_t)sub_100B9837C, v7);

  swift_release();
}

- (void)offlineAdvertisingKeysForReason:(int64_t)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC12searchpartyd23BeaconManagerTrampoline *v8;

  v6 = _Block_copy(a4);
  v7 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  _Block_copy(v6);
  v8 = self;
  sub_1004D2024(a3, v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)allPairingErrorsWithCompletion:(id)a3
{
  sub_100B90250((char *)self, (int)a2, a3, (void (*)(uint64_t, void *))sub_1002958E0);
}

- (void)postedLocalNotifyWhenFoundNotificationForUUID:(id)a3 completion:(id)a4
{
  sub_100B902F8(self, (uint64_t)a2, (uint64_t)a3, a4, 0xD000000000000037, 0x8000000100EF0460, sub_1004C2B8C);
}

- (void)commandKeysForUUIDs:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12searchpartyd23BeaconManagerTrampoline *v10;

  v6 = _Block_copy(a4);
  v7 = type metadata accessor for UUID(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = swift_allocObject(&unk_1010B0530, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v10 = self;
  sub_100B903EC(v8, (uint64_t)sub_100B982D4, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)commandKeysForUUIDs:(id)a3 dateInterval:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _TtC12searchpartyd23BeaconManagerTrampoline *v17;
  uint64_t v18;

  v9 = type metadata accessor for DateInterval(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = type metadata accessor for UUID(0);
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v14);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = swift_allocObject(&unk_1010B0508, 24, 7);
  *(_QWORD *)(v16 + 16) = v13;
  v17 = self;
  sub_100B906A0(v15, (uint64_t)v12, (uint64_t)sub_100B98198, v16);

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)allBeaconingKeysForUUID:(id)a3 dateInterval:(id)a4 forceGenerate:(BOOL)a5 completion:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  void *v18;
  _TtC12searchpartyd23BeaconManagerTrampoline *v19;
  _BYTE v20[12];
  _BOOL4 v21;

  v21 = a5;
  v10 = type metadata accessor for DateInterval(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = &v20[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = type metadata accessor for UUID(0);
  v15 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v17 = &v20[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v18);
  v19 = self;
  sub_100B95DC0((uint64_t)v17, (uint64_t)v13, v21, (uint64_t)v19, (void (**)(_QWORD, _QWORD))v18);
  _Block_release(v18);
  _Block_release(v18);

  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v17, v14);
}

- (void)commandKeysForUUID:(id)a3 withCriteria:(id)a4 completion:(id)a5
{
  sub_100B90CFC(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (void (*)(char *, id, id, void *))sub_100B95F34);
}

- (void)fetchAllKeyMapFileDescriptorsWithCompletion:(id)a3
{
  sub_100B90C4C(self, (int)a2, a3, 0xD00000000000002ALL, 0x8000000100ED8240, (uint64_t (*)(_QWORD, uint64_t))sub_1004C7A90);
}

- (void)allDuriansWithCompletion:(id)a3
{
  sub_100B950C0(self, (int)a2, a3, (uint64_t)&unk_1010B04B8, (uint64_t)sub_100B98168, (void (*)(uint64_t, uint64_t))sub_100B90A94);
}

- (void)roleCategoriesWithCompletion:(id)a3
{
  sub_100B90C4C(self, (int)a2, a3, 0xD00000000000001BLL, 0x8000000100ED8200, (uint64_t (*)(_QWORD, uint64_t))sub_1004C81F0);
}

- (void)setRole:(int64_t)a3 beaconId:(id)a4 completion:(id)a5
{
  sub_100B91130(self, (uint64_t)a2, a3, (uint64_t)a4, a5, 0xD00000000000001FLL, 0x8000000100ED8130, (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_1004C8718);
}

- (void)updateBeacon:(id)a3 updates:(id)a4 completion:(id)a5
{
  sub_100B90CFC(self, (uint64_t)a2, (uint64_t)a3, a4, a5, (void (*)(char *, id, id, void *))sub_100B9640C);
}

- (void)setWildKeyBase:(int64_t)a3 interval:(int64_t)a4 fallback:(int64_t)a5 forBeacon:(id)a6 completion:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  _TtC12searchpartyd23BeaconManagerTrampoline *v18;
  uint64_t v19;

  v13 = type metadata accessor for UUID(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a7);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a6);
  _Block_copy(v17);
  v18 = self;
  sub_100B96578(a3, a4, a5, (uint64_t)v16, (uint64_t)v18, v17);
  _Block_release(v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)setAlignmentUncertainty:(double)a3 atIndex:(int64_t)a4 date:(id)a5 forBeacon:(id)a6 completion:(id)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  _TtC12searchpartyd23BeaconManagerTrampoline *v21;
  uint64_t v22;
  uint64_t v23;

  v23 = a4;
  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for Date(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = _Block_copy(a7);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a6);
  _Block_copy(v20);
  v21 = self;
  sub_100B967A4(v23, (uint64_t)v19, (uint64_t)v15, (uint64_t)v21, v20, a3);
  _Block_release(v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

- (void)setKeyRollInterval:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _TtC12searchpartyd23BeaconManagerTrampoline *v14;
  uint64_t v15;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v13);
  v14 = self;
  sub_100B969A8(a3, (uint64_t)v12, (uint64_t)v14, v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)setCurrentWildKeyIndex:(int64_t)a3 forBeacon:(id)a4 completion:(id)a5
{
  sub_100B91130(self, (uint64_t)a2, a3, (uint64_t)a4, a5, 0xD00000000000002FLL, 0x8000000100ED78B0, (uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t))sub_1004CC7EC);
}

- (void)connectedToBeacon:(id)a3 withIndex:(int64_t)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _TtC12searchpartyd23BeaconManagerTrampoline *v14;
  uint64_t v15;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v13);
  v14 = self;
  sub_100B96CF0((uint64_t)v12, a4, (uint64_t)v14, v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)fetchUserStatsForBeacon:(id)a3 completion:(id)a4
{
  sub_100B918C8(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_1010B0490, (uint64_t)sub_10015AAF4, (void (*)(char *, uint64_t, uint64_t))sub_100B91308);
}

- (void)fetchFirmwareVersionForBeacon:(id)a3 completion:(id)a4
{
  sub_100B918C8(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)&unk_1010B0468, (uint64_t)sub_100B98160, (void (*)(char *, uint64_t, uint64_t))sub_100B91740);
}

- (void)nearOwnerCommandKeysWithCompletion:(id)a3
{
  sub_100B950C0(self, (int)a2, a3, (uint64_t)&unk_1010B0440, (uint64_t)sub_100B98138, (void (*)(uint64_t, uint64_t))sub_100B919BC);
}

- (void)updateBeaconObservations:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12searchpartyd23BeaconManagerTrampoline *v9;

  v6 = _Block_copy(a4);
  v7 = sub_10000F4A0(0, &qword_1011083D8, SPBeaconObservation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  v9 = self;
  sub_100B96EDC(v8, (uint64_t)v9, (uint64_t (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease();
}

- (void)createDuplicateBeaconsForBeacon:(id)a3 skipGroupIdentifier:(BOOL)a4 count:(int64_t)a5 completion:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _TtC12searchpartyd23BeaconManagerTrampoline *v18;
  id v19;
  unsigned int v20;
  uint64_t v21;
  _BYTE v22[4];
  _BOOL4 v23;

  v23 = a4;
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = &v22[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = swift_allocObject(&unk_1010B0418, 24, 7);
  *(_QWORD *)(v15 + 16) = v14;
  v16 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v17 = (void *)objc_opt_self(FMSystemInfo);
  v18 = self;
  _Block_copy(v14);
  v19 = objc_msgSend(v17, "sharedInstance");
  v20 = objc_msgSend(v19, "isInternalBuild");

  if (v20)
  {
    v21 = type metadata accessor for Transaction(0);
    __chkstk_darwin(v21);
    *(_QWORD *)&v22[-48] = v16;
    *(_QWORD *)&v22[-40] = v13;
    *(_QWORD *)&v22[-32] = a5;
    *(_QWORD *)&v22[-24] = sub_10001D1EC;
    *(_QWORD *)&v22[-16] = v15;
    v22[-8] = v23;
    static Transaction.named<A>(_:with:)("createDuplicateBeacons", 22, 2, sub_100B98114, &v22[-64], &type metadata for () + 1);
  }
  else
  {
    (*((void (**)(void *, _QWORD))v14 + 2))(v14, 0);
  }
  swift_release();
  _Block_release(v14);

  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)removeDuplicateBeaconsWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC12searchpartyd23BeaconManagerTrampoline *v9;
  _QWORD v10[3];
  char v11;
  uint64_t (*v12)(uint64_t, char);
  uint64_t v13;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010B03C8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v7 = swift_allocObject(&unk_1010B03F0, 32, 7);
  *(_QWORD *)(v7 + 16) = sub_100B980DC;
  *(_QWORD *)(v7 + 24) = v5;
  v8 = *(_QWORD *)(*v6 + 280);
  type metadata accessor for Transaction(0);
  v10[2] = v8;
  v11 = 1;
  v12 = sub_100B98108;
  v13 = v7;
  v9 = self;
  swift_retain();
  static Transaction.named<A>(_:with:)("removeDuplicateBeacons", 22, 2, sub_100880E30, v10);

  swift_release();
  swift_release();
}

- (void)submitDeviceEvent:(id)a3 source:(unsigned int)a4 attachedTo:(id)a5 completion:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _TtC12searchpartyd23BeaconManagerTrampoline *v30;
  void *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _TtC12searchpartyd23BeaconManagerTrampoline *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  _TtC12searchpartyd23BeaconManagerTrampoline *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;

  LODWORD(v60) = a4;
  v10 = sub_10001A9A8(&qword_1010F46C0);
  __chkstk_darwin(v10);
  v59 = (uint64_t)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10001A9A8(&qword_1010ED860);
  v57 = *(_QWORD *)(v12 - 8);
  v13 = *(_QWORD *)(v57 + 64);
  v14 = __chkstk_darwin(v12);
  v58 = (uint64_t)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v16 = (char *)&v52 - v15;
  v17 = type metadata accessor for UUID(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(_QWORD *)(v18 + 64);
  v20 = __chkstk_darwin(v17);
  v56 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v22 = (char *)&v52 - v21;
  v23 = _Block_copy(a6);
  v61 = v22;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v24 = 0;
  }
  else
  {
    v24 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, v24, 1, v17);
  v25 = swift_allocObject(&unk_1010B0378, 24, 7);
  *(_QWORD *)(v25 + 16) = v23;
  v26 = sub_100361D30(v60);
  if (v26 == 8)
  {
    v27 = sub_100599ED4();
    v28 = swift_allocError(&type metadata for BeaconManagerTrampoline.BeaconManagerTrampolineError, v27, 0, 0);
    *v29 = 0;
    v30 = self;
    _Block_copy(v23);
    v31 = (void *)_convertErrorToNSError(_:)(v28);
    (*((void (**)(void *, void *))v23 + 2))(v23, v31);

    swift_errorRelease(v28);
  }
  else
  {
    v32 = v26;
    v33 = *sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation+ 16]);
    v34 = type metadata accessor for TaskPriority(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v59, 1, 1, v34);
    v35 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
    v53 = v25;
    v36 = v56;
    v35(v56, v61, v17);
    v54 = v23;
    v37 = v58;
    sub_1002A380C((uint64_t)v16, v58);
    v38 = *(unsigned __int8 *)(v18 + 80);
    v55 = v18;
    v39 = v17;
    v40 = (v38 + 41) & ~v38;
    v41 = *(unsigned __int8 *)(v57 + 80);
    v60 = v16;
    v42 = self;
    v43 = (v19 + v41 + v40) & ~v41;
    v44 = (v13 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
    v45 = swift_allocObject(&unk_1010B03A0, v44 + 16, v38 | v41 | 7);
    *(_QWORD *)(v45 + 16) = 0;
    *(_QWORD *)(v45 + 24) = 0;
    *(_QWORD *)(v45 + 32) = v33;
    *(_BYTE *)(v45 + 40) = v32;
    v46 = v45 + v40;
    v17 = v39;
    v18 = v55;
    (*(void (**)(uint64_t, char *, uint64_t))(v55 + 32))(v46, v36, v17);
    v47 = v45 + v43;
    self = v42;
    v16 = v60;
    v48 = v37;
    v23 = v54;
    sub_100005CF0(v48, v47, &qword_1010ED860);
    v49 = (_QWORD *)(v45 + v44);
    v50 = v53;
    *v49 = sub_10001D1EC;
    v49[1] = v50;
    v51 = self;
    _Block_copy(v23);
    swift_retain();
    swift_retain();
    sub_100691AC0(v59, (uint64_t)&unk_1011169E0, v45);
    swift_release();
  }
  swift_release();
  _Block_release(v23);

  sub_100004048((uint64_t)v16, &qword_1010ED860);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v61, v17);
}

- (void)initiatePairingSessionWithCompletion:(id)a3
{
  sub_100B950C0(self, (int)a2, a3, (uint64_t)&unk_1010B0350, (uint64_t)sub_10059A5E4, (void (*)(uint64_t, uint64_t))sub_100B92290);
}

- (void)invalidatePairingSession:(id)a3 completion:(id)a4
{
  sub_100B92A34(self, (int)a2, a3, a4, (uint64_t)&unk_1010B0328, (uint64_t)sub_10001D1EC, (void (*)(id, uint64_t, uint64_t))sub_100B92444);
}

- (void)verifyPairingInfoUsing:(id)a3 completion:(id)a4
{
  sub_100B92A34(self, (int)a2, a3, a4, (uint64_t)&unk_1010B0300, (uint64_t)sub_10059A5E4, (void (*)(id, uint64_t, uint64_t))sub_100B9265C);
}

- (void)finalizePairingUsing:(id)a3 completion:(id)a4
{
  sub_100B92A34(self, (int)a2, a3, a4, (uint64_t)&unk_1010B02D8, (uint64_t)sub_10059A058, (void (*)(id, uint64_t, uint64_t))sub_100B92818);
}

- (void)unpairUUID:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _TtC12searchpartyd23BeaconManagerTrampoline *v14;
  uint64_t v15;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v13);
  v14 = self;
  sub_100B97040((uint64_t)v12, a4, (uint64_t)v14, v13);
  _Block_release(v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)getLocalPairingDataWithCompletion:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_100B971AC);
}

- (void)currentBeaconingKeyWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _TtC12searchpartyd23BeaconManagerTrampoline *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010B0288, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v6 = swift_allocObject(&unk_1010B02B0, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_10001D390;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_10047E8E0(0, (uint64_t)sub_100B97EE8, v6);

  swift_release();
  swift_release();
}

- (void)setAlwaysBeaconWildState:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  _TtC12searchpartyd23BeaconManagerTrampoline *v7;

  v4 = a3;
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_100B97300(v4, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)alwaysBeaconWildStateWithCompletion:(id)a3
{
  sub_10000897C(self, (int)a2, a3, (void (*)(void))sub_100B97444);
}

- (void)getOfflineFindingInfoWithCurrentData:(id)a3 completion:(id)a4
{
  void *v5;
  _TtC12searchpartyd23BeaconManagerTrampoline *v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;

  v5 = _Block_copy(a4);
  v6 = self;
  if (a3)
  {
    v7 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;

  }
  else
  {
    v9 = 0xF000000000000000;
  }
  *(_QWORD *)(swift_allocObject(&unk_1010B0260, 24, 7) + 16) = v5;
  v10 = sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  sub_1002967D0(*v10, sub_100B97EE0);
  swift_release();
  sub_10001EF3C((uint64_t)a3, v9);

}

- (void)poisonBeaconIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _TtC12searchpartyd23BeaconManagerTrampoline *v12;
  uint64_t v13;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  _Block_copy(v11);
  v12 = self;
  sub_100296D30((uint64_t)v10, (uint64_t)v11);
  _Block_release(v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)repairDataStore:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC12searchpartyd23BeaconManagerTrampoline *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1010B0238, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  sub_10001AA44((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation), *(_QWORD *)&self->implementation[OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation + 16]);
  v6 = self;
  sub_10079DE98((uint64_t)sub_1004D47C0, v5);

  swift_release();
}

- (_TtC12searchpartyd23BeaconManagerTrampoline)init
{
  _TtC12searchpartyd23BeaconManagerTrampoline *result;

  result = (_TtC12searchpartyd23BeaconManagerTrampoline *)_swift_stdlib_reportUnimplementedInitializer("searchpartyd.BeaconManagerTrampoline", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s12searchpartyd26ManagedCBPeripheralManagerVwxx_0((Class *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC12searchpartyd23BeaconManagerTrampoline_implementation));
  swift_release();
}

- (void)bluetoothConnectionKeysFor:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  _TtC12searchpartyd23BeaconManagerTrampoline *v10;
  id v11;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1010B0080, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  type metadata accessor for Transaction(0);
  v8 = (_QWORD *)swift_allocObject(&unk_1010B00A8, 48, 7);
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_10059A5E4;
  v8[5] = v7;
  v9 = a3;
  v10 = self;
  v11 = v9;
  swift_retain(v7);
  static Transaction.asyncTask(name:block:)("bluetoothConnectionKeys(for:completion:)", 40, 2, &unk_1011169B8, v8);

  swift_release(v7);
  swift_release(v8);
}

- (void)successfulConnectionForUserIdentifier:(id)a3 beaconIdentifier:(id)a4 primaryIndex:(unint64_t)a5 leMAC:(id)a6 ltkIndex:(unint64_t)a7 ltk:(id)a8 completion:(id)a9
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  char *v24;
  id v25;
  id v26;
  _TtC12searchpartyd23BeaconManagerTrampoline *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _TtC12searchpartyd23BeaconManagerTrampoline *v41;
  uint64_t v42;
  void (*v43)(uint64_t, char *, uint64_t);
  char *v44;
  uint64_t v45;
  _TtC12searchpartyd23BeaconManagerTrampoline **v46;
  _TtC12searchpartyd23BeaconManagerTrampoline *v47;
  unint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _TtC12searchpartyd23BeaconManagerTrampoline *v54;
  void (*v55)(char *, uint64_t);
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _TtC12searchpartyd23BeaconManagerTrampoline *v59;
  uint64_t v60;
  char *v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  _TtC12searchpartyd23BeaconManagerTrampoline *v65;
  id v66;
  char *v67;
  char *v68;
  unint64_t v69;
  unint64_t v70;
  char *v71;

  v65 = self;
  v66 = a8;
  v69 = a5;
  v70 = a7;
  v12 = type metadata accessor for UUID(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  v15 = __chkstk_darwin(v12);
  v71 = (char *)&v56 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v15);
  v61 = (char *)&v56 - v17;
  v18 = __chkstk_darwin(v16);
  v20 = (char *)&v56 - v19;
  __chkstk_darwin(v18);
  v22 = (char *)&v56 - v21;
  v23 = _Block_copy(a9);
  v68 = v22;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v24 = v20;
  v67 = v20;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v25 = a6;
  v26 = v66;
  v59 = v65;
  v27 = (_TtC12searchpartyd23BeaconManagerTrampoline *)static Data._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v64 = v28;
  v65 = v27;

  v29 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v26);
  v62 = v30;
  v63 = v29;

  v58 = swift_allocObject(&unk_1010B0030, 24, 7);
  *(_QWORD *)(v58 + 16) = v23;
  v66 = (id)type metadata accessor for Transaction(0);
  v31 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v32 = v61;
  v57 = v12;
  v31(v61, v22, v12);
  v31(v71, v24, v12);
  v33 = *(unsigned __int8 *)(v13 + 80);
  v60 = v13;
  v34 = (v33 + 24) & ~v33;
  v35 = (v14 + v33 + v34) & ~v33;
  v36 = (v14 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  v37 = (v36 + 15) & 0xFFFFFFFFFFFFFFF8;
  v38 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8;
  v39 = (v38 + 15) & 0xFFFFFFFFFFFFFFF8;
  v56 = (v39 + 23) & 0xFFFFFFFFFFFFFFF8;
  v40 = swift_allocObject(&unk_1010B0058, v56 + 16, v33 | 7);
  v41 = v59;
  *(_QWORD *)(v40 + 16) = v59;
  v42 = v40 + v34;
  v43 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v44 = v32;
  v45 = v57;
  v43(v42, v44, v57);
  v43(v40 + v35, v71, v45);
  *(_QWORD *)(v40 + v36) = v69;
  v46 = (_TtC12searchpartyd23BeaconManagerTrampoline **)(v40 + v37);
  v48 = v64;
  v47 = v65;
  *v46 = v65;
  v46[1] = (_TtC12searchpartyd23BeaconManagerTrampoline *)v48;
  *(_QWORD *)(v40 + v38) = v70;
  v49 = (uint64_t *)(v40 + v39);
  v51 = v62;
  v50 = v63;
  *v49 = v63;
  v49[1] = v51;
  v52 = (_QWORD *)(v40 + v56);
  v53 = v58;
  *v52 = sub_10001D1EC;
  v52[1] = v53;
  v54 = v41;
  sub_10001BBBC((uint64_t)v47, v48);
  sub_10001BBBC(v50, v51);
  swift_retain();
  static Transaction.asyncTask(name:block:)("successfulConnection(for:leMAC:ltkIndex:ltk:completion:)", 56, 2, &unk_1011169A8, v40);
  swift_release();
  swift_release();
  sub_10001BC14(v50, v51);
  sub_10001BC14((uint64_t)v47, v48);

  v55 = *(void (**)(char *, uint64_t))(v60 + 8);
  v55(v67, v45);
  v55(v68, v45);
}

- (void)leechScannerDiscoveredAdvertisementData:(id)a3 rssi:(int)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC12searchpartyd23BeaconManagerTrampoline *v12;

  v8 = _Block_copy(a5);
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v10 = swift_allocObject(&unk_1010AFFE0, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  type metadata accessor for Transaction(0);
  v11 = swift_allocObject(&unk_1010B0008, 56, 7);
  *(_QWORD *)(v11 + 16) = self;
  *(_QWORD *)(v11 + 24) = v9;
  *(_DWORD *)(v11 + 32) = a4;
  *(_QWORD *)(v11 + 40) = sub_10001D1EC;
  *(_QWORD *)(v11 + 48) = v10;
  v12 = self;
  swift_bridgeObjectRetain(v9);
  swift_retain(v10);
  static Transaction.asyncTask(name:block:)("leechScannerDiscoveredAdvertisementData(rssi:completion:)", 57, 2, &unk_101116978, v11);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
  swift_release(v11);
}

- (void)pairLowEnergyAccessoryWithIdentifier:(id)a3 completion:(id)a4
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
  _TtC12searchpartyd23BeaconManagerTrampoline *v21;
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
  v15 = swift_allocObject(&unk_1010AFF90, 24, 7);
  *(_QWORD *)(v15 + 16) = v14;
  type metadata accessor for Transaction(0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v16 = *(unsigned __int8 *)(v8 + 80);
  v17 = (v16 + 24) & ~v16;
  v18 = (v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject(&unk_1010AFFB8, v18 + 16, v16 | 7);
  *(_QWORD *)(v19 + 16) = self;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v19 + v17, v11, v7);
  v20 = (_QWORD *)(v19 + v18);
  *v20 = sub_10001D1EC;
  v20[1] = v15;
  v21 = self;
  swift_retain(v15);
  static Transaction.asyncTask(name:block:)("pairLowEnergyAccessory(identifier:completion", 44, 2, &unk_101116968, v19);

  swift_release(v15);
  swift_release(v19);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)unpairLowEnergyAccessoryWithIdentifier:(id)a3 completion:(id)a4
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
  _TtC12searchpartyd23BeaconManagerTrampoline *v21;
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
  v15 = swift_allocObject(&unk_1010AFF40, 24, 7);
  *(_QWORD *)(v15 + 16) = v14;
  type metadata accessor for Transaction(0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v16 = *(unsigned __int8 *)(v8 + 80);
  v17 = (v16 + 24) & ~v16;
  v18 = (v9 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject(&unk_1010AFF68, v18 + 16, v16 | 7);
  *(_QWORD *)(v19 + 16) = self;
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v19 + v17, v11, v7);
  v20 = (_QWORD *)(v19 + v18);
  *v20 = sub_10001D1EC;
  v20[1] = v15;
  v21 = self;
  swift_retain(v15);
  static Transaction.asyncTask(name:block:)("unpairLowEnergyAccessory(identifier:completion", 46, 2, &unk_101116950, v19);

  swift_release(v15);
  swift_release(v19);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)startScanningIncludeServiceCharacterstics:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC12searchpartyd23BeaconManagerTrampoline *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1010AFF18, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = self;
  sub_100B94C08(a3, (uint64_t)sub_10001D1EC, v7);

  swift_release();
}

- (void)stopScanningWithCompletion:(id)a3
{
  sub_100B950C0(self, (int)a2, a3, (uint64_t)&unk_1010AFEF0, (uint64_t)sub_10001D1F0, (void (*)(uint64_t, uint64_t))sub_100B94EAC);
}

- (void)tagSeparationStateChanged:(id)a3 beaconUUID:(id)a4 location:(id)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  id v17;
  _TtC12searchpartyd23BeaconManagerTrampoline *v18;
  uint64_t v19;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v15);
  v16 = a3;
  v17 = a5;
  v18 = self;
  sub_100D1DCE8((uint64_t)v16, (uint64_t)v14, (uint64_t)v18, (uint64_t)v15);
  _Block_release(v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

@end
