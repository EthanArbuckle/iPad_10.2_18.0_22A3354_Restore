@implementation CHFitnessAppContext

- (_TtC10FitnessApp30SeymourCatalogItemDataProvider)seymourCatalogItemDataProvider
{
  return (_TtC10FitnessApp30SeymourCatalogItemDataProvider *)*(id *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_seymourCatalogItemDataProvider);
}

- (void)setNavigationDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___CHFitnessAppContext_navigationDelegate, a3);
}

- (void)setAppBadgeAggregator:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___CHFitnessAppContext_appBadgeAggregator, a3);
}

- (void)navigateToWorkout:(id)a3
{
  id v4;
  CHFitnessAppContext *v5;

  v4 = a3;
  v5 = self;
  sub_10058E5A8(v4, (char *)v5);

}

- (CHCloudDeviceProvider)cloudDeviceProvider
{
  return (CHCloudDeviceProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR___CHFitnessAppContext_cloudDeviceProvider));
}

- (CHFitnessNavigationDelegate)navigationDelegate
{
  return (CHFitnessNavigationDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___CHFitnessAppContext_navigationDelegate);
}

- (CHFitnessAppBadgeAggregator)appBadgeAggregator
{
  return (CHFitnessAppBadgeAggregator *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___CHFitnessAppContext_appBadgeAggregator);
}

- (AMSBagProtocol)amsBag
{
  return (AMSBagProtocol *)objc_autoreleaseReturnValue((id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa
                                                                                              + OBJC_IVAR___CHFitnessAppContext_amsBag)));
}

- (_TtC10FitnessApp26SeymourAvailabilityManager)seymourAvailabilityManager
{
  return (_TtC10FitnessApp26SeymourAvailabilityManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                                 + OBJC_IVAR___CHFitnessAppContext_seymourAvailabilityManager));
}

- (CHFitnessAppContext)initWithHealthStore:(id)a3 seymourAvailabilityManager:(id)a4 wheelchairUseCache:(id)a5 formattingManager:(id)a6 pregnancyStateProvider:(id)a7
{
  return (CHFitnessAppContext *)sub_1005310B8(a3, a4, a5, a6, a7);
}

- (void)flushMetricEvents
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  CHFitnessAppContext *v9;
  void (*v10)(uint64_t (*)(), uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;

  v3 = sub_100047110((uint64_t *)&unk_100836170);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)&self->bookmarkClient[OBJC_IVAR___CHFitnessAppContext_metricClient];
  v8 = *(_QWORD *)&self->bookmarkClient[OBJC_IVAR___CHFitnessAppContext_metricClient + 8];
  sub_100016804((Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_metricClient), v7);
  v9 = self;
  dispatch thunk of MetricClientProtocol.flushMetrics()(v7, v8);
  v10 = (void (*)(uint64_t (*)(), uint64_t))Promise.operation.getter(v3);
  v12 = v11;
  v13 = swift_allocObject(&unk_1007A7C38, 32, 7);
  *(_QWORD *)(v13 + 16) = 0;
  *(_QWORD *)(v13 + 24) = 0;
  v10(sub_1001104CC, v13);
  swift_release(v12);
  v14 = swift_release(v13);
  (*(void (**)(char *, uint64_t, __n128))(v4 + 8))(v6, v3, v14);

}

- (id)seymourNavigationController
{
  unint64_t v2;
  void *v3;
  id v4;
  CHFitnessAppContext *v5;
  uint64_t v6;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_browsingCoordinator);
  v2 = *(_QWORD *)&self->accountFitnessSettingsProvider[OBJC_IVAR___CHFitnessAppContext_browsingCoordinator];
  if ((v2 & 0x8000000000000000) != 0)
  {
    v5 = self;
    v6 = sub_1001B9E4C(v3, v2);
    v4 = (id)AppCoordinator.rootViewController.getter(v6);
    sub_1001B9E74(v3, v2);

  }
  else
  {
    v4 = v3;
  }
  return v4;
}

- (void)handleWindowScene:(id)a3 with:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  CHFitnessAppContext *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_100047110(&qword_10081E650);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1007A7C10, 56, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = a4;
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = v12;
  v16 = v13;
  v17 = sub_1005A9074((uint64_t)v9, (uint64_t)&unk_100839730, (uint64_t)v11);

  swift_release(v17);
}

- (void)continueUserActivity:(id)a3
{
  id v4;
  CHFitnessAppContext *v5;

  v4 = a3;
  v5 = self;
  sub_100532480(v4);

}

- (void)openURLContext:(id)a3
{
  id v4;
  CHFitnessAppContext *v5;

  v4 = a3;
  v5 = self;
  sub_10053275C(v4);

}

- (void)navigateToWorkoutPlanCreation
{
  CHFitnessAppContext *v2;

  v2 = self;
  sub_100534DF8();

}

- (void)navigateToWorkoutPlanDetail
{
  CHFitnessAppContext *v2;

  v2 = self;
  sub_10053544C();

}

- (void)seymourTabSelectedWithSelection:(int64_t)a3
{
  CHFitnessAppContext *v4;

  v4 = self;
  sub_100537108(a3);

}

- (void)seymourTabDeselected
{
  CHFitnessAppContext *v2;

  v2 = self;
  sub_100537B44();

}

- (void)seymourAppWillResignActive
{
  sub_100537CC4(self, (uint64_t)a2, 0xD00000000000001CLL, (void *)0x80000001006A4CB0, (void (*)(uint64_t, uint64_t))&dispatch thunk of MetricSceneLifecycleReporting.reportDidEnterBackground());
}

- (void)seymourAppWillTerminate
{
  sub_100537CC4(self, (uint64_t)a2, 0xD000000000000019, (void *)0x80000001006A4C90, (void (*)(uint64_t, uint64_t))&dispatch thunk of MetricSceneLifecycleReporting.reportDidDisconnect());
}

- (void)shareSheetActivityItemsWithWorkout:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  CHFitnessAppContext *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1007A7BE8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_100537DB8((uint64_t)v8, (uint64_t)sub_100538C04, v7);

  swift_release(v7);
}

- (BOOL)isSessionViewControllerPresented
{
  CHFitnessAppContext *v2;
  BOOL v3;

  v2 = self;
  v3 = sub_100538240();

  return v3;
}

- (CHFitnessAppContext)init
{
  CHFitnessAppContext *result;

  result = (CHFitnessAppContext *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.FitnessAppContext", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = (char *)self + OBJC_IVAR___CHFitnessAppContext_completedWorkoutItemProvider;
  v4 = type metadata accessor for CompletedWorkoutShareItemProvider(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___CHFitnessAppContext_accountFitnessSettingsProvider));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___CHFitnessAppContext_bookmarkClient));
  sub_1001B9E74(*(void **)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_browsingCoordinator), *(_QWORD *)&self->accountFitnessSettingsProvider[OBJC_IVAR___CHFitnessAppContext_browsingCoordinator]);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___CHFitnessAppContext_catalogClient));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_dependencies));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_engagementAppBadgeProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_eventHub));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___CHFitnessAppContext_metricClient));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_navigator));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___CHFitnessAppContext_siriUserActivityHandler));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_subscriptionToken));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___CHFitnessAppContext_contentAvailabilityClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___CHFitnessAppContext_engagementClient));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___CHFitnessAppContext_privacyPreferenceClient));
  v5 = (char *)self + OBJC_IVAR___CHFitnessAppContext_activitySharingSettings;
  v6 = type metadata accessor for ActivitySharingSettings(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

  sub_1000F61B4((uint64_t)self + OBJC_IVAR___CHFitnessAppContext_navigationDelegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___CHFitnessAppContext_appBadgeAggregator);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_amsBag));

  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppContext_playlists), v7, v8, v9, v10, v11, v12, v13);
}

@end
