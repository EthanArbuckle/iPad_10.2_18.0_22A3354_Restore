@implementation RDClientConnectionListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC7remindd26RDClientConnectionListener *v8;
  char v9;
  char v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100016640((uint64_t)v6, v7);
  v10 = v9;

  return v10 & 1;
}

- (void)dealloc
{
  void *v2;
  _TtC7remindd26RDClientConnectionListener *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd26RDClientConnectionListener_xpcListener);
  v3 = self;
  objc_msgSend(v2, "invalidate");
  objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR____TtC7remindd26RDClientConnectionListener_xpcListenerUserInteractive), "invalidate");
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for RDClientConnectionListener();
  -[RDClientConnectionListener dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7remindd26RDClientConnectionListener_xpcListenerUserInteractive));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7remindd26RDClientConnectionListener_xpcDaemon));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd26RDClientConnectionListener_clientConnectionDidClosePublisher));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7remindd26RDClientConnectionListener_clientConnections));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC7remindd26RDClientConnectionListener_clientConnectionDidClosePassthroughSubject));
}

- (_TtC7remindd26RDClientConnectionListener)init
{
  _TtC7remindd26RDClientConnectionListener *result;

  result = (_TtC7remindd26RDClientConnectionListener *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDClientConnectionListener", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
