@implementation SDAuthenticationManager

- (_TtP16DaemoniOSLibrary31SDAuthenticationManagerDelegate_)delegate
{
  return (_TtP16DaemoniOSLibrary31SDAuthenticationManagerDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_delegate, a3);
}

+ (_TtC16DaemoniOSLibrary23SDAuthenticationManager)shared
{
  if (qword_1007B42C8 != -1)
    swift_once(&qword_1007B42C8, sub_1005478B0);
  return (_TtC16DaemoniOSLibrary23SDAuthenticationManager *)(id)qword_1007D88A8;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_queue));
}

- (_TtC16DaemoniOSLibrary23SDAuthenticationManager)initWithQueue:(id)a3
{
  return (_TtC16DaemoniOSLibrary23SDAuthenticationManager *)sub_100547BDC(a3);
}

- (void)listEligibleDevicesFor:(unint64_t)a3 completion:(id)a4
{
  void *v6;
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_100571DFC(a3, (uint64_t)v7, (char *)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)enableFor:(unint64_t)a3 device:(id)a4 passcode:(id)a5 sessionID:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject **v15;
  const char *v16;
  const char *v17;
  id v18;
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v19;
  uint64_t v20;

  v11 = type metadata accessor for UUID(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (NSObject **)static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v17 = v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v18 = a4;
  v19 = self;
  sub_10054D00C(a3, v18, v15, (uint64_t)v17, (uint64_t)v14);
  swift_bridgeObjectRelease(v17);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)requestEnablementFor:(unint64_t)a3 deviceID:(id)a4 sessionID:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v16;
  uint64_t v17;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = self;
  sub_10054DA14(a3, v13, v15, (uint64_t)v12);
  swift_bridgeObjectRelease(v15);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)disableFor:(unint64_t)a3 idsDeviceID:(id)a4 sessionID:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v16;
  __n128 v17;
  uint64_t v18;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = v14;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = self;
  sub_10054E404(a3, v13, v15, (uint64_t)v12);

  v17 = swift_bridgeObjectRelease((const char *)v15);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v17);
}

- (void)authenticateFor:(unint64_t)a3 sessionID:(id)a4 options:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v14;
  uint64_t v15;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a5;
  v14 = self;
  sub_10054F4A8(a3, v12, a5);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)cancel:(id)a3
{
  sub_100553280(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1005516D0);
}

- (void)registerForApprovalRequestsFor:(unint64_t)a3
{
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v3;

  v3 = self;
  sub_100572678();

}

- (void)reportApprovalResultWithAcmToken:(id)a3 error:(id)a4 sessionID:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;

  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a4;
  v14 = a5;
  v15 = self;
  if (a3)
  {
    v16 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v18 = v17;

  }
  else
  {
    v18 = 0xF000000000000000;
  }
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a5);

  sub_100551E74((uint64_t)a3, v18, (uint64_t)a4, (uint64_t)v12);
  sub_100225AA0((uint64_t)a3, v18);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)addAuthenticationStateChangesObserver:(id)a3 identifier:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v11;
  uint64_t v12;

  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  swift_unknownObjectRetain(a3);
  v11 = self;
  sub_100552B80((uint64_t)a3, (uint64_t)v10);
  swift_unknownObjectRelease(a3);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)removeAuthenticationStateChangesObserverFor:(id)a3
{
  sub_100553280(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100552F8C);
}

- (void)handleStateChanged
{
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v2;

  v2 = self;
  sub_100553810();

}

- (void)advertiseForUnlockClassCIfNecessaryWithIgnoreScreenState:(BOOL)a3
{
  _BOOL4 v3;
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v4;

  v3 = a3;
  v4 = self;
  sub_10054C088(v3);

}

- (_TtC16DaemoniOSLibrary23SDAuthenticationManager)init
{
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *result;

  result = (_TtC16DaemoniOSLibrary23SDAuthenticationManager *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAuthenticationManager", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3;
  double v4;
  double v5;
  double v6;

  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_delegate);

  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_pairingLockSessionGenerator]);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_pairingKeySessionGenerator]);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_commonContextGenerator]);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_flowGenerator]);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_sessionGenerator]);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_lockSessionGenerator]);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_keySessionInitiatorGenerator]);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_keySessionGenerator]);
  sub_10022E75C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_idsService));
  sub_10022E75C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_securityManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_transportManager));
  *(_QWORD *)&v3 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_pairingLockSessions)).n128_u64[0];
  *(_QWORD *)&v4 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_pairingKeySessions), v3).n128_u64[0];
  *(_QWORD *)&v5 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_keySessions), v4).n128_u64[0];
  *(_QWORD *)&v6 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_lockSessions), v5).n128_u64[0];
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_sessions), v6);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_nearbyActionAdvertiser));
  sub_1002443C8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_metrics, type metadata accessor for StateMetrics);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_bioArmKeyInitiator));
  if (*(_QWORD *)&self->pairingLockSessionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_bioArmKeyInitiatorDeviceStream])
    sub_10022E75C((Class *)((char *)&self->super.isa
                          + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_bioArmKeyInitiatorDeviceStream));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_previousUnlockClassCLockDevice, &qword_1007B9E38);
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_registrationStateByDeviceID));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_registrationManager));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_lastMacThatDidMacUnlockPhone, &qword_1007B9E38);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_macUnlockPhoneSessionIDThatNeedsArmingUI, &qword_1007B7280);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_approveNearbyInfoAdvertiser));
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                           + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_authenticationStateChangesObservers));
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_generateAWDLInfo]);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_isWifiEnabled]);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_isBluetoothEnabled]);
  swift_release(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_autoUnlockEligibleDevices]);
}

- (void)handleDelegateInvalidated
{
  uint64_t v2;
  _TtC16DaemoniOSLibrary23SDAuthenticationManager *v3;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_approveNearbyInfoAdvertiser);
  if (v2)
  {
    v3 = self;
    swift_retain();
    sub_1002C27D8();

    swift_release(v2);
  }
}

@end
