@implementation SDAirDropSendConnection

- (_TtC16DaemoniOSLibrary23SDAirDropSendConnection)init
{
  _TtC16DaemoniOSLibrary23SDAirDropSendConnection *result;

  result = (_TtC16DaemoniOSLibrary23SDAirDropSendConnection *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropSendConnection", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_1002443C8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_endpoint, type metadata accessor for SDAirDropDiscoveredEndpoint);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_deviceStatus));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_pseudonymService));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_sendRequest;
  v4 = type metadata accessor for SFAirDropSend.Request(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_primaryConnection));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_helloRequest, &qword_1007B7DE8);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_helloContinuation, &qword_1007B7DF0);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_helloConnection));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_askRequest, &qword_1007B7DF8);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_askConnection));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_askContinuation, &qword_1007B7E00);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_uploadRequest, &qword_1007B7E08);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_uploadContext));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_uploadConnection));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_uploadContinuation, &qword_1007B7E10);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_sandboxTokenURLPairs));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_sendCompressionAdapter));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_exchangeConnection));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_exchangeContinuation, &qword_1007B7E18);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_errorConnection));
  sub_1002443C8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_telemetry, type metadata accessor for SDAirDropSendConnectionTelemetry);
  v5 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropSendConnection_lastActiveInterfaceType;
  v6 = type metadata accessor for SFNWInterfaceType(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

@end
