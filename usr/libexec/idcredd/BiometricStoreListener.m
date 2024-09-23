@implementation BiometricStoreListener

- (void)dealloc
{
  _TtC7idcredd22BiometricStoreListener *v2;

  v2 = self;
  sub_100019E6C();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd22BiometricStoreListener_dataContainer));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC7idcredd22BiometricStoreListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100025608(v7);

  return v9 & 1;
}

- (_TtC7idcredd22BiometricStoreListener)init
{
  _TtC7idcredd22BiometricStoreListener *result;

  result = (_TtC7idcredd22BiometricStoreListener *)_swift_stdlib_reportUnimplementedInitializer("idcredd.BiometricStoreListener", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
