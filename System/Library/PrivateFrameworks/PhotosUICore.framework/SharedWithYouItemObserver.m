@implementation SharedWithYouItemObserver

- (void)assetFetchResultProvider:(id)a3 didChangeAssetFetchResult:(id)a4 forAssetCollection:(id)a5
{
  _TtC12PhotosUICore25SharedWithYouItemObserver *v7;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_1A6B4EB04(a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)socialLayerHighlightProvider:(id)a3 didChangeSocialLayerHighlight:(id)a4 forAsset:(id)a5
{
  id v7;
  _TtC12PhotosUICore25SharedWithYouItemObserver *v8;

  swift_getKeyPath();
  sub_1A6847A44(&qword_1EE8E6E88, (uint64_t (*)(uint64_t))type metadata accessor for SharedWithYouItemObserver, (uint64_t)&unk_1A7BBDCD8);
  swift_unknownObjectRetain();
  v7 = a4;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1A7ADCCA8();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_release();
}

- (_TtC12PhotosUICore25SharedWithYouItemObserver)init
{
  _TtC12PhotosUICore25SharedWithYouItemObserver *result;

  result = (_TtC12PhotosUICore25SharedWithYouItemObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore25SharedWithYouItemObserver___observationRegistrar;
  v4 = sub_1A7ADCCE4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
