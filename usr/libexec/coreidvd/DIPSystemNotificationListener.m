@implementation DIPSystemNotificationListener

- (_TtC8coreidvd29DIPSystemNotificationListener)init
{
  return (_TtC8coreidvd29DIPSystemNotificationListener *)sub_1001BA0F0();
}

- (void)dealloc
{
  _TtC8coreidvd29DIPSystemNotificationListener *v2;

  v2 = self;
  sub_1001BA2F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd29DIPSystemNotificationListener_systemNotificationListener));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC8coreidvd29DIPSystemNotificationListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1001BB7FC(v7);

  return v9 & 1;
}

@end
