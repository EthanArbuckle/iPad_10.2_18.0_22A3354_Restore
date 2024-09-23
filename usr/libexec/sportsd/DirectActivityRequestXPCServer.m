@implementation DirectActivityRequestXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC7sportsd30DirectActivityRequestXPCServer *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000AEDC((uint64_t)v8, v7);

  return 1;
}

- (_TtC7sportsd30DirectActivityRequestXPCServer)init
{
  sub_10000B234();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->entitlement[OBJC_IVAR____TtC7sportsd30DirectActivityRequestXPCServer_entitlement]);
  sub_10000AEBC(OBJC_IVAR____TtC7sportsd30DirectActivityRequestXPCServer_apsListening);
  sub_10000AEBC(OBJC_IVAR____TtC7sportsd30DirectActivityRequestXPCServer_metadataProvider);
  sub_10000AEBC(OBJC_IVAR____TtC7sportsd30DirectActivityRequestXPCServer_tempoApiProvider);
  sub_100007618((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC7sportsd30DirectActivityRequestXPCServer_supressionManager));
}

@end
