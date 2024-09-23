@implementation DIPDeviceInfo.DIPNFHardwareMonitor

- (void)hardwareStateDidChange
{
  _TtCC8coreidvd13DIPDeviceInfo20DIPNFHardwareMonitor *v2;

  v2 = self;
  sub_100422C5C();

}

- (_TtCC8coreidvd13DIPDeviceInfo20DIPNFHardwareMonitor)init
{
  uint64_t v3;
  _TtCC8coreidvd13DIPDeviceInfo20DIPNFHardwareMonitor *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtCC8coreidvd13DIPDeviceInfo20DIPNFHardwareMonitor_notified;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)dispatch_semaphore_create(0);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for DIPDeviceInfo.DIPNFHardwareMonitor();
  return -[DIPDeviceInfo.DIPNFHardwareMonitor init](&v6, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC8coreidvd13DIPDeviceInfo20DIPNFHardwareMonitor_notified));
}

@end
