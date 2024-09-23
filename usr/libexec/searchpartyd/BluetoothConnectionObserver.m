@implementation BluetoothConnectionObserver

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _TtC12searchpartyd27BluetoothConnectionObserver *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_1004E3AC4(v6, v4);

}

- (_TtC12searchpartyd27BluetoothConnectionObserver)init
{
  return (_TtC12searchpartyd27BluetoothConnectionObserver *)sub_1004E44B4();
}

- (void).cxx_destruct
{
  sub_1002EB2D8((uint64_t)self + OBJC_IVAR____TtC12searchpartyd27BluetoothConnectionObserver_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12searchpartyd27BluetoothConnectionObserver_bluetoothObserverQueue));
}

@end
