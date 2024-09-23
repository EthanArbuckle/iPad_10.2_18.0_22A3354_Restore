@implementation WidgetAssetStore

- (_TtC10NewsToday216WidgetAssetStore)init
{
  _TtC10NewsToday216WidgetAssetStore *result;

  result = (_TtC10NewsToday216WidgetAssetStore *)_swift_stdlib_reportUnimplementedInitializer("NewsToday2.WidgetAssetStore", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10001BBD8((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10NewsToday216WidgetAssetStore_infoService));
  v3 = (char *)self + OBJC_IVAR____TtC10NewsToday216WidgetAssetStore_directoryUrl;
  v4 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10NewsToday216WidgetAssetStore____lazy_storage___pruneThrottler));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10NewsToday216WidgetAssetStore_keysOfInterest));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10NewsToday216WidgetAssetStore_lock));
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC10NewsToday216WidgetAssetStore *v8;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_1000C8450, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  swift_unknownObjectRetain(a3);
  v8 = self;
  sub_100021ADC((uint64_t)sub_100021AD0, v7);
  swift_unknownObjectRelease(a3);

  swift_release(v7);
}

@end
