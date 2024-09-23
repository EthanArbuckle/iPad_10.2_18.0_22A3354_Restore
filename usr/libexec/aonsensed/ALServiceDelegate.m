@implementation ALServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC5ALXPC17ALServiceDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100285C08(v7);

  return v9 & 1;
}

- (void)onData:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC5ALXPC17ALServiceDelegate *v9;

  v5 = a3;
  v9 = self;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;

  sub_100284EA8(v6, v8);
  sub_100017F3C(v6, v8);

}

- (void)onInterrupt
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC5ALXPC17ALServiceDelegate *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;

  v3 = type metadata accessor for Logger(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  v8 = xpclog.getter((uint64_t)v6);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "service,onInterrupt", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (_TtC5ALXPC17ALServiceDelegate)init
{
  _TtC5ALXPC17ALServiceDelegate *result;

  result = (_TtC5ALXPC17ALServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer("ALXPC.ALServiceDelegate", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1000187CC((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5ALXPC17ALServiceDelegate__dataService));
}

@end
