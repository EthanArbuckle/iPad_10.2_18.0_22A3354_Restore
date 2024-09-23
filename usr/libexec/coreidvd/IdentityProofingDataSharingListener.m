@implementation IdentityProofingDataSharingListener

- (_TtC8coreidvd35IdentityProofingDataSharingListener)init
{
  return (_TtC8coreidvd35IdentityProofingDataSharingListener *)sub_10039D3D8();
}

- (void)dealloc
{
  _TtC8coreidvd35IdentityProofingDataSharingListener *v2;

  v2 = self;
  sub_10039D5AC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd35IdentityProofingDataSharingListener_xpcListener));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvd35IdentityProofingDataSharingListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10039D79C(v7);

  return v9 & 1;
}

@end
