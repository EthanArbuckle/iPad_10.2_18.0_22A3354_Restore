@implementation RDXPCDebugPerformer

- (_TtC7remindd19RDXPCDebugPerformer)init
{
  _TtC7remindd19RDXPCDebugPerformer *result;

  result = (_TtC7remindd19RDXPCDebugPerformer *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDXPCDebugPerformer", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_notificationCenter));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_locationManager));
  sub_100008EFC((uint64_t)self + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_xpcDaemon);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_q_storeControllerByContainerURL));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_q_storeControllerNotificationCenterByContainerURL));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_manualHashtagLabelUpdater));
}

- (void)daemonVersion:(id)a3
{
  void (**v4)(void *, NSString);
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  _TtC7remindd19RDXPCDebugPerformer *v8;

  v4 = (void (**)(void *, NSString))_Block_copy(a3);
  v8 = self;
  Double.description.getter(1.2);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  v4[2](v4, v7);
  swift_bridgeObjectRelease(v6);

  _Block_release(v4);
}

- (void)daemonPid:(id)a3
{
  void (**v4)(void *, NSString);
  void *v5;
  _TtC7remindd19RDXPCDebugPerformer *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v4 = (void (**)(void *, NSString))_Block_copy(a3);
  v5 = (void *)objc_opt_self(NSProcessInfo);
  v6 = self;
  v7 = objc_msgSend(v5, "processInfo");
  objc_msgSend(v7, "processIdentifier");

  dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
  v9 = v8;
  v10 = String._bridgeToObjectiveC()();
  v4[2](v4, v10);
  swift_bridgeObjectRelease(v9);

  _Block_release(v4);
}

- (void)daemonStatus:(BOOL)a3 completion:(id)a4
{
  sub_100105168(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_10010A49C);
}

- (void)containerStats:(id)a3
{
  sub_100103F04(self, (int)a2, a3, (void (*)(void))sub_10010C85C);
}

- (void)dumpUbKVS:(id)a3
{
  sub_1000FD420(self, (int)a2, a3, (void (*)(void *))sub_10010D688);
}

- (void)writeUbKVSWithKey:(id)a3 stringValue:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC7remindd19RDXPCDebugPerformer *v15;
  __int128 v16;
  __int128 v17;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4 && (v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4), v13))
  {
    v14 = v13;
    *((_QWORD *)&v17 + 1) = &type metadata for String;
    *(_QWORD *)&v16 = v12;
    *((_QWORD *)&v16 + 1) = v13;
  }
  else
  {
    v14 = 0;
    v16 = 0u;
    v17 = 0u;
  }
  _Block_copy(v8);
  v15 = self;
  swift_bridgeObjectRetain(v14);
  sub_10010DB5C(v9, v11, (uint64_t)&v16, (uint64_t)v8);
  _Block_release(v8);
  sub_10000882C((uint64_t)&v16, (uint64_t *)&unk_10083D5B0);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v14);
}

- (void)writeUbKVSWithKey:(id)a3 dateValue:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _TtC7remindd19RDXPCDebugPerformer *v21;
  _QWORD *v22;
  _TtC7remindd19RDXPCDebugPerformer *v23;
  __int128 v24;
  __int128 v25;

  v9 = sub_10001A630((uint64_t *)&unk_1008380D0);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v24 - v13;
  v15 = _Block_copy(a5);
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v18 = v17;
  if (a4)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v19 = type metadata accessor for Date(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v14, 0, 1, v19);
  }
  else
  {
    v19 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v14, 1, 1, v19);
  }
  sub_100008868((uint64_t)v14, (uint64_t)v12, (uint64_t *)&unk_1008380D0);
  type metadata accessor for Date(0);
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v12, 1, v19) == 1)
  {
    _Block_copy(v15);
    v21 = self;
    sub_10000882C((uint64_t)v12, (uint64_t *)&unk_1008380D0);
    v24 = 0u;
    v25 = 0u;
  }
  else
  {
    *((_QWORD *)&v25 + 1) = v19;
    v22 = sub_1000087F0(&v24);
    (*(void (**)(_QWORD *, char *, uint64_t))(v20 + 32))(v22, v12, v19);
    _Block_copy(v15);
    v23 = self;
  }
  _Block_copy(v15);
  sub_10010DB5C(v16, v18, (uint64_t)&v24, (uint64_t)v15);
  _Block_release(v15);
  sub_10000882C((uint64_t)&v24, (uint64_t *)&unk_10083D5B0);
  _Block_release(v15);
  _Block_release(v15);

  swift_bridgeObjectRelease(v18);
  sub_10000882C((uint64_t)v14, (uint64_t *)&unk_1008380D0);
}

- (void)removeFromUbKVSForKey:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _TtC7remindd19RDXPCDebugPerformer *v10;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  _Block_copy(v6);
  v10 = self;
  sub_10010DDD8(v7, v9, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v9);
}

- (void)nukeDatabase:(id)a3
{
  sub_100103F04(self, (int)a2, a3, (void (*)(void))sub_10010DFF0);
}

- (void)testInitialSyncWithAccountName:(id)a3 completion:(id)a4
{
  sub_100104058(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_10010E5C0);
}

- (void)testReinitializeCloudKitWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  sub_100104058(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_10010EAA0);
}

- (void)testFlagAccountForInactivatedCalDAVDataMigrationWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  sub_100104058(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_10010F0F0);
}

- (void)retryAccountZoneIDsNeedingToBeSavedWithAccountID:(id)a3 completion:(id)a4
{
  sub_100104058(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_10010F9AC);
}

- (void)cancelCloudKitSync:(id)a3
{
  sub_100103F04(self, (int)a2, a3, (void (*)(void))sub_10010FE34);
}

- (void)cloudKitStatus:(id)a3
{
  sub_100103F04(self, (int)a2, a3, (void (*)(void))sub_100110204);
}

- (void)fireDebugNotificationWithText:(id)a3 identifier:(id)a4 categoryIdentifier:(id)a5 reference:(id)a6 isRemove:(BOOL)a7 completion:(id)a8
{
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _TtC7remindd19RDXPCDebugPerformer *v24;

  v12 = _Block_copy(a8);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  if (a4)
  {
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v17;
    if (a5)
      goto LABEL_3;
LABEL_6:
    v18 = 0;
    v20 = 0;
    if (a6)
      goto LABEL_4;
LABEL_7:
    v21 = 0;
    goto LABEL_8;
  }
  v16 = 0;
  if (!a5)
    goto LABEL_6;
LABEL_3:
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v20 = v19;
  if (!a6)
    goto LABEL_7;
LABEL_4:
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  a6 = v22;
LABEL_8:
  v23 = swift_allocObject(&unk_1007E4A70, 24, 7);
  *(_QWORD *)(v23 + 16) = v12;
  v24 = self;
  sub_1000F9B80(v13, v15, v16, (uint64_t)a4, v18, v20, v21, (uint64_t)a6, a7, (uint64_t)sub_100119B24, v23);

  swift_bridgeObjectRelease(v15);
  swift_release(v23);
  swift_bridgeObjectRelease(a6);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(a4);
}

- (void)fetchGeofencesWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC7remindd19RDXPCDebugPerformer *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1007E49F8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1000FA1CC((uint64_t)sub_1001187A4, v5);

  swift_release(v5);
}

- (void)removeGeofenceWithUUID:(id)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC7remindd19RDXPCDebugPerformer *v13;
  uint64_t v14;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1007E4980, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_1000FA7E8((uint64_t)v10, (uint64_t)sub_100119C4C, v12);

  swift_release(v12);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)addGeofenceWithLatitude:(double)a3 longitude:(double)a4 radius:(double)a5 uuid:(id)a6 completion:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _TtC7remindd19RDXPCDebugPerformer *v20;
  uint64_t v21;

  v13 = sub_10001A630((uint64_t *)&unk_100839C80);
  __chkstk_darwin(v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  if (a6)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)(a6);
    v17 = type metadata accessor for UUID(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, 0, 1, v17);
  }
  else
  {
    v18 = type metadata accessor for UUID(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  }
  v19 = swift_allocObject(&unk_1007E4908, 24, 7);
  *(_QWORD *)(v19 + 16) = v16;
  v20 = self;
  sub_1000FAC84((uint64_t)v15, (uint64_t)sub_100119C4C, v19, a3, a4, a5);

  swift_release(v19);
  sub_10000882C((uint64_t)v15, (uint64_t *)&unk_100839C80);
}

- (void)simulateCoreLocationEnterRegionWithIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC7remindd19RDXPCDebugPerformer *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_1007E4890, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  sub_1000FB5E0(v7, v9, (uint64_t)sub_100119C4C, v10, (uint64_t)&unk_1007E48B8, (uint64_t)sub_1001185F4, (uint64_t)&unk_1007E48D0);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)simulateCoreLocationExitRegionWithIdentifier:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC7remindd19RDXPCDebugPerformer *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_1007E4818, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  sub_1000FB5E0(v7, v9, (uint64_t)sub_1001185A4, v10, (uint64_t)&unk_1007E4840, (uint64_t)sub_1001185B0, (uint64_t)&unk_1007E4858);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)persistenceStoreIDForAccountID:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_1001104F8);
}

- (void)purgeDeletedObjectsWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _TtC7remindd19RDXPCDebugPerformer *v9;
  _QWORD v10[5];
  uint64_t v11;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1007E47C8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd19RDXPCDebugPerformer_storeController);
  v10[4] = sub_100119B24;
  v11 = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_1000E18E4;
  v10[3] = &unk_1007E47E0;
  v7 = _Block_copy(v10);
  v8 = v11;
  v9 = self;
  swift_retain();
  swift_release(v8);
  objc_msgSend(v6, "purgeDeletedObjectsWithCompletionHandler:", v7);
  _Block_release(v7);

  swift_release(v5);
}

- (void)lowLevelMarkForDeletionWithObjectID:(id)a3 shouldSetDirtyFlags:(BOOL)a4 shouldRemoveFromParent:(BOOL)a5 completion:(id)a6
{
  void *v10;
  id v11;
  _TtC7remindd19RDXPCDebugPerformer *v12;

  v10 = _Block_copy(a6);
  _Block_copy(v10);
  v11 = a3;
  v12 = self;
  sub_1001108CC(v11, a4, a5, (uint64_t)v12, v10);
  _Block_release(v10);
  _Block_release(v10);

}

- (void)lowLevelUnmarkForDeletionWithObjectID:(id)a3 shouldSetDirtyFlags:(BOOL)a4 completion:(id)a5
{
  sub_1000FBC88(self, (int)a2, a3, a4, a5, (void (*)(id, uint64_t, id, void *))sub_100110B48);
}

- (void)markAndDeleteExtraneousAlarmsFromReminderID:(id)a3 shouldSetDirtyFlags:(BOOL)a4 completion:(id)a5
{
  sub_1000FBC88(self, (int)a2, a3, a4, a5, (void (*)(id, uint64_t, id, void *))sub_100110DB8);
}

- (void)setDueDateResolutionTokenNonceForAlarmID:(id)a3 nonce:(double)a4 shouldSetDirtyFlags:(BOOL)a5 completion:(id)a6
{
  sub_1000FC93C(self, (int)a2, a3, a5, a6, "RDXPCDebugPerformer: setDueDateResolutionTokenNonceForAlarmID {alarmID: %{public}@, shouldSetDirtyFlags: %{public}s}", 0xD000000000000028, 0x80000001006F84C0, a4, (uint64_t)sub_100118544);
}

- (void)setDueDateResolutionTokenNonceForReminderID:(id)a3 nonce:(double)a4 shouldSetDirtyFlags:(BOOL)a5 completion:(id)a6
{
  sub_1000FC93C(self, (int)a2, a3, a5, a6, "RDXPCDebugPerformer: setDueDateResolutionTokenNonceForReminderID {reminderID: %{public}@, shouldSetDirtyFlags: %{public}s}", 0xD00000000000002BLL, 0x80000001006F8430, a4, (uint64_t)sub_100118524);
}

- (void)crashDaemonWithMessage:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC7remindd19RDXPCDebugPerformer *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t inited;
  unint64_t v17;
  unint64_t v18;
  _BYTE v19[80];

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = qword_100836D08;
  v13 = self;
  if (v12 != -1)
    swift_once(&qword_100836D08, sub_1000F53D4);
  v14 = sub_10001AAA8(v5, (uint64_t)qword_10083AC30);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v6 + 16))(v8, v14, v5);
  v15 = sub_10001A630((uint64_t *)&unk_10083A280);
  inited = swift_initStackObject(v15, v19);
  *(_OWORD *)(inited + 16) = xmmword_1006A3C00;
  *(_QWORD *)(inited + 32) = 48;
  *(_QWORD *)(inited + 40) = 0xE100000000000000;
  *(_QWORD *)(inited + 72) = &type metadata for String;
  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 56) = v11;
  swift_bridgeObjectRetain(v11);
  v17 = sub_10016E7E4(inited);
  v18 = sub_10016E7E4((uint64_t)_swiftEmptyArrayStorage);
  sub_1004A14D8((uint64_t)"RDXPCDebugPerformer called crash {message: %@}", 46, 2uLL, v17, v18);
  __break(1u);
}

- (void)fetchContactsMatching:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  _TtC7remindd19RDXPCDebugPerformer *v9;

  v6 = _Block_copy(a4);
  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v8;
  }
  else
  {
    v7 = 0;
  }
  _Block_copy(v6);
  v9 = self;
  sub_1001113BC(v7, (uint64_t)a3, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(a3);
}

- (void)createIsolatedStoreContainerWithCompletion:(id)a3
{
  sub_1000FD420(self, (int)a2, a3, (void (*)(void *))sub_1001117BC);
}

- (void)destroyIsolatedStoreContainerWithToken:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7remindd19RDXPCDebugPerformer *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1007E45E8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1000FD484(v8, (uint64_t)sub_100119B24, v7);

  swift_release(v7);
}

- (void)dataAccessStatusReports:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC7remindd19RDXPCDebugPerformer *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1007E4570, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1001119F0((uint64_t)sub_100118248, v5);

  swift_release(v5);
}

- (void)registerBabysitterWith:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC7remindd19RDXPCDebugPerformer *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_1007E44F8, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  sub_100111C0C(v7, v9, (uint64_t)sub_100119B24, v10, (uint64_t)&unk_1007E4520, (uint64_t)sub_10011823C, (uint64_t)&unk_1007E4538);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)resetBabysitterWithRestrictedAccountID:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC7remindd19RDXPCDebugPerformer *v11;

  v6 = _Block_copy(a4);
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = v8;
  v10 = swift_allocObject(&unk_1007E4480, 24, 7);
  *(_QWORD *)(v10 + 16) = v6;
  v11 = self;
  sub_100111C0C(v7, v9, (uint64_t)sub_100119B24, v10, (uint64_t)&unk_1007E44A8, (uint64_t)sub_10011822C, (uint64_t)&unk_1007E44C0);

  swift_bridgeObjectRelease(v9);
  swift_release(v10);
}

- (void)downloadContainerWithAccountID:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  _TtC7remindd19RDXPCDebugPerformer *v9;

  v6 = _Block_copy(a4);
  if (a3)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    a3 = v8;
  }
  else
  {
    v7 = 0;
  }
  _Block_copy(v6);
  v9 = self;
  sub_100111E34(v7, a3, (char *)v9, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(a3);
}

- (void)purgeCKRecordWithRecordType:(id)a3 identifier:(id)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _TtC7remindd19RDXPCDebugPerformer *v17;
  __n128 v18;
  uint64_t v19;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v16 = v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v13);
  v17 = self;
  sub_100112848(v14, v16, (uint64_t)v12, (uint64_t)v17, (void (**)(_QWORD, _QWORD))v13);
  _Block_release(v13);
  _Block_release(v13);

  v18 = swift_bridgeObjectRelease(v16);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v18);
}

- (void)fetchAllManualSortHintsWithDetails:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v5;
  uint64_t Request;
  uint64_t v8;
  char *v9;
  void *v10;
  _TtC7remindd19RDXPCDebugPerformer *v11;
  uint64_t v12;

  v5 = a3;
  Request = type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest(0);
  __chkstk_darwin(Request);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  swift_storeEnumTagMultiPayload(v9, Request, 3);
  _Block_copy(v10);
  v11 = self;
  sub_100112F28(0xD000000000000021, 0x80000001006F8070, v5, (uint64_t)v9, (uint64_t)v11, v10);
  _Block_release(v10);
  sub_10001C744((uint64_t)v9, type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest);
  _Block_release(v10);

}

- (void)fetchManualSortHintWithListType:(id)a3 listID:(id)a4 completion:(id)a5
{
  sub_1001000A0(self, (int)a2, (uint64_t)a3, (uint64_t)a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, id, void *))sub_10011348C);
}

- (void)removeManualSortHintWithIdentifier:(id)a3 completion:(id)a4
{
  sub_100103F74(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, id, void *))sub_100113698);
}

- (void)resetAllManualSortHintsWithCompletion:(id)a3
{
  uint64_t Request;
  uint64_t v6;
  char *v7;
  void *v8;
  _TtC7remindd19RDXPCDebugPerformer *v9;
  uint64_t v10;

  Request = type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest(0);
  __chkstk_darwin(Request);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  swift_storeEnumTagMultiPayload(v7, Request, 3);
  _Block_copy(v8);
  v9 = self;
  sub_10011387C(0xD000000000000017, 0x80000001006F8030, (uint64_t)v7, (uint64_t)v9, v8);
  _Block_release(v8);
  sub_10001C744((uint64_t)v7, type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest);
  _Block_release(v8);

}

- (void)resetManualSortHintWithIdentifier:(id)a3 completion:(id)a4
{
  uint64_t Request;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _TtC7remindd19RDXPCDebugPerformer *v15;
  uint64_t v16;

  Request = type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest(0);
  __chkstk_darwin(Request);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
  swift_storeEnumTagMultiPayload(v9, Request, 0);
  _Block_copy(v14);
  v15 = self;
  sub_10011387C(0xD000000000000021, 0x80000001006F8000, (uint64_t)v9, (uint64_t)v15, v14);
  _Block_release(v14);
  sub_10001C744((uint64_t)v9, type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)resetManualSortHintWithListType:(id)a3 listID:(id)a4 completion:(id)a5
{
  sub_1001000A0(self, (int)a2, (uint64_t)a3, (uint64_t)a4, a5, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, id, void *))sub_100113B28);
}

- (void)resetManualSortHintBeforeLastAccessed:(id)a3 completion:(id)a4
{
  uint64_t Request;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _TtC7remindd19RDXPCDebugPerformer *v15;
  uint64_t v16;

  Request = type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest(0);
  __chkstk_darwin(Request);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a4);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a3);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v13, v10);
  swift_storeEnumTagMultiPayload(v9, Request, 2);
  _Block_copy(v14);
  v15 = self;
  sub_10011387C(0xD000000000000029, 0x80000001006F7F70, (uint64_t)v9, (uint64_t)v15, v14);
  _Block_release(v14);
  sub_10001C744((uint64_t)v9, type metadata accessor for RDXPCDebugPerformer.ManualSortHintFetchRequest);
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)updateManualSortHintWithIdentifier:(id)a3 lastAccessed:(id)a4 completion:(id)a5
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
  _TtC7remindd19RDXPCDebugPerformer *v18;
  uint64_t v19;

  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for UUID(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  _Block_copy(v17);
  v18 = self;
  sub_100113D2C((uint64_t)v16, (uint64_t)v12, (uint64_t)v18, v17);
  _Block_release(v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)setupManualHashtagLabelUpdater
{
  _TtC7remindd19RDXPCDebugPerformer *v2;

  v2 = self;
  sub_1001006F4();

}

- (void)refreshHashtagLabelsImmediately
{
  _TtC7remindd19RDXPCDebugPerformer *v2;

  v2 = self;
  sub_1001009F4();

}

- (void)handleIncompleteTemplateOperationQueueItemsImmediately
{
  _TtC7remindd19RDXPCDebugPerformer *v2;

  v2 = self;
  sub_100100B54();

}

- (void)handleIncompleteGroceryOperationQueueItemsImmediatelyWithTimeout:(double)a3
{
  uint64_t v4;
  _TtC7remindd19RDXPCDebugPerformer *v5;

  v5 = self;
  sub_100100F08(a3, (uint64_t)v5, v4);

}

- (void)immediatelyCreateOrUpdatePublicLinkOfTemplateWithTemplateObjectID:(id)a3 configuration:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC7remindd19RDXPCDebugPerformer *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100114220((uint64_t)v9, (uint64_t)v10, (uint64_t)v11, v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)immediatelyRevokePublicLinkOfTemplateWithTemplateObjectID:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100114328);
}

- (void)synchronous_revertImageAttachmentsToUnDeduped:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC7remindd19RDXPCDebugPerformer *v9;

  v6 = _Block_copy(a4);
  v7 = sub_1000151B0(0, (unint64_t *)&qword_10083A1E0, REMObjectID_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  v9 = self;
  sub_100114424(v8, (uint64_t)v9, v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v8);
}

- (void)validateHashtagLabelsWithoutHashtagWithRepair:(BOOL)a3 completion:(id)a4
{
  sub_100103488(self, (int)a2, a3, a4, "RDXPCDebugPerformer: validateHashtagLabelsWithoutHashtag initiated", 0xD000000000000023, 0x80000001006F7DF0, (uint64_t)sub_1001171D8);
}

- (void)validateHashtagLabelsWithConcealedHashtagsWithRepair:(BOOL)a3 completion:(id)a4
{
  sub_100103488(self, (int)a2, a3, a4, "RDXPCDebugPerformer: validateHashtagLabelsWithConcealedHashtags initiated", 0xD00000000000002ALL, 0x80000001006F7DC0, (uint64_t)sub_1001171BC);
}

- (void)validateHashtagsWithoutHashtagLabelWithRepair:(BOOL)a3 completion:(id)a4
{
  sub_100103550(self, (int)a2, a3, a4, "RDXPCDebugPerformer: validateHashtagsWithoutHashtagLabel initiated", 0xD000000000000023, 0x80000001006F7D90, (uint64_t)sub_1001171A0);
}

- (void)validateHashtagsWithMismatchedHashtagsWithRepair:(BOOL)a3 completion:(id)a4
{
  sub_100103550(self, (int)a2, a3, a4, "RDXPCDebugPerformer: validateHashtagLabelsWithMismatchedHashtags initiated", 0xD000000000000025, 0x80000001006F7D60, (uint64_t)sub_100117184);
}

- (void)validateHashtagsWithSharedToMeReminderCKIdentifierAndMismatchedReminderCKIdentifierWithRepair:(BOOL)a3 completion:(id)a4
{
  sub_100103550(self, (int)a2, a3, a4, "RDXPCDebugPerformer: validateHashtagsWithSharedToMeReminderCKIdentifierAndMismatchedReminderCKIdentifier initiated", 0xD000000000000052, 0x80000001006F7D00, (uint64_t)sub_100117168);
}

- (void)validateSharedToMeReminderPlaceholdersWithRepair:(BOOL)a3 completion:(id)a4
{
  sub_100103550(self, (int)a2, a3, a4, "RDXPCDebugPerformer: validateSharedToMeReminderPlaceholders initiated", 0xD000000000000025, 0x80000001006F7CD0, (uint64_t)sub_10011714C);
}

- (void)fetchAccountListOrderedIdentifiersWithAccountID:(id)a3 completion:(id)a4
{
  sub_100103F74(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, id, void *))sub_1001152A4);
}

- (void)fetchAllSharedEntitySyncActivities:(id)a3
{
  sub_100103F04(self, (int)a2, a3, (void (*)(void))sub_1001154A8);
}

- (void)addSharedEntitySyncActivityWithActivity:(id)a3 completion:(id)a4
{
  sub_100008F20(self, (int)a2, a3, a4, (void (*)(id, id, void *))sub_100115DA0);
}

- (void)removeAllSharedEntitySyncActivityWithCompletion:(id)a3
{
  sub_100103F04(self, (int)a2, a3, (void (*)(void))sub_1001165B8);
}

- (void)removeSharedEntitySyncActivityWithUUIDForChangeTracking:(id)a3 completion:(id)a4
{
  sub_100103F74(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(char *, id, void *))sub_100116728);
}

- (void)removeSharedEntitySyncActivitiesWithCKIdentifier:(id)a3 completion:(id)a4
{
  sub_100104058(self, (int)a2, (uint64_t)a3, a4, (void (*)(uint64_t, uint64_t, id, void *))sub_1001168BC);
}

- (void)updateMinimumSupportedVersionWithObjectID:(id)a3 minimumSupportedVersion:(int64_t)a4 completion:(id)a5
{
  void *v8;
  id v9;
  _TtC7remindd19RDXPCDebugPerformer *v10;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = self;
  sub_100116A48((uint64_t)v9, a4, (uint64_t)v10, v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)updateRemCurrentRuntimeVersionDebuggingOverride:(int64_t)a3
{
  sub_100116C30(a3);
}

- (void)fetchAllDueDateDeltaAlertsIncludingUnsupported:(BOOL)a3 completion:(id)a4
{
  sub_100105168(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))sub_100116D68);
}

@end
