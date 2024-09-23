@implementation SDAuthenticationTransportIDSService

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v12;
  const char *v13;
  const char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService *v19;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v14 = v13;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = self;
  sub_1004B3BF4(v15, v17, v12, v14);

  swift_bridgeObjectRelease(v14);
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v12;
  const char *v13;
  const char *v14;
  id v15;
  id v16;
  _TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService *v17;
  id v18;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v14 = v13;
  v15 = a3;
  v16 = a4;
  v18 = a7;
  v17 = self;
  sub_1004B41E4(v12, v14, a6);

  swift_bridgeObjectRelease(v14);
}

- (_TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService)init
{
  _TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService *result;

  result = (_TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAuthenticationTransportIDSService", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService_queue));
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService_delegate);
  sub_10022E75C((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC16DaemoniOSLibrary35SDAuthenticationTransportIDSService_idsService));
}

@end
