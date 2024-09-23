@implementation JSOrderedPlaylistSelectorRequestOperation

- (void)execute
{
  id v2;
  uint64_t v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSOrderedPlaylistSelectorRequestOperation();
  v2 = v5.receiver;
  -[JSOrderedPlaylistSelectorRequestOperation execute](&v5, "execute");
  sub_10F850();
  v3 = swift_allocObject(&unk_139A4B0, 24, 7);
  *(_QWORD *)(v3 + 16) = v2;
  v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_AC5DA8, v3);

  swift_release();
}

- (_TtC16MusicApplicationP33_80AE2528D20BB280B10BEE706541B0E941JSOrderedPlaylistSelectorRequestOperation)init
{
  _TtC16MusicApplicationP33_80AE2528D20BB280B10BEE706541B0E941JSOrderedPlaylistSelectorRequestOperation *result;

  result = (_TtC16MusicApplicationP33_80AE2528D20BB280B10BEE706541B0E941JSOrderedPlaylistSelectorRequestOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSOrderedPlaylistSelectorRequestOperation", 58, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->request[OBJC_IVAR____TtC16MusicApplicationP33_80AE2528D20BB280B10BEE706541B0E941JSOrderedPlaylistSelectorRequestOperation_responseHandler]);
}

@end
