@implementation PlayingEpisodePlayStateDataSource

- (void)dealloc
{
  uint64_t v3;
  _TtC8Podcasts33PlayingEpisodePlayStateDataSource *v4;
  objc_super v5;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_timer);
  v4 = self;
  if (v3)
  {
    swift_retain();
    sub_1001EE5C4();
    swift_release(v3);
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayingEpisodePlayStateDataSource();
  -[PlayingEpisodePlayStateDataSource dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_expectedEpisodeStates));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_previouslyPlayingEpisodes));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playerRequestController));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_timer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playingEpisode));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playingEpisodeRefreshSerialQueue));
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_refreshControllerStates), *(_QWORD *)&self->expectedEpisodeStates[OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_refreshControllerStates]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_accessQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playerController));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_episodeLookupUtil));
}

- (void)playerPathDidChange
{
  void *v2;
  _TtC8Podcasts33PlayingEpisodePlayStateDataSource *v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playerController);
  v3 = self;
  v6 = objc_msgSend(v2, "playerPath");
  v4 = *(Class *)((char *)&v3->super.isa
                + OBJC_IVAR____TtC8Podcasts33PlayingEpisodePlayStateDataSource_playerRequestController);
  v5 = objc_msgSend(v4, "request");
  objc_msgSend(v5, "setPlayerPath:", v6);

  objc_msgSend(v4, "setNeedsReloadForSignificantRequestChange");
}

- (_TtC8Podcasts33PlayingEpisodePlayStateDataSource)init
{
  _TtC8Podcasts33PlayingEpisodePlayStateDataSource *result;

  result = (_TtC8Podcasts33PlayingEpisodePlayStateDataSource *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.PlayingEpisodePlayStateDataSource", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC8Podcasts33PlayingEpisodePlayStateDataSource *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1004B5100, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1001EC650(v8, (uint64_t)sub_100048D5C, v7);

  swift_release(v7);
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  id v6;
  id v7;
  _TtC8Podcasts33PlayingEpisodePlayStateDataSource *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1001EEDA0(v6, (uint64_t)v7);

  return v9 & 1;
}

@end
