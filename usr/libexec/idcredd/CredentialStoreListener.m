@implementation CredentialStoreListener

- (void)dealloc
{
  _TtC7idcredd23CredentialStoreListener *v2;

  v2 = self;
  sub_1000D9EC8();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7idcredd23CredentialStoreListener_dataContainer));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC7idcredd23CredentialStoreListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1000EA95C(v7);

  return v9 & 1;
}

- (_TtC7idcredd23CredentialStoreListener)init
{
  _TtC7idcredd23CredentialStoreListener *result;

  result = (_TtC7idcredd23CredentialStoreListener *)_swift_stdlib_reportUnimplementedInitializer("idcredd.CredentialStoreListener", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
