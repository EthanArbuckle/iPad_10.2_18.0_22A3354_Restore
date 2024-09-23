@implementation RCRecorderAppDelegateDependencyContainer

- (RCRecorderAppDelegateDependencyContainer)init
{
  return (RCRecorderAppDelegateDependencyContainer *)sub_1000C1A4C();
}

- (void)applicationWillTerminateWithApplication:(id)a3
{
  uint64_t v3;
  id v5;
  RCRecorderAppDelegateDependencyContainer *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)((*(_QWORD **)((char *)&self->super.isa
                               + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_activityManagerStateCoordinator))[2]
                 + 16);
  if (v3)
  {
    v5 = a3;
    v6 = self;
    v7 = swift_retain(v3);
    v8 = Activity.id.getter(v7);
    v10 = v9;
    sub_1000D3F8C(v8, v9);

    swift_release(v3);
    swift_bridgeObjectRelease(v10);
  }
}

- (void)defaultSceneDidBecomeActive
{
  RCRecorderAppDelegateDependencyContainer *v2;

  v2 = self;
  sub_1000CE1E0();

}

- (void).cxx_destruct
{
  sub_10001B498((Class *)((char *)&self->super.isa
                        + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_recordingStatePublisher));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_locationManagerStateCoordinator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_backgroundTaskManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_secureAppAssertionManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_platterSuccessStatePresentationCoordinator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_activityManagerStateCoordinator));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR___RCRecorderAppDelegateDependencyContainer_controlCenterWidgetStateCoordinator));
}

@end
