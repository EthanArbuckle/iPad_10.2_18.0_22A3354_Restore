@implementation IdentityProvisioningListener

- (_TtC8coreidvd28IdentityProvisioningListener)init
{
  return (_TtC8coreidvd28IdentityProvisioningListener *)sub_1003FFECC();
}

- (void)dealloc
{
  _TtC8coreidvd28IdentityProvisioningListener *v2;

  v2 = self;
  sub_1004000A0();
}

- (void).cxx_destruct
{

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvd28IdentityProvisioningListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_100400D44(v7);

  return v9 & 1;
}

@end
