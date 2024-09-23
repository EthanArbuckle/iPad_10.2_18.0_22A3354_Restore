@implementation OldEpisodeCell

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews14OldEpisodeCell *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_230840((uint64_t)v4);

  return v6;
}

- (void)layoutSubviews
{
  _TtC23ShelfKitCollectionViews14OldEpisodeCell *v2;

  v2 = self;
  sub_230BF0();

}

- (_TtC23ShelfKitCollectionViews14OldEpisodeCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_objectGraph) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_episode) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_axis) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_episodeView) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[OldEpisodeCell initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews14OldEpisodeCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews14OldEpisodeCell *)sub_230F88(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_objectGraph));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_episode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14OldEpisodeCell_episodeView));
}

@end
