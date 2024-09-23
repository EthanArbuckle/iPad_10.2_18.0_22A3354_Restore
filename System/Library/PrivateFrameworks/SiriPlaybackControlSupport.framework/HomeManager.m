@implementation HomeManager

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4;
  _TtC26SiriPlaybackControlSupport11HomeManager *v5;

  v4 = a3;
  v5 = self;
  sub_2278243D4(v4);

}

- (_TtC26SiriPlaybackControlSupport11HomeManager)init
{
  sub_22782576C();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC26SiriPlaybackControlSupport11HomeManager_homeData);
  v4 = *(void **)&self->homeManagerRefreshTimeout[OBJC_IVAR____TtC26SiriPlaybackControlSupport11HomeManager_homeData];
  v5 = *(void **)&self->hmHomeManager[OBJC_IVAR____TtC26SiriPlaybackControlSupport11HomeManager_homeData];
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_1();

  v6 = (char *)self + OBJC_IVAR____TtC26SiriPlaybackControlSupport11HomeManager_homekitInitSignpostID;
  v7 = OUTLINED_FUNCTION_61_1();
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC26SiriPlaybackControlSupport11HomeManager_homekitRefreshSignpostID, v7);

  swift_release();
  swift_release();
}

@end
