@implementation RecommendationsController

- (_TtP13iCloudQuotaUI40RecommendationSubtitleControllerDelegate_)subtitleControllerDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController_subtitleControllerDelegate;
  swift_beginAccess();
  return (_TtP13iCloudQuotaUI40RecommendationSubtitleControllerDelegate_ *)(id)MEMORY[0x2207C9154](v2);
}

- (void)setSubtitleControllerDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (_TtC13iCloudQuotaUI25RecommendationsController)initWithAccount:(id)a3
{
  uint64_t ObjectType;
  id v5;
  uint64_t v6;
  _TtC13iCloudQuotaUI25RecommendationsController *v7;

  ObjectType = swift_getObjectType();
  sub_21F4546D8();
  v5 = a3;
  v6 = sub_21F4546CC();
  v7 = (_TtC13iCloudQuotaUI25RecommendationsController *)(*(uint64_t (**)(id, uint64_t))(ObjectType + 768))(v5, v6);
  swift_deallocPartialClassInstance();
  return v7;
}

- (void)fetchAll
{
  _QWORD *v2;
  void (*v3)(void);
  _TtC13iCloudQuotaUI25RecommendationsController *v4;
  void (*v5)(uint64_t);
  uint64_t v6;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x320);
  v4 = self;
  v3();
  (*(void (**)(uint64_t))((*v2 & (uint64_t)v4->super.isa) + 0x318))(1);
  v5 = *(void (**)(uint64_t))(**(_QWORD **)((char *)&v4->super.isa
                                                    + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController_recommendationsFilter)
                                      + 392);
  v6 = swift_retain();
  v5(v6);

  swift_release();
}

- (void)refresh
{
  void (*v2)(_QWORD);
  _TtC13iCloudQuotaUI25RecommendationsController *v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v2 = *(void (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x318);
  v3 = self;
  v2(0);
  v4 = *(void (**)(uint64_t))(**(_QWORD **)((char *)&v3->super.isa
                                                    + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController_recommendationsFilter)
                                      + 392);
  v5 = swift_retain();
  v4(v5);

  swift_release();
}

- (_TtC13iCloudQuotaUI25RecommendationsController)init
{
  _TtC13iCloudQuotaUI25RecommendationsController *result;

  result = (_TtC13iCloudQuotaUI25RecommendationsController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v3 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController__recommendationSections;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554C50F0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController__recommendationPage;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554C5108);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController__completedRecommendationsSection, v4);
  v8 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController__stillFetchingData;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554C22C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController__loadingError;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2554C5120);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);

  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController_recommendationTaskGroup));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController_recommendationsActionCache));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController_recommendationsDataFetcher));
  swift_release();
  swift_release();
  sub_21F414DA8((uint64_t)self + OBJC_IVAR____TtC13iCloudQuotaUI25RecommendationsController_subtitleControllerDelegate);
}

@end
