@implementation JSSearchLandingRequestOperation

- (void)execute
{
  id v2;
  uint64_t v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSSearchLandingRequestOperation();
  v2 = v5.receiver;
  -[JSSearchLandingRequestOperation execute](&v5, "execute");
  sub_10F850();
  v3 = swift_allocObject(&unk_1369908, 24, 7);
  *(_QWORD *)(v3 + 16) = v2;
  v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_4C2318, v3);

  swift_release(v3);
}

- (_TtC16MusicApplication31JSSearchLandingRequestOperation)init
{
  _TtC16MusicApplication31JSSearchLandingRequestOperation *result;

  result = (_TtC16MusicApplication31JSSearchLandingRequestOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSSearchLandingRequestOperation", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->request[OBJC_IVAR____TtC16MusicApplication31JSSearchLandingRequestOperation_responseHandler]);
}

@end
