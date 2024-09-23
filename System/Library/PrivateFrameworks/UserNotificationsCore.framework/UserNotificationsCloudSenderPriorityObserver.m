@implementation UserNotificationsCloudSenderPriorityObserver

- (_TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver)init
{
  _TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver *result;

  result = (_TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_249A27474((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver_monitor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver_consumer);
}

- (void)systemSleepMonitor:(id)a3 prepareForSleepWithCompletion:(id)a4
{
  void (**v6)(_QWORD);
  id v7;
  _TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver *v8;

  v6 = (void (**)(_QWORD))_Block_copy(a4);
  v7 = a3;
  v8 = self;
  sub_249A269E0("systemSleepMonitorPrepareForSleep(): %s waking = false", 0);
  v6[2](v6);
  _Block_release(v6);

}

- (void)systemSleepMonitorDidWakeFromSleep:(id)a3
{
  id v4;
  _TtC21UserNotificationsCore44UserNotificationsCloudSenderPriorityObserver *v5;

  v4 = a3;
  v5 = self;
  sub_249A269E0("systemSleepMonitorDidWakeFromSleep(): %s waking = true", 1);

}

@end
