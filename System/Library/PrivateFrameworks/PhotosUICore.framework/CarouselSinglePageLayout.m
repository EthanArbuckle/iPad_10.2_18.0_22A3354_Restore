@implementation CarouselSinglePageLayout

- (_TtC12PhotosUICore24CarouselSinglePageLayout)init
{
  return (_TtC12PhotosUICore24CarouselSinglePageLayout *)CarouselSinglePageLayout.init()();
}

- (void)updateMaskingEffects
{
  _TtC12PhotosUICore24CarouselSinglePageLayout *v2;

  v2 = self;
  sub_1A6A89048();

}

- (void)displayScaleDidChange
{
  _QWORD *v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CarouselSinglePageLayout();
  v2 = v4.receiver;
  v3 = -[PXGLayout displayScaleDidChange](&v4, sel_displayScaleDidChange);
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v2) + 0xD0))(v3);

}

- (void)updateIfNeeded
{
  void *v2;
  _TtC12PhotosUICore24CarouselSinglePageLayout *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore24CarouselSinglePageLayout_updater);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_updateIfNeeded);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for CarouselSinglePageLayout();
    -[PXGLayout updateIfNeeded](&v4, sel_updateIfNeeded);

  }
  else
  {
    __break(1u);
  }
}

- (void)entityManagerDidChange
{
  _TtC12PhotosUICore24CarouselSinglePageLayout *v2;

  v2 = self;
  sub_1A6A89298();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
