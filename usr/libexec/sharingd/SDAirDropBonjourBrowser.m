@implementation SDAirDropBonjourBrowser

- (void)wirelessBluetoothStateChangedWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = sub_100008384(&qword_1007B68A0);
  __chkstk_darwin(v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Notification(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  v13 = qword_1007B3D98;
  v14 = self;
  if (v13 != -1)
    swift_once(&qword_1007B3D98, sub_1002ACAEC);
  v15 = static AirDropActor.shared;
  v16 = sub_100220D78((unint64_t *)&qword_1007BCF00, (uint64_t (*)(uint64_t))type metadata accessor for AirDropActor, (uint64_t)&protocol conformance descriptor for AirDropActor);
  v17 = (_QWORD *)swift_allocObject(&unk_1007271F8, 40, 7);
  v17[2] = v15;
  v17[3] = v16;
  v17[4] = v14;
  swift_retain(v15);
  v18 = sub_100252EC0((uint64_t)v7, (uint64_t)&unk_1007BEC18, (uint64_t)v17);

  swift_release(v18);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser)init
{
  _TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser *result;

  result = (_TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropBonjourBrowser", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3;
  double v4;
  double v5;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_deviceStatus));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_bleController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_notificationCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_browserQueue));
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_browser));

  *(_QWORD *)&v3 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_serviceNamesToBrowseResult)).n128_u64[0];
  *(_QWORD *)&v4 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_serviceNamesToRetryCount), v3).n128_u64[0];
  *(_QWORD *)&v5 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_serviceNamesToCurrentDiscoverConnections), v4).n128_u64[0];
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa+ OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_serviceNamesToAirDropEndpoints), v5);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_serviceNamesNeedingDiscovery));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_sessionLogger));
  swift_release(*(_QWORD *)&self->deviceStatus[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropBonjourBrowser_endpointsUpdateHandler]);
}

@end
