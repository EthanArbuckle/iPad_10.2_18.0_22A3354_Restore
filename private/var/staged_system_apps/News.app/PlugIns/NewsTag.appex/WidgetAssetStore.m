@implementation WidgetAssetStore

- (_TtC7NewsTag16WidgetAssetStore)init
{
  _TtC7NewsTag16WidgetAssetStore *result;

  result = (_TtC7NewsTag16WidgetAssetStore *)_swift_stdlib_reportUnimplementedInitializer("NewsTag.WidgetAssetStore", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10001DA60((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsTag16WidgetAssetStore_infoService));
  v3 = (char *)self + OBJC_IVAR____TtC7NewsTag16WidgetAssetStore_directoryUrl;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsTag16WidgetAssetStore____lazy_storage___pruneThrottler));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC7NewsTag16WidgetAssetStore_keysOfInterest));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsTag16WidgetAssetStore_lock));
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC7NewsTag16WidgetAssetStore *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1000AB810, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain(a3);
  v8 = self;
  sub_100022DEC((uint64_t)sub_100022DE0, v7);
  swift_unknownObjectRelease(a3);

  swift_release(v7);
}

@end
