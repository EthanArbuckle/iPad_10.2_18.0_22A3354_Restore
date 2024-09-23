@implementation Daemon

- (_TtC21ProximityReaderDaemon6Daemon)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21ProximityReaderDaemon6Daemon_temporaryListeners) = (Class)MEMORY[0x24BEE4AF8];
  sub_244DCDC88();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[Daemon init](&v5, sel_init);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC21ProximityReaderDaemon6Daemon *v8;
  Swift::Bool v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = Daemon.listener(_:shouldAcceptNewConnection:)((NSXPCListener)v6, (NSXPCConnection)v7);

  return v9;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
