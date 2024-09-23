@implementation CarouselContentLayout

- (void)updateContent
{
  _TtC12PhotosUICore21CarouselContentLayout *v2;

  v2 = self;
  sub_1A689CD48();

}

- (void)updateDisplayedPageRange
{
  _TtC12PhotosUICore21CarouselContentLayout *v2;

  v2 = self;
  sub_1A689D208();

}

- (void)updateDisplayedPages
{
  _TtC12PhotosUICore21CarouselContentLayout *v2;

  v2 = self;
  sub_1A689D350();

}

- (void)updatePageControl
{
  _TtC12PhotosUICore21CarouselContentLayout *v2;

  v2 = self;
  sub_1A689D5A0();

}

- (void)update
{
  void *v2;
  _TtC12PhotosUICore21CarouselContentLayout *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_updater);
  if (v2)
  {
    v3 = self;
    objc_msgSend(v2, sel_updateIfNeeded);
    v4.receiver = v3;
    v4.super_class = (Class)type metadata accessor for CarouselContentLayout();
    -[PXGCompositeLayout update](&v4, sel_update);

  }
  else
  {
    __break(1u);
  }
}

- (void)alphaDidChange
{
  sub_1A689D728(self, (uint64_t)a2, (SEL *)&selRef_alphaDidChange);
}

- (void)referenceDepthDidChange
{
  sub_1A689D728(self, (uint64_t)a2, (SEL *)&selRef_referenceDepthDidChange);
}

- (void)referenceSizeDidChange
{
  sub_1A689D728(self, (uint64_t)a2, (SEL *)&selRef_referenceSizeDidChange);
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  id v6;
  _TtC12PhotosUICore21CarouselContentLayout *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_1A689DE54(a4);

  return v8;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  sub_1A6856488(0, &qword_1EE8DACD8);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_pageControlConfiguration));
}

- (NSIndexSet)axSpriteIndexes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_1A7ADCC0C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A7ADCC00();
  v6 = (void *)sub_1A7ADCB7C();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSIndexSet *)v6;
}

- (_TtC12PhotosUICore21CarouselContentLayout)initWithComposition:(id)a3
{
  id v3;
  _TtC12PhotosUICore21CarouselContentLayout *result;

  v3 = a3;
  result = (_TtC12PhotosUICore21CarouselContentLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICore21CarouselContentLayout)init
{
  _TtC12PhotosUICore21CarouselContentLayout *result;

  result = (_TtC12PhotosUICore21CarouselContentLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_layoutSpec);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_fullsizeFrameRectsStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_pageControlConfiguration));
  swift_bridgeObjectRelease();
  swift_release();
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_mostFocusedPageChangeHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore21CarouselContentLayout_updater));
}

@end
