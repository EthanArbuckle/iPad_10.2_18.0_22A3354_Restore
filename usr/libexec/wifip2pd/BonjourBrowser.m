@implementation BonjourBrowser

- (void)subscribeTerminatedWithReason:(int64_t)a3
{
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser *v3;

  v3 = self;
  sub_100032F14();

}

- (void)subscribeReceivedDiscoveryResult:(id)a3
{
  id v4;
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser *v5;

  v4 = a3;
  v5 = self;
  sub_10002A344(v4);

}

- (void)subscribeLostDiscoveryResultForPublishID:(unsigned __int8)a3 address:(id)a4
{
  id v6;
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser *v7;

  v6 = a4;
  v7 = self;
  sub_10002A764(a3, v6);

}

- (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser)init
{
  _TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser *result;

  result = (_TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser *)_swift_stdlib_reportUnimplementedInitializer("CoreP2P.BonjourBrowser", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->service[OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser_service]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser_delegate));
  v3 = (char *)self + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7CoreP2PP33_CC695AB9131387273B9CBC7793DE05AB14BonjourBrowser_discoveredPeers));
}

- (void)subscribeReceivedMessage:(void *)a3 fromPublishID:(uint64_t)a4 address:(void *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;

  v8 = a3;
  v9 = a5;
  v13 = a1;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  sub_10000E614(v10, v12);
}

@end
