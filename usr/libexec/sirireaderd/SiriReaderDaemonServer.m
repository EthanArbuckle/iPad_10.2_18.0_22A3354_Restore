@implementation SiriReaderDaemonServer

- (_TtC11sirireaderd22SiriReaderDaemonServer)init
{
  return (_TtC11sirireaderd22SiriReaderDaemonServer *)sub_10000A820();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  _TtC11sirireaderd22SiriReaderDaemonServer *v9;

  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11sirireaderd22SiriReaderDaemonServer_interface);
  v7 = a3;
  v8 = a4;
  v9 = self;
  objc_msgSend(v8, "setExportedInterface:", v6);
  objc_msgSend(v8, "setExportedObject:", *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC11sirireaderd22SiriReaderDaemonServer_server));
  objc_msgSend(v8, "resume");

  return 1;
}

- (void).cxx_destruct
{

}

@end
