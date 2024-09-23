@implementation WidgetManager

- (void)dealloc
{
  _TtC8Podcasts13WidgetManager *v2;

  v2 = self;
  sub_1002E93FC();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts13WidgetManager_libraryDataProvider));
  sub_10003D380((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts13WidgetManager_imageProvider));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts13WidgetManager_seenEpisodeUUIDs));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts13WidgetManager_subscriptions));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts13WidgetManager_artworkPrefetchReceiver));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts13WidgetManager_artworkPrefetchPipeline));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts13WidgetManager_observerTokens));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts13WidgetManager_playbackController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts13WidgetManager_playerSubscriptions));
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts13WidgetManager_lastPlayedInfo, &qword_1005624A8);
}

- (_TtC8Podcasts13WidgetManager)init
{
  _TtC8Podcasts13WidgetManager *result;

  result = (_TtC8Podcasts13WidgetManager *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.WidgetManager", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
