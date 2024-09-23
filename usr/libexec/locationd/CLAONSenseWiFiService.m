@implementation CLAONSenseWiFiService

+ (_TtC10CLAONSense21CLAONSenseWiFiService)shared
{
  if (qword_10230F898 != -1)
    swift_once(&qword_10230F898, sub_1014CA440);
  return (_TtC10CLAONSense21CLAONSenseWiFiService *)(id)qword_1023140E8;
}

- (BOOL)isAvailable
{
  return isAvailable()();
}

- (BOOL)registerForWifiScanResultsWithQueue:(id)a3 intervalSec:(float)a4 error:(id *)a5 callback:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  double v14;
  uint64_t v15;
  id v16;
  _TtC10CLAONSense21CLAONSenseWiFiService *v17;
  uint64_t v18;
  _BYTE v20[16];

  v10 = sub_1003B54E0(&qword_102300318);
  __chkstk_darwin(v10);
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = _Block_copy(a6);
  v15 = type metadata accessor for ALResultOptions(0, v14);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = a3;
  v17 = self;
  v20[4] = 0;
  sub_1014CBE78(v16, v18, LODWORD(a4));
  sub_1003B562C((uint64_t)v12, &qword_102300318);

  _Block_release(v13);
  return 1;
}

- (BOOL)registerForWifiScanResultsWithQueue:(id)a3 error:(id *)a4 callback:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  void *v11;
  uint64_t v12;
  double (*v13)(uint64_t (*)(), uint64_t);
  id v14;
  _TtC10CLAONSense21CLAONSenseWiFiService *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v20[16];

  v8 = sub_1003B54E0(&qword_102300318);
  __chkstk_darwin(v8);
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = _Block_copy(a5);
  v12 = swift_allocObject(&unk_1021BBD98, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = *(double (**)(uint64_t (*)(), uint64_t))((swift_isaMask & (uint64_t)self->super.isa) + 0xC8);
  v14 = a3;
  v15 = self;
  swift_retain(v12);
  v16 = v13(sub_1014CC4C8, v12);
  v17 = type metadata accessor for ALResultOptions(0, v16);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v10, 1, 1, v17);
  v20[4] = 1;
  sub_1014CBE78(v14, v18, 0x100000000uLL);
  sub_1003B562C((uint64_t)v10, &qword_102300318);
  swift_release(v12);

  return 1;
}

- (_TtC10CLAONSense21CLAONSenseWiFiService)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  sub_1014CA2E0((char *)self + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_associatedState, &byte_102311440);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_requester) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_desc);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService__callback);
  v5 = (objc_class *)type metadata accessor for CLAONSenseWiFiService();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[CLAONSenseWiFiService init](&v7, "init");
}

- (void).cxx_destruct
{
  sub_100CF1B64((uint64_t)self + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_associatedState);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_requester));
  swift_bridgeObjectRelease(*(_QWORD *)&self->associatedState[OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService_desc]);
  sub_1014CA8C8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService__callback), *(_QWORD *)&self->associatedState[OBJC_IVAR____TtC10CLAONSense21CLAONSenseWiFiService__callback]);
}

@end
