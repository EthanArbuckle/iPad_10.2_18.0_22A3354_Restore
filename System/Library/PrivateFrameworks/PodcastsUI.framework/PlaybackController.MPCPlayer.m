@implementation PlaybackController.MPCPlayer

- (_TtCC10PodcastsUI18PlaybackController9MPCPlayer)init
{
  _TtCC10PodcastsUI18PlaybackController9MPCPlayer *result;

  result = (_TtCC10PodcastsUI18PlaybackController9MPCPlayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_1DA63A5EC((uint64_t)self + OBJC_IVAR____TtCC10PodcastsUI18PlaybackController9MPCPlayer_playbackPositionTracker);
}

- (void)engine:(id)a3 didFailToPlayItem:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtCC10PodcastsUI18PlaybackController9MPCPlayer *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_1DA63A62C(v11);

}

- (void)engine:(id)a3 didFailToPlayFirstItem:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtCC10PodcastsUI18PlaybackController9MPCPlayer *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_1DA63A814(v11);

}

- (void)engine:(id)a3 didUpdatePlaybackPositionWithEvent:(id)a4
{
  id v6;
  id v7;
  _TtCC10PodcastsUI18PlaybackController9MPCPlayer *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1DA63A9D4(v7);

}

@end
