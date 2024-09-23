@implementation KTTapToRadar

- (_TtC13transparencyd12KTTapToRadar)initWithDataStore:(id)a3 configBag:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd12KTTapToRadar_dataStore) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd12KTTapToRadar_configBag) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for KTTapToRadar();
  v6 = a3;
  v7 = a4;
  return -[KTTapToRadar init](&v9, "init");
}

- (BOOL)hasRecentlyFiledTTRWithTapToRadarType:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC13transparencyd12KTTapToRadar *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  LOBYTE(v4) = KTTapToRadar.hasRecentlyFiledTTR(tapToRadarType:)(v8);

  swift_bridgeObjectRelease(v6);
  return v4 & 1;
}

- (void)presentTapToRadarErrorWithType:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC13transparencyd12KTTapToRadar *v7;
  Swift::String v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  KTTapToRadar.presentTapToRadarError(withType:)(v8);

  swift_bridgeObjectRelease(v6);
}

- (_TtC13transparencyd12KTTapToRadar)init
{
  _TtC13transparencyd12KTTapToRadar *result;

  result = (_TtC13transparencyd12KTTapToRadar *)_swift_stdlib_reportUnimplementedInitializer("transparencyd.KTTapToRadar", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
