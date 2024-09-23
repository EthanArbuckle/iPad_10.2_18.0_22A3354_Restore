@implementation SDAirDropReceiveHandler

- (_TtC16DaemoniOSLibrary23SDAirDropReceiveHandler)init
{
  _TtC16DaemoniOSLibrary23SDAirDropReceiveHandler *result;

  result = (_TtC16DaemoniOSLibrary23SDAirDropReceiveHandler *)_swift_stdlib_reportUnimplementedInitializer("DaemoniOSLibrary.SDAirDropReceiveHandler", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_id;
  v4 = type metadata accessor for SFAirDrop.TransferIdentifier(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_receiveID;
  v6 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  sub_1002443C8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_serverConnectionIdentity, type metadata accessor for SDAirDropServerConnectionIdentity);
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_delegate);
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_receiveServiceDelegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_deviceStatus));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_endpointService));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_pseudonymService));
  swift_bridgeObjectRelease(*(const char **)&self->delegate[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_idsSessionID]);
  v7 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_askContinuation;
  v8 = sub_100008384(&qword_1007C49F8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_transferContinuation;
  v10 = sub_100008384(&qword_1007B5B20);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_exchangeContinuation, &qword_1007C03E8);
  v11 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_handlerContinuation;
  v12 = sub_100008384(&qword_1007C04F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_helloRequest, &qword_1007B7DE8);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_askRequest, &qword_1007B7DF8);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_uploadRequest, &qword_1007B7E08);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_exchangeRequest, &qword_1007C03A8);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_transferStart, &qword_1007C4330);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_receiveCompressionAdapter));
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_helloConnection, &qword_1007C03E0);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_askConnection, &qword_1007C03E0);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_uploadConnection, &qword_1007C03E0);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_exchangeConnection, &qword_1007C03E0);
  sub_10000D0F0((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAirDropReceiveHandler_errorConnection, &qword_1007C03E0);
}

@end
