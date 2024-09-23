@implementation ASDConfigurationManager

- (NSDictionary)configDictionaryForCoreODI
{
  _TtC3asd23ASDConfigurationManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  ASDConfigurationManager.configDictionaryForCoreODI.getter();
  v4 = v3;

  return (NSDictionary *)v4;
}

- (double)cacheV2MaxAge
{
  _TtC3asd23ASDConfigurationManager *v2;
  double v3;
  double v4;

  v2 = self;
  ASDConfigurationManager.cacheV2MaxAge.getter();
  v4 = v3;

  return v4;
}

- (NSDictionary)payloadWorkflowTTLs
{
  _TtC3asd23ASDConfigurationManager *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = ASDConfigurationManager.payloadWorkflowTTLs.getter();

  sub_100039884(0, &qword_100503A68, NSNumber_ptr);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (void)pushInitialCoreODIConfig
{
  _TtC3asd23ASDConfigurationManager *v2;

  v2 = self;
  ASDConfigurationManager.pushInitialCoreODIConfig()();

}

+ (_TtC3asd23ASDConfigurationManager)shared
{
  return (_TtC3asd23ASDConfigurationManager *)static ASDConfigurationManager.shared.getter();
}

+ (void)setShared:(id)a3
{
  static ASDConfigurationManager.shared.setter((uint64_t)a3);
}

- (_TtC3asd23ASDConfigurationManager)init
{
  return (_TtC3asd23ASDConfigurationManager *)sub_1000891A4();
}

- (void)dealloc
{
  _TtC3asd23ASDConfigurationManager *v2;

  v2 = self;
  ASDConfigurationManager.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC3asd23ASDConfigurationManager_updateObservationToken));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3asd23ASDConfigurationManager_fetcher));
}

@end
