@implementation WODataLinkMonitor

- (WODataLinkMonitor)init
{
  return (WODataLinkMonitor *)sub_10001A578();
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___WODataLinkMonitor_delegate, a3);
}

+ (WODataLinkMonitor)shared
{
  if (qword_10081DAD8 != -1)
    swift_once(&qword_10081DAD8, sub_1000061F8);
  return (WODataLinkMonitor *)(id)qword_10086A610;
}

- (WODataLinkMonitorDelegate)delegate
{
  return (WODataLinkMonitorDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___WODataLinkMonitor_delegate);
}

- (void)dealloc
{
  WODataLinkMonitor *v2;

  v2 = self;
  sub_100359268();
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  sub_1000F61B4((uint64_t)self + OBJC_IVAR___WODataLinkMonitor_delegate);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___WODataLinkMonitor_publisher));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___WODataLinkMonitor_client));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___WODataLinkMonitor_workoutStateCancellable));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___WODataLinkMonitor_workoutStateUpdateWaiting));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___WODataLinkMonitor_metricPlatterAnalytics));
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa + OBJC_IVAR___WODataLinkMonitor_observers), v3, v4, v5, v6, v7, v8, v9);
}

@end
