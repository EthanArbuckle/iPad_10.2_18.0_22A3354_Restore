@implementation EngagementNotificationCoordinator

- (_TtC15SeymourServices33EngagementNotificationCoordinator)init
{
  _TtC15SeymourServices33EngagementNotificationCoordinator *result;

  result = (_TtC15SeymourServices33EngagementNotificationCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices33EngagementNotificationCoordinator_accountDeviceObserver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices33EngagementNotificationCoordinator_accountProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices33EngagementNotificationCoordinator_appLauncher);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices33EngagementNotificationCoordinator_contentAvailabilityObserver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices33EngagementNotificationCoordinator_engagementNotificationCenter);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices33EngagementNotificationCoordinator_notificationSettingsProvider);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices33EngagementNotificationCoordinator_privacyPreferenceDataSource);
  v3 = (char *)self + OBJC_IVAR____TtC15SeymourServices33EngagementNotificationCoordinator__migrationEnabled;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8C9588);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
