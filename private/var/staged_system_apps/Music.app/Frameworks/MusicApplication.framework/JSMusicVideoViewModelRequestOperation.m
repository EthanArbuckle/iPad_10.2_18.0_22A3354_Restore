@implementation JSMusicVideoViewModelRequestOperation

- (void)execute
{
  id v2;
  uint64_t v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSMusicVideoViewModelRequestOperation();
  v2 = v5.receiver;
  -[JSMusicVideoViewModelRequestOperation execute](&v5, "execute");
  sub_10F850();
  v3 = swift_allocObject(&unk_1374628, 24, 7);
  *(_QWORD *)(v3 + 16) = v2;
  v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_609850, v3);

  swift_release(v3);
}

- (_TtC16MusicApplication37JSMusicVideoViewModelRequestOperation)init
{
  _TtC16MusicApplication37JSMusicVideoViewModelRequestOperation *result;

  result = (_TtC16MusicApplication37JSMusicVideoViewModelRequestOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSMusicVideoViewModelRequestOperation", 54, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->request[OBJC_IVAR____TtC16MusicApplication37JSMusicVideoViewModelRequestOperation_responseHandler]);
}

@end
