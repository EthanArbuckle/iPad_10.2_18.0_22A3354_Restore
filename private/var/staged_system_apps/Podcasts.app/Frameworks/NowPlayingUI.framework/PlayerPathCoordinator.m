@implementation PlayerPathCoordinator

- (MPCPlayerPath)metadataPlayerPath
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_metadataPlayerPath);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_metadataPlayerPath, v4, 0, 0);
  return (MPCPlayerPath *)*v2;
}

- (void)setMetadataPlayerPath:(id)a3
{
  _TtC12NowPlayingUI21PlayerPathCoordinator *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_CE2F0(v5);

}

- (MPCPlayerPath)playbackPlayerPath
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_playbackPlayerPath);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_playbackPlayerPath, v4, 0, 0);
  return (MPCPlayerPath *)*v2;
}

- (void)setPlaybackPlayerPath:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _TtC12NowPlayingUI21PlayerPathCoordinator *v8;
  _BYTE v9[24];

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_playbackPlayerPath);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_playbackPlayerPath, v9, 1, 0);
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_CDA58();
}

- (_TtC12NowPlayingUI21PlayerPathCoordinator)init
{
  _TtC12NowPlayingUI21PlayerPathCoordinator *result;

  result = (_TtC12NowPlayingUI21PlayerPathCoordinator *)_swift_stdlib_reportUnimplementedInitializer("NowPlayingUI.PlayerPathCoordinator", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->playerID[OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_playerID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->playerID[OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_bundleID]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_metadataPlayerPath));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_playbackPlayerPath));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_failingPlayerPathTimers));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_activeSystemRouteDidChangeNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_playerPathInvalidationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_applicationDidBecomeActiveNotificationObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_applicationWillResignActiveNotificationObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI21PlayerPathCoordinator_updateBlocks));

}

@end
