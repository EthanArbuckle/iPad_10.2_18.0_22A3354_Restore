@implementation AwardsActivityTileDataModel

- (void)dealloc
{
  _TtC10FitnessApp27AwardsActivityTileDataModel *v2;

  v2 = self;
  sub_1002A9F68();
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_achievementsDataProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_achievementLocalizationProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_activityDataProvider));
  sub_100016828(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_keyAwards), *(void **)&self->achievementsDataProvider[OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_keyAwards], *(void **)&self->achievementsDataProvider[OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_keyAwards + 8]);
  sub_100022BA4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_onModelDidUpdate), *(_QWORD *)&self->achievementsDataProvider[OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_onModelDidUpdate]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp27AwardsActivityTileDataModel_observers));
}

- (_TtC10FitnessApp27AwardsActivityTileDataModel)init
{
  _TtC10FitnessApp27AwardsActivityTileDataModel *result;

  result = (_TtC10FitnessApp27AwardsActivityTileDataModel *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.AwardsActivityTileDataModel", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)achievementsDataProviderDidFinishInitialLoad:(id)a3
{
  id v4;
  _TtC10FitnessApp27AwardsActivityTileDataModel *v5;

  v4 = a3;
  v5 = self;
  sub_1002AA33C((uint64_t)sub_1002AA538, (uint64_t)&unk_100793C00);

}

- (void)achievementsDataProviderDidUpdate:(id)a3
{
  id v4;
  _TtC10FitnessApp27AwardsActivityTileDataModel *v5;

  v4 = a3;
  v5 = self;
  sub_1002AA33C((uint64_t)sub_1002AA538, (uint64_t)&unk_100793BD8);

}

@end
