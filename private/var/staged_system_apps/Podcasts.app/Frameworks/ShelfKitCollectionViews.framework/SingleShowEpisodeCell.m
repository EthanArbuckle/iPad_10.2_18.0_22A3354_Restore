@implementation SingleShowEpisodeCell

- (_TtC23ShelfKitCollectionViews21SingleShowEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews21SingleShowEpisodeCell *)sub_2CF88C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews21SingleShowEpisodeCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2D1C84();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews21SingleShowEpisodeCell *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_2D0F00((uint64_t)v4);

  return v6;
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews21SingleShowEpisodeCell *v2;

  v2 = self;
  sub_2D1308();

}

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
  v8.super_class = (Class)swift_getObjectType();
  v2 = (char *)v8.receiver;
  -[SingleShowEpisodeCell didMoveToWindow](&v8, "didMoveToWindow");
  v3 = objc_msgSend(v2, "window", v8.receiver, v8.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "screen");
    objc_msgSend(v5, "scale");
    v7 = v6;

    *(_QWORD *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_displayScale] = v7;
  }

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_episodeInfoView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_playControlsPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_playControlsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_artworkView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_playStateSubscription));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_objectGraph));
}

- (_TtC23ShelfKitCollectionViews15EpisodeInfoView)accessibilityEpisodeInfoView
{
  return (_TtC23ShelfKitCollectionViews15EpisodeInfoView *)sub_227BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_episodeInfoView);
}

- (_TtC23ShelfKitCollectionViews21PlayControlsStackView)accessibilityPlayControlsView
{
  return (_TtC23ShelfKitCollectionViews21PlayControlsStackView *)sub_227BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews21SingleShowEpisodeCell_playControlsView);
}

@end
