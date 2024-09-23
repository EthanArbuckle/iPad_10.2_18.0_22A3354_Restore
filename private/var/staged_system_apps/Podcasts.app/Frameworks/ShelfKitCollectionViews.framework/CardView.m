@implementation CardView

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView *)sub_22AE64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView *)sub_22AF8C(a3);
}

- (void)didTapFrom:(id)a3
{
  id v4;
  void (*v5)(__n128);
  uint64_t v6;
  __n128 v7;
  _TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView *v8;

  v4 = a3;
  v8 = self;
  if (objc_msgSend(v4, "state") == (char *)&dword_0 + 3)
  {
    v5 = *(void (**)(__n128))((char *)&v8->super.super.super.isa
                                       + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_tapAction);
    if (v5)
    {
      v6 = *(_QWORD *)&v8->tintView[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_tapAction];
      v7 = swift_retain(v6);
      v5(v7);
      sub_1D618((uint64_t)v5, v6);
    }
  }

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_tintView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_viewConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_view));
  sub_1D618(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_tapAction), *(_QWORD *)&self->tintView[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_tapAction]);
}

@end
