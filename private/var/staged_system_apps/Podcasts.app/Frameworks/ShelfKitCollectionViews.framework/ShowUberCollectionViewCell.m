@implementation ShowUberCollectionViewCell

- (_TtC23ShelfKitCollectionViews26ShowUberCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews26ShowUberCollectionViewCell *)sub_1B0514(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews26ShowUberCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B0D34();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowUberCollectionViewCell_showPageHeader));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowUberCollectionViewCell_episodePlayStateController));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowUberCollectionViewCell_showHeader));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews26ShowUberCollectionViewCell_objectGraph));
}

@end
