@implementation MobileDocumentReaderListener

- (_TtC8coreidvd28MobileDocumentReaderListener)init
{
  return (_TtC8coreidvd28MobileDocumentReaderListener *)sub_100112C94();
}

- (void)dealloc
{
  _TtC8coreidvd28MobileDocumentReaderListener *v2;

  v2 = self;
  sub_100112F18();
}

- (void).cxx_destruct
{

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  objc_class *v7;
  _TtC8coreidvd28MobileDocumentReaderListener *v8;
  char v9;

  v6 = a3;
  v7 = (objc_class *)a4;
  v8 = self;
  v9 = sub_100113C34(v7);

  return v9 & 1;
}

@end
