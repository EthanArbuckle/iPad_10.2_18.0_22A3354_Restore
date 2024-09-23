@implementation MultiShowEpisodeCell

- (void)didMoveToWindow
{
  char *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MultiShowEpisodeCell(0);
  v2 = (char *)v8.receiver;
  -[MultiShowEpisodeCell didMoveToWindow](&v8, "didMoveToWindow");
  v3 = objc_msgSend(v2, "window", v8.receiver, v8.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "screen");
    objc_msgSend(v5, "scale");
    v7 = v6;

    *(_QWORD *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_displayScale] = v7;
  }

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews20MultiShowEpisodeCell *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_D1914((uint64_t)v4);
  v7 = v6;

  return v7;
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews20MultiShowEpisodeCell *v2;

  v2 = self;
  sub_D2094();

}

- (_TtC23ShelfKitCollectionViews20MultiShowEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews20MultiShowEpisodeCell *)sub_D2224(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews20MultiShowEpisodeCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews20MultiShowEpisodeCell *)sub_D235C(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_objectGraph));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_presentation, &qword_3D19E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_layoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_episodeInfoView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_playControlsPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_playControlsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_internalArtworkView));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_imageProvider, &qword_3D1230);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_playStateSubscription));
}

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView
{
  return (_TtC23ShelfKitCollectionViews15EpisodeInfoView *)sub_227BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_episodeInfoView);
}

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView
{
  return (_TtC23ShelfKitCollectionViews21PlayControlsStackView *)sub_227BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews20MultiShowEpisodeCell_playControlsView);
}

@end
