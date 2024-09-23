@implementation AirDropUISessionClient

- (void)dealloc
{
  void *v3;
  _TtC16DaemoniOSLibrary22AirDropUISessionClient *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary22AirDropUISessionClient_connection);
  v4 = self;
  if (v3)
    objc_msgSend(v3, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AirDropUISessionClient();
  -[AirDropUISessionClient dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary22AirDropUISessionClient_airDropUIServer));
  sub_100232F78((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary22AirDropUISessionClient_delegate);
}

- (_TtC16DaemoniOSLibrary22AirDropUISessionClient)init
{
  return (_TtC16DaemoniOSLibrary22AirDropUISessionClient *)sub_10037976C();
}

- (void)cancellationWasRequestedForTransferIdentifier:(id)a3
{
  sub_100379A08(self, (uint64_t)a2, (uint64_t)a3, "SDAirDropUISessionManager: Received remote request for cancellation for transfer identifier: %s", sub_10037A538);
}

- (void)closeWasRequestedForTransferIdentifier:(id)a3
{
  sub_100379A08(self, (uint64_t)a2, (uint64_t)a3, "SDAirDropUISessionManager: Received remote request for close for transfer identifier: %s", sub_10037AC70);
}

- (void)runActionWasRequestedForTransferIdentifier:(id)a3 actionIdentifier:(id)a4
{
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  _TtC16DaemoniOSLibrary22AirDropUISessionClient *v12;
  double v13;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = self;
  sub_100379A70(v6, v8, v9, v11);

  *(_QWORD *)&v13 = swift_bridgeObjectRelease(v8).n128_u64[0];
  swift_bridgeObjectRelease(v11, v13);
}

- (void)acceptWasRequestedForTransferIdentifier:(id)a3
{
  sub_100379A08(self, (uint64_t)a2, (uint64_t)a3, "SDAirDropUISessionManager: Received remote request for accept for transfer identifier: %s", sub_10037A784);
}

@end
