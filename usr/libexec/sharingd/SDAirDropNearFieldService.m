@implementation SDAirDropNearFieldService

- (void)handleSystemUIChanged
{
  sub_100260804(self, (uint64_t)a2, (uint64_t)&unk_10071EF28, (uint64_t)&unk_1007B66F0);
}

- (void)dealloc
{
  _TtC16DaemoniOSLibrary25SDAirDropNearFieldService *v2;

  v2 = self;
  sub_10025396C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_deviceStatus));
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearFieldController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearbyDiscoveryClientForLabel));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearbyDiscoveryLabelForConnectionID));
  sub_10022E75C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_airDropUISessionManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_airDropClient));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_processingTap, (uint64_t *)&unk_1007B6400);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_localExchangePayload, &qword_1007B63F8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_notificationCenter));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService__nearbySharingInteraction;
  v4 = sub_100008384(&qword_1007B64B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_pendingNearbySharingInteraction, (uint64_t *)&unk_1007B6220);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_assertionsByNearbySharingInteractionID));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_singleBandManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearbySharingAssertionTimeoutWorkItem));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_cancelNearbySharingInteractionWorkItem));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearbySharingAirDropConnectionTimeoutWorkItem));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_activeAirDropTransactionID, &qword_1007B7280);
}

- (void)keyBagLockStateChangeWithNotification:(id)a3
{
  sub_10025F340(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10071EFC8, (uint64_t)&unk_1007B6730);
}

- (void)screenStateChangedWithNotification:(id)a3
{
  sub_10025F340(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_10071EFA0, (uint64_t)&unk_1007B6720);
}

- (void)handleAirDropAllowedChanged
{
  sub_100260804(self, (uint64_t)a2, (uint64_t)&unk_10071EF78, (uint64_t)&unk_1007B6710);
}

- (void)handleWifiStateChanged
{
  sub_100260804(self, (uint64_t)a2, (uint64_t)&unk_10071EF50, (uint64_t)&unk_1007B6700);
}

- (void)handleBuddyExited
{
  sub_100260804(self, (uint64_t)a2, (uint64_t)&unk_10071EF00, (uint64_t)&unk_1007B66E0);
}

- (void)handleProximityAppleIDSignInStarted
{
  sub_100260804(self, (uint64_t)a2, (uint64_t)&unk_10071EED8, (uint64_t)&unk_1007B66D8);
}

- (void)handleProximityAppleIDSignInCompleted
{
  sub_100260804(self, (uint64_t)a2, (uint64_t)&unk_10071EEB0, (uint64_t)&unk_1007B66C8);
}

- (_TtC16DaemoniOSLibrary25SDAirDropNearFieldService)init
{
  _TtC16DaemoniOSLibrary25SDAirDropNearFieldService *result;

  result = (_TtC16DaemoniOSLibrary25SDAirDropNearFieldService *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropNearFieldService", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)nearFieldController:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _TtC16DaemoniOSLibrary25SDAirDropNearFieldService *v15;
  id v16;
  id v17;
  _TtC16DaemoniOSLibrary25SDAirDropNearFieldService *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  ObjectType = swift_getObjectType(self);
  v8 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = qword_1007B3D98;
  v13 = a3;
  v14 = a4;
  v15 = self;
  v16 = v14;
  v17 = v13;
  v18 = v15;
  if (v12 != -1)
    swift_once(&qword_1007B3D98, sub_1002ACAEC);
  v19 = static AirDropActor.shared;
  v20 = sub_100220D78((unint64_t *)&qword_1007BCF00, (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor, (uint64_t)&protocol conformance descriptor for AirDropActor);
  v21 = (_QWORD *)swift_allocObject(&unk_10071EE88, 64, 7);
  v21[2] = v19;
  v21[3] = v20;
  v21[4] = v16;
  v21[5] = v17;
  v21[6] = v18;
  v21[7] = ObjectType;
  swift_retain(v19);
  v22 = sub_100253050((uint64_t)v10, (uint64_t)&unk_1007B66B8, (uint64_t)v21, (uint64_t)&unk_10071ECD0, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_1007B9C70);

  swift_release(v22);
}

- (void)didDetectDeviceNearbyForNearFieldController:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC16DaemoniOSLibrary25SDAirDropNearFieldService *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = qword_1007B3D98;
  v10 = self;
  v11 = a3;
  if (v9 != -1)
    swift_once(&qword_1007B3D98, sub_1002ACAEC);
  v12 = static AirDropActor.shared;
  v13 = sub_100220D78((unint64_t *)&qword_1007BCF00, (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor, (uint64_t)&protocol conformance descriptor for AirDropActor);
  v14 = swift_allocObject(&unk_10071EE60, 48, 7);
  *(_QWORD *)(v14 + 16) = v12;
  *(_QWORD *)(v14 + 24) = v13;
  *(_BYTE *)(v14 + 32) = 0;
  *(_QWORD *)(v14 + 40) = v10;
  swift_retain(v12);
  v15 = sub_100253050((uint64_t)v7, (uint64_t)&unk_1007B66A8, v14, (uint64_t)&unk_10071ECD0, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_1007B9C70);

  swift_release(v15);
}

- (void)nearFieldController:(id)a3 didDetectDeviceNearbyWithInitiatorRole:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _TtC16DaemoniOSLibrary25SDAirDropNearFieldService *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = qword_1007B3D98;
  v12 = self;
  v13 = a3;
  if (v11 != -1)
    swift_once(&qword_1007B3D98, sub_1002ACAEC);
  v14 = static AirDropActor.shared;
  v15 = sub_100220D78((unint64_t *)&qword_1007BCF00, (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor, (uint64_t)&protocol conformance descriptor for AirDropActor);
  v16 = swift_allocObject(&unk_10071EE38, 48, 7);
  *(_QWORD *)(v16 + 16) = v14;
  *(_QWORD *)(v16 + 24) = v15;
  *(_BYTE *)(v16 + 32) = a4;
  *(_QWORD *)(v16 + 40) = v12;
  swift_retain(v14);
  v17 = sub_100253050((uint64_t)v9, (uint64_t)&unk_1007B66A0, v16, (uint64_t)&unk_10071ECD0, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_1007B9C70);

  swift_release(v17);
}

- (void)nearFieldController:(id)a3 didBeginTransaction:(id)a4
{
  id v7;
  _TtC16DaemoniOSLibrary25SDAirDropNearFieldService *v8;

  swift_getObjectType(a4);
  v7 = a3;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10026F140((uint64_t)a4, v8);

  swift_unknownObjectRelease(a4);
}

- (void)nearFieldController:(id)a3 transaction:(id)a4 didReceiveTapEvent:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _TtC16DaemoniOSLibrary25SDAirDropNearFieldService *v15;
  id v16;
  _TtC16DaemoniOSLibrary25SDAirDropNearFieldService *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v9 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = qword_1007B3D98;
  swift_unknownObjectRetain_n(a4, 2);
  v14 = a5;
  v15 = self;
  v16 = v14;
  v17 = v15;
  v18 = a3;
  if (v13 != -1)
    swift_once(&qword_1007B3D98, sub_1002ACAEC);
  v19 = static AirDropActor.shared;
  v20 = sub_100220D78((unint64_t *)&qword_1007BCF00, (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor, (uint64_t)&protocol conformance descriptor for AirDropActor);
  v21 = (_QWORD *)swift_allocObject(&unk_10071EDE8, 56, 7);
  v21[2] = v19;
  v21[3] = v20;
  v21[4] = a4;
  v21[5] = v16;
  v21[6] = v17;
  swift_retain(v19);
  v22 = sub_100253050((uint64_t)v11, (uint64_t)&unk_1007B6690, (uint64_t)v21, (uint64_t)&unk_10071ECD0, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_1007B9C70);

  swift_unknownObjectRelease(a4);
  swift_release(v22);
}

- (void)nearFieldController:(id)a3 didInterruptTransaction:(id)a4 error:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC16DaemoniOSLibrary25SDAirDropNearFieldService *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = qword_1007B3D98;
  swift_unknownObjectRetain_n(a4, 2);
  v14 = self;
  v15 = a3;
  v16 = a5;
  if (v13 != -1)
    swift_once(&qword_1007B3D98, sub_1002ACAEC);
  v17 = static AirDropActor.shared;
  v18 = sub_100220D78((unint64_t *)&qword_1007BCF00, (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor, (uint64_t)&protocol conformance descriptor for AirDropActor);
  v19 = (_QWORD *)swift_allocObject(&unk_10071EDC0, 48, 7);
  v19[2] = v17;
  v19[3] = v18;
  v19[4] = a4;
  v19[5] = v14;
  swift_retain(v17);
  v20 = sub_100253050((uint64_t)v11, (uint64_t)&unk_1007B6680, (uint64_t)v19, (uint64_t)&unk_10071ECD0, (uint64_t)&type metadata for () + 8, (uint64_t)&unk_1007B9C70);

  swift_unknownObjectRelease(a4);
  swift_release(v20);
}

@end
