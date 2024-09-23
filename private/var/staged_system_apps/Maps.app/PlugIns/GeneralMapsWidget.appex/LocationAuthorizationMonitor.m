@implementation LocationAuthorizationMonitor

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  _TtC17GeneralMapsWidget28LocationAuthorizationMonitor *v5;

  v4 = a3;
  v5 = self;
  sub_100039AF4(v4);

}

- (_TtC17GeneralMapsWidget28LocationAuthorizationMonitor)init
{
  return (_TtC17GeneralMapsWidget28LocationAuthorizationMonitor *)sub_100039E2C();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17GeneralMapsWidget28LocationAuthorizationMonitor_locationManager));
  v3 = (char *)self + OBJC_IVAR____TtC17GeneralMapsWidget28LocationAuthorizationMonitor__accuracyAuthorization;
  v4 = sub_1000027AC(&qword_10008D5E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->locationManager[OBJC_IVAR____TtC17GeneralMapsWidget28LocationAuthorizationMonitor_bundleIdentifier]);
}

@end
