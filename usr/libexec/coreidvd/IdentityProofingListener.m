@implementation IdentityProofingListener

- (_TtC8coreidvd24IdentityProofingListener)init
{
  return (_TtC8coreidvd24IdentityProofingListener *)sub_10004BC98();
}

- (void)dealloc
{
  _TtC8coreidvd24IdentityProofingListener *v2;

  v2 = self;
  sub_10004BE6C();
}

- (void).cxx_destruct
{

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvd24IdentityProofingListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10004CDB4(v7);

  return v9 & 1;
}

@end
