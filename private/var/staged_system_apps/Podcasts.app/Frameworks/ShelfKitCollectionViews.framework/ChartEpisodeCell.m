@implementation ChartEpisodeCell

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
  -[ChartEpisodeCell didMoveToWindow](&v8, "didMoveToWindow");
  v3 = objc_msgSend(v2, "window", v8.receiver, v8.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "screen");
    objc_msgSend(v5, "scale");
    v7 = v6;

    *(_QWORD *)&v2[OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_displayScale] = v7;
  }

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews16ChartEpisodeCell *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_11BAB0((uint64_t)v4);

  return v6;
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews16ChartEpisodeCell *v2;

  v2 = self;
  sub_11BDB8();

}

- (_TtC23ShelfKitCollectionViews18CachingArtworkView)accessibilityInternalArtworkView
{
  return (_TtC23ShelfKitCollectionViews18CachingArtworkView *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_internalArtworkView);
}

- (UILabel)accessibilityOrdinalLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_ordinalLabel));
}

- (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton)accessibilityMoreButton
{
  return (_TtC23ShelfKitCollectionViews24DynamicContextMenuButton *)*(id *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_moreButton);
}

- (_TtC23ShelfKitCollectionViews16ChartEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews16ChartEpisodeCell *)sub_11BF78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews16ChartEpisodeCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews16ChartEpisodeCell *)sub_11C0CC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_internalArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_ordinalLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_ordinalLabelMinWidth));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_episodeInfoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_moreButton));
  sub_11D760((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_episodeController);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_episode));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews16ChartEpisodeCell_objectGraph));
}

@end
