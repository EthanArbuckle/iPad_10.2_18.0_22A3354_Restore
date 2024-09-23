@implementation IDVServiceListener

- (_TtC8coreidvd18IDVServiceListener)init
{
  return (_TtC8coreidvd18IDVServiceListener *)sub_1003BE408();
}

- (void)dealloc
{
  _TtC8coreidvd18IDVServiceListener *v2;

  v2 = self;
  sub_1003BE5D8();
}

- (void).cxx_destruct
{

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvd18IDVServiceListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1003BEBA0(v7);

  return v9 & 1;
}

@end
