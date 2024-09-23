@implementation TabletSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                             + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_window);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_window) = (Class)a3;
  v3 = a3;

}

- (_TtC10FitnessApp19TabletSceneDelegate)init
{
  return (_TtC10FitnessApp19TabletSceneDelegate *)sub_10049BBCC();
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_navigator));
  sub_1001B9E74(*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_browsingCoordinator), *(_QWORD *)&self->window[OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_browsingCoordinator]);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_dependencies));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_engagementAppBadgeProvider));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_fitnessAppBadgeAggregator));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_wheelchairUseCache));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_seymourNotificationResponseCoordinator));
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10FitnessApp19TabletSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10049D474(v8, v10);

}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC10FitnessApp19TabletSceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10049D754(v7);

}

- (void)sceneDidDisconnect:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC10FitnessApp19TabletSceneDelegate *v9;

  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_navigator);
  v6 = v5[14];
  v7 = v5[15];
  sub_100016804(v5 + 11, v6);
  v8 = a3;
  v9 = self;
  dispatch thunk of MetricSceneLifecycleReporting.reportDidDisconnect()(v6, v7);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  CHWorkoutDetailHeartRateTableViewCell *v9;
  id v10;
  _TtC10FitnessApp19TabletSceneDelegate *v11;
  SEL v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = sub_10001E724(0, &qword_100836190, UIOpenURLContext_ptr);
  v8 = sub_10049E79C();
  v9 = (CHWorkoutDetailHeartRateTableViewCell *)static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10049D91C(v9);

  swift_bridgeObjectRelease(v9, v12, v13, v14, v15, v16, v17, v18);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC10FitnessApp19TabletSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10049DAE8();

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC10FitnessApp19TabletSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10049DD6C();

}

- (void)sceneDidEnterBackground:(id)a3
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC10FitnessApp19TabletSceneDelegate *v9;

  (*(_BYTE **)((char *)&self->super.super.isa
             + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_fitnessAppBadgeAggregator))[OBJC_IVAR___CHFitnessAppBadgeAggregator_isBrowsingSeymour] = 0;
  v5 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10FitnessApp19TabletSceneDelegate_navigator);
  v6 = v5[14];
  v7 = v5[15];
  sub_100016804(v5 + 11, v6);
  v8 = a3;
  v9 = self;
  dispatch thunk of MetricSceneLifecycleReporting.reportDidEnterBackground()(v6, v7);

}

- (BOOL)aggregatorShouldAllowEngagementBadging:(id)a3
{
  return 1;
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6;
  id v7;
  _TtC10FitnessApp19TabletSceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10049DE9C();

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC10FitnessApp19TabletSceneDelegate *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_10049E388(v10, (uint64_t)v11, (void (**)(_QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

}

@end
