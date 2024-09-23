@implementation IdentityManagementListener

- (_TtC8coreidvd26IdentityManagementListener)init
{
  return (_TtC8coreidvd26IdentityManagementListener *)sub_1004AB95C();
}

- (void)dealloc
{
  _TtC8coreidvd26IdentityManagementListener *v2;

  v2 = self;
  sub_1004ABB58();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd26IdentityManagementListener_watchSessionManager));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvd26IdentityManagementListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1004B758C(v7);

  return v9 & 1;
}

@end
