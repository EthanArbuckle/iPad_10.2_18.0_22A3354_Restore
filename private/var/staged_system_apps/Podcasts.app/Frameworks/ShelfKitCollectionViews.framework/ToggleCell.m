@implementation ToggleCell

- (_TtC23ShelfKitCollectionViews10ToggleCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews10ToggleCell *)sub_A3B9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews10ToggleCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_A4890();
}

- (void)segmentedControlTapped
{
  _TtC23ShelfKitCollectionViews10ToggleCell *v2;

  v2 = self;
  sub_A4100();

}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews10ToggleCell_objectGraph));
  sub_D1D4((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews10ToggleCell_item, &qword_3D3FA8);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews10ToggleCell_defaultsSubscription));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews10ToggleCell_segmentedControl));
}

@end
