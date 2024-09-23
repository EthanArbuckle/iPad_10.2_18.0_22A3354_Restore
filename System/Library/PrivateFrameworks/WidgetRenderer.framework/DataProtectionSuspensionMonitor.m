@implementation DataProtectionSuspensionMonitor

- (void)applicationWillEnterForeground
{
  _TtC14WidgetRenderer31DataProtectionSuspensionMonitor *v2;

  v2 = self;
  sub_24A530610();

}

- (void)applicationDidEnterBackground
{
  _TtC14WidgetRenderer31DataProtectionSuspensionMonitor *v2;

  v2 = self;
  sub_24A530750();

}

- (_TtC14WidgetRenderer31DataProtectionSuspensionMonitor)init
{
  _TtC14WidgetRenderer31DataProtectionSuspensionMonitor *result;

  result = (_TtC14WidgetRenderer31DataProtectionSuspensionMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14WidgetRenderer31DataProtectionSuspensionMonitor_innerProtectionMonitor);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
