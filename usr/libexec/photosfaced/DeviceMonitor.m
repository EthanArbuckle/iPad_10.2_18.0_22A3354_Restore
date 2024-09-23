@implementation DeviceMonitor

- (_TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor)init
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  objc_super v8;

  v2 = (char *)self + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_nearby;
  *(_QWORD *)v2 = &_swiftEmptyArrayStorage;
  v2[8] = 1;
  v3 = (char *)self + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_connected;
  *(_QWORD *)v3 = &_swiftEmptyArrayStorage;
  v3[8] = 1;
  v4 = (char *)self + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_asleep;
  *(_QWORD *)v4 = &_swiftEmptyArrayStorage;
  v4[8] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_classCConnected;
  *(_QWORD *)v5 = &_swiftEmptyArrayStorage;
  v5[8] = 1;
  v6 = (char *)self + OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_pluggedIn;
  *(_QWORD *)v6 = &_swiftEmptyArrayStorage;
  v6[8] = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DeviceMonitor();
  return -[DeviceMonitor init](&v8, "init");
}

- (void)deviceIsNearbyDidChange:(id)a3 isNearby:(BOOL)a4
{
  id v6;
  _TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor *v7;

  v6 = a3;
  v7 = self;
  sub_10001A5F8(a4, 0xD000000000000024, 0x8000000100094900, (uint64_t)sub_10001A8C0);

}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  id v6;
  _TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor *v7;

  v6 = a3;
  v7 = self;
  sub_10001A5F8(a4, 0xD00000000000002ALL, 0x80000001000948D0, (uint64_t)sub_10001A89C);

}

- (void)deviceIsAsleepDidChange:(id)a3 isAsleep:(BOOL)a4
{
  id v6;
  _TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor *v7;

  v6 = a3;
  v7 = self;
  sub_10001A5F8(a4, 0xD000000000000024, 0x80000001000948A0, (uint64_t)sub_10001A878);

}

- (void)deviceIsClassCConnectedDidChange:(id)a3 isClassCConnected:(BOOL)a4
{
  id v6;
  _TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor *v7;

  v6 = a3;
  v7 = self;
  sub_10001A5F8(a4, 0xD000000000000036, 0x8000000100094860, (uint64_t)sub_10001A854);

}

- (void)devicePluggedInStateDidChange:(id)a3 pluggedIn:(BOOL)a4
{
  id v6;
  _TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor *v7;

  v6 = a3;
  v7 = self;
  sub_10001A5F8(a4, 0xD00000000000002ALL, 0x8000000100094830, (uint64_t)sub_10001A830);

}

- (void).cxx_destruct
{
  sub_10001A8E4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_nearby), self->nearby[OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_nearby]);
  sub_10001A8E4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_connected), self->nearby[OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_connected]);
  sub_10001A8E4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_asleep), self->nearby[OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_asleep]);
  sub_10001A8E4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_classCConnected), self->nearby[OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_classCConnected]);
  sub_10001A8E4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_pluggedIn), self->nearby[OBJC_IVAR____TtC11photosfacedP33_8C086EDF4440DE29CC98029F05504C4213DeviceMonitor_pluggedIn]);
}

@end
