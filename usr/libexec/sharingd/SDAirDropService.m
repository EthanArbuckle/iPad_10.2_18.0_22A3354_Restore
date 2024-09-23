@implementation SDAirDropService

- (_TtC16DaemoniOSLibrary16SDAirDropService)init
{
  _TtC16DaemoniOSLibrary16SDAirDropService *result;

  sub_10036759C();
  return result;
}

- (NSString)description
{
  _TtC16DaemoniOSLibrary16SDAirDropService *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  type metadata accessor for SFAirDropUserDefaults(0, a2);
  v3 = self;
  v4 = (void *)static SFAirDropUserDefaults.shared.getter();
  SFAirDropUserDefaults.description.getter();
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (void).cxx_destruct
{
  double v3;

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_pseudonymService));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_transfersSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_transferObserverTask));
  *(_QWORD *)&v3 = swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_transferObserverClientsBundleIDs)).n128_u64[0];
  swift_bridgeObjectRelease(*(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_transferPresenters), v3);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_sendService));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_receiveService));
  sub_10022E75C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_nearFieldService));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_pairingService));
  sub_10022E75C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_airDropUISessionManager));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary16SDAirDropService_sessionLogger));
}

@end
