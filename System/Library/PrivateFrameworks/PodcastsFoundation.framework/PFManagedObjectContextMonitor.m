@implementation PFManagedObjectContextMonitor

- (PFManagedObjectContextMonitor)initWithContext:(id)a3 label:(int64_t)a4 pingInterval:(double)a5 shortHangDuration:(double)a6 severeHangDuration:(double)a7 criticalHangDuration:(double)a8 criticalHangRepeatInterval:(double)a9
{
  return (PFManagedObjectContextMonitor *)ManagedObjectContextMonitor.init(context:label:pingInterval:shortHangDuration:severeHangDuration:criticalHangDuration:criticalHangRepeatInterval:)(a3, a4, a5, a6, a7, a8, a9);
}

- (void)beginMonitoring
{
  PFManagedObjectContextMonitor *v2;

  v2 = self;
  sub_1A90AD4C0();

}

- (void)endMonitoring
{
  PFManagedObjectContextMonitor *v2;

  v2 = self;
  sub_1A9397BB0();

}

- (PFManagedObjectContextMonitor)init
{
  PFManagedObjectContextMonitor *result;

  result = (PFManagedObjectContextMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___PFManagedObjectContextMonitor_signpost;
  v4 = sub_1A93F762C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

@end
