@implementation RemoteFollowCommandCenter

- (void)remoteSetPlaybackQueueCommand:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC10PodcastsUI25RemoteFollowCommandCenter *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_1DA5D635C(v7, v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC10PodcastsUI25RemoteFollowCommandCenter)init
{
  _TtC10PodcastsUI25RemoteFollowCommandCenter *result;

  result = (_TtC10PodcastsUI25RemoteFollowCommandCenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
