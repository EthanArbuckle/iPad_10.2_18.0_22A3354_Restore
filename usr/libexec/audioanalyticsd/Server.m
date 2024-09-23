@implementation Server

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC15audioanalyticsd6Server *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100005818(v7);

  return v9 & 1;
}

- (_TtC15audioanalyticsd6Server)init
{
  _TtC15audioanalyticsd6Server *result;

  result = (_TtC15audioanalyticsd6Server *)_swift_stdlib_reportUnimplementedInitializer("audioanalyticsd.Server", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioanalyticsd6Server_systemMonitor));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioanalyticsd6Server_clientServerInstances));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioanalyticsd6Server_xpcConnections));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15audioanalyticsd6Server_activeReporterIDs));

  v3 = (char *)self + OBJC_IVAR____TtC15audioanalyticsd6Server_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioanalyticsd6Server_singleMessageSession));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15audioanalyticsd6Server_config));
}

@end
