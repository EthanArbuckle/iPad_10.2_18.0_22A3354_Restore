@implementation KTZoneSetup

- (BOOL)initialFetch
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch, v4, 0, 0);
  return *v2;
}

- (void)setInitialFetch:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch, v5, 1, 0);
  *v4 = a3;
}

- (_TtC13transparencyd11KTZoneSetup)initWithCkdatabase:(id)a3 analytics:(id)a4 context:(id)a5 zoneCreate:(id)a6
{
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  objc_super v19;

  v11 = sub_10006D6DC(0, &qword_10029ED80, CKRecordZoneID_ptr);
  v12 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a6, v11);
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_initialFetch) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_ckdatabase) = (Class)a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_analytics) = (Class)a4;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_zoneCreate) = v12;
  v13 = type metadata accessor for KTCKZone();
  v14 = (objc_class *)swift_allocObject(v13, 24, 7);
  *((_QWORD *)v14 + 2) = a5;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_zoneHandler) = v14;
  v19.receiver = self;
  v19.super_class = (Class)type metadata accessor for KTZoneSetup();
  v15 = a3;
  v16 = a4;
  v17 = a5;
  return -[KTGroupOperation init](&v19, "init");
}

- (void)groupStart
{
  _TtC13transparencyd11KTZoneSetup *v2;

  v2 = self;
  KTZoneSetup.groupStart()();

}

- (_TtC13transparencyd11KTZoneSetup)init
{
  _TtC13transparencyd11KTZoneSetup *result;

  result = (_TtC13transparencyd11KTZoneSetup *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTZoneSetup", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_zoneCreate));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_zoneHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_ckdatabase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC13transparencyd11KTZoneSetup_analytics));
}

@end
