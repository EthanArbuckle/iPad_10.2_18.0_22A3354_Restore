@implementation DIDocUploadSessionListener

- (_TtC8coreidvd26DIDocUploadSessionListener)init
{
  return (_TtC8coreidvd26DIDocUploadSessionListener *)sub_1000F0468();
}

- (void)dealloc
{
  _TtC8coreidvd26DIDocUploadSessionListener *v2;

  v2 = self;
  sub_1000F0638();
}

- (void).cxx_destruct
{

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvd26DIDocUploadSessionListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1000F197C(v7);

  return v9 & 1;
}

@end
