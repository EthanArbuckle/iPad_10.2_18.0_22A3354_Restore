@implementation PMDeviceSharingAvailability

- (NSArray)devicesWithSharingAvailable
{
  return (NSArray *)sub_24368D7FC((uint64_t)self);
}

- (NSArray)devicesWithSharingUnavailable
{
  return (NSArray *)sub_24368D7FC((uint64_t)self);
}

- (PMDeviceSharingAvailability)initWithDevicesWithSharingAvailable:(id)a3 devicesWithSharingUnavailable:(id)a4
{
  objc_class *v5;
  objc_class *v6;
  objc_super v8;

  type metadata accessor for PMDevice((uint64_t)self);
  v5 = (objc_class *)sub_243850414();
  v6 = (objc_class *)sub_243850414();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PMDeviceSharingAvailability_devicesWithSharingAvailable) = v5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PMDeviceSharingAvailability_devicesWithSharingUnavailable) = v6;
  v8.receiver = self;
  v8.super_class = (Class)PMDeviceSharingAvailability;
  return -[PMDeviceSharingAvailability init](&v8, sel_init);
}

- (PMDeviceSharingAvailability)init
{
  PMDeviceSharingAvailability *result;

  result = (PMDeviceSharingAvailability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
