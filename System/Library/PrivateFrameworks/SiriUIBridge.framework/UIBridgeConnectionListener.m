@implementation UIBridgeConnectionListener

- (void)dealloc
{
  _TtC12SiriUIBridge26UIBridgeConnectionListener *v2;

  v2 = self;
  sub_24744FD90();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connectionQueue));

  swift_unknownObjectWeakDestroy();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC12SiriUIBridge26UIBridgeConnectionListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_24744FE68((int)v8, v7);

  return v9 & 1;
}

- (_TtC12SiriUIBridge26UIBridgeConnectionListener)init
{
  sub_24745077C();
}

@end
