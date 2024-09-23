@implementation GenreRecommendationManager

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  void *v4;
  NSString v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  _TtC5Books26GenreRecommendationManager *v9;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books26GenreRecommendationManager_defaults);
  v9 = self;
  v5 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  v6 = *(os_unfair_lock_s **)((char *)&v9->super.isa + OBJC_IVAR____TtC5Books26GenreRecommendationManager_stateLock);
  v7 = (uint64_t)&v6[4];
  v8 = v6 + 7;
  os_unfair_lock_lock(v6 + 7);
  sub_1004BB7CC(v7);
  os_unfair_lock_unlock(v8);

}

- (_TtC5Books26GenreRecommendationManager)init
{
  _TtC5Books26GenreRecommendationManager *result;

  result = (_TtC5Books26GenreRecommendationManager *)_swift_stdlib_reportUnimplementedInitializer("Books.GenreRecommendationManager", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books26GenreRecommendationManager_stateLock));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books26GenreRecommendationManager_accountsProvider));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books26GenreRecommendationManager_service));
}

@end
