@implementation CAFDAssetVariantsAgent

- (_TtC13caraccessoryd22CAFDAssetVariantsAgent)initWithCarManager:(id)a3 sessionStatus:(id)a4
{
  return (_TtC13caraccessoryd22CAFDAssetVariantsAgent *)CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(a3, a4);
}

- (_TtC13caraccessoryd22CAFDAssetVariantsAgent)init
{
  _TtC13caraccessoryd22CAFDAssetVariantsAgent *result;

  result = (_TtC13caraccessoryd22CAFDAssetVariantsAgent *)_swift_stdlib_reportUnimplementedInitializer("caraccessoryd.CAFDAssetVariantsAgent", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_carManager, a2);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_clusterThemeManager));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetVariants));

}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6;
  id v7;
  _TtC13caraccessoryd22CAFDAssetVariantsAgent *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  specialized CAFDAssetVariantsAgent.carManager(_:didUpdateCurrentCar:)(a4);

}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4;
  _TtC13caraccessoryd22CAFDAssetVariantsAgent *v5;

  v4 = a3;
  v5 = self;
  CAFDAssetVariantsAgent.carDidUpdateAccessories(_:)(v4);

}

- (void)clusterThemeManager:(id)a3 didUpdateExtraAssetsURL:(id)a4
{
  id v7;
  id v8;
  _TtC13caraccessoryd22CAFDAssetVariantsAgent *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

  v7 = a4;
  v8 = a3;
  v9 = self;
  CAFDAssetVariantsAgent.assetExtrasURL.willset(a4);
  v10 = *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL);
  *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL) = (Class)a4;
  v11 = v7;

  v12 = (Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections);
  swift_beginAccess((char *)v9 + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_connections, v15, 0, 0);
  v13 = *v12;
  v14 = swift_bridgeObjectRetain(*v12);
  specialized Sequence.forEach(_:)(v14);

  swift_bridgeObjectRelease(v13);
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5;
  _TtC13caraccessoryd22CAFDAssetVariantsAgent *v6;

  v5 = a3;
  v6 = self;
  specialized CAFDAssetVariantsAgent.accessoryDidUpdate(_:receivedAllValues:)();

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  _TtC13caraccessoryd22CAFDAssetVariantsAgent *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  specialized CAFDAssetVariantsAgent.listener(_:didReceive:withContext:)(v9);

  swift_unknownObjectRelease(a5);
}

- (NSString)domain
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  type metadata accessor for CAUVariantsService(0);
  static CAUVariantsService.domain.getter();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

@end
