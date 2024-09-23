@implementation LocationAuthorizationMonitor

- (_TtC7Weather28LocationAuthorizationMonitor)init
{
  sub_1009206A0();
}

- (void).cxx_destruct
{
  swift_release();
  _s7Weather29UVIDescriptorViewModelFactoryVwxx_0((Class *)((char *)&self->super.isa
                                                          + OBJC_IVAR____TtC7Weather28LocationAuthorizationMonitor_locationManager));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC7Weather28LocationAuthorizationMonitor_locationsOfInterestUpdater));
  swift_release();
  swift_release();
}

@end
