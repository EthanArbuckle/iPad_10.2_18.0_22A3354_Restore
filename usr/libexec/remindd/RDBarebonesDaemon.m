@implementation RDBarebonesDaemon

- (_TtC7remindd17RDBarebonesDaemon)init
{
  id v3;
  _TtC7remindd17RDBarebonesDaemon *v4;
  id v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  void *v9;
  char *v10;
  objc_super v12;

  v3 = objc_allocWithZone((Class)type metadata accessor for RDXPCBarebonesDaemon());
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  v6 = (Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC7remindd17RDBarebonesDaemon_xpcDaemon);
  *v6 = v5;
  v6[1] = &off_1007F52E0;
  v7 = qword_100836F08;
  v8 = v5;
  if (v7 != -1)
    swift_once(&qword_100836F08, sub_1001BA588);
  v9 = (void *)qword_100871CC8;
  v10 = (char *)objc_allocWithZone((Class)type metadata accessor for RDClientConnectionListener());
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC7remindd17RDBarebonesDaemon_xpcClientConnectionListener) = (Class)sub_10051F8C8(v8, v9, v10);

  v12.receiver = v4;
  v12.super_class = (Class)type metadata accessor for RDBarebonesDaemon();
  return -[RDBarebonesDaemon init](&v12, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd17RDBarebonesDaemon_xpcDaemon));

}

@end
