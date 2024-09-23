@implementation PresentmentListener

- (void)dealloc
{
  _TtC7idcredd19PresentmentListener *v2;

  v2 = self;
  sub_1000414D0();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd19PresentmentListener_dataContainer));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC7idcredd19PresentmentListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100043CB4(v7);

  return v9 & 1;
}

- (_TtC7idcredd19PresentmentListener)init
{
  _TtC7idcredd19PresentmentListener *result;

  result = (_TtC7idcredd19PresentmentListener *)_swift_stdlib_reportUnimplementedInitializer("idcredd.PresentmentListener", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
