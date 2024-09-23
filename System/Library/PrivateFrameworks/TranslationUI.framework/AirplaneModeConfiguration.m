@implementation AirplaneModeConfiguration

- (_TtC13TranslationUI25AirplaneModeConfiguration)init
{
  return (_TtC13TranslationUI25AirplaneModeConfiguration *)AirplaneModeConfiguration.init()();
}

- (void)dealloc
{
  void *v3;
  _TtC13TranslationUI25AirplaneModeConfiguration *v4;
  const __SCNetworkReachability *v5;
  objc_super v6;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI25AirplaneModeConfiguration_reachability);
  v4 = self;
  if (v3)
  {
    v5 = v3;
    SCNetworkReachabilitySetCallback(v5, 0, 0);
    SCNetworkReachabilitySetDispatchQueue(v5, 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AirplaneModeConfiguration();
  -[AirplaneModeConfiguration dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TranslationUI25AirplaneModeConfiguration_radiosPreferences));
  v3 = (char *)self + OBJC_IVAR____TtC13TranslationUI25AirplaneModeConfiguration___enabled;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED587798);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC13TranslationUI25AirplaneModeConfiguration___reachable, v4);
  swift_release();
}

- (void)airplaneModeChanged
{
  _TtC13TranslationUI25AirplaneModeConfiguration *v2;

  v2 = self;
  AirplaneModeConfiguration.airplaneModeChanged()();

}

@end
