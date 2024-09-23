@implementation SummaryCoordinator

- (void)pregnancyModelDidChangeWithProvider:(id)a3 model:(id)a4
{
  id v6;
  id v7;
  _TtC10FitnessApp18SummaryCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10035DDA4(0x31u);

}

- (void)dealloc
{
  _TtC10FitnessApp18SummaryCoordinator *v2;

  v2 = self;
  sub_10035C758();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  CHWorkoutDetailHeartRateTableViewCell *v24;
  SEL v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  SEL v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  SEL v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  SEL v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  SEL v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  SEL v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_ringsCardFactory);
  v4 = *(void **)&self->internalQueue[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_ringsCardFactory];

  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory);
  v5 = *(_QWORD *)&self->internalQueue[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory];
  v7 = *(void **)&self->context[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory];
  v8 = *(void **)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory];
  v9 = *(void **)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory + 8];
  v10 = *(void **)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory + 16];

  swift_release(v5);
  v11 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_metricsCardFactory);
  v12 = *(void **)&self->internalQueue[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_metricsCardFactory];

  v13 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory);
  v14 = *(void **)&self->internalQueue[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory];
  v16 = *(void **)&self->context[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory];
  v15 = *(_QWORD *)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory];
  v17 = *(void **)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory + 8];
  v18 = *(void **)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory + 16];
  v19 = *(void **)&self->friendsCardsFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory];

  swift_release(v15);
  sub_1003655EC((uint64_t)self + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_awardCardFactory);

  sub_100365620((uint64_t)self + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_fitnessPlusCardFactory);
  v20 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_catalogTipCardFactory);
  swift_release(*(_QWORD *)&self->internalQueue[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_catalogTipCardFactory]);
  swift_release(v20);
  v21 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_trendsCardFactory);
  v22 = *(void **)&self->internalQueue[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_trendsCardFactory];
  v23 = *(void **)&self->context[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_trendsCardFactory];
  v24 = *(CHWorkoutDetailHeartRateTableViewCell **)&self->friendsCardsFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_trendsCardFactory
                                                                            + 8];

  swift_bridgeObjectRelease(v24, v25, v26, v27, v28, v29, v30, v31);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_notificationCenterObservers), v32, v33, v34, v35, v36, v37, v38);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_activeCards), v39, v40, v41, v42, v43, v44, v45);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_clientActiveCards), v46, v47, v48, v49, v50, v51, v52);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_cardForId), v53, v54, v55, v56, v57, v58, v59);
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_delegate);
  swift_bridgeObjectRelease(*(CHWorkoutDetailHeartRateTableViewCell **)((char *)&self->super.isa+ OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_fitnessPlusDataProviderCancellables), v60, v61, v62, v63, v64, v65, v66);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsSetupStateCancellable));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsHighlightStateCancellable));
}

- (void)logCardConfigurationAnalytics
{
  _TtC10FitnessApp18SummaryCoordinator *v2;

  v2 = self;
  sub_10035CADC();

}

- (_TtC10FitnessApp18SummaryCoordinator)init
{
  _TtC10FitnessApp18SummaryCoordinator *result;

  result = (_TtC10FitnessApp18SummaryCoordinator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.SummaryCoordinator", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
