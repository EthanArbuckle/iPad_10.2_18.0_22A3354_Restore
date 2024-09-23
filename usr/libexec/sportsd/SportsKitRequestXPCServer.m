@implementation SportsKitRequestXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC7sportsd25SportsKitRequestXPCServer *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000A868((uint64_t)v8, v7);

  return 1;
}

- (_TtC7sportsd25SportsKitRequestXPCServer)init
{
  sub_10000ACA0();
}

- (void).cxx_destruct
{
  sub_100007618((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7sportsd25SportsKitRequestXPCServer_apsListening));
  sub_10000AEBC(OBJC_IVAR____TtC7sportsd25SportsKitRequestXPCServer_metadataProvider);
  sub_10000AEBC(OBJC_IVAR____TtC7sportsd25SportsKitRequestXPCServer_tempoApiProvider);
  sub_10000AEBC(OBJC_IVAR____TtC7sportsd25SportsKitRequestXPCServer_supressionManager);
  swift_bridgeObjectRelease(*(_QWORD *)&self->apsListening[OBJC_IVAR____TtC7sportsd25SportsKitRequestXPCServer_entitlement]);
}

@end
