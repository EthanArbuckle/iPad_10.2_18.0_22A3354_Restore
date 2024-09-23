@implementation RoomUberCollectionViewCell

- (_TtC23ShelfKitCollectionViews26RoomUberCollectionViewCell)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews26RoomUberCollectionViewCell *result;

  sub_1B6904(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC23ShelfKitCollectionViews26RoomUberCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B71FC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews26RoomUberCollectionViewCell_fixedHeightConstraint));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews26RoomUberCollectionViewCell_objectGraph));
}

@end
