@implementation BluetoothUserXPCServer

- (_TtC14bluetoothuserd22BluetoothUserXPCServer)init
{
  _TtC14bluetoothuserd22BluetoothUserXPCServer *result;

  result = (_TtC14bluetoothuserd22BluetoothUserXPCServer *)_swift_stdlib_reportUnimplementedInitializer("bluetoothuserd.BluetoothUserXPCServer", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14bluetoothuserd22BluetoothUserXPCServer_daemon));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14bluetoothuserd22BluetoothUserXPCServer____lazy_storage___connections));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14bluetoothuserd22BluetoothUserXPCServer____lazy_storage___xpcListener));
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC14bluetoothuserd22BluetoothUserXPCServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10004D584((uint64_t)v6, v7);

  return v9 & 1;
}

@end
